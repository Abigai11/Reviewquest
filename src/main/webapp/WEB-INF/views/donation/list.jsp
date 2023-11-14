<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	var result = "${msg}";
	if(result == "regSuccess"){
		alert("기부글 등록이 완료되었습니다.");
	} else if (result == "doDelSuccess"){
		alert("기부글 삭제가 완료되었습니다.");
	}
	
	$(document).ready(function () {
        $(".formBtn").on("click", function () {
            var newUrl = "${contextPath}/donation/create";
            window.location.href = newUrl;
        });
        
        $("#searchBtn").on("click", function (event) {
        	var searchType = $("select[name='searchType']").val(); // 선택한 옵션 값을 가져옴
            var keyword = encodeURIComponent($("#keywordInput").val());
        	
            self.location = "${contextPath}/donatione/${donationPage.makeQuery(1)}"
            + "&searchType=" + searchType + "&keyword=" + keyword;

        });
        
     	// 이미지를 로드한 후에 실행
        window.addEventListener('load', function() {
            var imageContainers = document.querySelectorAll('.image-container');
            imageContainers.forEach(function(container) {
                var img = container.querySelector('img');
                
                // 컨테이너와 이미지의 너비 및 높이
                var containerWidth = container.offsetWidth;
                var containerHeight = container.offsetHeight;
                var imgWidth = img.width;
                var imgHeight = img.height;

                // 이미지가 컨테이너 크기를 초과하는 경우 크기 조절
                if (imgWidth > containerWidth || imgHeight > containerHeight) {
                    if (imgWidth / containerWidth > imgHeight / containerHeight) {
                        img.style.width = containerWidth + 'px';
                        img.style.height = 'auto';
                    } else {
                        img.style.width = 'auto';
                        img.style.height = containerHeight + 'px';
                    }
                }
            });
        });

});
</script>
<head>
<link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/FlexSlider.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/bbs_style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.member_list_rows {
        display: inline-block;
        margin: 10px; /* 요소 간 간격을 조절할 수 있습니다. */
        vertical-align: top; /* 요소의 상단 정렬을 조절할 수 있습니다. */
    }
    
    .formatted-values {
        display: flex;
        justify-content: space-between;
    }
 
 	/* 이미지 컨테이너의 스타일 */
	.image-container {
	    width: 350px; /* 원하는 너비 설정 */
	    height: auto; /* 세로 비율을 자동으로 조절하여 가로-세로 비율 유지 */
	    min-height: 200px;
	    max-height: 200px; /* 이미지의 최대 높이 설정 (선택 사항) */
	    overflow: hidden; /* 내용을 넘어가는 부분 숨김 */
	}
	
	/* 이미지의 스타일 */
	.image-container img {
	    max-width: 100%; /* 이미지를 컨테이너의 최대 너비에 맞게 조절 */
	    max-height: 100%; /* 이미지를 컨테이너의 최대 높이에 맞게 조절 */
	    width: auto; /* 가로 비율 유지 */
	    height: auto; /* 세로 비율 유지 */
	}
	
	.list_hover:hover {
	border : 1px solid #b2b2b2 !important;
}

.write_hover:hover {
	background: #0057b3 !important;
}
</style>
<meta charset="UTF-8">
<title>ReViewQuest</title>
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
<input type="hidden" name="action" value="search">
<input type="hidden" name="group" value="1">
	<div class="default_main_title_bg">
		<div class="default_main_title_big noto500">
			<span style="color:#0067ff">기부</span> 검색
		</div>
		<form action="${contextPath }/donation/">
		<div style="font-size:17px; letter-spacing:-0.5px; color:#333; text-align:center; margin-top:10px;">
			<div style="width:750px; margin:0 auto" class="h_form">
				<span class="member_select">
					<select name="searchType" id="search_type" style="width:100; ">
						<option value="n" <c:out value="${donationPage.searchType == null ? 'selected' : '' }"/>>::::: 선택 :::::</option>
						<option value="t" <c:out value="${donationPage.searchType eq 't' ? 'selected' : '' }"/>>>제목</option>
						<option value="c" <c:out value="${donationPage.searchType eq 'c' ? 'selected' : '' }"/>>>내용</option>
						<option value="w" <c:out value="${donationPage.searchType eq 'w' ? 'selected' : '' }"/>>>기업명</option>
						<option value="tc" <c:out value="${donationPage.searchType eq 'tc' ? 'selected' : '' }"/>>>제목+내용</option>
						<option value="cw" <c:out value="${donationPage.searchType eq 'cw' ? 'selected' : '' }"/>>>내용+기업명</option>
						<option value="tcw" <c:out value="${donationPage.searchType eq 'tcw' ? 'selected' : '' }"/>>>제목+내용+기업명</option>
					</select>
				</span>
				<input type="text" name="keyword" value="${donationPage.keyword }" id="keywordInput" style="width:450px;" placeholder="제목/내용/기업명으로 검색가능합니다.">
				<button id="searchBtn" class="d-flex align-items-center write_hover" style="background: #0067ff; padding: 10px 18px; color: #ffffff; border-radius: 4px; font-size: 15px;">
				    <span>검색</span>
				    <i class="fas fa-search" style="margin-left: 5px;"></i>
				</button>
				
				</div>
			</div>
		</form>
	</div>
	<c:if test='${donationList.isEmpty()}'>
		<h3 style="text-align: center;">작성된 게시글이 없습니다.</h3>
	</c:if>
