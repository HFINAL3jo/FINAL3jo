package com.aligo.spring.chat.msg;

import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;

public class MessageDecoder implements Decoder.Text<Message> {

	@Override
	public void destroy() {
		
	}

	@Override
	public void init(EndpointConfig config) {
		
	}

	@Override
	public Message decode(String s) throws DecodeException {

		System.out.println(s);
		return new Gson().fromJson(s, Message.class);
	}

	@Override
	public boolean willDecode(String s) {
		
		return true;
	}

	
}
