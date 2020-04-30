
package com.aligo.spring.blog.controller;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aligo.spring.blog.model.service.BlogService;
import com.aligo.spring.blog.model.vo.BFile;
import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.common.AligoException;
import com.aligo.spring.common.Pagination;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;
import com.aligo.spring.theme.model.vo.Theme;

@Controller
public class BlogController extends BFile {
	
	@Autowired 
	private BlogService blService;
	
	@RequestMapping("blog.do")
	public ModelAndView blogList(ModelAndView mv,
			@RequestParam(value="currentPage",required=false,defaultValue="1")
			int currentPage,
			@RequestParam(value="keyword",required=false)String keyword,
			SearchCondition sc) {
		
		sc.setKeyword(keyword);
		
		if(currentPage <= 0) {
			currentPage = 1;
		}
		
		int listCount = blService.getListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo4(currentPage, listCount);
		
		ArrayList<Blog> list = blService.selectList(pi,sc);
		
		for(Blog b: list) {
			if(b.getbFileStatus().equals("Y")) {
				
				BFile bf = blService.getFile(b.getbId());
				
				b.setbModifyFile(bf.getbModifyFile());
				
				if(b.getbModifyFile().length() <= 18) {
					b.setbModifyFile("resources/buploadFiles/" + b.getbModifyFile());
				}else if(b.getbModifyFile().contains(",")){
					b.setbModifyFile("resources/buploadFiles/" + b.getbModifyFile().substring(0,b.getbModifyFile().indexOf(",")));
				}
			}
		}
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("blog/blogList");
		return mv;
	}

	@RequestMapping("blogInsertView.do")
	public String blogInsertView() {
		return "blog/blogInsertView";
	}
	
	@RequestMapping("blogInsert.do")
	public String insertBlog(Blog b,HttpServletRequest request)
			 throws ServletException, IOException {
		int bNum = blService.getBNum();
		int result = 0;
		try {
			result = blService.insertBlog(b,bNum);
		} catch (AligoException e) {
			e.getMessage();
		}
		if(result >0) {
			
			blService.insertMyReview(b);
			return "redirect:blog.do"; 
		}else { 
			request.setAttribute("msg",AligoException.getMsg());
			request.getRequestDispatcher("views/common/errorPage.jsp");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("blogMultiplePhotoUpload.do")
	public void saveFile(HttpServletRequest request, MultipartFile file,HttpServletResponse response) {
		String sFileInfo = "";
        String originFilename = request.getHeader("file-name");
        String root = request.getSession().getServletContext().getRealPath("resources");
        String savePath = root + "\\buploadFiles";
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
	         sFileInfo += "&sFileURL="+"/spring/resources/buploadFiles/"+ renameFilename;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	         
	         BFile bf = new BFile();
	         
	         BFile.bOriginalFile = originFilename;
	         BFile.bModifyFile = renameFilename;
	         BFile.bCodeNumber = blService.getBNum();
	         int result = blService.insertImg(bf);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	@RequestMapping("bDetailView.do")
	public ModelAndView blogDetail(ModelAndView mv,@RequestParam(value="bId")int bId) {
		Blog b = blService.selectBlog(bId);
		
		if(b.getbFileStatus().equals("Y")) {
			
			BFile bf = blService.getFile(b.getbId());
			
			b.setbModifyFile(bf.getbModifyFile());
			
		}
		
		ArrayList list = new ArrayList();
		if(b.getbModifyFile() != null) {
			
			if(b.getbModifyFile().length() > 18 && b.getbModifyFile().contains(",")) {
				String str = b.getbModifyFile();
				String strArr[] = str.split(",");
				
				for(int i=0;i<strArr.length;i++) {
					String result = strArr[i];
					BFile bf = new BFile();
					bf.setbModifyFile(result);
					list.add(bf);
				}
			}
		}
		if(!list.isEmpty()) {
			b.setbFileList(list);
		}
		if(b.getbAddress() != null && b.getbAddress().contains(",")) {
			b.setbAddress(b.getbAddress().substring(0,b.getbAddress().lastIndexOf(",")));
		}
		mv.addObject("b",b).setViewName("blog/blogDetailView");
		return mv;
	}
	
	@RequestMapping("searchBlog.do")
	public ModelAndView searchBlog(ModelAndView mv,@RequestParam
			(value="bkeyword",required=false) String bkeyword) {
		SearchCondition sc = new SearchCondition();
		
		sc.setSearchVal(bkeyword);
		
		int listCount = blService.getSearchListCount(sc);
		int currentPage = 1;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
		ArrayList<Blog> list = blService.selectSearchList(pi,sc);
		
		for(Blog b: list) {
			
			if(b.getbFileStatus().equals("Y")) {
				
				BFile bf = blService.getFile(b.getbId());
				b.setbModifyFile(bf.getbModifyFile());
				
				if(b.getbModifyFile().length() <= 18) {
					b.setbModifyFile("resources/buploadFiles/" + b.getbModifyFile());
				}else if(b.getbModifyFile().contains(",")){
					b.setbModifyFile("resources/buploadFiles/" + b.getbModifyFile().substring(0,b.getbModifyFile().indexOf(",")));
				}
			}
		}
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.addObject("sc",sc);
		mv.setViewName("blog/blogList");
		return mv;
	}
	
	@RequestMapping("bupdateLike.do")
	public String updateLike(int bId,String lv,String loginUser,HttpServletResponse response) throws IOException {
		
		HashMap<String,String> map = new HashMap<>();
		map.put("loginUser",loginUser);
		map.put("bId",Integer.toString(bId));
		map.put("lv",lv);
		int result = blService.updateLike(map);
		String str = "";
		switch(result) {
		case 3: str = "Saved mylike list!"; break;
		case 2: str = "deleted!"; break;
		case 0: str = "error!"; break;
		default: str = "Contact the admin"; break;
		}
		return str;
	}
	
	@RequestMapping("blogModifyView.do")
	public ModelAndView themeModifyView(int bId,ModelAndView mv) {
		Blog b = blService.selectBlog(bId);
		mv.addObject("b",b).setViewName("blog/blogModifyView");
		return mv;
	}
	
	@RequestMapping("blogModify.do")
	public String updateBlog(Blog b) {
			int result = blService.updateBlog(b);
			
			return "redirect:blog.do";
		}
	
	@RequestMapping("deleteBlog.do")
	public String deleteBlog(Blog b) {
			blService.deleteBlog(b);
		return "redirect:blog.do";
	}
}
