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

@Component
public class AlertHandler extends TextWebSocketHandler{
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	// 여기에서 WebSocket 메시지 처리

	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우 (로그인중인 개별 유저) 
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓이 연결됐을 때, 사용되는 메서드
		//클라이언트와 서버가 연결됨 
		
		System.out.println("Socket 연결");
		sessions.add(session);
		
		String senderId = currentUserId(session); //현재 접속한 사람의 http세션을 조회하여 id를 얻는 함수
		System.out.println(senderId);
		
		if(senderId != null) {	// 로그인 값이 있는 경우만
			userSessionsMap.put(senderId, session);   // 로그인중 개별유저 저장
		}
	}
	
	
	// 클라이언트가 Data 전송 시 (소켓에 메세지 보냈을 때 )
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//JS에서 메세지 받을 때.
		// 클라이언트에서 온 메시지를 받는 메서드
		System.out.println("ssesion"+currentUserId(session));
		
		String senderId = currentUserId(session);
		
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg //웹소켓 세션으로 전달 된 메시지를 받을 수 있다.
		System.out.println("msg="+msg);
		
		if (StringUtils.hasText(msg)) {  //메세지 내용이 있으면 
			String[] strs = msg.split(",");
			System.out.println(strs.toString());
			
			if(strs != null && strs.length == 6) {
				
				String cmd = strs[0]; //댓글, 스크랩등의 기능을 구분, 전달 될 메시지를 바꿀때 사용
				String replyWriter = strs[1]; //댓글작성자 (알람보내는사람)
				String boardWriter = strs[2];  //글작성자(알람받는사람)
				String boardNo = strs[3];  //게시글번호, 알림을 누르면 해당 게시글로 이동
				String replyNo = strs[4];  //댓글번호, 알림을 누르면 해당 게시글로 이동
				String title = strs[5];  //게시글제목(내용),알림을 누르면 해당 게시글로 이동
				
				System.out.println("length 성공?"+cmd);
				
				//웹소켓으로 전달 될 메시지는 전달받을 사용자가 접속되어 있을 때만 전송
				//작성자가 로그인 해서 있다면 (실시간 접속시)
				WebSocketSession replyWriterSession = userSessionsMap.get(replyWriter); //메세지 받을 세션 조회 //대댓달린경우 댓글 달린 작성자에게 알림전송
				WebSocketSession boardWriterSession = userSessionsMap.get(boardWriter); //댓글 달린 경우 글 쓴 작성자에게 알림전송 
				
				System.out.println("boardWriterSession="+userSessionsMap.get(boardWriter));
				System.out.println("boardWriterSession"+boardWriterSession);
				
					//내 글에 댓글달림 && 글쓴이가 로그인해있음
					if ("reply".equals(cmd) && boardWriterSession != null) {
						
						System.out.println("onmessage되나?");
						
						TextMessage tmpMsg = new TextMessage
								(replyWriter + "님이 " + "<a href='/board/detail.kh?boardNo="+ boardNo +"'  style=\"color: black\">"
								+ title+"</a> 에 댓글을 달았습니다!");
						boardWriterSession.sendMessage(tmpMsg); //글작성자에게 메세지 보냄 
					}
					
					//내 댓글에 대댓글달림 && 글쓴이가 로그인해있음 
					else if ("rereply".equals(cmd) && replyWriterSession != null) {
						//replyWriter = 대댓단사람 , boardWriter = 댓글단사람
						
						TextMessage tmpMsg = new TextMessage
								(replyWriter + "님이 "+ "<a href='/board/detail.kh?replyNo="+ replyNo 
										+ "&refBoardNo="+ boardNo + "'  style=\"color: black\">"
										+ title+"</a> 에 댓글을 달았습니다!");
						replyWriterSession.sendMessage(tmpMsg); //댓글작성자에게 메세지 보냄 
					}
					
					//내 글에 좋아요 && 글쓴이가 로그인해있음
					else if("like".equals(cmd) && boardWriterSession != null) {
						//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
						
						TextMessage tmpMsg = new TextMessage
								(replyWriter + "님이 "
								+ "<a href='/board/readView?boardNo=" + boardNo + "'  style=\"color: black\"><strong>"
								+ title+"</strong> 에 작성한 글을 좋아요했습니다!</a>");
						boardWriterSession.sendMessage(tmpMsg);
					}
					
					//팔로우  && 상대방이 로그인해있음
					else if("follow".equals(cmd) && boardWriterSession != null) {
						//replyWriter = 팔로우한사람 , boardWriter = 팔로우받은사람
						TextMessage tmpMsg = new TextMessage
								(replyWriter + "님이 " + boardWriter + "님을 팔로우 했습니다.");
						boardWriterSession.sendMessage(tmpMsg);
					}
					
					//채팅왔을때
					else if("chat".equals(cmd) && boardWriterSession != null) {
						//replyWriter = 채팅건사람 , boardWriter = 채팅받은사람
						TextMessage tmpMsg = new TextMessage
								(replyWriter + "님이 " + boardWriter + "님께 채팅을 보냈습니다.");
						boardWriterSession.sendMessage(tmpMsg);
					}
				
					//모임 요청 승인시  
					else if("moqoook".equals(cmd) && boardWriterSession != null) {
						//replyWriter = 모임주최자 , boardWriter = 모임신청한사람
						TextMessage tmpMsg = new TextMessage
								(replyWriter + "님이 " + boardWriter + "님의 모임신청을 승인했습니다.");
						boardWriterSession.sendMessage(tmpMsg);
					}
					
					//모임 요청 거절시  
					else if("moqoono".equals(cmd) && boardWriterSession != null) {
						//replyWriter = 모임주최자 , boardWriter = 모임신청한사람
						TextMessage tmpMsg = new TextMessage
								(replyWriter + "님이 " + boardWriter + "님의 모임신청을 거절했습니다.");
						boardWriterSession.sendMessage(tmpMsg);
					}
				
					//모임 요청 받았을 시 
					else if("moqooreque".equals(cmd) && boardWriterSession != null) {
						//replyWriter = 모임신청자 , boardWriter = 모임주최자
						TextMessage tmpMsg = new TextMessage
								(replyWriter + "님이 " + boardWriter + "님께 모임을 신청했습니다.");
						boardWriterSession.sendMessage(tmpMsg);
					}
			}
			
		}
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 접속 끊길때 사용 
		//연결 해제
		String senderId = currentUserId(session);
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			System.out.println("Socket 끊음");
			
			sessions.remove(session);
			userSessionsMap.remove(senderId, session);
		}
	}
	
	
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
		
	
	// 웹소켓에 id 가져오기
    // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	//사용자가 로그인하지 않은 경우에는 세션의 고유 ID를 사용하고, 로그인한 경우에는 사용자의 실제 ID를 반환
	private String currentUserId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();  //로그인시 사용자가 소켓에 연결됨 
//		Member loginUser = (Member)httpSession.get("member");
		String loginUser = (String) httpSession.get("memberId"); 
		
//		if(loginUser == null) {
//			//로그인 하지 않은 경우 
//			String memberId = session.getId();  
//			return memberId;
//		}
//		String memberId = loginUser.getMemberId();
//		return memberId;
		return loginUser == null ? null : loginUser; //loginUser가 null이면 (로그인안했으면)null반환, 로그인 했으면 loginUser 반환 
		
	}	
			

}
