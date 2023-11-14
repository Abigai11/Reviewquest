<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:include page="../common/header.jsp" flush="false" />
<%@ page import="com.project.reviewquest.campaign.CampaignDTO" %>
<%@page import="com.project.reviewquest.member.MemberDTO"%>
<c:set var="userInfo" value="${sessionScope.userInfo}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
    <title>Campaign Details</title>
       <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
       <script src="js/FlexSlider/modernizr.js"></script>
	   <script defer="" src="js/FlexSlider/jquery.flexslider.js"></script> 

</head>
<body>
<div class="d_container"><script type="text/javascript" src="js/adblog.js"></script>

<style type="text/css">
	.h_form .h_btn_st1 { background-color: #4b93ff !important; }
	.h_form .h_btn_st1:hover, .h_form .h_btn_st1:focus { background-color: #0067ff !important; }
	.h_form .h_btn_st1:active { background-color: #0067ff !important; }

	.h_form input[type="text"]:focus, .h_form input[type="password"]:focus, .h_form select:focus, .h_form textarea:focus { border-color: #0067ff; }

	.h_form .h_btn_st2 { background-color: #828282 !important; }
	.h_form .h_btn_st2:hover, .h_form .h_btn_st2:focus { background-color: #777777 !important; }
	.h_form .h_btn_st2:active { background-color: #777777 !important; }

	.detail_info_cover span{color:#0067ff;}

	.detail_main_group .address_title, .detail_main_group .small_text{display:none;}

	/* 상세정보탭 */
	.detail_list_tab a{
		display:inline-block;
		padding:13px 20px;
		font-size:16px;
		color:#595959;
		letter-spacing:-1px;
		float:left;
	}
	.detail_list_tab .tab_off span{color:#afafaf;}
	.detail_list_tab .tab_on span{color:#0067ff;}
	.detail_list_tab .tab_on{
		font-weight:500;
		color:#222222;
		border-bottom:2px solid #0067ff;
	}
	
.image-gallery {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom:100px;
}

.main-image {
    width: 100%;
    text-align: center;
    margin-top:50px;
}

#mainImage {
    transition: opacity 0.5s; /* 페이드 효과를 위한 CSS 트랜지션 설정 */
    border-radius:20px;
}

.sub-images {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10px; /* 서브 이미지들과의 간격 설정 */

}

.sub-image {
    max-width: 80px; /* 서브 이미지 크기 설정 */
    cursor: pointer;
    margin: 0 10px; /* 서브 이미지 간 간격 설정 */
    border-radius:10px;
}

.image-gallery {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
}

.main-image {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.controls {
    position: absolute;
    transform: translateY(850%);
}

#prevButton {
    font-size: 24px;
    border: none;
    cursor: pointer;
    border-radius:10px;
    margin-right: 650px;
    background-color: rgba(255, 255, 255, 0.7) !important;
    transform: translateY(-50%);
}

#prevButton:hover {
    font-size: 24px;
    border: none;
    cursor: pointer;
    border-radius:10px;
    margin-right: 650px;
    background-color: rgba(0, 0, 0, 0.7) !important;
    transform: translateY(-50%);
}

#nextButton {
    font-size: 24px;
    border: none;
    cursor: pointer;
    border-radius: 10px;
    background-color: rgba(255, 255, 255, 0.7) !important;
    transform: translateY(-50%);
}

#nextButton:hover {
    font-size: 24px;
    border: none;
    cursor: pointer;
    border-radius: 10px;
    background-color: rgba(0, 0, 0, 0.7) !important;
    transform: translateY(-50%);
}

#showMoreButton {
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 300px;
    height: 50px;
    display: block;
    margin: 0 auto;
    text-align: center;
    line-height: 10px;
    margin-bottom:50px;
}

.buttonArray{
	display:flex;
}

/* 모달 팝업 스타일 */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    z-index: 1;
    overflow: auto;
}

.modal-content {
    background-color: #f9f9f9;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%) scale(0.9);
    transform-origin: center;
    width: 80%;
    max-width: 800px; /* 팝업 너비를 조정 */
    padding: 20px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    z-index: 2;
    opacity: 0;
    transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
    border-radius: 8px; /* 팝업을 둥글게 만듦 */
}

/* 모달 닫기 버튼 스타일 */
.close-button {
    float: right;
    cursor: pointer;
    font-size: 24px;
    color: #333;
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
}

.popup-button {
    text-align: center;
    margin-top: 20px;
}

/* 버튼 스타일 */
.h-btn {
    background-color: #0074e4;
    color: #fff;
    padding: 15px 30px;
    border: none;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s ease;
    font-size: 16px;
}

.h-btn:hover {
    background-color: #0052cc;
}

/* 인풋 박스 스타일 */
input[type="text"],
input[type="email"],
input[type="tel"],
textarea {
    width: 100%;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 10px;
    font-size: 16px;
}

button {
    background-color: #0074e4;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #0057b3;
}

/* 기본 탭 스타일 */
.detail_list_tab .tab {
    cursor: pointer;
    color: #000; /* 일반 상태의 글자색 */
    padding: 10px 20px;
    text-decoration: none;
}

/* 클릭한 탭 스타일 */
.detail_list_tab .active-tab {
    background-color: #0067ff;
    color: #fff;
    border: 3px solid #0067ff;
    border-radius: 5px;
}

/* 버튼 스타일링 */
.btn-review {
    background-color: #0067ff; /* 배경색 */
    color: #fff; /* 텍스트 색상 */
    padding: 8px 16px; /* 패딩 */
    border-radius: 4px; /* 둥근 모서리 */
    text-decoration: none; /* 밑줄 제거 */
    transition: background-color 0.3s; /* 마우스 오버 효과 */
}

.btn-review:hover {
		    background-color: #0057b3; /* 마우스 오버시 배경색 변경 */
		    color: #fff;
		}

#view:hover{
	cursor:pointer !important;
}

input[type="text"], input[type="email"], input[type="tel"], textarea {
    width: 350px;
    border: 1px solid #000;
    border-radius: 5px;
    margin-bottom: 0px;
    padding: 0px;
}

.modal-close1 {
	background: rgba(255, 255, 255, 0);
	position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    color: #777777;
    padding: 0px;
}

.modal-close1:hover {
	background: rgba(255, 255, 255, 0);
    cursor: pointer;
}
</style>

<div style="position:relative;">
	<div class="af_clear detail_setting_area" style="position:absolute; width:100%; top:0; left:0; background:#f7f7f7; z-index:2;">
		<div class="f_l h_form"></div>
		<div class="f_r h_form"></div>
	</div>
</div>


<div class="af_clear">

	<div id="scrollMoveBox_target"></div>
	<div class="scrollMoveBox"></div>
	<table class="f_l">
	<tbody>
	<tr>
		<td class="detail_left_area">
			<div class="detail_big_title">		
				${campaign.campaignName}
			</div>
			<div class="detail_hongbo_text">${campaign.campaignPrice}</div>
			<div class="image-gallery">
			    <div class="main-image">
			        <img id="mainImage" src="${pageContext.request.contextPath}/resources/images/${campaign.imageFileName}" style="width: 820px; height: 820px !important;">
			    </div>
			        <div class="controls">
			            <button id="prevButton" class="control-button">&#10094;</button>
			            <button id="nextButton" class="control-button">&#10095;</button>
			        </div>    
			    <div class="sub-images">
			        <!-- 대표 이미지 추가 -->
			        <div class="image-item main-image-item">
			            <img class="sub-image" src="${pageContext.request.contextPath}/resources/images/${campaign.imageFileName}" alt="Main Image">
			        </div>
			        <c:forEach items="${campaign.subImageFileNames}" var="subImageFileName">
			            <div class="image-item">
			                <img class="sub-image" src="${pageContext.request.contextPath}/resources/images/${subImageFileName}" alt="Sub Image">
			            </div>
			        </c:forEach>
			    </div>
			</div>
		</div>
		<div class="af_clear">
		<!-- 신청현황/등록현황 -->
		<div class="f_l detail_info_box" style="width:490px; height:139px; padding:20px 25px 50px 25px;">
		    <div class="noto500 font_16 ls_1" style="color:#333333;">리뷰어 신청현황</div>
		    <div style="display:table; width:100%; margin:10px 0 5px 0;">
		        <div class="font_15" style="display:table-cell; color:#969696;">
		            <span uk-icon="icon:account-supervisor; ratio:0.8" style="color:#bbb" class="uk-icon"><svg width="19.200000000000003" height="19.200000000000003" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" data-svg="account-supervisor"><path d="M16.5,12A2.5,2.5 0 0,0 19,9.5A2.5,2.5 0 0,0 16.5,7A2.5,2.5 0 0,0 14,9.5A2.5,2.5 0 0,0 16.5,12M9,11A3,3 0 0,0 12,8A3,3 0 0,0 9,5A3,3 0 0,0 6,8A3,3 0 0,0 9,11M16.5,14C14.67,14 11,14.92 11,16.75V19H22V16.75C22,14.92 18.33,14 16.5,14M9,13C6.67,13 2,14.17 2,16.5V19H9V16.75C9,15.9 9.33,14.41 11.37,13.28C10.5,13.10 9.66,13 9,13Z"></path></svg></span>
		            <span class="noto500" style="color:#0067ff;">${campaign.applicants}</span> 명
		        </div>
		        <div class="font_15" style="display:table-cell; text-align:right; color:#969696;">
		            <span class="noto500" style="color:#545454;">${campaign.selectedCandidates}</span> 명
		        </div>
		    </div>
		    <div style="overflow:hidden; height:5px; border-radius:50px; background:#eaeaea;">
		        <div id="progress-bar" style="background:#0067ff; width:0%; height:5px; float:left;"></div>
		    </div>
		    <div style="position:relative; top:0px; left:-22px;">
		        <div class="percent_bubble_layer" style="position:absolute; top:10px; left:100%;">
		            <div id="progress-percent" class="font_12" style="color:#0067ff">0%</div>
		        </div>
		    </div>
		</div>

		<div class="f_l detail_info_box" style="margin-left:10px; width:320px; height:139px; padding:15px 25px 20px 25px;">
			<table class="detail_info_table" style="width:100%;">
				<tbody>
					<tr>
						<th>카테고리</th>
						<td>${campaign.mainCategory} / ${campaign.subCategory}</td>
					</tr>
					<tr>
						<th>진행상태</th>
						<td style="color:#0067ff">리뷰어신청 D-${campaign.daysUntilEndDate()}</td>
					</tr>
					<tr>
						<th>모집희망SNS</th>
						<td class="detail_sns_img">
							<c:forEach items="${campaign.campaignTypes}" var="campaignType">
							    <img src="${pageContext.request.contextPath}/resources/images/snsIcon/${campaignType}.png" width="20px" alt="Sub Image">
							</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

<div class="conList" style="margin-top:80px;">
    <!-- 상세정보 및 리스트 -->
    <div id="con1">
        <div class="detail_contents_box" style="display:block;">
            <div>
                <div class="detail_list_tab af_clear" style="border-bottom:1px solid #e2e2e2;">
                    <a class="tab" overclass="tab_on" outclass="tab_off" id="tab_reviewer" onclick="">상세정보</a>
                    <a class="tab" id="tab_review">리뷰 <span>${reviewCount}</span></a>
                </div>
            </div>
            <div id="ct_reviewer" style="margin:20px 0 40px 0;">
                <div id="detail_overflow" style="overflow:hidden; max-height:760px;">
                    <p style="text-align: center;"></p>
                    <p style="text-align: center;"></p>
                <button id="showMoreButton">상세정보 더 보기</button>
                <c:forEach items="${campaign.detailimageFileNames}" var="detailimageFileName">
                    <img src="${pageContext.request.contextPath}/resources/images/${detailimageFileName}" style="display: block; margin: 0 auto;" width="100%" alt="Sub Image"> 
                </c:forEach>
                                    
                </div>
            </div>
            
    <script>
	    // JavaScript로 상세정보 표시 여부를 제어합니다.
	    const showMoreButton = document.getElementById('showMoreButton');
	    const detailOverflow = document.getElementById('detail_overflow');
	    let isDetailVisible = false;
	
	    showMoreButton.addEventListener('click', () => {
	        if (isDetailVisible) {
	            detailOverflow.style.maxHeight = '760px'; // 디테일 이미지 최대 높이 설정
	            showMoreButton.textContent = '상세정보 더 보기'; // 버튼 텍스트 변경
	        } else {
	            detailOverflow.style.maxHeight = null; // 디테일 이미지의 최대 높이 제거
	            showMoreButton.textContent = '상세정보 줄이기'; // 버튼 텍스트 변경
	        }
	        isDetailVisible = !isDetailVisible; // 토글 상태 변경
	    });
	</script>
	
            <div id="ct_review" style="margin:20px 0 40px 0;">
               <table cellpadding="0" cellspacing="0" border="0" style="width:100%;" class="bbs_list_title_bar">
					<c:if test='${listReview.isEmpty()}'>
						<tr>
							<td colspan="4"><h3 style="text-align: center;">등록된 리뷰가 없습니다.</h3>
							</td>
						</tr>
					</c:if>
					<c:forEach var="listReview" items="${listReview}">
						<tr>
						    <td style="width:20%; text-align:center; padding: 30px 0" class="noto400 font_15 bbs_rows_num">
						        <img alt="" src="${contextPath}/resources/images/profilephoto/${listReview.filePath}" style="width:90px; height:90px; border-radius:50%;">
						    </td>
						    <td style="width:50%; text-align:left; padding-left: 10px;" class="noto400 font_15 bbs_rows_num">
						    	<div style="margin-bottom: 20px; font-size: 17px;">
							    	<b class="h_form">${listReview.name}</b><br>
							    </div>
							    <div style="margin-bottom: 20px;">
							    	<span>${listReview.word }</span><br>
							    </div>
							    <div class="noto400 font_15 bbs_rows_by" style="margin-bottom: 20px;">
							        <fmt:formatDate value="${listReview.reDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							    </div>
							</td>
						    <td style="width:30%; text-align:center;" class="noto400 font_15 bbs_rows_date">
							    <div>
							        <a href="${contextPath }/review/read?id=${id}&reviewNo=${listReview.reviewNo}" class="btn-review">
							            <i class="fas fa-eye"></i> 리뷰 보러가기
							        </a>
							    </div>
							</td>
						</tr>
					</c:forEach>
				</table>
            </div>
        </div>
    </div>
</div>



<!-- 제공내역 -->
<div id="con2">
	<div class="detail_contents_box">
		<div class="detail_con_title">제공내역</div>
		<div class="detail_con_text">
			<div class="ct"><p>${campaign.providedDetails}</p>
</div>
						</div>
					</div>
				</div>

				<!-- 검색 키워드 -->
<div id="con3">
	<div class="detail_contents_box">
		<div class="detail_con_title">검색 키워드</div>
		<div class="detail_con_text">
			${campaign.keyword}
		<span class="font_14" style="display:block; color:#969696;">- 안내드린 키워드를 제목, 본문, SNS 해시태그에 넣어주세요.</span>
		</div>
	</div>
</div>

<!-- 참여 안내 사항 -->
<div id="con4">
	<div class="detail_contents_box">
		<div class="detail_con_title">참여 안내 사항</div>
		<div class="detail_con_text">
			${campaign.notification}
		</div>
	</div>
</div>

<!-- 업체 정보 -->
<div id="con5">
	<div class="detail_contents_box" style="border-bottom:none;">
	<div class="detail_con_title">업체 정보</div>
	<div class="detail_con_text">
		<div class="detail_main_group"><table cellspacing="0" style="width:100%;">
		${campaign.companyInformation}
</table>
</div></div>
</div>
</div></div></td></tr></tbody></table>

	<div class="f_r" style="width:380px; position:sticky; top:50px">
		<!-- 우측 스크롤 -->
		<div id="detail_view_right_scroll" style="z-index:99;">
			<div class="detail_middle_area">
				<div class="detail_tab_box">
					<div class="noto500" style="font-size:25px; color:#333; letter-spacing:-1px;">캠페인 기간</div>
					<div class="detail_campaign_period">
	<div id="10" style="color: rgb(33, 33, 33); font-weight: 500; letter-spacing: -1px;">
		<span>리뷰어 신청</span>
		${campaign.startDate} ~ ${campaign.endDate}
	</div>
	<div id="20">
		<span>리뷰어 발표</span>
		${campaign.selectDate}
	</div>
	<div id="30">
		<span>콘텐츠 등록</span>
		${campaign.registrationStart} ~ ${campaign.registrationEnd}
	</div>
</div>



<div class="detail_menu tabBt">
	<div class="detail_tab_menu">
		<ul>
			<li><a href="#con1">캠페인 상세정보</a></li>
			<li><a href="#con2">제공내역</a></li>
			<li><a href="#con3">검색 키워드</a></li>
			<li><a href="#con4">참여 안내 사항</a></li>
			<li><a href="#con5">업체정보</a></li>
			<li><a href="#con6">캠페인 댓글</a></li>
		</ul>
	</div>
</div>

<div class="buttonArray">
   <button style="margin-right:10px;" onclick="openModal()" id="application"></button>

    <form action="<c:url value='/deleteApplication/${campaign.id}/${userInfo.nickName}'/>" id="" method="post" accept-charset="UTF-8">
		<button style="display:none;" onclick="cancel()" id="cancel">신청취소</button>
	</form>
</div>
	
<form action="<c:url value='/application/${campaign.id}/${userInfo.nickName} '/>" id="form" method="post" accept-charset="UTF-8">
	<a href=""><button style="display:none;" id="view">콘텐츠 등록 확인</button></a>	

    <!-- 모달 팝업 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal1()">&times;</span>
            <h2>캠페인 신청하기</h2>
        <input type="hidden" name="campaignNum" value="${campaign.id}">
 
         <div class="popup_table">
            <div class="popup_table_title">
                닉네임
            </div>
            <div class="popup_table_content h_form">
               <input type="text" id="nickName" value="${userInfo.nickName}" name="nickName" disabled>
            </div>
        </div>
   
        <div class="popup_table">
            <div class="popup_table_title">
                인스타그램
            </div>
            <div class="popup_table_content h_form">
                <div style="color:#848484; line-height:15px; margin-top:7px;" class="font_12">
                    자신의 인스타그램 주소를 적어주세요.
                </div>
                <input type="text" id="snsURL" value="" name="snsURL">
            </div>
        </div>
        
        <div class="popup_table">
            <div class="popup_table_title">
                네이버 블로그
            </div>
            <div class="popup_table_content h_form">
                <div style="color:#848484; line-height:15px; margin-top:7px;" class="font_12">
                    자신의 블로그 주소를 적어주세요.
                </div>
                <input type="text" id="snsURL" value="" name="snsURL">
            </div>
        </div>
        
        <div class="popup_table">
            <div class="popup_table_title">
                유튜브
            </div>
            <div class="popup_table_content h_form">
                <div style="color:#848484; line-height:15px; margin-top:7px;" class="font_12">
                    자신의 유튜브 주소를 적어주세요.
                </div>
                <input type="text" id="snsURL" value="" name="snsURL">
            </div>
        </div>      

        <div class="popup_table">
            <div class="popup_table_title">
                이름
            </div>
            <div class="popup_table_content h_form">
                <input type="text" name="name" id="name" value="">
            </div>
        </div>

        <div class="popup_table">
            <div class="popup_table_title">
                신청한마디
            </div>
            <div class="popup_table_content h_form">
                <textarea name="comment" id="comment" style="height:100px;"></textarea>
                <div style="color:#848484; line-height:15px; margin-top:7px;" class="font_12">신청 한마디를 남겨주세요.</div>
            </div>
        </div>

        <div class="popup_table"  id="RecipientTable">
            <div class="popup_table_title">
                제공상품 수령인
            </div>
            <div class="popup_table_content h_form">
                <input type="text" name="Recipient" id="Recipient" value=""><br>
                <div style="color:#848484; line-height:15px; margin-top:7px;" class="font_12">제공상품을 받으실 수령인을 입력해주세요.</div>
            </div>
        </div>

        <div class="popup_table" id="AddressTable">
            <div class="popup_table_title">
                제공상품 배송지
            </div>
            <div class="popup_table_content h_form">
     					   <input type="text" name="address_first" id="sample4_postcode" placeholder="우편번호" style="width: 120px;" readonly="readonly" >
                           <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="cursor:pointer;" ><br>
                           <input type="text" id="address" placeholder="도로명주소" style="width:30%;" maxlength="90" readonly="readonly">
                           <span id="guide" style="color:#999;display:none"></span>
                           <input type="text" name="address_third" id="sample4_detailAddress" placeholder="상세주소" style="width:30%;">
                           <input type="hidden" name="address" id="combined_address">
            </div>
        </div>

        <div class="popup_table">
            <div class="popup_table_title">
                연락처
            </div>
            <div class="popup_table_content h_form">
                <input type="text" name="phone" id="phone" value="" maxlength="11">
                <div style="color:#848484; line-height:15px; margin-top:7px;" class="font_12">"-" 없이 번호만 입력하여 주세요.</div>
            </div>
        </div>

        <div class="popup_table">
            <div class="popup_table_title">
                메일주소
            </div>
            <div class="popup_table_content h_form">
                <input type="text" name="email" id="email" value="">
            </div>
        </div>

        <div class="popup-button">
            <button class="h-btn h-btn-st1" onclick="complete()">신청완료</button>
        </div>
        </div></div>
        
    </form>

</td>
</tr><tr>
</tr>
</tbody></table>
			</div>
		</div>
	</div>

</div>
</div>
</div>

    <script>
    function complete() {
        alert("신청이 완료되었습니다.");
    }
    
    document.getElementById("cancel").onclick = function(event) {
        var result = confirm("취소하시겠습니까?");
        if (result) {
            alert("신청이 취소되었습니다.");
        } else {
            event.preventDefault();
        }
    };
    
    function load() {
        var application = document.getElementById("application");
        var cancel = document.getElementById("cancel");
        var snsURL = document.getElementById('snsURL');
        var name = document.getElementById('name');
        var comment =  document.getElementById('comment');
        var recipient = document.getElementById('recipient');
        var address	= document.getElementById('address');
        var phone = document.getElementById('phone');
        var email =document.getElementById('email');
        var form =document.getElementById('form');
        var view = document.getElementById('view');

        
        var DBapp = "${application.nickName}";
        var status = "${application.status}";
        
        if (DBapp != null && DBapp != "" && status !=="콘텐츠 등록"){
            application.innerText   = "신청내용수정";
            cancel.style.display = "block";
            snsURL.value = "${application.snsURL}";
            name.value = "${application.name}";
            comment.innerText = "${application.comment}";
            Recipient.value = "${application.recipient}";
            address.value = "${application.address}";
            phone.value = "${application.phone}";
            email.value = "${application.email}";
            form.action = "<c:url value='/updateApplication/${campaign.id}/${userInfo.nickName}' />";
            
        } else if (DBapp == null || DBapp == "" && status !=="콘텐츠 등록"){
            application.innerText   = "신청하기";
            snsURL.value = "${userInfo.urlSNS}";
            name.value = "${userInfo.name}";
            comment.innerText = "${userInfo.introduce}";
            Recipient.value = "${userInfo.name}";
            address.value = "${userInfo.address}";
            phone.value = "${userInfo.phoneNo}";
            email.value = "${userInfo.email}";
        } else if(status =="콘텐츠 등록"){
        	view.style.display = "block";
        	application.style.display = "none";
        }
    }

    window.onload = load;


    function openModal() {
    	var campaignStatus = "${campaign.campaignStatus}";
    	var session = "${userInfo.division}";
  		var modal = document.getElementById("myModal");
	    if (session != "" && session == "influencer"){
	    	  if (campaignStatus === "캠페인 신청진행중") {
	    	        modal.style.display = "block";
	    	        setTimeout(function () {
	    	            modal.classList.add("open");
	    	        }, 50);
	    	  	  }
	    	  	  else{
	    	  		alert("캠페인 신청이 현재 진행 중이 아닙니다. 다음 기간에 신청해주세요.");
	    	  	  }
	    } else if(session != "" && session == "company" || session == "admin" ){
	    	alert("인플루언서만 신청 가능합니다.");    	
	    } else if(session == null  || session == "") {
	    	alert("로그인 페이지로 이동합니다.");
	    	window.location.href = "${pageContext.request.contextPath}/login";
	    }

		
      
/*         // AJAX 요청을 보냄
        $.ajax({
            url: 'http://localhost:8080/reviewquest/popup',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                var memberSnsURL = data.snsURL;
                var memberName = data.name;
                var memberPhone = data.phone;
                var memberEmail = data.email;
                
                document.getElementById('snsURL').value = memberSnsURL;
                document.getElementById('name').value = memberName;
                document.getElementById('Recipient').value = memberName;
                document.getElementById('phone').value = memberPhone;
                document.getElementById('email').value = memberEmail;
                
            },
            error: function (error) {
                console.error("서버 요청 실패: " + error.statusText);
            }
        });
        
        $.ajax({
        	
        }) */
    }




        // 모달 팝업 닫기
        function closeModal1() {
            var modal = document.getElementById("myModal");
            modal.classList.remove("open"); 
            setTimeout(function () {
                modal.style.display = "none";
            }, 300); //
        }
    </script>

    
    <!-- 회원가입 정보입력 체크 JS [ start ] -->
<script>
    function sample4_execDaumPostcode() {
       var popup= new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("address").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                popup.close();
            },
            
            theme: {
                searchBgColor: "#0B65C8", //검색창 배경색
                queryTextColor: "#FFFFFF" //검색창 글자색
            }
        });
       popup.open({
           popupTitle: '주소 검색창',
           autoClose: true        
        });
       // 팝업 창 닫기
       if (window.opener) {
           window.opener.location.reload(); // 팝업을 열었던 창을 새로고침 (선택 사항)
           window.close(); // 현재 팝업 창을 닫음
       }
    }
    
 // JavaScript 코드
    document.addEventListener("DOMContentLoaded", function() {
      // userInfo.name에서 가져온 데이터를 분할하고 각각의 필드에 할당
      const userInfoAddress = "${userInfo.address}";
      const userDataArray = userInfoAddress.split("/"); // "/"를 기준으로 분할

      if (userDataArray.length >= 3) {
        const postcodeInput = document.getElementById("sample4_postcode");
        const addressInput = document.getElementById("address");
        const detailAddressInput = document.getElementById("sample4_detailAddress");
        const combinedAddressInput = document.getElementById("combined_address");

        // 각각의 필드에 데이터 할당
        postcodeInput.value = userDataArray[0];
        addressInput.value = userDataArray[1];
        detailAddressInput.value = userDataArray[2];
        combinedAddressInput.value = userInfoAddress; // 원본 데이터를 숨은 필드에 저장
      }
    });

 
