<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="/assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	var result = "${msg}";
	if(result == "regSuccess"){
		alert("게시글 등록이 완료되었습니다.");
	} else if (result == "delSuccess"){
		alert("게시글 삭제가 완료되었습니다.");
	}
	
	$(document).ready(function () { 
        $("#searchBtn").on("click", function (event) {
        	var searchType = $("select[name='searchType']").val(); // 선택한 옵션 값을 가져옴
            var keyword = encodeURIComponent($("#keywordInput").val());
        	
            self.location = "${contextPath}/forum/listForum${forumPage.makeQuery(1)}"
            + "&searchType=" + searchType + "&keyword=" + keyword;

        });
    });

</script>
<head>
<meta charset="UTF-8">
<link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/FlexSlider.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/bbs_style.css" rel="stylesheet" type="text/css">
<title>ReViewQuest</title>
<style type="text/css">
.list_hover:hover {
	border : 1px solid #b2b2b2 !important;
}

.write_hover:hover {
	background: #0057b3 !important;
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
		<div class="f_l" style="width:1202px; margin:0 0 70px 50px;">
			<div style="width:100%;">
	<!-- 게시판상단 -->
	<div>
		<div class="noto500 ls_1" style="font-size:30px; color:#333; padding-bottom:50px;">자유게시판</div>
	</div>
	<!-- 게시판상단 -->

	<!-- 게시판검색 -->
	<div class="h_form bbs_top_search">
		<div class="bbs_top_search_right" style="display: flex; align-items: center;">
			<select name="searchType">
				<option value="t" <c:out value="${forumPage.searchType eq 't' ? 'selected' : '' }"/>>>제목</option>
				<option value="c" <c:out value="${forumPage.searchType eq 'c' ? 'selected' : '' }"/>>>내용</option>
				<option value="w" <c:out value="${forumPage.searchType eq 'w' ? 'selected' : '' }"/>>>작성자</option>
				<option value="tc" <c:out value="${forumPage.searchType eq 'tc' ? 'selected' : '' }"/>>>제목+내용</option>
				<option value="cw" <c:out value="${forumPage.searchType eq 'cw' ? 'selected' : '' }"/>>>내용+작성자</option>
				<option value="tcw" <c:out value="${forumPage.searchType eq 'tcw' ? 'selected' : '' }"/>>>제목+내용+작성자</option>
			</select>
				<input type="text" name="keyword" id="keywordInput" value="${forumPage.keyword }" placeholder="검색어를 입력해주세요">
				<button id="searchBtn" class="write_hover" style="background: #0067ff; padding: 10px 18px; color: #ffffff; border-radius: 4px; font-size: 15px; display: flex; align-items: center;">
				    <span style="white-space: nowrap;">검색</span>
				    <i class="fas fa-search" style="margin-left: 5px;"></i>
				</button>
				
		</div>
		<div style="clear:both;"></div>
	</div>
	<!-- 게시판검색 -->

	<!-- 게시판리스트 -->
	<div style="border-top:1px solid #4d4d4d;">
		<table cellpadding="0" cellspacing="0" border="0" style="width:100%; border-bottom:1px solid #e7e7e6;" class="bbs_list_title_bar">
			<tr>
				<td style="width:80px;">번호</td>
				<td>제목</td>
				<td style="width:150px;">작성자</td>
				<td style="width:130px;">등록일</td>
			</tr>
		</table>
		<c:forEach var="newsList" items="${newsList}">
		<table cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td valign="top" align="center"><table style="width: 100%; height: 55px; border-bottom: 1px solid rgb(231, 231, 230);" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">
			<tr>
				<td style="width:80px; text-align:center;"><span uk-icon="icon:bell; ratio:1" class="bell_ico uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="bell"><path fill="none" stroke="#000" stroke-width="1.1" d="M17,15.5 L3,15.5 C2.99,14.61 3.79,13.34 4.1,12.51 C4.58,11.3 4.72,10.35 5.19,7.01 C5.54,4.53 5.89,3.2 7.28,2.16 C8.13,1.56 9.37,1.5 9.81,1.5 L9.96,1.5 C9.96,1.5 11.62,1.41 12.67,2.17 C14.08,3.2 14.42,4.54 14.77,7.02 C15.26,10.35 15.4,11.31 15.87,12.52 C16.2,13.34 17.01,14.61 17,15.5 L17,15.5 Z"></path><path fill="none" stroke="#000" d="M12.39,16 C12.39,17.37 11.35,18.43 9.91,18.43 C8.48,18.43 7.42,17.37 7.42,16"></path></svg></span></td>
				<td style="text-align:left;">
		<!-- 제목이 길어도 댓글과 뉴아이콘이 출력되도록 -->
					<table>
						<tr>
							<td>
								<div class="noto400 font_15 bbs_rows_title ellipsis_line1_clamp" style="height:22px;">
									<a href="${contextPath }/news/read?num=${newsList.num}">
									<span class="bbs_cate">[전체] </span>${newsList.title }</a>
								</div>
							</td>
							<td class="noto400 font_15 bbs_rows_reply" style="padding-left:5px;min-width:50px;">
							</td>
						</tr>
					</table>
				</td>
				<td style="width:150px; text-align:center;">
					<div class="bbs_name_cut ellipsis_line_1 noto400 font_15 bbs_rows_by">${newsList.name }</div>
				</td>
				<td style="width:130px; text-align:center;" class="noto400 font_15 bbs_rows_date"><fmt:formatDate	value="${newsList.writeDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</table>

</td></tr></table> 
</c:forEach>

<c:if test='${forumList.isEmpty()}'>
	<tr>
		<td colspan="4"><h3 style="text-align: center;">작성된 게시글이 없습니다.</h3></td>
	</tr>
</c:if>
		
<c:forEach var="forumList" items="${forumList}">
	<td valign="top" align="center">
		<table style="width: 100%; height: 55px; border-bottom: 1px solid rgb(231, 231, 230);" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">
			<tr>
				<td style="width:80px; text-align:center;" class="noto400 font_15 bbs_rows_num">
					<span class="h_form"></span>${forumList.num}
				</td>
				<td style="text-align:left;">
					<table>
						<tr>
							<td class="noto400 font_15 bbs_rows_title ">
								<a href="${contextPath }/forum/read${forumPage.makeSearch(forumPage.page)}&num=${forumList.num}" class="ellipsis_line1_clamp ib" style="height:22px;">${forumList.title } </a>
							</td>
							<td class="noto400 font_15 bbs_rows_reply" style="padding-left:5px; min-width:50px;">[${forumList.replyCnt }]</td>
						</tr>
					</table>
				</td>
				<td style="width:150px; text-align:center;">
					<div class="bbs_name_cut ellipsis_line1 noto400 font_15 bbs_rows_by">${forumList.name}</div>
				</td>
				<td style="width:130px; text-align:center;" class="noto400 font_15 bbs_rows_date"><font class="today_bbs_date"><fmt:formatDate	value="${forumList.writeDate}" pattern="yyyy-MM-dd" /></font>
				</td>
			</tr>
		</table>
	</td>
</c:forEach>
<div class="bbs_page">
    <span>
        <span style="display:inline-block;">
            <div class="page_next">
                <c:choose>
                    <c:when test="${forumPage.page > 1}">
                        <a href="${contextPath}/forum/listForum${forumPage.makeSearch(1)}">&lt;&lt;</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/forum/listForum${forumPage.makeSearch(forumPage.page)}">&lt;&lt;</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="page_next">
                <c:choose>
                    <c:when test="${forumPage.page > 1}">
                        <a href="${contextPath}/forum/listForum${forumPage.makeSearch(forumPage.page - 1)}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/forum/listForum${forumPage.makeSearch(forumPage.page)}">이전</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <c:forEach begin="${forumPage.startPage}" end="${forumPage.endPage}" var="page">
            <div class="page_next">
                <c:choose>
                    <c:when test="${forumPage.page == page}">
                        <div class="page_now">${page}</div>
                    </c:when>
                    <c:otherwise>
                            <a href="${contextPath}/forum/listForum${forumPage.makeSearch(page)}">${page}</a>
                    </c:otherwise>
                </c:choose>
            </div>
            </c:forEach>
            <div class="page_next">
                <c:choose>
                    <c:when test="${forumPage.page < forumPage.endPage}">
                        <a href="${contextPath}/forum/listForum${forumPage.makeSearch(forumPage.page + 1)}" onfocus="this.blur()">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/forum/listForum${forumPage.makeSearch(forumPage.page)}" onfocus="this.blur()">다음</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="page_next">
                <c:choose>
                    <c:when test="${forumPage.page < forumPage.endPage}">
                        <a href="${contextPath}/forum/listForum${forumPage.makeSearch(forumPage.endPage)}" onfocus="this.blur()">&gt;&gt;</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/forum/listForum${forumPage.makeSearch(forumPage.page)}" onfocus="this.blur()">&gt;&gt;</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </span>
    </span>
</div>
</div></div>

<div style="position:relative;">
	<div id="divcopy" style="border:1px solid #e9e9e9; background:#ffffff; width:390px; height:310px; position:absolute; top:-370px; left:0px; border-radius:3px; box-shadow: 0 2px 8px 0 rgba(0,0,0,0.1); display:none; z-index:1; ">
		

		<div style="background:#fafafa; border-bottom:1ps solid #e9e9e9; padding:0px 20px;">
			<table cellpadding="0" cellspacing="0" border="0" style="width:100%;margin:0 !important">
			<tbody><tr style="background:none">
			</tr>
			</tbody></table>
		</div>


	</div>
</div>
</div>
	<!-- 게시판관리팝업레이어 -->

	<!-- 페이지출력 -->

	
<!-- 게시판버튼 -->
<div class="h_form bbs_bottom_btn">
	<div class="bbs_bottom_btn_right noto400">
		<a href="${contextPath}/forum/" class="list_hover" style="display: inline-flex; align-items: center; padding: 12px 20px; border: 1px solid #e5e5e5; border-radius: 4px;">
		    <i class="fa fa-list" style="font-size: 20px; margin-right: 5px;"></i>
		    <span style="line-height: 1;">목록보기</span>
		</a>


		<c:choose>
            <c:when test="${empty userInfo}">                      
            </c:when>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
            <c:otherwise>
                <a href="${contextPath}/forum/form" class="write_hover" style="display: inline-flex; align-items: center; padding: 12px 20px; border: 1px solid #e5e5e5;background: #0067ff;color: #ffffff; border-radius: 4px;">
				    <i class="fa fa-pencil" style="font-size: 20px; margin-right: 5px;"></i>
				    <span style="line-height: 1;">글쓰기</span>
				</a>

            </c:otherwise>
        </c:choose>
		</div>
	<div style="clear:both;"></div>
</div>
<!-- 게시판버튼 -->
	<!-- 페이지출력 -->

	<!-- 게시판하단 -->
	<div></div>
	<!-- 게시판하단 -->
</div>
<br><br><br>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>