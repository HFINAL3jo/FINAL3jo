package com.aligo.spring.common;

import org.springframework.web.servlet.ModelAndView;

public class AligoException extends Exception{
	
	private static String msg;
	public AligoException(String msg){
		super(msg);
		AligoException.msg = msg;
	}
	public static String getMsg() {
		return msg;
	}
	public static void setMsg(String msg) {
		AligoException.msg = msg;
	}
	
}
