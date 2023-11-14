<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(document).ready(function() {
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
        <div class="f_l" style="width: 1202px; margin: 60px 0 70px 50px;">

            <c:choose>
                <c:when test="${empty userInfo}">
                    <div>
                        <div class="noto500 ls_1" style="font-size: 30px; color: #333; padding-bottom: 50px;">로그인
                            후 이용가능합니다.</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="width: 100%;">

                        <!-- 게시판상단 -->
                        <div>
                            <div class="noto500 ls_1" style="font-size: 30px; color: #333; padding-bottom: 50px;">자유게시판</div>
                        </div>
                        <!-- 게시판상단 -->

                        <!-- 제목 -->
                        <div class="noto400" style="font-size: 26px; color: #222222; padding-top: 30px; border-top: 1px solid #4d4d4d;">
                            <span style="color: #505050;">${forumDTO.title }</span>
                        </div>
                        <!-- 제목 -->

                        <!-- 글쓴이 날짜 -->
                        <div class="noto400 font_15 bbs_rows_date" style="padding: 30px 0px; border-bottom: 1px solid #e7e7e6;">
                            <span class="bbs_rows_by">BY <span style='position: relative;'> <a href='#1' onClick="messageShowUser('0')" style='padding-bottom: 6px;'>${forumDTO.name }</a>
                                </span>
                            </span> 
                                <span class="bbs_gubun_line"></span><span class="bbs_rows_date">
                                <fmt:formatDate value="${forumDTO.writeDate}" pattern="yyyy-MM-dd HH:mm" /></span>
                            <div style="clear: both;"></div>
                        </div>
                        <!-- 글쓴이 날짜 -->

                        <!-- 상세카운트정보 sns 글자크기 -->
                        <div style="margin-top: 30px;">
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td>
                                                	<span class="bbs_cw_detail">
													    <i class="fas fa-eye" style="font-size: 0.8em;"></i> 조회수
													    ${forumDTO.hit}
													</span>

                                                    <span class="bbs_cw_detail">
													    <i class="fas fa-comment" style="font-size: 1em;"></i> 댓글수
													    ${forumDTO.replyCnt}
													</span>
												</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" class="h_form"><a href="javascript:happySizeChange('-');" uk-icon="icon:minus; ratio:1" class="h_btn_circle" alt="글자작게" title="글자작게"></a><a href="javascript:happySizeChange('+')" uk-icon="icon:plus; ratio:1" style="margin-left: 10px;" class="h_btn_circle" alt="글자크게" title="글자크게"></a></td>
                                </tr>
                            </table>
                        </div>
                        <!-- 상세카운트정보 sns 글자크기 -->

                        <!-- 본문 -->
                        <div style="background: #ffffff; margin-top: 60px;">
                            <div class="h_form bbs_attach_file"></div>
                            <div style="clear: both;"></div>
                            <div>
                                <script language="JavaScript">
                                    function openNewWindow(window, width, height) {
                                        open(window, "NewWindow", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=" + width + ", height=" + height + ",top=0,left=0");
                                    }
                                </script>
                            </div>
                            <div id="ct">
                                <p>
                                    <br> ${forumDTO.content }
                            </div>
                        </div>
                        <!-- 본문 -->

                        <!-- 댓글 -->
                        <div id='reply_table' style="border-top: 1px solid #4d4d4d; margin-top: 60px;" class="bg_reply_list">
                            <div style="background: #ffffff; border-bottom: 1px solid #e1e1e1;">
                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                    <tr>
                                        <td style="text-align: left; color: #222222; height: 60px;" class="font_20 noto400">댓글 <span style="color: #0067ff;">${forumDTO.replyCnt }</span>
                                            개
                                        </td>

                                    </tr>
                                </table>
                            </div>
                            <c:forEach items="${reply}" var="replyItem">
                                <div id='reply_view_bool' padding:0px 20px 20px 20px;">
                                    <!-- #회원이 작성한글 - sun 댓글위치 로드-->
                                    <div style='margin-top: 20px;'>
                                        <!-- 댓글리스트 댓글수정 댓글삭제 -->
                                        <div class=''>
                                            <table cellpadding='0' cellspacing='0' style='width: 100%;'>
                                                <tr>
	                                                    <td style='width: 60px; vertical-align: top;'>
	                                                    <img src='${contextPath}/resources/images/profilephoto/${replyItem.filePath}' class='bbs_reply_member_img'></td>
                                                    <td style='padding: 0px 120px 0px 20px'>
                                                        <div class='font_16 noto400' style='color: #222222;'>${replyItem.replyName}<span style='color: #afafaf; margin-left: 10px;'>
                                                                <fmt:formatDate value="${replyItem.reDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                                                        </div>
                                                        <div class='bbs_comment_box' style=''>

                                                            <table cellpadding='0' cellspacing='0' style='width: 100%;'>
                                                                <tr>
                                                                    <td class='font_15 noto400' style='color: #666666;'>${replyItem.replyText }</td>
                                                                    <td style='text-align: right; vertical-align: top; width: 40px;'><a href="javascript:show_reply_reply('274');" uk-icon='icon:more-vertical; ratio:1' style='color: #bcbcbc;' alt='답글달기' title='답글달기'></a></td>
                                                                </tr>
                                                            </table>
                                                            <!-- 댓글 수정 버튼 -->
                                                            <c:if test="${userInfo.nickName == replyItem.replyName || userInfo.division == 'admin'}">
															    <div style="text-align: right;">
															        <button type="button" class="repModBtn list_hover" onclick="showReplyEditForm(${replyItem.replyNo})">
															            <i class="fas fa-edit" style="margin-right: 5px;"></i>수정
															        </button>
															        <script type="text/javascript">
															            function showReplyEditForm(replyNo) {
															                var editForm = document.getElementById('reply_mod_' + replyNo);
															                if (editForm.style.display === 'none' || editForm.style.display === '') {
															                    editForm.style.display = 'block';
															                } else {
															                    editForm.style.display = 'none';
															                }
															            }
															        </script>
															        |
															        <button type="button" class="repDelBtn list_hover" onclick="window.location.href='${contextPath}/reply/remove?replyNo=${replyItem.replyNo}&num=${replyItem.num}'">
															            <i class="fas fa-trash" style="margin-right: 5px;"></i>삭제
															        </button>
															    </div>
															</c:if>

                                                            <!-- 댓글 수정 양식 -->
                                                            <div style="margin-top: 10px; display: none;" id="reply_mod_${replyItem.replyNo}">
															    <form name="editForm" action="${contextPath}/reply/modify" method="post">
															        <input type="hidden" name="action" value="mod" />
															        <input type="hidden" name="replyNo" value="${replyItem.replyNo}" />
															        <input type="hidden" name="num" value="${replyItem.num}" />
															        <div style="display: flex; align-items: center;">
															            <textarea style="height: 71px; width: 80%;" name="replyText" id="short_comment_mod_${replyItem.replyNo}"></textarea>
															            <button type="submit" class="h_btn_l icon_l h_btn_st1 list_hover" style="margin-left: 10px;">
															                <i class="fas fa-edit"></i> 댓글수정
															            </button>
															        </div>
															    </form>
															</div>
                                                        </div>
	                                   		 </td>
	                                    </tr>
                                    </table>
                                </div>
                                <!-- 댓글리스트 댓글수정 댓글삭제 -->
                        </div>
                    </div>
                    </c:forEach>
                    <div id='reply_write_bool' class="h_form">
                        <form name='reply_add_form' action="${contextPath}/reply/write" method=post>
                            <div style='padding: 15px;'>
                                <div class='short_comment_size' style='float: left;'>
                                    <textarea name='replyText' id='short_comment_0' class="replyText" style='width: 100%; height: 71px;'></textarea>
                                </div>

                                <div style='float: right; width: 130px;'>
                                    <button type="submit" class="h_btn_l icon_l h_btn_st1 replyAddBtn" style="border-radius: 10px;">댓글쓰기</button>
                                </div>
                                <div style='clear: both;'></div>
                                <div style="margin-top: 10px;">
                                    <div>
                                        <br>
                                    </div>
                                </div>
                                <input type="hidden" name="num" value="${forumDTO.num }">
                                <input type="hidden" name="replyName" value="${userInfo.nickName}" />
                                <input type="hidden" name="filePath" value="${userInfo.profilephoto }"> 
                            </div>
                        </form>
                        <iframe name=xiframe id='xiframe' src='' width='200' height='200' marginwidth='0' marginheight='0' hspace='0' vspace='0' frameborder='0' scrolling='no' style='display: none;'></iframe>
                    </div>
        </div>


        <!-- 게시판버튼 -->
        <div class="h_form bbs_bottom_btn" style="border-top: 1px solid #4d4d4d; padding-top: 20px; margin-top: 20px;">
            <div class="bbs_bottom_btn_right noto400">
                <c:if test="${userInfo.nickName == forumDTO.name}">
				    <button type="button" class="modBtn list_hover" style="border: none; line-height: 1;">
				        <i class="fa fa-pencil" style="font-size: 15px; margin-right: 5px;"></i>
				        <span>수정 </span>
				    </button>
					|
				    <button type="button" class="delBtn list_hover" style="border: none; line-height: 1;">
				        <i class="fa fa-trash" style="font-size: 15px; margin-right: 5px;"></i>
				        <span> 삭제 </span>
				    </button>
				    |
				</c:if>
					<button type="button" class="listBtn list_hover" style="border: none; line-height: 1;">
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
				                    url: "${contextPath}/forum/remove?num=${forumDTO.num}",
				                    success: function(data) {
				                        // 삭제 작업이 성공하면 수행할 동작
				                        alert("삭제되었습니다.");
				                        // 페이지 새로고침 또는 필요한 동작 수행
				                        window.location.href = "${contextPath}/forum/";
				                    },
				                    error: function() {
				                        // 삭제 작업이 실패한 경우 처리 (예: 오류 메시지 표시)
				                        alert("삭제에 실패했습니다.");
				                    }
				                });
				            }
				        });
				        $(".modBtn").on("click", function() {
				            var modifyUrl = "${contextPath}/forum/modify?num=${forumDTO.num}"; // 수정 페이지 URL
				            window.location.href = modifyUrl; // 페이지 이동
				        });

				        $(".listBtn").on("click", function() {
				            var listUrl = "${contextPath}/forum/"; // 목록 페이지 URL
				            window.location.href = listUrl;
				        });
				    });
				</script>
				<div style="display: flex; height: 30px; vertical-align: middle; text-align: center;">

