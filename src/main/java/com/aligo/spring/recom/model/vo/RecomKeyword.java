package com.aligo.spring.recom.model.vo;

public class RecomKeyword {

	private String keyword1;			//	첫번째 키워드
	private String keyword2;			//	두번째 키워드
	private String keyword3;			//	세번째 키워드
	private String keyword4;			//	네번째 키워드
	private String keyword5;			//	다섯번째 키워드

	public RecomKeyword() {
		super();
	}

	public RecomKeyword(String keyword1, String keyword2, String keyword3, String keyword4, String keyword5) {
		super();
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
		this.keyword4 = keyword4;
		this.keyword5 = keyword5;
	}

	public String getKeyword1() {
		return keyword1;
	}

	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}

	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}

	public String getKeyword3() {
		return keyword3;
	}

	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}

	public String getKeyword4() {
		return keyword4;
	}

	public void setKeyword4(String keyword4) {
		this.keyword4 = keyword4;
	}

	public String getKeyword5() {
		return keyword5;
	}

	public void setKeyword5(String keyword5) {
		this.keyword5 = keyword5;
	}

	@Override
	public String toString() {
		return "RecomKeyword [keyword1=" + keyword1 + ", keyword2=" + keyword2 + ", keyword3=" + keyword3
				+ ", keyword4=" + keyword4 + ", keyword5=" + keyword5 + "]";
	}
	
	
	
	
}
