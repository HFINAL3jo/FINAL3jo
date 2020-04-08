package com.aligo.spring.member.model.vo;

public class Member {
	
	private String email;
	private String pwd;
	private String nick;
	private String gender;
	private String age;
	private String fav;

	public Member() {}

	public Member(String email, String pwd, String nick, String gender, String age, String fav) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.nick = nick;
		this.gender = gender;
		this.age = age;
		this.fav = fav;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getFav() {
		return fav;
	}

	public void setFav(String fav) {
		this.fav = fav;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", pwd=" + pwd + ", nick=" + nick + ", gender=" + gender + ", age=" + age
				+ ", fav=" + fav + "]";
	}
	
	

}
