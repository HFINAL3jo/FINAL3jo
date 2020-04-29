package com.aligo.spring.common;

import com.aligo.spring.blog.model.vo.BFile;
import com.aligo.spring.blog.model.vo.Blog;

public class BlogCommon {

	public static Blog blogCode(Blog b) {
		switch(b.getbCode()) {
		case "Information":b.setbCode("B1"); break;
		case "Transportation":b.setbCode("B2"); break;
		case "Travel Guide":b.setbCode("B3"); break;
		case "Accommodation":b.setbCode("B4"); break;
		case "Reviews":b.setbCode("B5"); break;
		case "etc":b.setbCode("B6"); break;
		}
		return b;
	}
	
public static BFile fileCheck(Blog b,int bNum,int chk){
			BFile bf = null;
		
			if(chk == 0) {
			
			String str = b.getbContent();
			
			if(str.indexOf("src") != -1) {
				
				str = str.substring(str.indexOf("src")+5,str.length());
				str = str.substring(0,str.indexOf("\""));
				
				b.setbOriginalFile(str);
				b.setbModifyFile(str);
				bf = new BFile();
				bf.setbCodeNumber(bNum);
				bf.setbOriginalFile(str);
				bf.setbModifyFile(str);
			}
		}
			
		return bf;
		}

}
