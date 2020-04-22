package com.aligo.spring.chat.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class WebSocketSessionListener implements HttpSessionListener, HttpSessionAttributeListener{

	public WebSocketSessionListener() {}
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {

		se.getSession().getId();
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

}
