package com.aligo.spring.theme.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aligo.spring.theme.model.vo.PhotoVo;

@Controller
public class ThemeFileController {
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
}