function combineaddressFields() {
    var second = document.getElementsByName("address_second")[0].value;
    var third = document.getElementsByName("address_third")[0].value;
    
    var combinedValue = second + " " + third;
    document.getElementById("combined_address").value = combinedValue;
}

function combineAndSubmit() {
    combineaddressFields();
    
    document.forms[0].submit(); // 해당 문서의 첫 번째 form에 submit
    
}

//JavaScript를 사용하여 프로그래스 바 업데이트
const applicants = ${campaign.applicants};
const selectedCandidates = ${campaign.selectedCandidates};
const progressBar = document.getElementById('progress-bar');
const progressPercent = document.getElementById('progress-percent');

if (applicants > 0) {
    const progress = (applicants/selectedCandidates) * 100;
    
    // 소수점 둘째 자리까지 반올림
    const roundedProgress = Math.round(progress * 100) / 100;
    
    progressBar.style.width = roundedProgress + '%';
    progressPercent.textContent = roundedProgress + '%';
}

//JavaScript 코드
document.addEventListener("DOMContentLoaded", function() {
  // 캠페인 카테고리를 가져온다고 가정
  const campaignCategory = "${campaign.mainCategory}";

  // "제품"인 경우에만 제공상품 수령인 폼과 제공상품 배송지 폼 표시
  if (campaignCategory === "방문") {
	  const recipientForm = document.getElementById("RecipientTable"); // 수정
	  const addressForm = document.getElementById("AddressTable"); // 수정

	  // 폼을 표시
	  recipientForm.style.display = "none"; // 수정
	  addressForm.style.display = "none"; // 수정
  }
});

