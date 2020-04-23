package com.aligo.spring.chat.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.websocket.Decoder;
import javax.websocket.DeploymentException;
import javax.websocket.Encoder;
import javax.websocket.server.ServerContainer;
import javax.websocket.server.ServerEndpointConfig;

import com.aligo.spring.chat.controller.ProgramicalEnpoint;
import com.aligo.spring.chat.msg.MessageDecoder;
import com.aligo.spring.chat.msg.MessageEncoder;

@WebListener
public class WebsocketListener implements ServletContextListener{

	public WebsocketListener() {}
	
	
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {

		ServerContainer container = (ServerContainer)sce.getServletContext().getAttribute("javax.websocket.server.ServerContainer");
		try {
			
			container.addEndpoint(getEndpoint());
			System.out.println("실행" + container);
		}catch(DeploymentException e) {
			e.printStackTrace();
		}
	}
	
	private ServerEndpointConfig getEndpoint() {
		
		//	server 구성
		ServerEndpointConfig.Builder build = ServerEndpointConfig.Builder.create(ProgramicalEnpoint.class, "/programic");
		
		//	websocketServerEndpoint 객체, mapping 주소 등록
		List<Class<? extends Encoder>> addEncoders = new ArrayList();
		addEncoders.add(MessageEncoder.class);
		
		//	객체 전송에 필요한 encoder 등록
		List<Class<? extends Decoder>> addDecoders = new ArrayList();
		addDecoders.add(MessageDecoder.class);
		
		//	객체 받을 때 필요한 decoder 등록
		build.encoders(addEncoders);
		build.decoders(addDecoders);
		
		return build.build();
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
