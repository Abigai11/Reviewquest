<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script type="text/javascript" src="${contextPath }/resources/js/donation.js"></script>
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function () {
    var result = "${msg}";
    if (result == "doModSuccess") {
        alert("기부글 수정이 완료되었습니다.");
    } else if (result == "amountSuccess") {
        alert("기부가 완료되었습니다.");
    }
    
    // 현재 금액과 목표 금액을 포맷팅하여 표시
    var currentAmount = ${donationDTO.amount};
    var targetAmount = ${donationDTO.targetAmount};
    var formattedCurrentAmount = currentAmount.toLocaleString();
    var formattedTargetAmount = targetAmount.toLocaleString();
    $(".amount").text(formattedCurrentAmount + " 원");
    $(".targetAmount").text(formattedTargetAmount + " 원");
    
	 // 현재 모금된 금액과 목표 금액 가져오기
    var currentAmount = parseInt("${donationDTO.amount}"); // 현재 모금된 금액 (예: 5000원)
    var targetAmount = parseInt("${donationDTO.targetAmount}"); // 목표 금액 (예: 10000원)

    // 남은 금액 계산
    var remainingAmount = targetAmount - currentAmount;

    // 남은 금액을 퍼센트로 계산
    var percent = (currentAmount / targetAmount) * 100;
    
 	// 모든 .progress-bar 클래스를 가진 요소를 선택
    var progressBarList = document.querySelectorAll(".progress-bar");
    var progressTextList = document.querySelectorAll(".progress-text");

    // 프로그레스 바 업데이트
    progressBarList.forEach(function (progressBar) {
   		progressBar.style.width = percent + "%";
	});
	
	progressTextList.forEach(function (progressText) {
	   	progressText.textContent = percent.toFixed(2) + "%";
	});
    
 	// 100%를 넘어서면 "over-100" 클래스 추가
    if (percent > 100) {
        progressBarList.forEach(function (progressBar) {
            progressBar.classList.add("over-100");
            progressBar.style.width = "100%";
        });
    }
});
</script>
<head>
<link href="${contextPath }/resources/css/donation.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/FlexSlider.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/bbs_style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ReViewQeust</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.influencerInfo}">
        <c:set var="userInfo" value="${sessionScope.influencerInfo}" />
    </c:when>
    <c:when test="${not empty sessionScope.companyInfo}">
         <c:set var="userInfo" value="${sessionScope.companyInfo}" />
    </c:when>
    <c:when test="${not empty sessionScope.adminInfo}">
        <c:set var="userInfo" value="${sessionScope.adminInfo}" />
    </c:when>
</c:choose>
<div class="af_clear container_auto">

	<div id="scrollMoveBox_target"></div><!-- 삭제하지마세요. hun -->
	<div class="scrollMoveBox"></div>

	<table class="f_l">
	<tbody><tr>
		<td class="detail_left_area">
			<div class="detail_big_title" style="border-bottom:1px solid #e2e2e2;">	
				${donationDTO.title }<br><br>
			</div><br>
			<div class="detail_hongbo_text">
			<div style="height: 700px; overflow: hidden;">
			<img alt="" src="${contextPath }/resources/images/doUpload/${donationDTO.filePath }"><br>
			</div>
			</div>


			<div class="af_clear">
				<!-- 신청현황/등록현황 -->
				<div class="f_l detail_info_box" style="width:490px; height:139px; padding:20px 25px 50px 25px;">
					<div class="noto500 font_16 ls_1" style="color:#333333;">기부현황</div>
					<div style="display:table; width:100%; margin:10px 0 5px 0;">
						<div class="font_15" style="display:table-cell; color:#969696;">
							<span uk-icon="icon:account-supervisor; ratio:0.8" style="color:#bbb" class="uk-icon"><svg width="19.200000000000003" height="19.200000000000003" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" data-svg="account-supervisor"><path d="M16.5,12A2.5,2.5 0 0,0 19,9.5A2.5,2.5 0 0,0 16.5,7A2.5,2.5 0 0,0 14,9.5A2.5,2.5 0 0,0 16.5,12M9,11A3,3 0 0,0 12,8A3,3 0 0,0 9,5A3,3 0 0,0 6,8A3,3 0 0,0 9,11M16.5,14C14.67,14 11,14.92 11,16.75V19H22V16.75C22,14.92 18.33,14 16.5,14M9,13C6.67,13 2,14.17 2,16.5V19H9V16.75C9,15.9 9.33,14.41 11.37,13.28C10.5,13.1 9.66,13 9,13Z"></path></svg></span>
							<span class="noto500 amount" style="color:#0067ff;">${donationDTO.amount }</span>
						</div>
						<div class="font_15" style="display:table-cell; text-align:right; color:#969696;">
							<span class="noto500 targetAmount" style="color:#545454;">${donationDTO.targetAmount }</span>
						</div>
					</div>
					<div class="progress-container">
					  <div class="progress-bar" id="progress-bar"></div>
					  <div class="progress-text font_12" id="progress-text">0%</div>
					</div>
				</div>
				<input type="hidden" id="endDate" value="${donationDTO.endDate }">
				<div class="f_l detail_info_box" style="margin-left:10px; width:320px; height:139px; padding:15px 25px 20px 25px;">
					<table class="detail_info_table" style="width:100%;">
					<tbody><tr>
						<th>카테고리</th>
						<td>기부</td>
					</tr>
					<tr>
						<th>시작일</th>
						<td>${donationDTO.date }</td>
					</tr>
					<tr>
						<th>마감일</th>
						<td style="color:#0067ff">
						<span class="date"></span>
						</td>
					</tr>
					</tbody></table>
				</div>
			</div>

			<div class="conList" style="margin-top:80px;">
				<!-- 상세정보 및 리스트 -->
				<div id="con1">
					<div style="display:block;">
						<div><div class="detail_list_tab af_clear" style="border-bottom:1px solid #e2e2e2;">
  <a class="tab_on" overclass="tab_on" outclass="tab_off" id="class_div_1" onclick="happy_tab_menu('class_div','1');layerOpen2('','1');">상세정보</a>
  
