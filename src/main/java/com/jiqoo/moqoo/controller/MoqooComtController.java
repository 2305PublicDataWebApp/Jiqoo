package com.jiqoo.moqoo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.jiqoo.common.domain.Comment;
import com.jiqoo.moqoo.service.MoqooComtService;


@Controller
public class MoqooComtController {
	
	@Autowired
	private MoqooComtService moqooComtService;

	// 댓글 작성
	@ResponseBody
	@PostMapping("/comt/insert")
	public String insertComt(@ModelAttribute Comment comt, HttpSession session) {
		String comtWriter = (String)session.getAttribute("userId");
//		if(comtWriter != null && !comtWriter.equals("")) {
		comt.setComtWriter(comtWriter);
//		}
		int result = moqooComtService.insertComt(comt);
		if(result > 0) {
			return "success";
		}
		else {
			return "fales";
		}
		
	}
	
	// 댓글 삭제
	@ResponseBody
	@GetMapping("/moqoo/delComt")
	public String deleteComt(@ModelAttribute Comment comt) {
		int countChildComt = moqooComtService.countChildComment(comt);
		if(countChildComt > 0) {
			int updateDelComment = moqooComtService.updateDelComment(comt);
			if(updateDelComment > 0) {
				return "success";
			}else {
				return "fail";
			}
		}else {
		   int result = moqooComtService.deleteComt(comt);
		   if(result > 0) {
			   return "success";
		   }else {
			   return "fail";
		   }
		}
	}
	
	
	// 댓글 수정
	@ResponseBody
	@GetMapping("/moqoo/updateComt")
	public String updateComment(
//			@ModelAttribute Comment comment
			@RequestParam("refPostNo") int refPostNo
			, @RequestParam("comtNo") int comtNo
			, @RequestParam("comtContent") String comtContent
			) {
		Comment comt = new Comment ();
		comt.setRefPostNo(refPostNo);
		comt.setComtContent(comtContent);
		comt.setComtNo(comtNo);
		int result = moqooComtService.updateComment(comt);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
//	// 댓글 리스트
//	@ResponseBody
//	@GetMapping(value = "/moqoo/listComt", produces = "application/json;charset=UTF-8;")
//	public String showReplyList(@RequestParam int moqooNo ) {
//		List<Comment> comtList = moqooComtService.selectComtList(moqooNo);
//		// List 데이터를 JSON 형태로 만드는 방법
//		// 1. JSObject, JSONArray
//		// 2. Gson
//		// 3. HashMap
//		Gson gson = new Gson();
//		return gson.toJson(comtList);
//	}
	
	// 답글 작성
	@ResponseBody
	@GetMapping("/moqoo/insertReply")
	public String insertReComt(@RequestParam("comtContent") String comtContent
			, @RequestParam("pComtNo") int pComtNo
			,@RequestParam("refPostNo") int refPostNo
			, HttpSession session) {
		String comtWriter = (String)session.getAttribute("userId");
		Comment comt = new Comment();
		comt.setComtContent(comtContent);
		comt.setpComtNo(pComtNo);
		comt.setRefPostNo(refPostNo);
		comt.setComtWriter(comtWriter);
		int result = moqooComtService.insertReComt(comt);
		if(result > 0) {
			return "success";
		}
		else {
			return "fales";
		}
		
	}
	
	// 초기 댓글 리스트
	@ResponseBody
	@GetMapping("/moqoo/loadInitialComments")
	public List<Comment> loadInitialComments(@RequestParam int moqooNo){
		// moqooNo를 사용하여 초기 댓글 데이터를 가져오는 로직을 구현합니다.
        // 여기에서는 더미 데이터로 예시를 제공합니다.
        List<Comment> initialComts = moqooComtService.initialComments(moqooNo);
        return initialComts;
	}
	
	// 댓글 무한 스크롤
	@ResponseBody
	@GetMapping("/moqoo/loadMoreComments")
	public ResponseEntity<List<Comment>> loadMoreComments(@RequestParam("offset") int offset, @RequestParam("limit") int limit, @RequestParam("moqooNo") int moqooNo) {
		Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        params.put("moqooNo", moqooNo);
		List<Comment> newComments = moqooComtService.loadMoreComments(params);
        return ResponseEntity.ok(newComments);
	}
}
