package com.aligo.spring.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aligo.spring.member.model.service.MemberService;
import com.aligo.spring.member.model.vo.Member;



/*
 * 회원가입
 * → 아이디중복체크 -> 옆에 버튼만들어서 중복체크 중복이면 알럿으로 띄워주기?
 * → 이메일 형식 지키도록 (ex. www@dfad.net 안됨) -> 인풋창 아래 올바른 형식으로 입력해주세요. 띄우기
 * → 비밀번호 영문자+숫자 조합으로 -> 인풋창아래 영문자+숫자 조합으로 입력해주세요. 띄우기
 * → 비밀번호 일치체크 -> 입력하신 비밀번호와 일치/불일치 합니다. 띄우기
 * → 닉네임중복제크 -> 옆에 버튼만들어서 중복체크 중복이면 알럿으로 띄워주기?
 * → 회원가입나이제한(0~100)
 * → 취향선택 연결하기
 */
@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Inject
	JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	MemberService memberservice;

	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	private static final String String = null;

	@Autowired
	private MemberService memService;

	@RequestMapping(value="signUp.do", method = RequestMethod.POST)
	public String insertMember(Member m) {

		String encPwd = bcryptPasswordEncoder.encode(m.getpassword());
		m.setpassword(encPwd);

		int result = memService.insertMember(m);

		if(result >0) {
			return "redirect:main.do";
		} else {
			return "common/errorPage.jsp";
		}

	}

	/**
	 * @param email
	 * @return
	 * 이메일 중복관련
	 */
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String email) {

		int result = memService.idCheck(email);

		if(result >0) {
			return "fail";
		}else {
			return "ok";
		}

	}

	@ResponseBody
	@RequestMapping("nickCheck.do")
	public String nickCheck(String nickname) {

		int result = memService.nickCheck(nickname);

		if(result >0) {
			return "fail";
		}else {
			return "ok";
		}
	}



	/**
	 * @param request
	 * @param e_mail
	 * @param response_email
	 * @return
	 * @throws IOException
	 * 이메일 인증 관련
	 */
	@RequestMapping( value = "auth.do" , method=RequestMethod.POST )
	public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email) throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)

		String setfrom = "noticealigo@gmail.com";
		String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
		String title = "Welcome to Aligo"; // 제목
		String content =

				System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성

				System.getProperty("line.separator")+

				"Hello~"

        +System.getProperty("line.separator")+

        System.getProperty("line.separator")+

        " Your number is " + dice

        +System.getProperty("line.separator")+

        System.getProperty("line.separator")+

        "Thank You!"; // 내용


		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		String diceStr = "" + dice;

		ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("/member/email_injeung");     //뷰의이름
		mv.addObject("dice", diceStr);

		System.out.println("mv : "+mv);

		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('Send the authentication no. to your Email');</script>"); 	
		out_email.flush();
		mv.addObject(e_mail);
		return mv;


	}

	//이메일 인증 페이지 맵핑 메소드
	@RequestMapping("/member/signUp.do")
	public String email() {
		return "member/signUp";
	}


	//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	//틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "ec.do")
	public ModelAndView join_injeung(String email_injeung, String diceCheck, String email, HttpServletResponse response_equals) throws IOException {


		System.out.println("마지막 : email_injeung : "+ email_injeung);

		System.out.println("마지막 : dice : "+diceCheck);

		System.out.println("email : " + email);


		//페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음

		ModelAndView mv = new ModelAndView();

		mv.setViewName("/member/join.do");


		if (email_injeung.equals(diceCheck)) {

			//인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

			mv.setViewName("member/join");
			mv.addObject("email",email);
			//만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			//한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('Matched authentication no.');</script>");
			out_equals.flush();

			return mv;


		}else if (email_injeung != diceCheck) {


			ModelAndView mv2 = new ModelAndView(); 

			mv2.setViewName("member/email_injeung");

			response_equals.setContentType("text/html; charset=UTF-8"); PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('Not matched authentication no. Try again'); history.go(-1);</script>");
			out_equals.flush();


			return mv2;

		}    

		return mv;

	}

	/** 암호화 로그인
	 * @param m
	 * @param model
	 * @return
	 */
	@RequestMapping(value="login.do")
	public String memberLogin(@ModelAttribute Member m, Model model) {

		Member loginUser = memService.loginMember(m);

		if(loginUser != null && bcryptPasswordEncoder.matches(m.getpassword(), loginUser.getpassword())) {			
			//	로그인 성공 시 세션에 정보를 담아야 되기 때문에 세션이 필요하다.
			model.addAttribute("loginUser", loginUser);
			return "redirect:main.do";
		}else {			
			//	로그인 실패
			model.addAttribute("msg", "login fail!!");
			return "common/errorPage";
		}
	}

	/** 로그아웃
	 * @param status
	 * @return
	 */
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		// SessionStatus : 커맨드 객체로 세선의 상태를 관리할 수 있는 객체이다.

		// 세션의 상태를 확정지어주는 메소드 호출
		status.setComplete();

		return "redirect:main.do";
	}



	@RequestMapping("pwdUpdate.do")

	public String pwdUpdate(Member m, Model model) throws Exception {

		String encPwd = bcryptPasswordEncoder.encode(m.getpassword());
		m.setpassword(encPwd);

		int result = memService.pwdUpdate(m);

		if (result > 0) { 
			model.addAttribute("loginUser", m); 

			return "redirect:main.do"; 

		} else { 

			model.addAttribute("msg", "Modify Fail"); 

			return "common/errorPage"; 
		} 
	}



	@RequestMapping(value = "findPwd.do")
	public String findPwd() throws Exception{
		return "member/findPwd";
	} 
	

	@RequestMapping(value = "deleteAccount.do")
	public String deleteAccount() throws Exception{
		return "member/deleteAccount";
	} 
	
	// 회원 탈퇴 post
	@RequestMapping(value="deleteMember.do", method = RequestMethod.POST)
	public String memberDelete(Member m, HttpSession session, RedirectAttributes rttr,SessionStatus status) throws Exception{
		memService.deleteMember(m);
		session.invalidate();
		status.setComplete();

		
		return "redirect:main.do";
	}
	
	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value="passChk.do", method = RequestMethod.POST)
	public boolean passChk(Member m) throws Exception {

		Member login = memService.loginMember(m);
		boolean pwdChk = bcryptPasswordEncoder.matches(m.getpassword(), login.getpassword());
		return pwdChk;
	}
	
	
	

	public Member findPwd(Member m) throws Exception{
		Random r = new Random();
		int num = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
		System.out.println(num);
		String newpass = Integer.toString(num);
		System.out.println(newpass);
		m.setpassword(newpass);
		return m;
}
	
	
	@RequestMapping("findPwdfin.do")
	public String findPwdfin(Member m, HttpSession session,HttpServletResponse response_email,HttpServletRequest request) throws Exception{
		

		m = findPwd(m);
		String newpass = m.getpassword();
		
		String setfrom = "noticealigo@gmail.com";
		String tomail = request.getParameter("email"); 
		String title = "[Aligo] Your temporary password"; 
		String content =
				"Hello~ your temporary password is [ " + newpass
		+ " ] you must change your password after login"; 

		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); 
			messageHelper.setTo(tomail); 
			messageHelper.setSubject(title); 
			messageHelper.setText(content); 

			mailSender.send(message);
			m.setpassword(bcryptPasswordEncoder.encode(m.getpassword()));
			memService.findPwd(m);
			
		} catch (Exception e) {
			System.out.println(e);
			
		}
	
		return "redirect:loginView.do";


	} 
	
}