</div>


<!-- 목록레이어 -->
<div id="listLayer2" style="display:none; margin-bottom:70px;"></div>
<!-- 목록레이어 -->

</div>
						<div id="ct" style="margin:20px 0 40px 0;">
							<div id="detail_overflow"><p style="text-align: center;">&nbsp;</p>
							<p style="text-align: center;">		
							${donationDTO.content }
							</div>
						</div>
							<c:if test="${userInfo.division == 'admin' }">
							<script type="text/javascript">
							$(document).ready(function () {
							// 목록 버튼 클릭 시 실행할 함수
						    document.querySelector(".listBtn").addEventListener("click", function() {
						      // 목록 기능 실행 코드
						      // 예: window.location.href = "목록 페이지 URL";
						    	window.location.href = "${contextPath}/donation/";
						    });

						    // 수정 버튼 클릭 시 실행할 함수
						    document.querySelector(".modBtn").addEventListener("click", function() {
						      // 수정 기능 실행 코드
						      // 예: window.location.href = "수정 페이지 URL";
						    	window.location.href = "${contextPath}/donation/modify?num=${donationDTO.num}";
						    });

						    // 삭제 버튼 클릭 시 실행할 함수
						    $(".delBtn").on("click", function() {
						        // 삭제 확인 다이얼로그 표시 (선택사항)
						        if (confirm("삭제하시겠습니까?")) {
						            // jQuery Ajax 요청을 사용하여 삭제 작업을 서버에 전송
						            $.ajax({
						                type: "POST",
						                url: "${contextPath}/donation/remove?num=${donationDTO.num}",
						                success: function(data) {
						                    // 삭제 작업이 성공하면 수행할 동작
						                    alert("삭제되었습니다.");
						                    // 페이지 새로고침 또는 필요한 동작 수행
						                    window.location.href = "${contextPath}/donation/";
						                },
						                error: function() {
						                    // 삭제 작업이 실패한 경우 처리 (예: 오류 메시지 표시)
						                    alert("삭제에 실패했습니다.");
						                }
						            });
						        
						         // 이미지 삭제 버튼 클릭 시 실행할 함수
						            function deleteImage(imageUrl) {
						                    // 이미지 삭제 요청을 서버로 보내는 AJAX 요청을 수행
						                    $.ajax({
						                        type: "POST", // 또는 다른 HTTP 메서드 (POST, DELETE 등)를 사용하세요.
						                        url: "deleteSummernoteImageFile",
						                        contentType: false,
						                        enctype: 'multipart/form-data',
						                        data: { imageUrl: imageUrl }, // 삭제할 이미지의 URL을 서버로 보냅니다.
						                        success: function (response) {
						                            if (response === "success") {
						                                // 이미지 삭제가 성공한 경우, UI에서 이미지를 제거합니다.
						                                // 예를 들어, 이미지가 포함된 HTML 요소를 삭제하거나 숨길 수 있습니다.
						                                // 이미지가 삭제된 후에 수행할 동작을 여기에 추가하세요.
						                                alert("이미지가 성공적으로 삭제되었습니다.");
						                            } else {
						                                alert("이미지 삭제에 실패했습니다.");
						                            }
						                        },
						                        error: function () {
						                            alert("이미지 삭제 요청을 보내는 중 오류가 발생했습니다.");
						                        },
						                    });
						            }
						        }
						    });
							});
							</script>
					        <div style="display: flex; height: 30px; vertical-align: middle; text-align: center;">
					            <button type="button" class="listBtn" style="border: 1px solid #e5e5e5; line-height: 1; border-radius: 4px;">
					                <i class="fa fa-list" style="font-size: 15px; margin-right: 5px;"></i>
					                <span>목록</span>
					            </button>
					
					            <button type="button" class="modBtn" style="border: 1px solid #e5e5e5; line-height: 1; border-radius: 4px;">
					                <i class="fa fa-pencil" style="font-size: 15px; margin-right: 5px;"></i>
					                <span>수정</span>
					            </button>
					
					            <button type="button" class="delBtn" style="border: 1px solid #e5e5e5; line-height: 1; border-radius: 4px;">
					                <i class="fa fa-trash" style="font-size: 15px; margin-right: 5px;"></i>
					                <span>삭제</span>
					            </button>
					        </div>
					        </c:if>
					      </div>
					        
					</div>
				</div>

		</td>
	</tr>
	</tbody></table>


	<div class="f_r" style="width:380px; position:sticky; top:50px">
		<!-- 우측 스크롤 -->
		<div id="detail_view_right_scroll" style="z-index:99;">
			<div class="detail_middle_area">
				<div class="detail_tab_box">
					<div class="noto500" style="font-size:25px; color:#333; letter-spacing:-1px;">기부 참여 기간</div>
	<div class="detail_campaign_period">
	<div id="10" style="color: rgb(33, 33, 33); font-weight: 500; letter-spacing: -1px;">
		<span>기부 기간</span>
		${donationDTO.date } ~ ${donationDTO.endDate }
	</div>
	<div id="20">
		<span>목표 금액</span>
		<span class="targetAmount">${donationDTO.targetAmount }</span>
	</div>
	<div id="30">
		<span>현재 금액</span>
		<span class="amount">${donationDTO.amount }</span>
	</div>
	<div id="40">
		<div class="progress-container">
		  <div class="progress-bar"></div>
		  <div class="progress-text">0%</div>
		</div>
	</div>
	<div id="30">
		<span></span>
		<span></span>
	</div>
	<div id="30">
		<span>참여 인원</span>
		<span>${donationDTO.people } 명</span>
	</div>
	<div id="30">
		<span>남은 시간</span>
		<span class="date" style="font-size: 14px"></span>
	</div>
