<%@page import="com.project.reviewquest.member.InfluencerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userInfo" value="${sessionScope.userInfo}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인플루언서 마이페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans+KR" media="all">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/FlexSlider.css" type="text/css" media="screen">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>

<style>
button {
    background-color: #0074e4;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    width: 110px;
    height: 40px;
}

button:hover {
    background-color: #0057b3;
}

 /* 모달 팝업 스타일 */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8); /* 배경 어둡게 */
    z-index: 1000;
    overflow: auto; /* 스크롤이 생길 경우 스크롤 가능하도록 설정 */
}

.modal-content {
    background-color: #fff;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%) scale(0.8); /* 초기 위치와 크기 설정 */
    transform-origin: center;
    width: 80%;
    max-width: 500px; /* 팝업 너비 조정 */
    padding: 20px; /* 내용 여백 추가 */
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    z-index: 2;
    opacity: 0; /* 초기 투명도 설정 */
    transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out; /* 트랜지션 효과 */
}

/* 모달 닫기 버튼 스타일 */
.close-button {
    float: right;
    cursor: pointer;
    font-size: 20px;
}

/* 모달 열릴 때 크기와 투명도 조절 */
.modal.open .modal-content {
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
}

/* 팝업 테이블 스타일 */
.popup-table {
    margin-top: 20px;
}

.popup-table-row {
    display: flex;
    margin-bottom: 10px;
}

.popup-table-col {
    flex: 1;
    padding: 10px;
    display: flex;
    align-items: center;
}


.popup-button {
    text-align: center;
    margin-top: 20px;
}

.h-btn:hover {
    background-color: #0052cc;
}

/* 인풋 박스 스타일 수정 */
input[type="text"],
input[type="email"],
input[type="tel"],
textarea {
    width: 350px;
    padding: 15px; /* 패딩을 더 크게 조정 */
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 10px;
    font-size: 16px; /* 폰트 크기를 조정 */
}

/* 기타 스타일 수정 */
.popup_table_content {
    background-color: #f2f7fd;
    padding: 20px; /* 패딩 크게 조정 */
    border: 1px solid #d8e3ff;
}

/* 버튼 스타일 수정 */
.h-btn {
    background-color: #0074e4;
    color: #fff;
    border: none;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s ease;
    font-size: 16px; /* 폰트 크기 조정 */
}

/* 닫기 버튼 스타일 수정 */
.close-button {
    float: right;
    cursor: pointer;
    font-size: 24px; /* 아이콘 크기 조정 */
}

.goback:hover{
   background-color: #0057b3 !important;
}
</style>        
<c:choose>  
    <c:when test="${not empty sessionScope.admin_onemember}">
        <c:set var="userInfo" value="${sessionScope.admin_onemember}" />
    </c:when>
    <c:otherwise>
        <c:set var="userInfo" value="${sessionScope.userInfo}" />
    </c:otherwise>
