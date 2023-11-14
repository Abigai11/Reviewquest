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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/FlexSlider.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/bbs_style.css" rel="stylesheet" type="text/css">
<title>ReViewQuest</title>
<style type="text/css">
	.list_hover:hover {
	color: #0067ff;
}
</style>
</head>
<body>

	<div class="container">
		<div style="">
			<div class="noto500 font_18 ls_1" style="padding:20px 0; position:relative;">
				<h2>캠페인 정보</h2>
			</div>
			<c:if test="${userInfo.nickName == reviewDTO.name }">
				<div>
					<a href="${contextPath }/review/modify?id=${campaignDTO.id }&reviewNo=${reviewDTO.reviewNo}" class="list_hover">수정하기</a>
				</div>
			</c:if>
			<div style="padding:25px 0; border-top:1px solid #eaeaea; border-bottom:1px solid #eaeaea; margin-bottom:20px;">
				<div style="display:table; width:100%; table-layout:fixed;">
					<div style="padding-top:6px; display:table-cell; width:180px; vertical-align:top;"><a href="${contextPath }/${campaignDTO.id}"><img src="${contextPath}/resources/images/${campaignDTO.imageFileName}" border="0" style="width:180px; height:120px;"></a></div>
					<div class="font_16 ls_1" style="display:table-cell; padding-left:30px; vertical-align:top;">
						<a href="detail.php?number=124&amp;category=" class="noto500 ls_1 font_22" style="display:inline-block;">${campaignDTO.campaignName }</a><br>
						
						<p style="padding:3px 0 5px 0;"><a href="detail.php?number=124&amp;category=" class="ls_1" style="color:#999;">${reviewDTO.word }</a></p>
						
						<p style="line-height:2;">
							리뷰작성일 <span style="color:#999; padding-left:50px;"><fmt:formatDate	value="${reviewDTO.reDate}" pattern="yyyy-MM-dd" /></span><br>
							모집희망 SNS <span style="color:#999; padding-left:20px;"><span class="inquiry_sns_img">
								<c:forEach items="${campaignDTO.campaignTypes}" var="campaignType">
	                                <img src="${contextPath}/resources/images/snsIcon/${campaignType}.png" width="20px" alt="Sub Image">
	                            </c:forEach>
							</span></span><br>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="h_form font_15 ls_1" style="text-align:left; background-color:#888; border-radius:5px 5px 0 0; color:#fff; padding:15px 20px; margin-top:30px; position:relative;">
			아래는 해당 콘텐츠의 블로그 페이지입니다.
			<a href="${reviewDTO.url}" target="_blank" style="position: absolute; top: 15px; right: 15px; text-decoration: none;">
			  <span style="color: #fff;">새창으로 열기</span>
			  <i class="fas fa-external-link-alt" style="margin-left: 5px; color: #fff;"></i>
			</a>
		</div>

		<table cellspacing="0" style="width:100%; margin-bottom:30px; border:1px solid #eaeaea; border-top:none;">
		<tbody><tr>
			<td>
				<iframe id="fBody" width="100%" height="1000" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" src=${reviewDTO.url }></iframe>
			</td>
		</tr>
		</tbody></table>
	</div>
	<br><br><br>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>