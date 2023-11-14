<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<c:set var="userInfo" value="${sessionScope.userInfo}" /> 
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/FlexSlider.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/bbs_style.css" rel="stylesheet" type="text/css">
<title>ReViewQuest</title>
</head>
<body>
<div class="container af_clear">
<c:choose>  
    <c:when test="${userInfo.nickName == reviewDTO.name}">
<form name="review_regi_form" method="post" action="${contextPath }/review/modify?id=${campaignDTO.id}" onsubmit="return chk_regiform();">
<input type="hidden" name="contentNo" value="${campaignDTO.id}">
<input type="hidden" name="id" value="${campaignDTO.id}">
<input type="hidden" name="reviewNo" value="${reviewDTO.reviewNo}">

<div class="af_clear popup_big_title">
	리뷰 수정<span class="font_15"></span>
</div>

<div class="popup_table">
	<div class="popup_table_title">
		리뷰 URL
	</div>
	<div class="popup_table_content h_form">
		<div class="review_app_sns_box font_13">
			※ 본 캠페인은 <span class="review_app_sns">
				<c:forEach items="${campaignDTO.campaignTypes}" var="campaignType">
                    <img src="${contextPath}/resources/images/snsIcon/${campaignType}.png" width="20px" alt="Sub Image">
                </c:forEach>
			 </span> 를 모집희망합니다.
		</div>
		<div style="padding:10px; background:#f7f7f7; border:1px solid #eaeaea; border-radius:5px; margin-top:10px;">
			<p class="font_14 noto500" style="margin-bottom:10px;">콘텐츠 URL</p>
			<input type="text" name="url" value="${reviewDTO.url }" placeholder="콘텐츠 URL을 입력하세요.">
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
		<input type="text" name="word" value="${reviewDTO.word }"><br>
		<div style="color:#999; line-height:15px; margin-top:7px;" class="font_13">후기를 입력해주세요.</div>
	</div>
</div>

<div class="h_form" style="text-align:center; padding:20px 0;">
    <button class="h_btn_m h_btn_st1" style="background-color: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">수정완료</button>
</div>

</form>
</c:when>
    <c:otherwise>
        <c:redirect url="/WEB-INF/views/error/error404.jsp" />
    </c:otherwise>
</c:choose>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>