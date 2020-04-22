package com.aligo.spring.chat.controller;

import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aligo.spring.chat.msg.Message;
import com.aligo.spring.chat.msg.MessageDecoder;
import com.aligo.spring.chat.msg.MessageEncoder;
import com.aligo.spring.member.model.vo.Member;

@ServerEndpoint(value="/chat.do",
				encoders = {MessageEncoder.class},
				decoders = {MessageDecoder.class}
				)
@Controller
public class ChattingServer {

	@RequestMapping("chat.do")
	public String goChatting() {
		
		return "chat/chat";
	}
	
	private Message fileMsg;
	
	@OnOpen
	public void open(Session session, EndpointConfig conf) {
		
		session.getMaxBinaryMessageBufferSize();
		
		//	생성된 채팅방 가져오기
		String rooms = checkRooms(session);
		
		//	사용자 가져오기
		String users = checkUser(session);
		
		try {
			session.getBasicRemote().sendObject(new Message("admin", "", rooms, "room"));	//	방 현황 전송
			session.getBasicRemote().sendObject(new Message("admin", "", users, "user"));	//	유저 현황 전송
		}catch(Exception e1) {
			e1.printStackTrace();
		}
	}
	
	@OnMessage
	public void messageObj(Session session, Message msg) {
		
		//	session으로 socket session 관리하기
		session.getUserProperties().put("msg", msg);
		
		//	생성된 채팅방 가져오기
		String rooms = checkRooms(session);

		//	사용자 가져오기
		String users = checkUser(session);
		
		//	message를 하는 기준값
		String flag = msg.getFlag();
		
		try {
			if(flag.equals("file")) {
				
				fileMsg = msg;
			}else if (flag.equals("msg")) {
				
				for(Session s : session.getOpenSessions()) {
					
					Message m = (Message)(s.getUserProperties().get("msg"));
					System.out.println("여기확인 : " + m);
					m.setReceiveNn(users);
//					s.getBasicRemote().sendObject(new Message("admin","",rooms, "room"));
					s.getBasicRemote().sendObject(new Message("admin","",users, "user"));
					
					if( m != null) {
						System.out.println("세션 접속자 : " + m.getNickname());
						System.out.println("받는 사람들 : " + m.getReceiveNn());
						
//						s.getBasicRemote().sendObject(msg);
						
						if( m.getNickname().equals(msg.getReceiveNn())) {
							
							s.getBasicRemote().sendObject(msg);
						}else if( msg.getReceiveNn().equals("") && m.getRoom().equals(msg.getRoom())) {
							
							s.getBasicRemote().sendObject(msg);
						}
					}
				}
			}else if ( flag.equals("createroom")) {
				
				for(Session s : session.getOpenSessions()) {
					
					s.getBasicRemote().sendObject(new Message("admin", "",rooms, "room"));
					s.getBasicRemote().sendObject(new Message("admin", "",users, "user"));
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@OnClose
	public void close(Session session, CloseReason reason) {
		
	}
	
	private String checkRooms(Session session) {
		
		//채팅방 확인하기
		Set<String> rooms = new HashSet<String>();
		
//		System.out.println("1" + rooms);
		
		for(Session s : session.getOpenSessions()) {
			
			Message m = (Message)(s.getUserProperties().get("msg"));
			System.out.println("m : " + m);
			if(m != null) {
				rooms.add(m.getRoom());
			}
		}
		
//		System.out.println("2" + rooms);
		
		String[] roomStr = new String[rooms.size()];
		rooms.toArray(roomStr);
		
		return String.join(",", rooms);
	}
	
	private String checkUser(Session session) {
		
		//채팅방 확인하기
		Set<String> users = new HashSet<String>();
		
		for(Session s : session.getOpenSessions()) {
			Message m = (Message)(s.getUserProperties().get("msg"));
			if(m!=null) {
				
				users.add(m.getNickname());
			}
		}
		
		String[] usersStr = new String[users.size()];
		users.toArray(usersStr);
		
//		System.out.println("usersStr : " + usersStr);
//		System.out.println("users : " + users);
		
		while(users.remove(null));
		
//		System.out.println(String.join(",", users));
		
		return String.join(",", users);
	}
	
	
	
}
