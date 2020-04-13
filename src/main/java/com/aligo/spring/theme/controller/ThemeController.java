package com.aligo.spring.theme.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.common.Pagination;
import com.aligo.spring.theme.model.service.ThemeService;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.PhotoVo;
import com.aligo.spring.theme.model.vo.TFile;
import com.aligo.spring.theme.model.vo.Theme;

@Controller
public class ThemeController extends TFile{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6137904105279348852L;
	@Autowired
	private ThemeService tService;
	
	@RequestMapping("theme.do")
	public ModelAndView themeList(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		int listCount = tService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Theme> list = tService.selectList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("theme/categoryList");
		return mv;
	}
	
	@RequestMapping("pagination.do")
	public void pagination(HttpServletResponse response,
		@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage)throws IOException {
			
		response.setContentType("application/json; charset=UTF-8");
	  
		int listCount = tService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
	
		ArrayList<Theme> list = tService.selectList(pi);
		JSONArray jArr = new JSONArray();
		
		for(Theme t: list) {
			JSONObject jobj = new JSONObject();
			jobj.put("tModifyFile","resources/tuploadFiles/"+t.gettModifyFile());
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
	public String insertTheme(Theme t) {
		
		int result = tService.insertTheme(t);
		
		if(result >0) return "redirect:theme.do"; else return "";
	}
	
	@RequestMapping("postdetail.do")
	public ModelAndView themeDetailView(ModelAndView mv, 
			@RequestParam(value="tId") int bId) {
		
		Theme t = tService.selectTheme(bId);
		mv.addObject("t",t);
		mv.setViewName("board/post");		
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
		         sFileInfo += "&sFileName="+ originFilename;
		         sFileInfo += "&sFileURL="+"/spring/resources/tuploadFiles/"+ renameFilename;
		         PrintWriter print = response.getWriter();
		         print.print(sFileInfo);
		         print.flush();
		         print.close();
		         
		         TFile tf = new TFile();
		         
		         TFile.tOriginalFile = originFilename;
		         TFile.tModifyFile = renameFilename;
		         TFile.tCodeNumber = tService.getTNum();
		         System.out.println(originFilename);
		         System.out.println(renameFilename);
		         System.out.println(tf);
		         
		         int result = tService.insertImg(tf);
		         
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}	

}
