package com.aligo.spring.member.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aligo.spring.member.model.service.MemberService;
import com.aligo.spring.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memService;
	
	
	@RequestMapping(value="signUp.do", method = RequestMethod.POST)
	public String insertMember(Member m) {
		
		
		
		int result = memService.insertMember(m);
		
		
		/*
		 * String host = "smtp.google.com"; String user = "noticealigo@gmail.com"; //자신의
		 * 네이버 계정 String password = "khfinalaligo";//자신의 네이버 패스워드
		 * 
		 * //메일 받을 주소 String to_email = m.getEmail();
		 * 
		 * //SMTP 서버 정보를 설정한다. Properties props = new Properties();
		 * props.put("mail.smtp.host", host); props.put("mail.smtp.port", 465);
		 * props.put("mail.smtp.auth", "true"); props.put("mail.smtp.ssl.enable",
		 * "true");
		 * 
		 * //인증 번호 생성기 StringBuffer temp =new StringBuffer(); Random rnd = new Random();
		 * for(int i=0;i<10;i++) { int rIndex = rnd.nextInt(3); switch (rIndex) { case
		 * 0: // a-z temp.append((char) ((int) (rnd.nextInt(26)) + 97)); break; case 1:
		 * // A-Z temp.append((char) ((int) (rnd.nextInt(26)) + 65)); break; case 2: //
		 * 0-9 temp.append((rnd.nextInt(10))); break; } } String AuthenticationKey =
		 * temp.toString(); System.out.println(AuthenticationKey);
		 * 
		 * Session session = Session.getDefaultInstance(props, new
		 * javax.mail.Authenticator() { protected PasswordAuthentication
		 * getPasswordAuthentication() { return new
		 * PasswordAuthentication(user,password); } });
		 * 
		 * //email 전송 try { MimeMessage msg = new MimeMessage(session); msg.setFrom(new
		 * InternetAddress(user, "NEWBY 관리자"));
		 * msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
		 * 
		 * // 메일 제목 msg.setSubject("Aligo 회원가입 인증 메일입니다."); // 메일 내용
		 * msg.setText("인증 번호 : " + temp + "\n");
		 * 
		 * Transport.send(msg); System.out.println("이메일 전송");
		 * 
		 * } catch (Exception e) { e.printStackTrace();// TODO: handle exception
		 * System.out.println("오류발생"); }
		 * 
		 * HttpSession saveKey = request.getSession();
		 * saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
		 * saveKey.setAttribute("userId", to_email);
		 * 
		 * 
		 * new Gson().toJson("완료", response.getWriter());
		 * 
		 * }
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * System.out.println(m);
		 */
		return "main";
		

		
		/*
		 * if(result > 0) { return "redirect:main.jsp"; } else {
		 * model.addAttribute("msg","회원 가입에 실패하셨습니다."); return "common/errorPage.jsp"; }
		 */
		
		
	}
	

}
