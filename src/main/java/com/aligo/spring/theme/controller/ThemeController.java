package com.aligo.spring.theme.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.AligoException;
import com.aligo.spring.common.Pagination;
import com.aligo.spring.theme.model.service.ThemeService;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.PhotoVo;
import com.aligo.spring.theme.model.vo.SearchCondition;
import com.aligo.spring.theme.model.vo.TFile;
import com.aligo.spring.theme.model.vo.TReply;
import com.aligo.spring.theme.model.vo.Theme;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class ThemeController extends TFile{
	
	/**
	 * 
	 */
	@Autowired
	private ThemeService tService;
	
	@RequestMapping("themeInsertView.do")
	public ModelAndView themeInsertView(ModelAndView mv) {
		String str = tService.getKeyword();
		String strArr[] = str.split(",");
		ArrayList<String> list = new ArrayList<>(); 
		for(int i=0;i<strArr.length;i++) {
			list.add(strArr[i]);
		}
		mv.addObject("list",list).addObject("tKlength",strArr.length).setViewName("board/boardInsertView");
		
		return mv;
	}
	
	@RequestMapping("theme.do")
	public ModelAndView themeList(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			SearchCondition sc) {
		
		int listCount = tService.getListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		//키워드 관련 검색 횟수 증가
		if(sc.getKeyword() == "" || sc.getKeyword() == null) {
			sc.setKeyword(null);
		}else {
			int usk = tService.updateSearchKeywordCount(sc);
		}
		
		ArrayList<Theme> list = tService.selectList(pi,sc);
		
		for(Theme t: list) {
			if(t.gettTitle().length() > 16) {
				t.settTitle(t.gettTitle().substring(0,15));
			}
			
			if(t.gettModifyFile().length() <= 18) {
				t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile());
			}else if(t.gettModifyFile().contains(",")){
				t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile().substring(0,t.gettModifyFile().indexOf(",")));
			}
		}
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.addObject("sc",sc);
		mv.setViewName("theme/categoryList");
		return mv;
	}
	
	@RequestMapping("pagination.do")
	public void pagination(HttpServletResponse response,
		@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
		SearchCondition sc)throws IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		int listCount = tService.getListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		ArrayList<Theme> list = tService.selectList(pi,sc);
		
		JSONArray jArr = new JSONArray();
		
		for(Theme t: list) {
			if(t.gettTitle().length() > 16) {
				t.settTitle(t.gettTitle().substring(0,15));
			}
			
			if(t.gettModifyFile().length() <= 18) {
				t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile());
			}else if(t.gettModifyFile().contains(",")){
				t.settModifyFile("resources/tuploadFiles/" + t.gettModifyFile().substring(0,t.gettModifyFile().indexOf(",")));
			}else {
				t.settModifyFile(t.gettModifyFile().replace("amp;",""));
			}
			JSONObject jobj = new JSONObject();
			jobj.put("tId",t.gettId());
			jobj.put("tModifyFile",t.gettModifyFile());
			jobj.put("tTitle", t.gettTitle());
			jobj.put("tName","#"+t.gettName());
			
			jArr.add(jobj);
		}
		PrintWriter out = response.getWriter();
		
		out.print(jArr);
		out.flush();
		out.close();
	}
	
	@RequestMapping("themeInsert.do")
	public String insertTheme(Theme t,HttpServletRequest request) throws ServletException, IOException {
		int tNum = tService.getTNum();
		int result = 0;
		try {
			result = tService.insertTheme(t,tNum);
		} catch (AligoException e) {
			e.getMessage();
		}
		if(result >0) {
			return "redirect:theme.do"; 
		}else { 
			request.setAttribute("msg",AligoException.getMsg());
			request.getRequestDispatcher("views/common/errorPage.jsp");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("postdetail.do")
	public ModelAndView themeDetailView(ModelAndView mv, 
			@RequestParam(value="tId") int tId) {
		
		int uc = tService.updateCount(tId);
		
		Theme t = tService.selectTheme(tId);
		ArrayList list = new ArrayList();
		if(t.gettModifyFile().length() > 18 && t.gettModifyFile().contains(",")) {
			String str = t.gettModifyFile();
			String strArr[] = str.split(",");
			
			for(int i=0;i<strArr.length;i++) {
				String result = strArr[i];
				TFile ti = new TFile();
				ti.settModifyFile(result);
				list.add(ti);
			}
		}
		
		if(!list.isEmpty()) {
			t.settFileList(list);
		}
		mv.addObject("t",t);
		mv.setViewName("theme/themeDetailView");		
		return mv;
	}
	
	//단일파일업로드
		@RequestMapping("photoUpload.do")
		public String photoUpload(HttpServletRequest request, PhotoVo vo){
		    String callback = vo.getCallback();
		    String callback_func = vo.getCallback_func();
		    String file_result = "";
		    try {
		        if(vo.getFileData() != null && vo.getFileData().getOriginalFilename() != null && !vo.getFileData().getOriginalFilename().equals("")){
		            //파일이 존재하면
		            String originFilename = vo.getFileData().getOriginalFilename();
		            
		            //파일 기본경로
		            String root = request.getSession().getServletContext().getRealPath("resources");
		            //파일 기본경로 _ 상세경로
		            String savePath = root + "\\tuploadFiles";           
		            File folder = new File(savePath);
		            //디렉토리 존재하지 않을경우 디렉토리 생성
		            if(!folder.exists()) {
		                folder.mkdirs();
		            }
		            
		        	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		    		
		    		String renameFilename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
		    		+ originFilename.substring(originFilename.lastIndexOf(".")+1);

		    		String renamePath = folder + "\\" + renameFilename;
		        ///////////////// 서버에 파일쓰기 /////////////////
		            vo.getFileData().transferTo(new File(renamePath));
		            file_result += "&bNewLine=true&sFileName="+originFilename+"&sFileURL=/spring/resources/tuploadFiles/"+renameFilename;
		        } else {
		            file_result += "&errstr=error";
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
		}
		
		@RequestMapping("multiplePhotoUpload.do")
		public void saveFile(HttpServletRequest request, MultipartFile file,HttpServletResponse response) {
			String sFileInfo = "";
	        String originFilename = request.getHeader("file-name");
	        String root = request.getSession().getServletContext().getRealPath("resources");
	        String savePath = root + "\\tuploadFiles";
	        File folder = new File(savePath);
	        if(!folder.exists()) {
	           folder.mkdirs();
	        }
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	        String renameFilename= sdf.format(new java.util.Date(System.currentTimeMillis())) + "." 
	        + originFilename.substring(originFilename.lastIndexOf(".")+1);
	        
	        String renamePath = folder + "\\" + renameFilename;
			
	        try {
		         //파일정보
		         
		         ///////////////// 서버에 파일쓰기 /////////////////
		         InputStream is = request.getInputStream();
		         OutputStream os=new FileOutputStream(renamePath);
		         int numRead;
		         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
		         while((numRead = is.read(b,0,b.length)) != -1){
		            os.write(b,0,numRead);
		         }
		         if(is != null) {
		            is.close();
		         }
		         os.flush();
		         os.close();
		         // 정보 출력
		         sFileInfo += "&bNewLine=true";
		         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
		         sFileInfo += "&sFileName="+originFilename;
		         sFileInfo += "&sFileURL="+"/spring/resources/tuploadFiles/"+ renameFilename;
		         PrintWriter print = response.getWriter();
		         print.print(sFileInfo);
		         print.flush();
		         print.close();
		         
		         TFile tf = new TFile();
		         
		         TFile.tOriginalFile = originFilename;
		         TFile.tModifyFile = renameFilename;
		         TFile.tCodeNumber = tService.getTNum();
		         int result = tService.insertImg(tf);
		         
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		
	@RequestMapping("addTReply.do")
	@ResponseBody
	public String addTReply(TReply r) {
		String str = "";
		int result = tService.addTReply(r);
		
		if(result > 0) str="success"; else str="fail";
		
		return str;
	}
	
	@RequestMapping("trList.do")
	public void getTReplyList(HttpServletResponse response,int tId) throws JsonIOException, IOException {
		
		ArrayList<TReply> list = tService.selectTReplyList(tId);
	
		response.setContentType("application/json; charset=UTF-8");
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	
		gson.toJson(list,response.getWriter());
	}
	
	@RequestMapping("themeModifyView.do")
	public ModelAndView themeModifyView(int tId,ModelAndView mv) {
		Theme t = tService.selectTheme(tId);
		
		String str = tService.getKeyword();
		String strArr[] = str.split(",");
		ArrayList<String> list = new ArrayList<>(); 
		for(int i=0;i<strArr.length;i++) {
			list.add(strArr[i]);
		}
		mv.addObject("list",list).addObject("tKlength",strArr.length).addObject("t",t)
		.setViewName("board/boardModifyView");
		return mv;
	}
	
	@RequestMapping("updateTheme.do")
	public String updateTheme(Theme t) {
		int result = tService.updateTheme(t);
		
		return "redirect:postdetail.do";
	}

	@RequestMapping("updateLike.do")
	public String updateLike(int tId,String lv,String loginUser,String tCode,HttpServletResponse response) throws IOException {
		HashMap<String,String> map = new HashMap<>();
		map.put("loginUser",loginUser);
		map.put("tCode",tCode);
		map.put("tId",Integer.toString(tId));
		map.put("lv",lv);
		int result = tService.updateLike(map);
		String str = "";
		switch(result) {
		case 3: str = "Saved mylike list!"; break;
		case 2: str = "deleted!"; break;
		case 0: str = "error!"; break;
		default: str = "Contact the admin"; break;
		}
		return str;
	}
	
	@RequestMapping("likeStatus.do")
	@ResponseBody
	public String likeStatus(String loginUser,int tId) {
		HashMap<String,String> map = new HashMap<>();
		map.put("loginUser",loginUser);
		map.put("tId",Integer.toString(tId));
		
		int result = tService.likeStatus(map);
		if(result > 0) return "true"; else return "false";
	}
	
	@RequestMapping("deleteTheme.do")
	public String deleteTheme(int tId) {
		int result = tService.deleteTheme(tId);
		return "redirect:theme.do";
	}
	
	@RequestMapping("deleteTReply.do")
	public String deleteTReply(int trId) {
		int result = tService.deleteTReply(trId); 
		if(result > 0) return "success"; else return "fail";
	}
}