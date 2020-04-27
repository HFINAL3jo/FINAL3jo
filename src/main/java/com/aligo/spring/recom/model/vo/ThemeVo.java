package com.aligo.spring.recom.model.vo;

public class ThemeVo {

	private String tcode;			//	테마코드
	private String tname;			//	테마이름
	private int tid;				//	포스팅번호
	private String ttitle;			//	제목
	private String tstatus;			//	상태
	private String tfile;			//	이미지

	private RecomKeyword keywords;	//	키워드 5개
	
	public ThemeVo() {
		super();
	}

	public ThemeVo(String tcode, String tname, int tid, String ttitle, String tstatus, String tfile,
			RecomKeyword keywords) {
		super();
		this.tcode = tcode;
		this.tname = tname;
		this.tid = tid;
		this.ttitle = ttitle;
		this.tstatus = tstatus;
		this.tfile = tfile;
		this.keywords = keywords;
	}

	public String getTcode() {
		return tcode;
	}

	public void setTcode(String tcode) {
		this.tcode = tcode;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTtitle() {
		return ttitle;
	}

	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}

	public String getTstatus() {
		return tstatus;
	}

	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}

	public String getTfile() {
		return tfile;
	}

	public void setTfile(String tfile) {
		this.tfile = tfile;
	}

	public RecomKeyword getKeywords() {
		return keywords;
	}

	public void setKeywords(RecomKeyword keywords) {
		this.keywords = keywords;
	}

	@Override
	public String toString() {
		return "ThemeVo [tcode=" + tcode + ", tname=" + tname + ", tid=" + tid + ", ttitle=" + ttitle + ", tstatus="
				+ tstatus + ", tfile=" + tfile + ", keywords=" + keywords + "]";
	}


}
