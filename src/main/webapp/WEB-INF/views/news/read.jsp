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
$(document).ready(function () {
    var result = "${msg}";
    if (result == "modSuccess") {
        alert("게시글 수정이 완료되었습니다.");
    } else if (result == "repSuccess") {
        alert("댓글 등록이 완료되었습니다.");
    } else if (result == "repModSuccess") {
        alert("댓글 수정이 완료되었습니다.");
    } else if (result == "repDelSuccess") {
        alert("댓글 삭제가 완료되었습니다.");
    }

});
</script>
<head>
<link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/FlexSlider.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/bbs_style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>ReViewQuest</title>
<style type="text/css">
	.list_hover:hover {
	color: #0067ff;
}
</style>
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
	
	<div class="container af_clear">
		<jsp:include page="/WEB-INF/views/common/aside.jsp" flush="true"></jsp:include>
		<div class="f_l" style="width:1202px; margin:60px 0 70px 50px;">
            
    
<div style="width:100%;">

	<!-- 게시판상단 -->
	<div><div class="noto500 ls_1" style="font-size:30px; color:#333; padding-bottom:50px;">공지사항</div></div>
	<!-- 게시판상단 -->

	<!-- 제목 -->
	<div class="noto400" style="font-size:26px; color:#222222; padding-top:30px; border-top:1px solid #4d4d4d;">
		<span style="color:#505050;">${newsDTO.title }</span>
	</div>
	<!-- 제목 -->

	<!-- 글쓴이 날짜 -->
	<div class="noto400 font_15 bbs_rows_date" style="padding:30px 0px; border-bottom:1px solid #e7e7e6;">
		<span class="bbs_rows_by">BY 
	<span style='position:relative;'>
		<a href='#1' onClick="messageShowUser('0')" style='padding-bottom:6px;'>${newsDTO.name }</a>
	</span>
	</span>
	</div>
	<!-- 상세카운트정보 sns 글자크기 -->

	<!-- 본문 -->
	<div style="background:#ffffff; margin-top:60px;">
		<div class="h_form bbs_attach_file"></div>
		<div style="clear:both;"></div>
		<div >
		<script language="JavaScript">
			function openNewWindow(window,width,height) {
			open (window,"NewWindow","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width="+ width +", height="+height+",top=0,left=0");
			}
		</script></div>
		<div id="ct"><p><br>
		${newsDTO.content }

</div>
	</div>
	<!-- 본문 -->
	<!-- 게시판버튼 -->
	
	<div class="h_form bbs_bottom_btn" style="border-top:1px solid #4d4d4d; padding-top:20px; margin-top:20px;">
		<div class="bbs_bottom_btn_right noto400">
		<c:if test="${userInfo.nickName == newsDTO.name}">
		    <button type="button" class="modBtn list_hover" style="border: 1px solid #e5e5e5; line-height: 1; border: none;">
		        <i class="fa fa-pencil" style="font-size: 15px; margin-right: 5px;"></i>
		        <span>수정 </span>
		    </button>
			|
		    <button type="button" class="delBtn list_hover" style="border: 1px solid #e5e5e5; line-height: 1; border: none;">
		        <i class="fa fa-trash" style="font-size: 15px; margin-right: 5px;"></i>
		        <span> 삭제 </span>
		    </button>
		    |
		</c:if>
			<button type="button" class="listBtn list_hover" style="border: 1px solid #e5e5e5; line-height: 1; border: none;">
		        <i class="fa fa-list" style="font-size: 15px; margin-right: 5px;"></i>
		        <span> 목록</span>
		    </button>
		
		<script type="text/javascript">
		    $(document).ready(function() {
		        // 삭제 버튼 클릭 시 실행할 함수
		        $(".delBtn").on("click", function() {
		            // 삭제 확인 다이얼로그 표시 (선택사항)
		            if (confirm("삭제하시겠습니까?")) {
		                // jQuery Ajax 요청을 사용하여 삭제 작업을 서버에 전송
		                $.ajax({
		                    type: "POST",
		                    url: "${contextPath}/news/remove?num=${newsDTO.num}",
		                    success: function(data) {
		                        // 삭제 작업이 성공하면 수행할 동작
		                        alert("삭제되었습니다.");
		                        // 페이지 새로고침 또는 필요한 동작 수행
		                        window.location.href = "${contextPath}/news/";
		                    },
		                    error: function() {
		                        // 삭제 작업이 실패한 경우 처리 (예: 오류 메시지 표시)
		                        alert("삭제에 실패했습니다.");
		                    }
		                });
		            }
		        });
		        $(".modBtn").on("click", function() {
		            var modifyUrl = "${contextPath}/news/modify?num=${newsDTO.num}"; // 수정 페이지 URL
		            window.location.href = modifyUrl; // 페이지 이동
		        });

		        $(".listBtn").on("click", function() {
		            var listUrl = "${contextPath}/news/"; // 목록 페이지 URL
		            window.location.href = listUrl;
		        });
		    });
		</script>
	</div>
		<div style="clear:both;"></div>
	</div>	
		    
	
	<!-- 게시판버튼 -->

	<!-- 전체게시글 -->
	<div style="margin-top:80px;" >
		<div style="color:#222222;" class="font_20 noto400">전체게시글</div>
		<div style="border-top:1px solid #4d4d4d; margin-top:20px;">
			<table cellpadding="0" cellspacing="0" border="0" style="width:100%; border-bottom:1px solid #e7e7e6;" class="bbs_list_title_bar">
			<tr>
				<td style="width:80px;">번호</td>
				<td >제목</td>
				<td style="width:150px;">작성자</td>
				<td style="width:130px;">등록일</td>
			</tr>
			</table>
			<table cellspacing='0' cellpadding='0' border='0' width=100% border=0><td valign=top align=center>

