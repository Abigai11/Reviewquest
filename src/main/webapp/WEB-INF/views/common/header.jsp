<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html class="wf-notosanskr-n4-active wf-active">
<head>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans+KR" media="all">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/FlexSlider.css" type="text/css" media="screen">
</head>
<style>
/* 모달 스타일 */
.modal1 {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 999;
  overflow: auto;
}

.modal-dialog1 {
  position: relative;
  margin: 10% auto;
  max-width: 600px;
  background-color: #ffffff;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  border-radius: 8px;
}

.modal-content1 {
  padding: 20px;
  border: none;
}

.modal-close1 {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 24px;
  cursor: pointer;
  color: #777777;
}

.modal-close1:hover {
  color: #333333;
}

/* 닫기 버튼 스타일 */
.close-button1 {
  background-color: #333333;
  color: #ffffff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
}

.close-button1:hover {
  background-color: #555555;
}

/* 검색 버튼 스타일 (파란색 계열) */
.search-button1 {
  background-color: #007bff;
  color: #ffffff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
  margin-left:-30px;
}

.search-button1:hover {
  background-color: #0056b3;
}

/* 텍스트와 인풋박스를 가로로 배치하는 스타일 */
.flex-container1 {
  display: flex;
  justify-content: space-around; /* 수평 정렬 */
  /* align-items: center; */
  flex-direction: row; /* 가로 배치 */
}

/* 텍스트 스타일 */
.label-text1 {
  flex: 1;
  margin-right: 10px;
}

.searchtext1{
  font-size: 20px; /* 텍스트 크기 설정 */
  display: flex;
  align-items: center; /* 수직 가운데 정렬 */
}
/* 인풋박스 스타일 */
.input-box1 {
  flex: 5; /* 인풋박스 크기 조절 */
  margin-right: 10px;
}

#modalSearchKeyword1{
	width:350px;
	border:1px solid #000;
	border-radius:5px;
}

.div_category2 {
	position: absolute;
	top: 52px;
	left: -56px;
	z-index: 9999;
	width: 1610px;
	border: 1px solid #f4f4f4;
	border-radius: 16px;
	box-shadow: 0 0 5px rgba(155, 155, 155, .2);
	display: none
}

.div_category2 .all_menu_content:before {
	border-top: 0 solid transparent;
	border-left: 8px solid transparent;
	border-right: 8px solid transparent;
	border-bottom: 8px solid #f4f4f4;
	content: "";
	position: absolute;
	top: -9px;
	right: 55px
}

.div_category2 .all_menu_content:after {
	border-top: 0 solid transparent;
	border-left: 8px solid transparent;
	border-right: 8px solid transparent;
	border-bottom: 8px solid #fff;
	content: "";
	position: absolute;
	top: -7px;
	right: 55px
}

.all_menu_content .menu_box2 {
	padding: 25px 0;
	width: 100%
}

.all_menu_content .menu_2st2 a {
	font-size: 17px;
	color: #838383;
	display: block;
	margin: 14px 25px 0 0;
	letter-spacing: -1px
}

.all_menu_content .menu_2st2 a:hover {
	color: #333
}
.header_scroll .f_l .main_menu:nth-of-type(1){margin-right:30px !important;}

.write_hover:hover {
	background: #0057b3 !important;
}
</style>

<body>
<c:set var="userInfo" value="${sessionScope.userInfo}" />


