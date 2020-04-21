package com.aligo.spring.chat.msg;

import java.util.Objects;

public class Message {

	private String nickname;
	private String room;
	private String msg;
	private String flag;
	private String receiveNn;
	
	public Message() {}

	public Message(String nickname, String room, String msg, String flag) {
		super();
		this.nickname = nickname;
		this.room = room;
		this.msg = msg;
		this.flag = flag;
	}

	public Message(String nickname, String room, String msg, String flag, String receiveNn) {
		super();
		this.nickname = nickname;
		this.room = room;
		this.msg = msg;
		this.flag = flag;
		this.receiveNn = receiveNn;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getReceiveNn() {
		return receiveNn;
	}

	public void setReceiveNn(String receiveNn) {
		this.receiveNn = receiveNn;
	}
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(obj instanceof Message) {
			Message m=(Message)obj;
			return this.nickname.equals(m.getNickname());
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(nickname);
	}
	
	@Override
	public String toString() {
		return "Message [nickname=" + nickname + ", room=" + room + ", msg=" + msg + ", flag=" + flag + ", receiveNn=" + receiveNn
				+ "]";
	}
}