</c:choose>


	<div class="container af_clear" style="margin-bottom:70px">
		<div class="site_location"><span uk-icon="icon:home; ratio:1" class="uk-icon home_icon"></span><a href="#">마이페이지</a></div>
		<div style="display:flex;">
			<div class="mypage_left_box">
				<div class="mypage_common_box" style="text-align:center; position:relative;">
					<a href="/happy_member.php?mode=modify" onfocus="this.blur()" alt="회원정보수정" title="회원정보수정" style="position:absolute; top:20px; right:20px; color:#c2c2c2;"><span uk-icon="icon:cog; ratio:1" class="uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="cog"><circle fill="none" stroke="#000" cx="9.997" cy="10" r="3.31"></circle><path fill="none" stroke="#000" d="M18.488,12.285 L16.205,16.237 C15.322,15.496 14.185,15.281 13.303,15.791 C12.428,16.289 12.047,17.373 12.246,18.5 L7.735,18.5 C7.938,17.374 7.553,16.299 6.684,15.791 C5.801,15.27 4.655,15.492 3.773,16.237 L1.5,12.285 C2.573,11.871 3.317,10.999 3.317,9.991 C3.305,8.98 2.573,8.121 1.5,7.716 L3.765,3.784 C4.645,4.516 5.794,4.738 6.687,4.232 C7.555,3.722 7.939,2.637 7.735,1.5 L12.263,1.5 C12.072,2.637 12.441,3.71 13.314,4.22 C14.206,4.73 15.343,4.516 16.225,3.794 L18.487,7.714 C17.404,8.117 16.661,8.988 16.67,10.009 C16.672,11.018 17.415,11.88 18.488,12.285 L18.488,12.285 Z"></path></svg></span></a>
					<div style="margin:35px 0 12px 0;">
						<a class="noto500 ls_1 font_24" style="color:#1f1f1f;" href="happy_member.php?mode=mypage">마이페이지</a>
					</div>
					<!-- 회원사진 및 정보-->
					<img src="${contextPath}/resources/images/profilephoto/${userInfo.profilephoto}" style="width:110px; height:110px; border-radius:50%;">
					<div style="border-bottom:1px solid #eaeaea; padding:7px 0 35px 0;">
						<span class="font_16 ls_1">${userInfo.nickName}</span><br>
						<span class="ls_1" style="color:#999999;">${userInfo.email}</span><br>
						<span class="ls_1" style="color:#0067ff;">${userInfo.division}의 마이페이지</span>
					</div>

				</div>
				<div class="h_form" style="margin:15px 0;">
					<a href="happy_member.php?mode=camp_selected_list" class="h_btn_st1 h_btn_b icon_b uk-icon mypage_left_btn" uk-icon="icon:bookmark; ratio:1">선정된 캠페인</a>
				</div>
				<div class="left_menu" style="position:sticky; top:100px; z-index:199; width:250px"><div class="mypage_common_box">
	<div class="mypage_left_menu_main">
		<a href="happy_member.php?mode=camp_join_list" class="mypage_left_menu_main_link">
			<span style="color:#0067ff;">참여한 캠페인</span> 관리
			<span uk-icon="icon:more-vertical; ratio:1" class="uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="more-vertical"><circle cx="10" cy="3" r="2"></circle><circle cx="10" cy="10" r="2"></circle><circle cx="10" cy="17" r="2"></circle></svg></span>
		</a>
		
	</div>

	<div class="mypage_left_menu_main">
		<a href="${contextPath}/mypage_update_influencer" class="mypage_left_menu_main_link">
			내정보 관리
			<span uk-icon="icon:more-vertical; ratio:1" class="uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="more-vertical"><circle cx="10" cy="3" r="2"></circle><circle cx="10" cy="10" r="2"></circle><circle cx="10" cy="17" r="2"></circle></svg></span>
		</a>
		<div class="mypage_left_menu_sub">
			<div class="mypage_common_box">
				<a href="${contextPath}/mypage_update_influencer" class="mypage_left_menu_sub_link">
					회원정보수정
				</a>
				
				<a href="${contextPath}/member/logout?id=${userInfo.id}&division=influencer_delete" class="mypage_left_menu_sub_link">
					회원탈퇴 
				</a>
			</div>
		</div>
	</div>

</div>
</div>
			</div>
			<div class="mypage_right_box">
<c:set var="userInfo" value="${sessionScope.userInfo}" />
<c:if test="${userInfo != null && userInfo.division == 'admin'}">
	<div class="goback_container"style="display: flex; justify-content: flex-end;margin-bottom: 30px;">
		<a href="${contextPath}/allmember_admin"><button class="goback" style="width:150px;">목록으로 돌아가기</button></a>
	 </div>
</c:if>

