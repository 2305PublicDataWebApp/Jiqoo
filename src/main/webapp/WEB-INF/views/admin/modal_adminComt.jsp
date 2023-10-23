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
					<c:forEach var="comtReport" items="${comtList.reportList}" varStatus="i">
						<div id="r-reason">
							${ comtReport.reportContent}
						</div>
					</c:forEach>
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
<!-- End 댓글 Modal -->