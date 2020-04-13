package com.aligo.spring.theme.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVo {
	private MultipartFile FileData;
	private String callback;
	private String callback_func;

	public PhotoVo() {}

	public MultipartFile getFileData() {
		return FileData;
	}

	public void setFileData(MultipartFile fileData) {
		FileData = fileData;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getCallback_func() {
		return callback_func;
	}

	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}

	public PhotoVo(MultipartFile fileData, String callback, String callback_func) {
		super();
		FileData = fileData;
		this.callback = callback;
		this.callback_func = callback_func;
	}

	@Override
	public String toString() {
		return "PhotoVo [FileData=" + FileData + ", callback=" + callback + ", callback_func=" + callback_func + "]";
	}

}
