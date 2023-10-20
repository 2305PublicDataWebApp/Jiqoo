package com.jiqoo.alert.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jiqoo.user.domain.User;
//https://kimfk567.tistory.com/74
//https://mag1c.tistory.com/222

@Component
public class AlertHandler extends TextWebSocketHandler{
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우 (로그인중인 개별 유저) 
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓이 연결됐을 때, 사용되는 메서드
		//클라이언트가 웹 소켓 생성 
		//클라이언트와 서버가 연결됨 
		logger.info("Socket 연결");
		sessions.add(session);
		
		logger.info(currentUserId(session));//현재 접속한 사람
		String senderId = currentUserId(session);
		userSessionsMap.put(senderId,session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 소켓에 메세지 보냈을 때 
		//JS에서 메세지 받을 때.
		// 클라이언트에서 온 메시지를 받는 메서드
		logger.info("ssesion"+currentUserId(session));
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		logger.info("msg="+msg);
		
		if (!StringUtils.hasText(msg)) {
			logger.info("if문 들어옴?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 10) {
				
				String cmd = strs[0]; //댓글, 스크랩등의 기능을 구분, 전달 될 메시지를 바꿀때 사용
				String jiqooWriter = strs[1]; //지꾸 글작성자 
				String moqooWriter = strs[2];  //모꾸 글작성자
				String comtWriter = strs[3];  //댓글쓴이
				String jiqooNo = strs[4];  //지꾸 글번호
				String moqooNo = strs[5];  //모꾸 글번호
				String comtNo = strs[6];  //댓글 글번호
				String pComtNo = strs[7];  //부모댓글번호
				String jiqooTitle = strs[8];  //지꾸 글제목
				String moqooTitle = strs[9];  //모꾸 글제목
				
				logger.info("length 성공?"+cmd);
				
				//웹소켓으로 전달 될 메시지는 전달받을 사용자가 접속되어 있을 때만 전송
				WebSocketSession comtWriterSession = userSessionsMap.get(comtWriter); //대댓 달린 경우 댓글 쓴 작성자에게 알림전송
				WebSocketSession jiqooWriterSession = userSessionsMap.get(jiqooWriter); //댓글 달린 경우 지꾸 쓴 작성자에게 알림전송 
				WebSocketSession moqooWriterSession = userSessionsMap.get(moqooWriter);
				logger.info("jiqooWriterSession="+userSessionsMap.get(jiqooWriter));
				logger.info("moqooWriterSession="+userSessionsMap.get(moqooWriter));
				logger.info("jiqooWriterSession"+jiqooWriterSession);
				logger.info("moqooWriterSession"+moqooWriterSession);
				
				//지꾸 내 글에 댓글달림 
				if ("comment".equals(cmd) && jiqooWriterSession != null) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage(comtWriter + "님이 "
							+ "<a href='/jiqoo/detail?jiqooNo="+ jiqooNo +"'  style=\"color: black\">"
							+ jiqooTitle+" 에 댓글을 달았습니다!</a>");
					jiqooWriterSession.sendMessage(tmpMsg); //글작성자에게 메세지 보냄 
				}
				
				//지꾸 내 글에 좋아요
				else if("like".equals(cmd) && jiqooWriterSession != null) {
					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
					TextMessage tmpMsg = new TextMessage(comtWriter + "님이 "
							+ "<a href='/jiqoo/detail?jiqooNo=" + jiqooNo + "'  style=\"color: black\"><strong>"
							+ jiqooTitle+"</strong> 에 작성한 글을 좋아요했습니다!</a>");

					jiqooWriterSession.sendMessage(tmpMsg);
					
				}
				
				//지꾸 내 댓글에 대댓글달림 
				if ("comment".equals(cmd) && comtWriterSession != null) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage(comtWriter + "님이 "
							+ "<a href='/jiqoo/listComt?comtNo="+ comtNo + "&refPostNo="+ jiqooNo + "'  style=\"color: black\">"
							+ jiqooTitle+" 에 댓글을 달았습니다!</a>");
					comtWriterSession.sendMessage(tmpMsg); //댓글작성자에게 메세지 보냄 
				}
				
				// 채팅왔을때 
				
				//모임 요청 승인/거절시  
				
				//팔로우 받았을 시 
				
				//모임 요청 받았을 시 
			}
			
		}
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 접속 끊길때 사용 
		//연결 해제
		logger.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserId(session),session);
	}
	
	//사용자가 로그인하지 않은 경우에는 세션의 고유 ID를 사용하고, 로그인한 경우에는 사용자의 실제 ID를 반환
	private String currentUserId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		User loginUser = (User)httpSession.get("login");
		
		if(loginUser == null) {
			//로그인 하지 않은 경우 
			String userId = session.getId();  
			return userId;
		}
		String userId = loginUser.getUserId();
		return userId;
		
	}		
			

}
