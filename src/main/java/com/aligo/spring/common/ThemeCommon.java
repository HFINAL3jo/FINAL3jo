package com.aligo.spring.common;

import com.aligo.spring.theme.model.vo.TFile;
import com.aligo.spring.theme.model.vo.Theme;

public class ThemeCommon {
	public static Theme themeCode(Theme t) {
		switch(t.gettCode()) {
		case "NATURE":t.settCode("T1"); break;
		case "RESTAURANT":t.settCode("T2"); break;
		case "HISTORY":t.settCode("T3"); break;
		case "SHOPPING":t.settCode("T4"); break;
		case "BAR":t.settCode("T5"); break;
		case "ACTIVITY":t.settCode("T6"); break;
		case "EXHIBITION":t.settCode("T7"); break;
		}
		return t;
	}
	
public static TFile fileCheck(Theme t,int tNum,int chk) throws AligoException {
			TFile tf = null;
		if(chk == 0) {
			
			String str = t.gettContent();
			try {
				str = str.substring(str.indexOf("src")+5,str.length());
				str = str.substring(0,str.indexOf("\""));
			}catch(Exception e){
				throw new AligoException("At least Need One Image");
			}
			t.settOriginalFile(str);
			t.settModifyFile(str);
			tf = new TFile();
			tf.settCodeNumber(tNum);
			tf.settOriginalFile(str);
			tf.settModifyFile(str);
	}
		return tf;
		}
}
