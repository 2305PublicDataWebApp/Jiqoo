<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- admin_user_detail.jsp -->

<!-- 회원신고수Modal -->
<div class="modal fade" id="user-report-Modal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">${user.userId}</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<h5></h5>
				<span>&nbsp;J : ${usersTotalJiqooCount }</span> 
				<span>&nbsp;M : ${usersTotalMoqooCount }</span> 
				<span>&nbsp;C : ${usersTotalComtCount }</span>
				<div id="report-reason">
					<div id="r-title">신고사유(${user.count})</div>
					<c:forEach var="userReport" items="${user.reportList}" varStatus="i">
						<div id="r-reason">
						</div>
						
						<script>
							var reportContent = "${userReport.reportContent}";
							var reportCount = "${userReport.reportCount}";
// 							var reportContent = document.querySelector(".r-reason").innerHTML;
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
				<div id="report-btn">
<%-- 					<button type="button" class="button mx-2" onclick="resetReportByA('${user.userId}');">리셋</button> --%>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End 회원신고 Modal -->

<script>
// 	var reportContent = ${ userReport.reportContent}
// 	var rReason = document.querySelector("#r-reason").innerHTML;
// 	if(reportContent == 'abusive'){
// 		rReason = reportContent.replaceAll('abusive', '욕설사용');
// 	}
// 	if(reportContent == 'advertising'){
// 		rReason = reportContent.replaceAll('advertising', '광고글');
// 	}
// 	if(reportContent == 'noSubject'){
// 		rReason = reportContent.replaceAll('noSubject', '주제와 맞지 않는 글');
// 	}
// 	if(reportContent == 'violent'){
// 		rReason = reportContent.replaceAll('violent', '폭력적인 내용');
// 	}

</script>