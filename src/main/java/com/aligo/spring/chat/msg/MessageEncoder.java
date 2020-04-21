package com.aligo.spring.chat.msg;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;

public class MessageEncoder implements Encoder.Text<Message>{

	@Override
	public void destroy() {
		
	}

	@Override
	public void init(EndpointConfig config) {
		
	}

	@Override
	public String encode(Message object) throws EncodeException {

		return new Gson().toJson(object);
	}

}