//JavaScript로 대표 이미지와 서브 이미지 엘리먼트를 가져옵니다.
const mainImage = document.getElementById('mainImage');
const subImages = document.querySelectorAll('.sub-image');

// 서브 이미지와 대표 이미지의 초기화
let currentImageIndex = 0;
let autoSlideInterval; // 자동 슬라이드를 위한 타이머

// 대표 이미지 설정 함수
function setMainImage(index) {
    // 클릭한 이미지의 src 속성을 대표 이미지로 설정합니다.
    mainImage.src = subImages[index].src;
    // 대표 이미지에 슬라이드 효과를 적용합니다.
    mainImage.style.opacity = '0'; // 처음에 투명도를 0으로 설정
    setTimeout(() => {
        mainImage.style.opacity = '1'; // 0.5초 후에 투명도를 1로 변경하여 페이드 인 효과 적용
    }, 200);
    currentImageIndex = index;
}

// 서브 이미지를 클릭할 때 대표 이미지를 변경하고 슬라이드 효과를 적용합니다.
subImages.forEach((subImage, index) => {
    subImage.addEventListener('click', () => {
        setMainImage(index);
        clearInterval(autoSlideInterval); // 이미지를 클릭하면 자동 슬라이드 타이머를 멈춥니다.
        startAutoSlide(); // 이미지 클릭 후 다시 자동 슬라이드 시작
    });
});

