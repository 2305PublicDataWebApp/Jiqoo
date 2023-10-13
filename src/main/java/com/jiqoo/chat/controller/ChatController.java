package com.jiqoo.chat.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jiqoo.chat.domain.ChatMessage;
import com.jiqoo.chat.domain.ChatRoom;
import com.jiqoo.chat.domain.ChatRoomWithUnreadCount;
import com.jiqoo.chat.domain.ChatUser;
import com.jiqoo.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	@Autowired
	private SimpMessagingTemplate template;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// 채팅 페이지 접속
		@GetMapping("/chat/list")
		public String showChatList(Model model, HttpSession session) {
			logger.info("session{}", session.getAttribute("userId"));
			
			// 로그인 하지 않았을 경우 로그인 페이지로 이동
			if(session.getAttribute("userId") == null) {
				model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
				model.addAttribute("url", "/user/login.do");
				return "common/message";
			}else {
				// 참여한 채팅방 리스트
				String userId = (String) session.getAttribute("userId");
				List<ChatRoom> chatRoomList = chatService.selectChatRoomById(userId);
				List<ChatRoomWithUnreadCount> chatRoomWithCountList = new ArrayList<ChatRoomWithUnreadCount>();
				for(ChatRoom chatRoom : chatRoomList) {
					int unreadMsgCount = chatService.selectCountUnreadMsg(userId, chatRoom.getChatNo());
					ChatRoomWithUnreadCount chatRoomWithUnreadCount = new ChatRoomWithUnreadCount(chatRoom, unreadMsgCount);
					chatRoomWithCountList.add(chatRoomWithUnreadCount);
				}
				model.addAttribute("chatRoomList", chatRoomWithCountList);
			}
			return "chat/chatList";
		}
	
	// 채팅방 접속
	@ResponseBody
	@GetMapping(value = "/chat/room", produces="application/json;charset=UTF-8;")
	public String chatRoom(@RequestParam("chatNo") int chatNo) {
		List<ChatMessage> chatMessageList = chatService.selectChatMessageByNo(chatNo);
		Gson gson = new Gson();
		return gson.toJson(chatMessageList);
	}

	// 읽지 않은 메시지 갯수
	@ResponseBody
	@GetMapping("/chat/unreadCount/{chatRoomId}/{userId}")
	public int getUnreadMsgCount(@PathVariable int chatRoomId, @PathVariable String userId) {
		ChatUser chatUser = new ChatUser();
		chatUser.setRefChatNo(chatRoomId);
		chatUser.setUserId(userId);
		int unreadMsgCount = chatService.selectUnreadMsgCount(chatUser);
		return unreadMsgCount;
	}
	
	// 보낸 메시지 저장
	
	@MessageMapping("/chat/chatRoom-{refChatNo}")
	@SendTo("/toppic/chat/chatRoom-{refChatNo}")
	public ChatMessage sendMessage(@Payload ChatMessage chatMessage, @DestinationVariable int refChatNo) {
	    // 새로운 메시지를 데이터베이스에 저장
	    int result = chatService.insertChatMessage(chatMessage);
	    
	    if (result > 0) {
	        // 저장에 성공하면 메시지를 모든 클라이언트로 다시 보냄
	        return chatMessage;
	    } else {
	        // 저장에 실패한 경우 에러 처리
	        throw new RuntimeException("메시지를 저장하는 중에 문제가 발생했습니다.");
	    }
	}
	// 채팅방 나갈 때 마지막 접속시간 업데이트
	@ResponseBody
	@PostMapping("/chat/disconnect")
	public String updateChatLastDate(@ModelAttribute ChatUser chatUser) {
		int result = chatService.updateChatLastDate(chatUser);
		if(result > 0) {
			return "success";
		}else {
			return "error";
		}
	}
//	@MessageMapping(value = "/chat/chatRoom-{refChatNo}")
//	public void receiveMessage(ChatMessage message, @DestinationVariable int refChatNo) {
//		template.convertAndSend("/toppic/chat/chatRoom-" + refChatNo, message);
//		
//	}
	
}