<div id="header">
    <div class="af_clear header_top">
        <div class="f_l">
            <a href="${contextPath}/index"><img src="${contextPath}/resources/images/logo/logo.png" width="220px" alt="" title="리뷰퀘스트 체험단"></a>
        </div>
        <div class="f_r noto400">
             <c:choose>
                <c:when test="${empty userInfo}">
                    <a href="${contextPath}/login_admin">관리자로그인</a>
                    <a href="${contextPath}/login">로그인</a>
                    <a href="${contextPath}/join">회원가입</a>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${userInfo.division == 'admin'}">
                            <a href="${contextPath}/admin/index">관리자페이지</a>
                        </c:when>
                        <c:when test="${userInfo.division == 'company'}">
                            <a href="${contextPath}/mypage_update_company">마이페이지</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${contextPath}/mypage/${userInfo.division}/${userInfo.nickName}">마이페이지</a>
                        </c:otherwise>
                    </c:choose>
                    <a href="${contextPath}/member/logout?id=${userInfo.id}&division=logout">로그아웃</a>
                </c:otherwise>
            </c:choose>
            <a class="blogger_search_text write_hover" href="${contextPath}/donation/" style="background:#0067ff;">기부하기</a>
        </div>
    </div>
    <div>
        <div class="af_clear header_scroll">
            <div class="header_scroll_inner" style="position:relative;">
                <div class="f_l" style="padding:16px 0;">
                	<a href="${pageContext.request.contextPath}/list?mainCategory=&subCategory=&region=&city=&page=1" target="" class="main_menu noto700 ls_1">전체</a>
                    <a href="${pageContext.request.contextPath}/list?mainCategory=방문&subCategory=&region=" target="" class="main_menu noto700 ls_1">방문</a>
                    <a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=&region=" target="" class="main_menu noto700 ls_1">제품</a>
                    <a href="${contextPath}/forum/" target="" class="main_menu noto700 ls_1">커뮤니티</a>
                </div>
                <div class="f_r" style="padding:16px 0;">
                    <span id="btn_search_img"><img src="${contextPath}/resources/images/btn_top_search.jpg" title="통합검색" alt="통합검색"></span>
                    <span id="btn_category_img" onclick="toggleSubMenuModal()"><img src="${contextPath}/resources/images/btn_top_menu.jpg" title="전체메뉴보기" alt="전체메뉴보기"></span>
                </div>

				<!-- 모달 HTML -->
				<div id="myModal1" class="modal1">
				  <div class="modal-dialog1">
				    <div class="modal-content1">
				      <!-- 모달 내용 시작 -->
				      <button class="modal-close1" onclick="closeModal()">&times;</button>
				      <form name="modalSearchForm1" action="${pageContext.request.contextPath}/list" method="GET">
				        <input type="hidden" name="searchBy" value="keyword">
				        
				        <div class="form-group flex-container1">
				          <label class="searchtext1" for="modalSearchKeyword">검색어</label>
				          <input type="text" name="searchKeyword" id="modalSearchKeyword1" class="form-control flex-grow-1">
				          <button type="submit" class="btn search-button1">검색하기</button>
				        </div>
				
				      </form>
				      <!-- 모달 내용 끝 -->
				    </div>
				  </div>
				</div>

                <div id="div_category2" class="div_category2" style="background:url('http://adblog.cgimall.co.kr/skin/adblog/img/all_menu_bg.png') 64% top / contain no-repeat rgba(255, 255, 255, 0.98);">
                    <div id="table_category" class="div_cate_inner">
                        <div class="all_menu_content" style="padding:40px 31px 22px 84px;">
                            <div class="all_menu_left_area">
                                <div class="menu_box2">
                                    <a href="category.php?category=829" target="" class="menu_1st noto500">방문</a>
                                    <div class="menu_2st2 noto400">
                                    	<a href="${pageContext.request.contextPath}/list?mainCategory=방문&subCategory=&region=" target="">전체</a>
                                        <a href="${pageContext.request.contextPath}/list?mainCategory=방문&subCategory=맛집&region=" target="">맛집</a>
                                        <a href="${pageContext.request.contextPath}/list?mainCategory=방문&subCategory=숙박&region=" target="" style="color:#fe555c;">숙박</a>
                                        <a href="${pageContext.request.contextPath}/list?mainCategory=방문&subCategory=문화&region=" target="" style="color:#3450e9;">문화</a>
                                    </div>
                                </div>
                                <div class="menu_box2">
                                    <a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=&region=" target="" class="menu_1st noto500">제품</a>
                                    <div class="menu_2st2 noto400"><a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=&region=" target="">전체</a>

                                        <a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=생활&region=" target="">생활</a>

                                        <a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=유아동&region=" target="">유아동</a>

                                        <a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=뷰티&region=" target="">뷰티</a>

                                        <a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=디지털&region=" target="">디지털</a>

                                        <a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=패션&region=" target="">패션</a>

                                        <a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=도서&region=" target="">도서</a>

                                        <a href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=식품&region=" target="">식품</a>

                                    </div>
                                </div>

                                <div class="menu_box2">
                                    <a href="${contextPath}/forum/" target="" class="menu_1st noto500">커뮤니티</a>
                                    <div class="menu_2st2 noto400"><a href="${contextPath}/forum/" target="">자유게시판</a>
                                    <div class="menu_2st2 noto400"><a href="${contextPath}/news/" target="">공지사항</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
function toggleSubMenuModal() {
    var modal = document.getElementById('div_category2');
    modal.style.display = modal.style.display === 'block' ? 'none' : 'block';
}

function openModal() {
  var modal = document.getElementById("myModal1");
  modal.style.display = "block";
}

function closeModal() {
  var modal = document.getElementById("myModal1");
  modal.style.display = "none";
}

// 검색 버튼 클릭 시 모달 열기
document.getElementById("btn_search_img").addEventListener("click", openModal);
</script>

</body>
</html>
