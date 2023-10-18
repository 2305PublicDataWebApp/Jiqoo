package com.jiqoo.moqoo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiqoo.common.domain.Comment;
import com.jiqoo.moqoo.service.MoqooComtService;


@Controller
public class MoqooComtController {
	
	@Autowired
	private MoqooComtService moqooComtService;

	// 댓글 작성
	@ResponseBody
	@PostMapping("/comt/insert")
	public String insertComt(@RequestParam("comtContent") String comtContent
			, @RequestParam("refMoqooNo") int refMoqooNo
			, HttpSession session) {
		String comtWriter = (String)session.getAttribute("userId");
		Comment comt = new Comment();
		comt.setRefPostNo(refMoqooNo);
		comt.setComtContent(comtContent);
		int result = 0;
		if(comtWriter != null && !comtWriter.equals("")) {
			comt.setComtWriter(comtWriter);
			result = moqooComtService.insertComt(comt);
		}
		if(result > 0) {
			return "success";
		}
		else {
			return "fales";
		}
		
	}
	
	@ResponseBody
	@GetMapping("/moqoo/delComt")
	public String deleteComt(@ModelAttribute Comment comt) {
		int result = moqooComtService.deleteComt(comt);
		if(result > 0) {
			return "success";
		}
		else {
			return "fail";
		}
	}
}
