package com.jiqoo.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// 채팅 페이지 접속
	@GetMapping("/chat/list")
	public ModelAndView showChatList(ModelAndView mv, HttpSession session) {
		logger.info("session{}", session.getAttribute("userId"));
		
		// 로그인 하지 않았을 경우 로그인 페이지로 이동
//		if(session.getAttribute("userId") == null) {
//			mv.addObject("msg", "로그인이 필요한 서비스입니다.");
//			mv.addObject("url", "/user/login.do");
//			mv.setViewName("common/msg");
//		}else {
			// 참여한 채팅방 리스트
			String userId = (String) session.getAttribute("userId");
			userId = "user01";
			List<ChatRoom> chatRoomList = chatService.selectChatRoomById(userId);
			mv.addObject("chatRoomList", chatRoomList);
			mv.setViewName("chat/chatList");			
//		}
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value = "/chat/room", produces="application/json;charset=UTF-8;")
	public String chatRoom(@RequestParam("chatNo") int chatNo) {
		List<ChatMessage> chatMessageList = chatService.selectChatMessageByNo(chatNo);
		Gson gson = new Gson();
		return gson.toJson(chatMessageList);
	}
	
}
