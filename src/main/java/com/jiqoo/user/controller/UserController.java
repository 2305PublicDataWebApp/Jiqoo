package com.jiqoo.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiqoo.user.domain.User;
import com.jiqoo.user.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSenderImpl mailSender;

	// 회원가입
	@PostMapping("/register")
	public ModelAndView insertUser(ModelAndView mv, @ModelAttribute User user) {
		int result = userService.insertUser(user);
		if(result > 0) {
			System.out.println("회원가입완료");
			mv.setViewName("/");
		} else {
			System.out.println("회원가입실패");
		}
		return mv;
	}
	
	// 로그인
	@ResponseBody
	@PostMapping("/login")
	public String selectCheckLogin(@ModelAttribute User user, HttpSession session) {
		User uOne = userService.selectCheckLogin(user);
		if (uOne != null) {
			session.setAttribute("userId", uOne.getUserId());
			session.setAttribute("userNickName", uOne.getUserNickname());
			session.setAttribute("userPhotoPath", uOne.getUserPhotoPath());
			session.setAttribute("adminYn", uOne.getAdminYn());
			return "true";
		} else {
			return "false";
		}
	}

	// ID 중복 체크
	@ResponseBody
	@GetMapping("/userIdCheck")
	public int selectCheckId(@RequestParam(value = "userId") String userId) {
		int idCheck = userService.selectCheckId(userId);
		return idCheck;
	}

	// 닉네임 중복 체크
	@ResponseBody
	@GetMapping("/userNicknameCheck")
	public int selectCheckNickname(@RequestParam(value = "userNickname") String userNickname) {
		int nicknameCheck = userService.selectCheckNickname(userNickname);
		return nicknameCheck;
	}
	
	// 이메일 중복, 인증체크
	@ResponseBody
	@PostMapping("/emailCheck")
	public Map<String, Object> selectCheckEmail(@RequestParam(value = "userEmail") String userEmail) {
		Map<String, Object> response = new HashMap<>();
		int emailCheck = userService.selectCheckEmail(userEmail);
		if (emailCheck == 0) { // 중복x
			int checkNum = this.sendEmail(userEmail);
			response.put("isDuplicate", false);
			response.put("checkNum", checkNum);
		} else {
			response.put("isDuplicate", true);
		}
		return response;
	}

	// 로그아웃
	@GetMapping("/logout")
	public String userLogout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	// 로그인페이지 접속
	@GetMapping("/login")
	public ModelAndView showUserLoginForm(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}

	// 마이페이지 접속
	@GetMapping("/myPage")
	public ModelAndView showMyPage(ModelAndView mv) {
		mv.setViewName("user/myPage");
		return mv;
	}

	// 회원가입페이지 접속
	@GetMapping("/register")
	public ModelAndView showRegisterForm(ModelAndView mv) {
		mv.setViewName("user/register");
		return mv;
	}

	// 수정페이지 접속
	@GetMapping("/modify")
	public ModelAndView showModifyForm(ModelAndView mv) {
		mv.setViewName("user/modify");
		return mv;
	}

	// 인증메일 발송
	private int sendEmail(String userEmail) {
		// 인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
	
		
		// 이메일 양식
		String setFrom = "jiqoofinal@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = userEmail;
		String title = "[지꾸] 이메일 인증번호"; // 이메일 제목
	    String content = "<div align='center' style='border:1px solid black; padding:10px;'>" +
		/* "<img src="" style=\"margin: 30px;\"><br>" + */
	            "<h1 style='color:black'>지꾸에서 발송한 인증번호입니다.</h1>" +
	            "<h1 style='color:black'>인증을 완료해주세요!</h1>" +
	            "<br>" +
	            "<h1 style='color:blue'>" + checkNum + "</h3>" +
	            "<br>" +
	            "</div>";
	
		// 이메일 전송
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return checkNum;
	}
}
