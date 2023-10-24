<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- admin_moqoo.jsp, admin_user_detail.jsp -->

<!--===== 채팅방 상세보기 Modal =====-->
<c:forEach var="chatRoomAllList " items="${chatRoomAllList}" varStatus="i">
<div class="modal fade" id="detailChatModal${i.count }" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-title fs-5" id="exampleModalLabel">
					<h3>
						<i class="bi bi-bookmark-heart"></i> ${chatList.chatNo} 번째 채팅방
					</h3>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div id="report-reason">
					<div id="r-title">신고사유(${chatRoomAllList.cReportCount})</div>
					
					<div id="r-reason">
						<c:forEach var="chatReport" items="${chatRoomAllList.reportList}" varStatus="i">
							<script>
								var reportContent = "${chatReport.reportContent}";
								var reportCount = "${chatReport.reportCount}";
								var replacedText = "";
													
								switch (reportContent) {
									case "abusive": replacedText = "욕설사용";
										 break;
									case "advertising": replacedText = "광고글";
										 break;
									case "noSubject": replacedText = "주제와 맞지 않는 글";
										break;
									case "violent":replacedText = "폭력적인 내용";
										break;
									case "discrimination": replacedText = "차별적인 내용";
										break;
									case "pornography": replacedText = "음란물";
										break;  
									case "personal": replacedText = "민감한 개인정보 노출";
										break;
									case "etc": replacedText = "기타 (직접 작성)";
										break;
									default: replacedText = reportContent;
										break;
									} 
								
								document.write(replacedText+"("+reportCount+")");
							</script>
						</c:forEach>
					</div>
					
				</div>
				<div id="report-btn">
					<button type="button" class="button delete-btn" onclick="deleteChatRoomByA('${chatList.chatNo}');">삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>
</c:forEach>
<!-- End 모꾸 상세보기 Modal -->