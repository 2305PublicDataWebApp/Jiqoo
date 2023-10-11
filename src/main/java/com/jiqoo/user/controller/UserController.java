package com.jiqoo.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiqoo.user.domain.User;
import com.jiqoo.user.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	// 로그인페이지 접속
	@GetMapping("/login.do")
	public ModelAndView showUserLoginForm(ModelAndView mv) {
		mv.setViewName("user/login");
		return mv;
	}
	
	// 로그인
	@ResponseBody
	@PostMapping("/login.do")
	public String userLogin(@ModelAttribute User user, HttpSession session) {
		User uOne = userService.selectCheckLogin(user);
		if(uOne != null) {
			session.setAttribute("userId", uOne.getUserId());
			session.setAttribute("userNickName", uOne.getUserNickname());
			session.setAttribute("userPhotoPath", uOne.getUserPhotoPath());
			session.setAttribute("adminYn", uOne.getAdminYn());
			return "true";
		} else {
			return "false";			
		}
	}
	
	// 로그아웃
	@GetMapping("/logout.do")
	public String userLogout(HttpSession session) {
		if(session != null) {
			session.invalidate();	
		}
		return "redirect:/";
	}
	
	// 마이페이지 접속
	@GetMapping("/myPage.do")
	public ModelAndView showMyPage(ModelAndView mv) {
		mv.setViewName("user/myPage");
		return mv;
	}
	
	// 회원가입페이지 접속
	@GetMapping("/register.do")
	public ModelAndView showRegisterForm(ModelAndView mv) {
		mv.setViewName("user/register");
		return mv;
	}
	
	// 수정페이지 접속
	@GetMapping("/modify.do")
	public ModelAndView showModifyForm(ModelAndView mv) {
		mv.setViewName("user/modify");
		return mv;
	}
}
