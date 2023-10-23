<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- admin_jiqoo.jsp -->

<!--===== 지꾸 상세보기 Modal =====-->
<c:forEach var="jiqooList" items="${jiqooList}" varStatus="i">
<div class="modal fade" id="detailJiqooModal${i.count }" tabindex="-1"
	aria-labelledby="exampleModalLabel modal-lg" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-title fs-5" id="exampleModalLabel" >
					<h3><i class="bi bi-bookmark-heart"></i> ${jiqooList.jiqooNo} 번째 지꾸</h3>
					<span><i class="bi bi-envelope-open" style="margin-left:5px"></i> 
						<c:if test="${jiqooList.jOpenStatus eq 'Y'}">공개중</c:if>
						<c:if test="${jiqooList.jOpenStatus eq 'N'}">비공개</c:if>
					</span> <!-- 공개여부 -->
					<span><i class="bi bi-file-earmark-x"></i> 
						<c:if test="${jiqooList.jiqooStatus eq 'Y'}">삭제전</c:if>
						<c:if test="${jiqooList.jiqooStatus eq 'N'}">삭제됨</c:if>
						<c:if test="${jiqooList.jiqooStatus eq 'A'}">관리자에 의해 삭제</c:if>
					</span> <!-- 삭제여부 (Y:삭제안됨 / N,A:삭제됨) -->
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<h3 style="display:inline" ><i class="bi bi-sticky"></i> ${jiqooList.jiqooTitle}</h3>&nbsp; <!-- 타이틀 -->
				<span><i class="bi bi-pencil"></i> ${jiqooList.jiqooWriter} </span>&nbsp; <!-- 작성자 -->
				<span><i class="bi bi-calendar-week"></i> 
					<fmt:parseDate value='${jiqooList.jCreateDate}' pattern="yyyy-MM-dd HH:mm:ss.SSS" var='jCreateDate'/>
					<fmt:formatDate value="${jCreateDate}" pattern="yy/MM/dd HH:mm"/> <!-- 작성일자 -->
				</span>
				<br>
				<h5 style="display:inline"><i class="bi bi-tag"></i>${jiqooList.jiqooCtgr}</h5>&nbsp;&nbsp; <!-- 카테고리 -->
				<h5 style="display:inline"><i class="bi bi-globe"></i> ${jiqooList.jiqooW3W}</h5>&nbsp; <!-- W3W -->
				<span><i class="bi bi-clock"></i> ${jiqooList.jiqooDate}</span>&nbsp; <!-- 모임일자 -->
				
				<div id="map${i.count }" class="map" style="width:100%; height:350px;"></div>
				
				<div id="report-reason">
					<div id="r-title">신고사유(${jiqooList.jReportCount})</div>
					
					<div id="r-reason">
						<c:forEach var="jiqooReport" items="${jiqooList.reportList}" varStatus="i">
							
	<%-- 							${ jiqooReport.reportContent} --%>
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
					<c:set var="jiqooStatus" value="${jiqooList.jiqooStatus}"></c:set>
					<c:if test="${jiqooStatus eq 'Y'}">
						<button type="button" class="button delete-btn" onclick="deleteJiqooByA('${jiqooList.jiqooNo}', '${jiqooList.jiqooWriter}');">삭제</button>
					</c:if>
					<c:if test="${jiqooStatus eq 'A'}">	
						<button type="button" class="button revival-btn" onclick="reviveJiqooByA('${jiqooList.jiqooNo }', '${jiqooList.jiqooWriter}');">복원</button>
					</c:if>	
					
				</div>
			</div>
		</div>
	</div>
</div>
</c:forEach>
<!-- End Modal -->

<!-- 카카오맵api -->
<c:forEach var="jiqooList" items="${jiqooList}" varStatus="i">
<script>
// 	$(function() {  //html이 다 로드된 다음에 동작하도록 함, window.onload와 같음 
		$("#detailJiqooModal${i.count}").on('shown.bs.modal', function(){
			var mapContainer = document.getElementById('map${i.count }'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(${jiqooList.jiqooLat}, ${jiqooList.jiqooLng}), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
	
			var map = new kakao.maps.Map(mapContainer, mapOption);
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(${jiqooList.jiqooLat}, ${jiqooList.jiqooLng}); 
	
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
	
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
	
			var iwPosition = new kakao.maps.LatLng(${jiqooList.jiqooLat}, ${jiqooList.jiqooLng}); //인포윈도우 표시 위치입니다
	
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition,
			    content : '<div class="info-window" >${jiqooList.jiqooContent}</div>'
			    
			});
			// 마커 위에 인포윈도우를 표시합니다. 
			infowindow.open(map, marker); 
		});
// 	});
</script>
</c:forEach>