</div>
				
            </div>
            <div style="clear: both;"></div>
        </div>
        </c:otherwise>
        </c:choose>
        <!-- 게시판버튼 -->

        <!-- 전체게시글 -->
        <div style="margin-top: 80px;">
            <div style="color: #222222;" class="font_20 noto400">전체게시글</div>
            <div style="border-top: 1px solid #4d4d4d; margin-top: 20px;">
                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; border-bottom: 1px solid #e7e7e6;" class="bbs_list_title_bar">
                    <tr>
                        <td style="width: 80px;">번호</td>
                        <td>제목</td>
                        <td style="width: 150px;">작성자</td>
                        <td style="width: 130px;">등록일</td>
                    </tr>
                </table>
                <c:forEach var="newsList" items="${newsList}">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                            <td valign="top" align="center">
                                <table style="width: 100%; height: 55px; border-bottom: 1px solid rgb(231, 231, 230);" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">
                                    <tr>
                                        <td style="width: 80px; text-align: center;"><span uk-icon="icon:bell; ratio:1" class="bell_ico uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="bell">
                                                    <path fill="none" stroke="#000" stroke-width="1.1" d="M17,15.5 L3,15.5 C2.99,14.61 3.79,13.34 4.1,12.51 C4.58,11.3 4.72,10.35 5.19,7.01 C5.54,4.53 5.89,3.2 7.28,2.16 C8.13,1.56 9.37,1.5 9.81,1.5 L9.96,1.5 C9.96,1.5 11.62,1.41 12.67,2.17 C14.08,3.2 14.42,4.54 14.77,7.02 C15.26,10.35 15.4,11.31 15.87,12.52 C16.2,13.34 17.01,14.61 17,15.5 L17,15.5 Z"></path>
                                                    <path fill="none" stroke="#000" d="M12.39,16 C12.39,17.37 11.35,18.43 9.91,18.43 C8.48,18.43 7.42,17.37 7.42,16"></path>
                                                </svg></span></td>
                                        <td style="text-align: left;">
                                            <!-- 제목이 길어도 댓글과 뉴아이콘이 출력되도록 -->
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div class="noto400 font_15 bbs_rows_title ellipsis_line1_clamp" style="height: 22px;">
                                                            <a href="${contextPath }/news/read?num=${newsList.num}">
                                                                <span class="bbs_cate">[전체] </span>${newsList.title }</a>
                                                        </div>
                                                    </td>
                                                    <td class="noto400 font_15 bbs_rows_reply" style="padding-left: 5px; min-width: 50px;"></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 150px; text-align: center;">
                                            <div class="bbs_name_cut ellipsis_line_1 noto400 font_15 bbs_rows_by">${newsList.name }</div>
                                        </td>
                                        <td style="width: 130px; text-align: center;" class="noto400 font_15 bbs_rows_date">
                                            <fmt:formatDate value="${newsList.writeDate}" pattern="yyyy-MM-dd" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </c:forEach>
                <c:if test='${forumList.isEmpty()}'>
                    <tr>
                        <td colspan="4">
                            <h3 style="text-align: center;">작성된
                                게시글이 없습니다.</h3>
                        </td>
                    </tr>
                </c:if>

                <c:forEach var="forumList" items="${forumList}">
                    <td valign="top" align="center">
                        <table style="width: 100%; height: 55px; border-bottom: 1px solid rgb(231, 231, 230);" onmouseover="this.style.backgroundColor='#fafafa'" onmouseout="this.style.backgroundColor=''">
                            <tr>
                                <td style="width: 80px; text-align: center;" class="noto400 font_15 bbs_rows_num"><span class="h_form"></span>${forumList.num}
                                </td>
                                <td style="text-align: left;">
                                    <table>
                                        <tr>
                                            <td class="noto400 font_15 bbs_rows_title "><a href="${contextPath }/forum/read${forumPage.makeSearch(forumPage.page)}&num=${forumList.num}" class="ellipsis_line1_clamp ib" style="height: 22px;">${forumList.title }
                                                </a></td>
                                            <td class="noto400 font_15 bbs_rows_reply" style="padding-left: 5px; min-width: 50px;">[${forumList.replyCnt }]</td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 150px; text-align: center;">
                                    <div class="bbs_name_cut ellipsis_line1 noto400 font_15 bbs_rows_by">${forumList.name}</div>
                                </td>
                                <td style="width: 130px; text-align: center;" class="noto400 font_15 bbs_rows_date">
                                    <font class="today_bbs_date">
                                        <fmt:formatDate value="${forumList.writeDate}" pattern="yyyy-MM-dd" />
                                    </font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </c:forEach>
            </div>
            <!-- 페이지출력 -->
            <div class="bbs_page">
                <span> <span style="display: inline-block;">
                        <div class="page_next">
                            <c:choose>
                                <c:when test="${forumPage.page > 1}">
                                    <a href="${contextPath}/forum/read${forumPage.makeSearch(1)}&num=${forumDTO.num}">&lt;&lt;</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${contextPath}/forum/read${forumPage.makeSearch(forumPage.page)}&num=${forumDTO.num}">&lt;&lt;</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="page_next">
                            <c:choose>
                                <c:when test="${forumPage.page > 1}">
                                    <a href="${contextPath}/forum/read${forumPage.makeSearch(forumPage.page - 1)}&num=${forumDTO.num}">이전</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${contextPath}/forum/read${forumPage.makeSearch(forumPage.page)}&num=${forumDTO.num}">이전</a>
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

                                        <a href="${contextPath}/forum/read${forumPage.makeSearch(page)}&num=${forumDTO.num}">${page}</a>

                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                        <div class="page_next">
                            <c:choose>
                                <c:when test="${forumPage.page < forumPage.endPage}">
                                    <a href="${contextPath}/forum/read${forumPage.makeSearch(forumPage.page + 1)}&num=${forumDTO.num}" onfocus="this.blur()">다음</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${contextPath}/forum/read${forumPage.makeSearch(forumPage.page)}&num=${forumDTO.num}" onfocus="this.blur()">다음</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="page_next">
                            <c:choose>
                                <c:when test="${forumPage.page < forumPage.endPage}">
                                    <a href="${contextPath}/forum/read${forumPage.makeSearch(forumPage.endPage)}&num=${forumDTO.num}" onfocus="this.blur()">&gt;&gt;</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${contextPath}/forum/read${forumPage.makeSearch(forumPage.page)}&num=${forumDTO.num}" onfocus="this.blur()">&gt;&gt;</a>
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
    </div>
    </div>

</body>

</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>