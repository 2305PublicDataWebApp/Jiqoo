<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 댓글 Modal -->
<c:forEach var="comtList" items="${comtList}" varStatus="i">
<div class="modal fade" id="cmtModal${i.count }" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-title fs-5" id="exampleModalLabel" >
					<h3><i class="bi bi-bookmark-heart"></i> ${comtList.comtNo} 번째 댓글</h3>
					<span><i class="bi bi-file-earmark-x" style="margin-left:5px"></i> 
						<c:set var="comtStatus" value="${comtList.comtStatus}"></c:set>
						<c:if test="${fn:contains(comtStatus, 'Y')}">삭제전</c:if>
						<c:if test="${fn:contains(comtStatus, 'N')}">삭제됨</c:if>
						<c:if test="${fn:contains(comtStatus, 'A')}">관리자에 의해 삭제</c:if>
					</span> <!-- 삭제여부 (Y:삭제안됨 / N,A:삭제됨) -->
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div>
					<h5 style="display:inline"><i class="bi bi-pencil" style="margin-left:5px"></i> ${comtList.comtWriter} </h5>&nbsp; <!-- 작성자 -->
					<h5 style="display:inline"><i class="bi bi-calendar-week"></i> 
						<fmt:parseDate value='${comtList.comtDate}' pattern="yyyy-MM-dd HH:mm:ss.SSS" var='comtDate'/>
						<fmt:formatDate value="${comtDate}" pattern="yy/MM/dd HH:mm"/> <!-- 작성일자 -->
					</h5>
					<br>
					<span><i class="bi bi-clipboard-check" style="margin-left:5px"></i> ${comtList.cBoardType}</span>&nbsp; <!-- 보드타입 -->
					<span><i class="bi bi-clipboard-plus"></i> ${comtList.refPostNo}</span>&nbsp; <!-- 댓달린 게시글 번호 -->
					<span><i class="bi bi-reply-all-fill"></i> ${comtList.pComtNo}</span>&nbsp; <!-- 대댓일경우 부모댓글번호 -->
																	
				</div>
				<div class="contents" style="width:100%; height:auto;">
					 <i class="bi bi-arrow-return-right"></i> ${comtList.comtContent}
				</div>
				<div id="report-reason">
					<div id="r-title">신고사유(${comtList.cReportCount})</div>
					
					<div id="r-reason">
						<c:forEach var="comtReport" items="${comtList.reportList}" varStatus="i">
							<script>
								var reportContent = "${comtReport.reportContent}";
								var reportCount = "${comtReport.reportCount}";
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
					
					<c:set var="comtStatus" value="${comtList.comtStatus}"></c:set>
					<c:if test="${fn:contains(comtStatus, 'Y')}">
						<button type="button" class="button delete-btn" onclick="deleteComtByA(${comtList.comtNo}, '${comtList.comtWriter}');">삭제</button>
					</c:if>
					<c:if test="${fn:contains(comtStatus, 'A')}">
						<button type="button" class="button revival-btn" onclick="reviveComtByA('${comtList.comtNo }', '${comtList.comtWriter}');">복원</button>
					</c:if>	
					
				</div>
			</div>
		</div>
	</div>
</div>
</c:forEach>
<script>
$(document).ready(function(){
	updateComt();
});

function updateComt() { 
	const commentText = $("<p class='comment-text'>").val();
	if(comtList.comtStatus == 'A' && comtList.comtWriter !== 'admin'){
	// comtStatus가 A && 댓글 쓴 사람이 관리자가 아님 
		// 댓글 내용을 변경
       commentText.text("관리자에 의해 삭제된 댓글입니다");
	
    	// 삭제된 댓글입니다라는 텍스트가 포함되어 있다면 텍스트 색상을 빨간색으로 변경
       if (commentText.text().includes('관리자에 의해 삭제된 댓글입니다')) {
           commentText.css({ color: 'red' });
       }
	}
} 






</script>
<!-- End 댓글 Modal -->