</div>

					<div class="detail_menu tabBt">
						<div class="detail_tab_menu">
							<ul>
								<li><a href="#con4">참여 안내 사항</a></li>
								<li><a href="#con5" style="border-right:none;">업체정보</a></li>
							</ul>
						</div>
					</div>
					
					<!-- 모달 내용 -->
			<c:choose>
			    <c:when test="${empty userInfo}">       
			    	<div class="h_form">
					    <a href="${contextPath}/login">
					        <button class="btn btn-primary w-100" style="height : 50px; vertical-align: middle; font-size: 20px;">
					            기부하기
					        </button>
					    </a>
					</div>
			    	            
			    </c:when>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
			    <c:otherwise>
					<div class="h_form">
						<button class="donateBtn btn btn-primary w-100" style="height : 50px; vertical-align: middle; font-size: 20px;">
							기부하기
						</button>
					</div>
				</c:otherwise>
			</c:choose>
				<div id="myModal" class="modal">
		  <div class="modal-content" style="width: 50%; height: 50%;">
		    <span class="close">&times;</span>
		    <form action="${contextPath }/donation/updateAmount?num=${donationDTO.num}" method="post" id="donationForm">
			    <h2>기부하기</h2><br>
			    <p>기부하실 금액을 입력하세요</p><br>
			    <input type="hidden" name="nickname" value="${userInfo.nickName }">
			    <input type="hidden" name="email" value="${userInfo.email }">
			    <input type="hidden" name="title" value="${donationDTO.title }">
			    <div style="display: flex; align-items: center;">
				    <input type="text" placeholder="금액을 입력하세요" id="price" name="amount" style="text-align: right;">
				    <span style="margin-left: 5px; font-size: 20px;">원</span>
				</div><br>

			    <div class="button-container">
			    <button type="button" class="addAmountBtn" data-amount="10000" style="border: 1px solid #ddd;">+ 1만원</button>
		        <button type="button" class="addAmountBtn" data-amount="30000" style="border: 1px solid #ddd;">+ 3만원</button>
		        <button type="button" class="addAmountBtn" data-amount="50000" style="border: 1px solid #ddd;">+ 5만원</button>
		        <button type="button" class="addAmountBtn" data-amount="100000" style="border: 1px solid #ddd;">+ 10만원</button>
		        <button type="button" class="addAmountBtn" data-amount="500000" style="border: 1px solid #ddd;">+ 50만원</button>
		        <button type="button" class="addAmountBtn" data-amount="1000000" style="border: 1px solid #ddd;">+ 100만원</button><br><br>
			    <button type="submit" class="btn btn-primary w-100 ">기부하기</button>
			    </div>
		    </form>
		  </div>
		</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<br><br><br>
</body>
<script type="text/javascript" src="${contextPath }/resources/js/date.js"></script>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>