<!-- 참여한 캠페인 -->
<div class="mypage_common_box" style="margin-top:25px;">
    <div class="mypage_main_title">
        <a href="happy_member.php?mode=camp_join_list">참여한 캠페인</a>
        <a href="happy_member.php?mode=camp_join_list" class="title_more">
            <span uk-icon="icon:more; ratio:1.3" class="uk-icon">
                <svg width="26" height="26" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="more">
                    <circle cx="3" cy="10" r="2"></circle>
                    <circle cx="10" cy="10" r="2"></circle>
                    <circle cx="17" cy="10" r="2"></circle>
                </svg>
            </span>
        </a>
    </div>
    <div style="padding:25px 30px;">
        <table class="mypage_common_table_title" style="border-bottom:none;">
            <tbody>
                <tr>
                    <td style="">캠페인정보</td>
                    <td style="width:320px;">캠페인 참여일/캠페인 기간</td>
                    <td style="width:240px;">참여상태</td>
                    <td style="width:95px;">관리</td>
                </tr>
            </tbody>
        </table>
        <c:forEach var="campaign" items="${campaigns}">
            <table align="center" width="1148" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td width="1148" align="center" valign="top">
                            <div class="my_regi_camp_rows" style="padding:25px 0; border-top:1px solid #eaeaea;">
                                <table style="width:100%;">
                                    <tbody>
                                        <tr>
                                            <!-- 캠페인정보 -->
                                            <td style="vertical-align:top;">
                                                <div style="display:table; width:100%; table-layout:fixed;">
                                                    <div style="display:table-cell; vertical-align:top; width:190px;">
                                                        <div class="flexslider" style="border-radius:3px; overflow:hidden;">
                                                            <a href="detail.php?number=225&amp;category=858">
                                                                <div class="my_img_uryo">   </div>
                                                                <img src="${pageContext.request.contextPath}/resources/images/${campaign.imageFileName}" width="233px;" class="mainimage">
                                                            </a>
                                                            <ol class="flex-control-nav flex-control-paging">
                                                                <li><a href="#" class="flex-active">1</a></li>
                                                                <li><a href="#">2</a></li>
                                                                <li><a href="#">3</a></li>
                                                                <li><a href="#">4</a></li>
                                                            </ol>
                                                            <ul class="flex-direction-nav">
                                                                <li class="flex-nav-prev"><a class="flex-prev" href="#">Previous</a></li>
                                                                <li class="flex-nav-next"><a class="flex-next" href="#">Next</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div style="display:table-cell; vertical-align:top; padding:0 30px 0 20px;">
                                                        <a href="detail.php?number=225&amp;category=858" class="big_info_text">${campaign.campaignName}</a>
                                                        <div class="small_info_text">
                                                            카테고리 : ${campaign.mainCategory}/${campaign.subCategory}
                                                            <br>지역 : ${campaign.region} ${campaign.city}
                                                            <span style=""><br>신청 : <span style="color:#0067ff">${campaign.applicants} </span> / ${campaign.selectedCandidates} 명</span>
                                                            <span style="display:none;"><br>콘텐츠 : <span class="no_recruit_color_01">0</span> 개</span>
                                                                <c:forEach items="${campaign.campaignTypes}" var="campaignType">
                                                                    <img src="${pageContext.request.contextPath}/resources/images/snsIcon/${campaignType}.png" width="20px" alt="Sub Image">
                                                                </c:forEach>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <!-- 캠페인정보 -->

                                            <!-- 캠페인 참여일/캠페인기간 -->
             
                                                <td style="width:300px; vertical-align:top;">
                                                    <div class="big_info_text">신청일 : <span style="color:#4b93ff;" class="">${campaign.applications.registrationDate}</span></div>
                                                    <div class="small_info_text">
                                                        <div class="mypage_regi_period">
                                                            <div id="10">
                                                                리뷰어 신청 : ${campaign.startDate} ~ ${campaign.endDate}
                                                            </div>
                                                            <div id="20">
                                                                리뷰어 발표 : ${campaign.selectDate}
                                                            </div>
                                                            <div id="30">
                                                                콘텐츠 등록 : ${campaign.registrationStart} ~ ${campaign.registrationEnd}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            
                                            <!-- 캠페인 참여일/캠페인기간 -->

                                            <!-- 참여상태 -->
                                            <td style="width:240px; padding:0 20px; vertical-align:top;">
                                                <div class="big_info_text ${campaign.applications.status == '선정대기'}">
                                                    <c:choose>
                                                        <c:when test="${campaign.applications.status == '선정대기'}">
                                                            선정대기
                                                        </c:when>
                                                        <c:when test="${campaign.applications.status == '선정취소'}">
                                                            선정취소
                                                        </c:when>
                                                        <c:when test="${campaign.applications.status == '미선정'}">
                                                            미선정
                                                        </c:when>
                                                        <c:when test="${campaign.applications.status == '선정'}">
                                                            선정
                                                        </c:when>
                                                        <c:when test="${campaign.applications.status == '콘텐츠 등록'}">
											                컨텐츠 등록
											            </c:when>
                                                    </c:choose>
                                                </div>
                                                <div class="font_13 ls_1" style="color:#a4a4a4; margin-top:10px;">
                                                    <c:choose>
                                                        <c:when test="${campaign.applications.status == '선정대기'}">
                                                            리뷰어 신청을 하셨습니다.<br>리뷰어 발표일을 기다려주세요.
                                                        </c:when>
                                                        <c:when test="${campaign.applications.status == '선정취소'}">
                                                            선정취소 되었습니다. <br> 패널티에 유의해주세요.
                                                        </c:when>
                                                        <c:when test="${campaign.applications.status == '미선정'}">
                                                            미선정되었습니다.<br>다음에 다시 신청해주세요.
                                                        </c:when>
                                                        <c:when test="${campaign.applications.status == '선정'}">
                                                            선정되셨습니다.<br>콘텐츠를 등록해주세요.
                                                        </c:when>
                                                        <c:when test="${campaign.applications.status == '콘텐츠 등록'}">
											                컨텐츠를 등록하셨습니다.
											            </c:when>
                                                        <c:otherwise>
                                                            다른 상태에 대한 내용을 출력하세요.
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
 
                                            </td>
											<td class="h_form my_join_set_btn" style="width:105px; vertical-align:top;">
											    <a href="${contextPath}/${campaign.id}/${userInfo.nickName}">
											        <button class="button">상세보기</button>
											    </a>
											
											   <form action="<c:url value='/mypagedeleteApplication/${campaign.id}/${userInfo.nickName}'/>" method="post">
									                <button onclick="cancel_${campaign.id}()" class="button cancel-button" id="cancel_${campaign.id}" style="display:none;">신청취소</button>
									            </form>
											    <script>
											    document.getElementById("cancel_${campaign.id}").onclick = function(event) {
											        var result = confirm("취소하시겠습니까?");
											        if (result) {
											            alert("신청이 취소되었습니다.");
											        } else {
											            event.preventDefault();
											        }
											    };
											    </script>								
									            <button onclick="openModal_${campaign.id}()" class="button content-button" id="content_${campaign.id}" style="display:none;">콘텐츠 등록</button>
				
				
													<div id="myModal_${campaign.id}" class="modal">
													    <div class="modal-content">
													        <span class="close-button" onclick="closeModal(${campaign.id})">&times;</span>
													        <h2>콘텐츠 등록하기</h2>
													        <form name="review_regi_form" method="post" action="${contextPath }/review/create" id="reviewForm">
															<input type="hidden" name="id" value="${campaign.id}">
															<input type="hidden" name="contentNo" value="${campaign.id}">
															<input type="hidden" name="filePath" value="${userInfo.profilephoto }"> 
															<input type="hidden" name="division" value="${userInfo.division }"> 
															
															<div class="popup_table">
																<div class="popup_table_title">
																	리뷰 URL
																</div>
																<div class="popup_table_content h_form">
																	<div class="review_app_sns_box font_13">
																		※ 본 캠페인은 <span class="review_app_sns">
																			<c:forEach items="${campaign.campaignTypes}" var="campaignType">																				
			                                                                    <img src="${contextPath}/resources/images/snsIcon/${campaignType}.png" width="20px" alt="Sub Image">
			                                                                </c:forEach>
																		 </span> 를 모집희망합니다.
																	</div>
																	<div style="padding:10px; background:#f7f7f7; border:1px solid #eaeaea; border-radius:5px; margin-top:10px;">
																		<p class="font_14 noto500" style="margin-bottom:10px;">콘텐츠 URL</p>
																		<input type="text" name="url" value="" placeholder="콘텐츠 URL을 입력하세요.">
																		<p class="font_13" style="color:#999; margin:7px 0 10px 0;">
																			<span class="font_13" style="color:#0067ff;">타인의 블로그 등록시 여러가지 불이익이 있을 수 있습니다.</span><br>
																			http:// 또는 https://를 포함한 정확한 URL을 입력해주세요.<br>
																			예) http://blog.naver.com/test/123412312
																		</p>
																	</div>
																</div>
															</div>
															
															<div class="popup_table" style="display:;">
																<div class="popup_table_title" >
																	작성자
																</div>
																<div class="popup_table_content h_form">
																	<input type="text" name="name" value="${userInfo.nickName }"><br>
																</div>
															</div>
															<div class="popup_table" style="display:;">
																<div class="popup_table_title" >
																	체험 후기
																</div>
																<div class="popup_table_content h_form">
																	<input type="text" name="word" value=""><br>
																	<div style="color:#999; line-height:15px; margin-top:7px;" class="font_13">후기를 입력해주세요.</div>
																</div>
															</div>
															<div class="h_form" style="text-align:center; padding:20px 0;">
																<button class="h_btn_m h_btn_st1">등록완료</button>
															</div>
															
															</form>
													    </div>
													</div>

												 <script>
												 
										        function application_${campaign.id}() {
										        	var status = "${campaign.applications.status}";
										            var cancelButton = document.getElementById("cancel_${campaign.id}");
										            var contentButton = document.getElementById("content_${campaign.id}");

										            if (status == "선정대기" || status == "선정취소") {
										                cancelButton.style.display = "block";
										            } else if (status == "선정") {
										                contentButton.style.display = "block";
										                cancelButton.style.display = "none";
										            } else if (status == "콘텐츠 등록") {
										                contentButton.style.display = "none"; // "콘텐츠 등록" 상태에서 "컨텐츠 등록" 버튼 감춤
										                cancelButton.style.display = "none"; // "콘텐츠 등록" 상태에서 "신청취소" 버튼 감춤
										            }
										        }
										        
										        /* $(document).ready(function () {
										            $("#reviewForm").on("submit", function (e) {
										                e.preventDefault(); // 기본 제출 동작 방지
										                console.log("폼 서브밋 시도");


										             	// Ajax 요청 후 서버 응답 처리
										                $.ajax({
										                    type: "POST",
										                    url: $(this).attr("action"),
										                    data: $(this).serialize(),
										                    success: function (response) {
										                    	console.log("서버 응답: " + JSON.stringify(response));

										                        // JSON 응답에서 상태를 확인
										                        var status = response.status;

										                        // 여기에서 적절한 동작을 수행하여 페이지 이동 및 상태 업데이트
										                        if (status === "콘텐츠 등록") {
										                            // 리뷰어 선정 상태를 '컨텐츠 등록'으로 변경
										                            application_${campaign.id}(); // 해당 캠페인의 상태 업데이트 함수 호출
										                            // 원하는 페이지로 이동하는 JavaScript 코드를 작성
										                            window.location.href = "${contextPath}/mypage/${userInfo.division}/${userInfo.nickName}";
										                        }
										                    },
										                    error: function (error) {
										                        console.error("오류 발생: " + error);
										                    }
										                });

										            });
										        }); */
												
										        
										        // 각 campaign에 대한 application 함수 호출
										        application_${campaign.id}();

									                function openModal_${campaign.id}() {
									                    var modal = document.getElementById("myModal_${campaign.id}");
									                    modal.style.display = "block";
									                    setTimeout(function () {
									                        modal.classList.add("open");
									                    }, 50);
									                }
											
									            	 // 모달 팝업 닫기
									                function closeModal(campaignId) {
									                    var modal = document.getElementById("myModal_" + campaignId);
									                    modal.classList.remove("open"); 
									                    setTimeout(function () {
									                        modal.style.display = "none";
									                    }, 300);
									                }

											    </script>
											</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div style="text-align:right;">
                                    <div class="af_clear" style="text-align:right; margin-top:20px; position:relative; display:inline-block;">
                                        <ul class="circle_period_view">
                                            <li class="${campaign.applications.status == '선정대기' || campaign.applications.status == '선정취소' ? 'circle_period_view_on' : ''}">리뷰어<br>신청</li>
                                            <li class="${campaign.applications.status == '미선정' ? 'circle_period_view_on' : ''}">리뷰어<br>미선정</li>
                                            <li class="${campaign.applications.status == '선정' ? 'circle_period_view_on' : ''}">리뷰어<br>선정</li>
                                            <li class="${campaign.applications.status == '콘텐츠 등록' ? 'circle_period_view_on' : ''}">콘텐츠<br>등록</li>
                                        </ul>
                                        <div class="cirle_period_line"></div>
                                    </div>
                                </div>
                            </div>
                        </td>   
                    </tr>
                </tbody>
            </table>
        </c:forEach>
    </div>
</div>


</td>
</tr><tr>
</tr>
<tr><td colspan="5" align="center"></td></tr>
</tbody></table>
	</div>
</div>

			</div>
		</div>
	</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>
</body>
</html>