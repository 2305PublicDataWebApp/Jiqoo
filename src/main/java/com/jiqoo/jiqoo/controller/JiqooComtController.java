package com.jiqoo.jiqoo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.jiqoo.service.JiqooComtService;

@Controller
public class JiqooComtController {

	@Autowired
	private JiqooComtService jiqooComtService;

//	@PostMapping("/comt/add")
//	public String insertComt(Model model, @ModelAttribute Comment comment, HttpSession session) {
//		String url = "";
//		try {
//			String comtWriter = (String)session.getAttribute("userId");
//			if(comtWriter != null && !comtWriter.equals("")) {
////				comment.
//				return "";
//			}else {
//				model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
//				model.addAttribute("url", "/jiqoo/login");
//				return "common/message";
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", e.getMessage());
//			model.addAttribute("url", "/jiqoo/list");
//			return "common/message";
//		}
//	}
	
	   //댓글 작성
	   @PostMapping("/jiqoo/insertComt")
	   @ResponseBody
	   public String insertComment(int jiqooNo, int userNo, String comtContent) {
	      Comment comment = new Comment();
	      comment.setRefPostNo(jiqooNo);
	      comment.setComtWriter(userNo);
	      comment.setComtContent(comtContent);
	      int result = jiqooComtService.insertComment(comment);
	      return "success";
	   }
	
	   
}