// 대표 이미지를 클릭할 때도 변경되도록 설정
const mainImageItem = document.querySelector('.main-image-item');
mainImageItem.addEventListener('click', () => {
    setMainImage(currentImageIndex);
    clearInterval(autoSlideInterval); // 이미지를 클릭하면 자동 슬라이드 타이머를 멈춥니다.
    startAutoSlide(); // 이미지 클릭 후 다시 자동 슬라이드 시작
});

// 이전 이미지로 이동
function moveToPreviousImage() {
    currentImageIndex = (currentImageIndex - 1 + subImages.length) % subImages.length;
    setMainImage(currentImageIndex);
}

// 다음 이미지로 이동
function moveToNextImage() {
    currentImageIndex = (currentImageIndex + 1) % subImages.length;
    setMainImage(currentImageIndex);
}

// 이전 이미지 버튼 클릭 시
const prevButton = document.getElementById('prevButton');
prevButton.addEventListener('click', () => {
    moveToPreviousImage();
    clearInterval(autoSlideInterval); // 버튼 클릭 시 자동 슬라이드 타이머를 멈춥니다.
    startAutoSlide(); // 버튼 클릭 후 다시 자동 슬라이드 시작
});

// 다음 이미지 버튼 클릭 시
const nextButton = document.getElementById('nextButton');
nextButton.addEventListener('click', () => {
    moveToNextImage();
    clearInterval(autoSlideInterval); // 버튼 클릭 시 자동 슬라이드 타이머를 멈춥니다.
    startAutoSlide(); // 버튼 클릭 후 다시 자동 슬라이드 시작
});

