package com.jiqoo.chat.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.handler.invocation.reactive.ReturnValueHandlerConfigurer;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
import com.jiqoo.user.domain.User;

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
				model.addAttribute("url", "/user/login");
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
				// 현재 날짜/시간
		        Date now = new Date();
		        // 현재 날짜/시간 출력
		        System.out.println(now); // Thu May 03 14:43:32 KST 2022
		        // 포맷팅 정의
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        // 포맷팅 적용
		        String currentDate = sdf.format(now);
				model.addAttribute("currentDate", currentDate);
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
	// 메시지 ID로 정보 조회
	@ResponseBody
	@GetMapping("/chat/userinfo")
	public String selectMsgSenderInfo(@RequestParam String userId) {
		User user = chatService.selectMsgSenderInfo(userId);
		Gson gson = new Gson();
		return gson.toJson(user);
	}
	
	// 채팅방별 참여자 조회
	@ResponseBody
	@GetMapping("/chat/users")
	public String selectAllUserByChatNo(@RequestParam int chatNo) {
		List<User> userList = chatService.selectAllUserByChatNo(chatNo);
		Gson gson = new Gson();
		System.out.println(gson.toJson(userList));
		return gson.toJson(userList);
	}
	
	// 초대할 유저 검색
	@ResponseBody
	@GetMapping("/chat/user-search")
	public String selectUsersByKeyword(@RequestParam int chatNo, @RequestParam String user) {
		List<User> userList = chatService.selectUsersByKeyword(chatNo, user);
		Gson gson = new Gson();
		return gson.toJson(userList);
	}
	
	// 초대한 유저 채팅방에 추가
	@ResponseBody
	@PostMapping("/chat/invite-users")
	public String insertChatUserByChatNo(@RequestBody Map<String, Object> requestData) {
	    int result = 0;
	    int chatNo = Integer.parseInt((String) requestData.get("chatNo"));
	    List<String> selectedUserIds = (List<String>) requestData.get("selectedUserIds");
	    for (String userId : selectedUserIds) {
	        result += chatService.insertChatUserByChatNo(chatNo, userId);
	    }
	    if (result >= selectedUserIds.size()) {
	        return "success";
	    } else {
	        return "fail";
	    }
	}
	
	@ResponseBody
	@GetMapping("/chat/delete-chat-user")
	public String deleteChatUser(@ModelAttribute ChatUser chatUser, Model model) {
		int result = chatService.deleteChatUserById(chatUser);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
//	@MessageMapping(value = "/chat/chatRoom-{refChatNo}")
//	public void receiveMessage(ChatMessage message, @DestinationVariable int refChatNo) {
//		template.convertAndSend("/toppic/chat/chatRoom-" + refChatNo, message);
//		
//	}
	
}