</td></tr></table> 
<c:if test='${newsList.isEmpty()}'>
	<tr>
		<td colspan="4"><h3 style="text-align: center;">작성된 게시글이 없습니다.</h3></td>
	</tr>
</c:if>
		
<c:forEach var="newsList" items="${newsList}">
	<td valign="top" align="center">
		<table style="width: 100%; height: 55px; border-bottom: 1px solid rgb(231, 231, 230);" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">
			<tr>
				<td style="width:80px; text-align:center;" class="noto400 font_15 bbs_rows_num">
					<span class="h_form"></span>${newsList.num}
				</td>
				<td style="text-align:left;">
					<table>
						<tr>
							<td class="noto400 font_15 bbs_rows_title ">
								<a href="${contextPath }/news/read${newsPage.makeSearch(newsPage.page)}&num=${newsList.num}" class="ellipsis_line1_clamp ib" style="height:22px;">${newsList.title } </a>
							</td>
						</tr>
					</table>
				</td>
				<td style="width:150px; text-align:center;">
					<div class="bbs_name_cut ellipsis_line1 noto400 font_15 bbs_rows_by">${newsList.name}</div>
				</td>
				<td style="width:130px; text-align:center;" class="noto400 font_15 bbs_rows_date"><font class="today_bbs_date"><fmt:formatDate	value="${newsList.writeDate}" pattern="yyyy-MM-dd" /></font>
				</td>
			</tr>
		</table>
	</td>
</c:forEach>
		</div>
		<!-- 페이지출력 -->
			<div class="bbs_page">
    <span>
        <span style="display:inline-block;">
            <div class="page_next">
                <c:choose>
                    <c:when test="${newsPage.page > 1}">
                        <a href="${contextPath}/news/read${newsPage.makeSearch(1)}&num=${newsDTO.num}">&lt;&lt;</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/news/read${newsPage.makeSearch(newsPage.page)}&num=${newsDTO.num}">&lt;&lt;</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="page_next">
                <c:choose>
                    <c:when test="${newsPage.page > 1}">
                        <a href="${contextPath}/news/read${newsPage.makeSearch(newsPage.page - 1)}&num=${newsDTO.num}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/news/read${newsPage.makeSearch(newsPage.page)}&num=${newsDTO.num}">이전</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <c:forEach begin="${newsPage.startPage}" end="${newsPage.endPage}" var="page">
            <div class="page_next">
                <c:choose>
                    <c:when test="${newsPage.page == page}">
                        <div class="page_now">${page}</div>
                    </c:when>
                    <c:otherwise>

                            <a href="${contextPath}/news/read${newsPage.makeSearch(page)}&num=${newsDTO.num}">${page}</a>
 
                    </c:otherwise>
                </c:choose>
            </div>
            </c:forEach>
            <div class="page_next">
                <c:choose>
                    <c:when test="${newsPage.page < newsPage.endPage}">
                        <a href="${contextPath}/news/read${newsPage.makeSearch(newsPage.page + 1)}&num=${newsDTO.num}" onfocus="this.blur()">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/news/read${newsPage.makeSearch(newsPage.page)}&num=${newsDTO.num}" onfocus="this.blur()">다음</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="page_next">
                <c:choose>
                    <c:when test="${newsPage.page < newsPage.endPage}">
                        <a href="${contextPath}/news/read${newsPage.makeSearch(newsPage.endPage)}&num=${newsDTO.num}" onfocus="this.blur()">&gt;&gt;</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/news/read${newsPage.makeSearch(newsPage.page)}&num=${newsDTO.num}" onfocus="this.blur()">&gt;&gt;</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </span>
    </span>
</div>
		<!-- 페이지출력 -->
	</div>
	<!-- 전체게시글 -->

	<!-- 게시판하단 -->
	<div></div>
	<!-- 게시판하단 -->
</div></div></div>

</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>