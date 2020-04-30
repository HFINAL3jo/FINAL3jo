package com.aligo.spring.common;

import com.aligo.spring.blog.model.vo.Blog;

public class BlogCommon {

	public static Blog blogCode(Blog b) {
		switch(b.getbCode()) {
		case "Information":b.setbCode("B1"); break;
		case "Transportation":b.setbCode("B2"); break;
		case "Travel Guide":b.setbCode("B3"); break;
		case "Accommodation":b.setbCode("B4"); break;
		case "Reviews":b.setbCode("B5"); break;
		case "etc":b.setbCode("B6"); break;
		}
		return b;
	}	
}