<div class="container_auto" id="container">
    <div class="member_list_area">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tbody>
                <c:forEach var="donationList" items="${donationList}" varStatus="loop">
                    <c:if test="${loop.index % 4 == 0}">
                        <tr> <!-- 매 4번째 요소마다 새로운 행 시작 -->
                    </c:if>

                    <td valign="top" align="center">
                        <div class="member_list_rows rows_hover_effect item" style="width:350px; height: 400px;">
                            <!-- 여기에 이미지와 내용 추가 -->
                            <a href="${contextPath}/donation/read?num=${donationList.num}">
							    <div class="image-container">
							        <img alt="" src="${contextPath}/resources/images/doUpload/${donationList.filePath}">
							    </div>
							    <div class="note500 font_20">${donationList.title}</div>
							</a>
							<div style="color: #999">${donationList.office}</div>
							<!-- 프로그래스 바 추가 -->
                            <div style="background-color: #ccc; height: 10px;">
                                <div style="background-color: #4caf50; width: ${(donationList.amount / donationList.targetAmount) * 100}%; height: 100%; float: left;"></div>
                            </div>
							 <!-- 현재 금액 형식화하여 표시 -->
							<div class="formatted-values">
								<span><fmt:formatNumber value="${donationList.amount}" pattern="###,###,###원" /></span>
								<span style="color: #4caf50"><b><fmt:formatNumber value="${(donationList.amount / donationList.targetAmount)}" pattern="###,###,###.##%" /></b></span>
							</div>

							<div><fmt:formatDate value="${donationList.date}" pattern="yyyy-MM-dd" /></div>
                        </div>
                    </td>

                    <c:if test="${loop.index % 4 == 3 || loop.last}">
                         <!-- 매 4번째 요소 또는 마지막 요소일 때 행 닫기 -->
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="bbs_page">
    <span>
        <span style="display:inline-block;">
            <div class="page_next">
                <c:choose>
                    <c:when test="${donationPage.page > 1}">
                        <a href="${contextPath}/donation/${donationPage.makeSearch(1)}">&lt;&lt;</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/donation/${donationPage.makeSearch(donationPage.page)}">&lt;&lt;</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="page_next">
                <c:choose>
                    <c:when test="${donationPage.page > 1}">
                        <a href="${contextPath}/donation/${donationPage.makeSearch(donationPage.page - 1)}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/donation/${donationPage.makeSearch(donationPage.page)}">이전</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <c:forEach begin="${donationPage.startPage}" end="${donationPage.endPage}" var="page">
            <div class="page_next">
                <c:choose>
                    <c:when test="${donationPage.page == page}">
                        <div class="page_now">${page}</div>
                    </c:when>
                    <c:otherwise>
                            <a href="${contextPath}/donation/${donationPage.makeSearch(page)}">${page}</a>
                    </c:otherwise>
                </c:choose>
            </div>
            </c:forEach>
            <div class="page_next">
                <c:choose>
                    <c:when test="${donationPage.page < donationPage.endPage}">
                        <a href="${contextPath}/donation/${donationPage.makeSearch(donationPage.page + 1)}" onfocus="this.blur()">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/donation/${donationPage.makeSearch(donationPage.page)}" onfocus="this.blur()">다음</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="page_next">
                <c:choose>
                    <c:when test="${donationPage.page < donationPage.endPage}">
                        <a href="${contextPath}/donation/${donationPage.makeSearch(donationPage.endPage)}" onfocus="this.blur()">&gt;&gt;</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/donation/${donationPage.makeSearch(donationPage.page)}" onfocus="this.blur()">&gt;&gt;</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </span>
    </span>
</div>
<!-- 게시판버튼 -->

        <div class="h_form bbs_bottom_btn" style="margin-right: 100px;">
			<div class="bbs_bottom_btn_right noto400">
			<a href="${contextPath}/donation/" class="list_hover" style="display: inline-flex; align-items: center; padding: 12px 20px; border: 1px solid #e5e5e5; border-radius: 4px;">
			    <i class="fa fa-list" style="font-size: 20px; margin-right: 5px;"></i>
			    <span style="line-height: 1;">목록보기</span>
			</a>
			<c:choose>
	    		<c:when test="${empty userInfo || userInfo.division ne 'admin'}">        	                
	    		</c:when>     
				<c:otherwise>
					<a href="${contextPath}/donation/create" class="write_hover" style="display: inline-flex; align-items: center; padding: 12px 20px; border: 1px solid #e5e5e5; background: #0067ff;color: #ffffff; border-radius: 4px;">
					    <i class="fa fa-pencil" style="font-size: 20px; margin-right: 5px;"></i>
					    <span style="line-height: 1;">글쓰기</span>
					</a>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<div style="clear:both;"></div>
    <br><br><br>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>