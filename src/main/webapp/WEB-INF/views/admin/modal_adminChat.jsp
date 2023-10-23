<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- admin_moqoo.jsp, admin_user_detail.jsp -->

<!--===== 모꾸 상세보기 Modal =====-->
<c:forEach var="chatList" items="${chatRoomList}" varStatus="i">
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
					<div id="r-title">신고사유()</div>
					<div id="r-reason">
				
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