// 자동 슬라이드 시작 함수
function startAutoSlide() {
    autoSlideInterval = setInterval(() => {
        moveToNextImage();
    }, 3000); // 3초마다 다음 이미지로 이동
}

// 초기에 첫 번째 이미지를 대표 이미지로 설정하고 자동 슬라이드 시작
setMainImage(currentImageIndex);
startAutoSlide();

$(document).ready(function () {
    // 초기 상태 설정
    $("#ct_reviewer").show();
    $("#ct_review").hide();

    // 탭 클릭 이벤트 처리
    $(".detail_list_tab .tab").click(function () {
        // 모든 탭에서 active-tab 클래스 제거
        $(".detail_list_tab .tab").removeClass("active-tab");

        // 클릭한 탭에 active-tab 클래스 추가
        $(this).addClass("active-tab");

        // 클릭된 탭의 ID 값을 가져옴
        var clickedTabId = $(this).attr("id");

        // 탭에 따라 내용을 표시 또는 숨김
        if (clickedTabId === "tab_reviewer") {
            $("#ct_reviewer").show();
            $("#ct_review").hide();
        } else if (clickedTabId === "tab_review") {
            $("#ct_reviewer").hide();
            $("#ct_review").show();
        }
    });

    // '신청한 리뷰어' 탭을 초기에 활성화
    $("#tab_reviewer").addClass("active-tab");
    $("#ct_reviewer").show();
    $("#ct_review").hide();
});

function closeModal() {
	  var modal = document.getElementById("myModal1");
	  modal.style.display = "none";
	}

</script>
<!-- 회원가입 정보입력 체크 JS [ end ] -->
</body>
</html>
