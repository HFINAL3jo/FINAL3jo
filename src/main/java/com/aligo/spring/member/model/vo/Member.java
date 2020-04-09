package com.aligo.spring.member.model.vo;

public class Member {
	
	private String mid;
	private String email;
	private String password;
	private String nickname;
	private String gender;
	private int age;
	private String mStatus;
	private String recommend;

	public Member() {}

	public Member(String mid, String email, String password, String nickname, String gender, int age, String mStatus,
			String recommend) {
		super();
		this.mid = mid;
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.mStatus = mStatus;
		this.recommend = recommend;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}

	public String getnickname() {
		return nickname;
	}

	public void setnickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getrecommend() {
		return recommend;
	}

	public void setrecommend(String recommend) {
		this.recommend = recommend;
	}

	@Override
	public String toString() {
		return "Member [mid=" + mid + ", email=" + email + ", password=" + password + ", nickname=" + nickname + ", gender=" + gender
				+ ", age=" + age + ", mStatus=" + mStatus + ", recommend=" + recommend + "]";
	}

}
