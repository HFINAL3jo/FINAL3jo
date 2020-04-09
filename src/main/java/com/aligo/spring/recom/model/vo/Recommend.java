package com.aligo.spring.recom.model.vo;

public class Recommend {

	private String recomCode;			//	질문 코드
	private String recomContent;		//	질문 내용
	private String keyword1;			//	질문에 대한 키워드 1 (답변 1)
	private String keyword1Content;		//	키워드 1 내용 (화면에 보여질 내용)
	private String keyword2;			//	질문에 대한 키워드 2 (답변 2)
	private String keyword2Content;		//	키워드 2 내용 (화면에 보여질 내용)
	private String rStatus;				//	상태
	
	public Recommend() {
		super();
	}

	public Recommend(String recomCode, String recomContent, String keyword1, String keyword1Content, String keyword2,
			String keyword2Content, String rStatus) {
		super();
		this.recomCode = recomCode;
		this.recomContent = recomContent;
		this.keyword1 = keyword1;
		this.keyword1Content = keyword1Content;
		this.keyword2 = keyword2;
		this.keyword2Content = keyword2Content;
		this.rStatus = rStatus;
	}

	public String getRecomCode() {
		return recomCode;
	}

	public void setRecomCode(String recomCode) {
		this.recomCode = recomCode;
	}

	public String getRecomContent() {
		return recomContent;
	}

	public void setRecomContent(String recomContent) {
		this.recomContent = recomContent;
	}

	public String getKeyword1() {
		return keyword1;
	}

	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}

	public String getKeyword1Content() {
		return keyword1Content;
	}

	public void setKeyword1Content(String keyword1Content) {
		this.keyword1Content = keyword1Content;
	}

	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}

	public String getKeyword2Content() {
		return keyword2Content;
	}

	public void setKeyword2Content(String keyword2Content) {
		this.keyword2Content = keyword2Content;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "Recommend [recomCode=" + recomCode + ", recomContent=" + recomContent + ", keyword1=" + keyword1
				+ ", keyword1Content=" + keyword1Content + ", keyword2=" + keyword2 + ", keyword2Content="
				+ keyword2Content + ", rStatus=" + rStatus + "]";
	}


	
	
}
