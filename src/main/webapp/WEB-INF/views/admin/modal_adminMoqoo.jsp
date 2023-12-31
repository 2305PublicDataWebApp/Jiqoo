<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- admin_moqoo.jsp, admin_user_detail.jsp -->

<!--===== 모꾸 상세보기 Modal =====-->
<c:forEach var="moqooList" items="${moqooList}" varStatus="i">
<div class="modal fade" id="detailMoqooModal${i.count }" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-title fs-5" id="exampleModalLabel">
					<h3>
						<i class="bi bi-bookmark-heart"></i> ${moqooList.moqooNo} 번째 모꾸
					</h3>
					<span><i class="bi bi-file-earmark-x"></i> 										
						<c:if test="${moqooList.moqooStatus eq 'Y'}">삭제전</c:if>
						<c:if test="${moqooList.moqooStatus eq 'N'}">삭제됨</c:if>
						<c:if test="${moqooList.moqooStatus eq 'A'}">관리자에 의해 삭제</c:if>
					</span>
					<!-- 삭제여부 (Y:삭제안됨 / N,A:삭제됨) -->
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<h3 style="display: inline">
					<i class="bi bi-sticky"></i> ${moqooList.moqooTitle} <!-- 타이틀 -->
				</h3> 
				<span><i class="bi bi-pencil"></i> ${moqooList.moqooWriter} </span>&nbsp; <!-- 작성자 -->
				<span><i class="bi bi-calendar-week"></i> 
					<fmt:parseDate value='${moqooList.moqooDate}' pattern="yyyy-MM-dd HH:mm:ss.SSS" var='moqooDate' /> 
					<fmt:formatDate value="${moqooDate}" pattern="yy/MM/dd HH:mm" />  <!-- 작성일자 --> 
				</span>&nbsp; 
				<span><i class="bi bi-eye"></i>${moqooList.mViewCount} </span>
				<br>
				<h5 style="display: inline">
					<i class="bi bi-tag"></i> ${moqooList.category} <!-- 카테고리 -->
				</h5>
				&nbsp;&nbsp;
				
				<h5 style="display: inline">
					<i class="bi bi-globe"></i> ${moqooList.moqooW3W} <!-- W3W -->
				</h5>
				&nbsp;
				<span><i class="bi bi-clock"></i> ${moqooList.moqooDay}</span>&nbsp; <!-- 모임일자 -->
				<span><i class="bi bi-people"></i> ${moqooList.moqooJoin}</span>&nbsp; <!-- 모임인원 -->

				<div id="map${i.count }" class="map"
					style="width: 100%; height: 350px;"></div>
				<div id="report-reason">
					<div id="r-title">신고사유(${moqooList.mReportCount})</div>
					<div id="r-reason">
					<c:forEach var="moqooReport" items="${moqooList.reportList}" varStatus="i">
<%-- 							${ moqooReport.reportContent} --%>
						<script>
							var reportContent = "${moqooReport.reportContent}";
							var reportCount = "${moqooReport.reportCount}";
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
<%-- 					<button type="button" class="button mx-2" onclick="resetReportByA('${user.userId}',${moqooList.moqooNo});">리셋</button> --%>
					<c:set var="moqooStatus" value="${moqooList.moqooStatus}"></c:set>
					<c:if test="${moqooStatus eq 'Y'}">
						<button type="button" class="button delete-btn" onclick="deleteMoqooByA('${moqooList.moqooNo}', '${moqooList.moqooWriter}');">삭제</button>
					</c:if>
					<c:if test="${moqooStatus eq 'A' || moqooStatus eq 'N' }">	
						<div class="button complete">삭제완료</div>
					</c:if>	
				

				</div>
			</div>
		</div>
	</div>
</div>
</c:forEach>
<!-- End 모꾸 상세보기 Modal -->

<!-- 카카오맵api -->
<c:forEach var="moqooList" items="${moqooList}" varStatus="i">
<script>
	$("#detailMoqooModal${i.count}").on('shown.bs.modal', function(){
		var mapContainer = document.getElementById('map${i.count }'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${moqooList.moqooLat}, ${moqooList.moqooLng}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${moqooList.moqooLat}, ${moqooList.moqooLng}); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwPosition = new kakao.maps.LatLng(${moqooList.moqooLat}, ${moqooList.moqooLng}); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition,
		    content : '<div class="info-window">${moqooList.moqooContent}</div>'
		    
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		
	});
</script>
</c:forEach>