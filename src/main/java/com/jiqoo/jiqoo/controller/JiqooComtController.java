package com.jiqoo.jiqoo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.jiqoo.common.domain.Comment;
import com.jiqoo.jiqoo.service.JiqooComtService;

@RestController
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
	@ResponseBody
	@GetMapping("/jiqoo/insertComt")
	public String insertComment(@ModelAttribute Comment comment, HttpSession session) {
	String comtWriter = (String)session.getAttribute("userId");
	comment.setComtWriter(comtWriter);
	int result = jiqooComtService.insertComment(comment);
	if(result > 0) {
			return "success";
	}else {
		return "fail";
			}
	}
	
	   
	// 댓글 삭제
   @ResponseBody 
   @GetMapping("/jiqoo/delComment")
	public String deleteComment(
			@ModelAttribute Comment comment
			) {
	   int countChildComt = jiqooComtService.countChildComment(comment);
	   if(countChildComt > 0) {
		   int updateDelComment = jiqooComtService.updateDelComment(comment);
		   if(updateDelComment > 0) {
			   return "success";
		   }else {
			   return "fail";
		   }
	   }else {
		   int result = jiqooComtService.delComment(comment);
		   if(result > 0) {
			   return "success";
		   }else {
			   return "fail";
		   }
	   }
   }
   
   // 댓글 수정
	@ResponseBody
	@GetMapping("/jiqoo/updateComt")
	public String updateComment(
//			@ModelAttribute Comment comment
			@RequestParam("refPostNo") int refPostNo
			, @RequestParam("comtNo") int comtNo
			, @RequestParam("comtContent") String comtContent
			) {
		Comment comment = new Comment ();
		comment.setRefPostNo(refPostNo);
		comment.setComtContent(comtContent);
		comment.setComtNo(comtNo);
		int result = jiqooComtService.updateComment(comment);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	@ResponseBody
	@GetMapping("/jiqoo/insertReply")
	public String insertReply(@RequestParam("pComtNo") int pComtNo, @RequestParam("comtContent") String comtContent , @RequestParam("refPostNo") int refPostNo,HttpSession session) {
		String comtWriter = (String)session.getAttribute("userId");
		Comment comment = new Comment();
		comment.setComtWriter(comtWriter);
		comment.setpComtNo(pComtNo);
		comment.setComtContent(comtContent);
		comment.setRefPostNo(refPostNo);
		int result = jiqooComtService.insertReply(comment);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
//	// 댓글 리스트
//	@ResponseBody
//	@GetMapping(value = "/jiqoo/listComt", produces = "application/json;charset=UTF-8;")
//	public String showReplyList(@RequestParam int jiqooNo ) {
//		List<Comment> commentList = jiqooComtService.selectCommentList(jiqooNo);
//		// List 데이터를 JSON 형태로 만드는 방법
//		// 1. JSObject, JSONArray
//		// 2. Gson
//		// 3. HashMap
//		Gson gson = new Gson();
//		return gson.toJson(commentList);
//	}
	
	@ResponseBody
	@GetMapping("/jiqoo/loadInitialComments")
    public List<Comment> loadInitialComments(@RequestParam int jiqooNo) {
        // jiqooNo를 사용하여 초기 댓글 데이터를 가져오는 로직을 구현합니다.
        // 여기에서는 더미 데이터로 예시를 제공합니다.
        List<Comment> initialComments = jiqooComtService.initialComments(jiqooNo);
        return initialComments;
    }
	
	@ResponseBody
	@GetMapping("/jiqoo/loadMoreComments")
	public ResponseEntity<List<Comment>> loadMoreComments(@RequestParam("offset") int offset, @RequestParam("limit") int limit, @RequestParam("jiqooNo") int jiqooNo) {
		Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        params.put("jiqooNo", jiqooNo);
		List<Comment> newComments = jiqooComtService.loadMoreComments(params);
        return ResponseEntity.ok(newComments);
	}
}
