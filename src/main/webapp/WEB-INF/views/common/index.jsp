<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<head>
	<script>
	var currentURL = window.location.href;

	if (currentURL === 'http://localhost:8080/reviewquest/') {
	    window.location.href = '${pageContext.request.contextPath}/index';
	} else {
	}
	</script>
	 <script>
        // JavaScript 코드를 추가합니다.
        function showAlert(message) {
            alert(message);
        }

        // 파라미터를 확인하고 경고창을 표시
        if (${param.showAlert} == true) {
            showAlert('감사합니다. 탈퇴 완료되었습니다.');
        }
    </script>
    <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "523b4285-bf6f-443e-9cb6-423a9a72ecf7"
  });
</script>
</head>
<style>
.mainimage{
  border-radius: 20px;
}
.categorysearch {
  padding: 10px 20px 10px 20px;
}

.category {
  margin-right: 20px; /* 아이템 간의 가로 간격 설정 */
}

.category:last-child {
  margin-right: 0; /* 마지막 아이템의 오른쪽 마진 제거 */
}

.category-item select {
  width: 150px; /* 원하는 가로 길이로 설정 */
}

.cate_box {
  display: flex;
  justify-content: flex-start; /* 가운데 정렬 */
  height:100%;
}

.container_auto {
  width:1500px;
  display: flex;
  justify-content: flex-start; /* 가운데 정렬 */
}

.cate_search_area {
  margin: 5% 10px 10px 10px;
  display:block !important;
}

.campaignbox {

  padding: 15%;
  display: grid;
  grid-template-columns: repeat(5, 1fr); /* 가로로 5개씩 배치 */
  grid-gap: 20px; /* 아이템 간의 간격 설정 */
  justify-content: flex-start;
  position: relative; /* 부모 요소를 relative로 설정 */

}

.cate_list_rows {
  padding:15px;
  display:flex;
  justify-content: center;
}

.list{
  display:flex;
  justify-content: center;
  width:100%; /* 가운데 정렬 */
}

/* 검색 버튼 스타일 */
input[type="submit"] {
  width: 200px;
  height: 50px;
  background-color: #5e72e4;
  color: white;
  border: none;
  cursor: pointer;
  font-size: 16px;
  display: flex;
  justify-content: center;
  align-items: center;
  transform: translateY(70%);
  border-radius: 10px;
  font-weight:bold;
}

input[type="submit"]:hover {
  background-color: #fff;
  color: #5e72e4;
  border:1px solid #5e72e4
}

.register {
  width: 100px;
  height: 50px;
  background-color: #5e72e4;
  color: #fff;
  border: none;
  cursor: pointer;
  font-size: 16px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  border-radius: 10px;
  font-weight:bold;
  transform: translateY(50%);
  text-align:right;
  margin-left:40%;
}

register:hover {
    background-color: #fff;
    color: white;
    border: none;
    padding: 10px 20px;
    margin: 0 5px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
    transform: translateY(50%);
  
}

.register a {
    width: 100%;
    height: 100%;
    color: #fff;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
}


.underpage {
    display: flex;
    justify-content: space-between;
    align-items: center;
    
}

.paging {
    flex: 1;
    text-align: center;
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    margin-top:20px;
    
}

.category-item {
    z-index: 1;
}
.paging button {
    background-color: #5e72e4;
    color: white;
    border: none;
    padding: 10px 20px;
    margin: 0 5px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
}

.paging button:hover {
    background-color: #fff;
    color: white;
    border: none;
    padding: 10px 20px;
    margin: 0 5px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
    
}

.category-item button {
    background-color: #5e72e4;
    color: white;
    border: none;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
}

.category-item button:hover {
    background-color: #fff;
    color: white;
    border: none;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
}

.category-item select {
  width: 200px;
  padding : 10px 20px 10px 20px;
  font-size: 12px;
  background-color: #fff;
  border: 1px solid #C4C4C4;
  box-sizing: border-box;
  border-radius: 10px;
  cursor: pointer;
  text-align: left;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}


.category-item select:hover {
  border: 1px solid #9B51E0;
  outline: 3px solid #F8E4FF;
}

select option {
    /* 모든 <option> 요소에 스타일 적용 */
    background-color: white;
    color: #000; 
    border-radius: 10px; 

}

.input-box {
    align-items: center;
    padding: 0.5rem 0.75rem;
    font-size: 0.875rem;
    font-weight: 400;
    line-height: 1.4rem;
    color: #344767;
    text-align: center;
    white-space: nowrap;
    background-color: #fff;
    border: 1px solid #d2d6da;
    border-radius: 0.5rem;
    cursor: pointer;
}

.input-box:focus {
  border: 1px solid #C4C4C4;
  box-sizing: border-box;
  border-radius: 10px;
  cursor: pointer;
  text-align: center;
  /* 말줄임 */
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}

    .bxslider {
        text-align: center;
        margin: 0 auto;
        border-radius: 10px;
        overflow: hidden;
        position: relative; /* 버튼의 위치 지정을 위해 상대 위치 설정 */
    }
    
    /* 슬라이더 내 이미지에 border-radius 적용 */
    .bxslider img {
        max-width: 100%;
        height: auto;
        border-radius: 10px;
    }

    .bx-wrapper {
        width: 1500px;
        margin: 100px auto 0px;
        display: flex;
        justify-content: center;
        position: relative; /* 버튼의 위치 지정을 위해 상대 위치 설정 */
    }

    .bx-prev-img, .bx-next-img {
        width: 50px;
        height: 50px;
        cursor: pointer;
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
    }
    
#slide-list {
    list-style: none;
    padding: 0;
    text-align: center;
    position: relative;
    bottom: 50px; /* 가운데 하단 위치 조절 */
    left: 0;
    right: 0;
    display: flex;
    justify-content: center;
    z-index: 999;
}

#slide-list li {
    width: 20px;
    height: 10px;
    margin: 0 5px;
}

#slide-list li a {
    color: #fff;
    text-decoration: none;
}


#slide-list .box {
    width: 20px;
    height: 10px;
    border-radius: 10px;
    background-color: #fff;
    display: inline-block;
}

#slide-list .current-slide .box {
    background-color: #000; /* 활성화된 인디케이터를 검은색으로 변경 */
}

article.category {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 8rem auto 0;
    width: 150rem;
}

article.category a {
    display: flex;
    justify-content: center;
    align-items: flex-end;
    width: 10rem;
    height: 14rem;
    font-size: 1.7rem;
    font-variation-settings: 'wght' 500;
    color: var(--c-black);
}

.home-category{
	width:100%;
	margin:100px 0;
}

.category-array {
    display: flex;
    justify-content: space-between;
    max-width: 79%;
    margin: 0 auto;
}

.category-array li {
    text-align: center;
    max-width: 88px;
}

.category-array img {
    max-width: 88px;
    max-height: 88px;
    display: block;
    margin: 0 auto;
}

.categoryview a{
	background:#0067ff;
	border:1px solid #fff;
	color:#fff;
}

.categoryview a:hover{
	color:#fff;
	cursor:auto;
}
</style>
<jsp:include page="header.jsp" flush="true"></jsp:include>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>

<!-- 슬라이더 영역 -->
<ul class="bxslider">
    <li><a href="detail.php?number=35&category=865" target="_parent"><img src="http://adblog.cgimall.co.kr/skin/adblog/upload/happy_banner_slide/68fd490d03d7330478f6e5b9d63ca40b" alt=""></a></li>
    <li><a href="detail.php?number=132&category=1004" target="_parent"><img src="http://adblog.cgimall.co.kr/skin/adblog/upload/happy_banner_slide/2bd483e8a4f65ac1cec1c2a7e6234b8d" alt=""></a></li>
    <li><a href="detail.php?number=232&category=859" target="_parent"><img src="http://adblog.cgimall.co.kr/skin/adblog/upload/happy_banner_slide/c882bb3c75241d05fef95f84b009e8ae" alt=""></a></li>
</ul>

<!-- 슬라이더 인디케이터 (점) -->
<ul id="slide-list">
    <li class="slide-link-0"><a href="#"><div class="box"></div></a></li>
    <li class="slide-link-1"><a href="#"><div class="box"></div></a></li>
    <li class="slide-link-2"><a href="#"><div class="box"></div></a></li>
</ul>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>



<script>
$(document).ready(function(){
    var slider = $('.bxslider').bxSlider({
        auto: true,
        pause: 5000,
        mode: 'horizontal',
        controls: false,
        pager: false,
        adaptiveHeight: true,
        startSlide: 0, // 첫 번째 슬라이드를 기본값으로 설정
        onSlideAfter: function($slideElement, oldIndex, newIndex) {
            // 슬라이드가 변경될 때 인디케이터도 변경
            $('#slide-list li .box').css('background-color', '#fff');
            $('#slide-list li:eq(' + newIndex + ') .box').css('background-color', '#000');
        }
    });

    // 슬라이더 인디케이터 (점) 클릭 시
    $('#slide-list li').click(function() {
        var index = $(this).index(); // 클릭한 li 요소의 인덱스
        slider.goToSlide(index); // 클릭한 점에 해당하는 슬라이드로 이동
    });

    // 첫 번째 슬라이드의 인디케이터를 활성화
    $('#slide-list li:eq(0) .box').css('background-color', '#000');
});
</script>


<section>
	<div class="home-category">
		<ul class="category-array">
			<li><a href="${contextPath }/list?mainCategory=방문&subCategory=맛집&region="><img src="${pageContext.request.contextPath}/resources/images/category/category-restaurant.png">맛집</a></li>
			<li><a href="${contextPath }/list?mainCategory=제품&subCategory=뷰티&region="><img src="${pageContext.request.contextPath}/resources/images/category/category-beauty.png">뷰티</a></li>
			<li><a href="${contextPath }/list?mainCategory=방문&subCategory=숙박&region="><img src="${pageContext.request.contextPath}/resources/images/category/category-travel.png">여행</a></li>
			<li><a href="${contextPath }/list?mainCategory=방문&subCategory=문화&region="><img src="${pageContext.request.contextPath}/resources/images/category/category-restaurant.png">문화</a></li>
			<li><a href="${contextPath }/list?mainCategory=제품&subCategory=식품&region="><img src="${pageContext.request.contextPath}/resources/images/category/category-food.png">식품</a></li>
			<li><a href="${contextPath }/list?mainCategory=제품&subCategory=생활&region="><img src="${pageContext.request.contextPath}/resources/images/category/category-life.png">생활</a></li>
			<li><a href="${contextPath }/list?mainCategory=제품&subCategory=디지털&region="><img src="${pageContext.request.contextPath}/resources/images/category/category-digital.png">디지털</a></li>
			<li><a href="${contextPath }/forum/"><img src="${pageContext.request.contextPath}/resources/images/category/category-community.png">커뮤니티</a></li>
																											
		</ul>
	</div>
</section>
    

<div class="list">
  <div class="container_auto">
    <div class="cate_box">
      <div class="f_l main_title_text">
        <a href="html_file.php?file=all_premium.html&amp;file2=default_auto.html">인기 캠페인</a>
      </div>
      <div class="cate_search_area">
        <div class="campaignbox">
          <c:forEach var="best" items="${Bests}">
            <div class="cate_list_rows">
              <table align="center" width="100" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr>
                    <td width="20" align="center" valign="top">
                      <div id="" class="list_graph_rows" style="width: 233px; height=233px; margin: 0px;">
                        <div id="">
                          <div>
                            <div class="flexslider" style="border-radius: 7px; overflow: hidden;">
                              <ul>
                                <li>
								<c:set var="linkPath" value="${pageContext.request.contextPath}/${best.id}" />
								<c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a href="${linkPath}">
								            <img src="${pageContext.request.contextPath}/resources/images/${best.imageFileName}" style="width: 233px; height: 233px !important;" class="mainimage">
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a href="${linkPath}/${userInfo.nickName}">
								            <img src="${pageContext.request.contextPath}/resources/images/${best.imageFileName}" style="width: 233px; height: 233px !important;" class="mainimage">
								        </a>
								    </c:otherwise>
								</c:choose>
                                </li>
                              </ul>
                            </div>
                            <div style="text-align: left; margin: 10px;">
                              <c:forEach items="${best.campaignTypes}" var="campaignType">
                                <img src="${pageContext.request.contextPath}/resources/images/snsIcon/${campaignType}.png" width="20px" alt="Sub Image">
                              </c:forEach>
                              <c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}">
								            ${best.campaignName}
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}/${userInfo.nickName}">
								            ${best.campaignName}
								        </a>
								    </c:otherwise>
								</c:choose>
								<c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}">
								            ${best.campaignPrice}
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}/${userInfo.nickName}">
								            ${best.campaignPrice}
								        </a>
								    </c:otherwise>
								</c:choose>       
                            </div>
                            <div style="">
                              <div class="common_rows_graph01">
                                <div class="common_rows_people" style="text-align: left; margin: 10px;">
                                  <span>신청 ${best.selectedCandidates}</span>/${best.applicants}명
                                </div>
                                <div class="common_rows_percent" id="progress-percent" style="color: #adceff; margin: 10px;">0%</div>
                              </div>
                              <div class="common_rows_graph02 af_clear" style="margin: 10px;">
                                <div id="progress-bar" style="background: #adceff;  width: 0%; height: 4px; float: left; border-radius: 4px;"></div>
                              </div>
                            </div>
                          </div>
                          <script>
                            const applicants = ${best.applicants};
                            const selectedCandidates = ${best.selectedCandidates};
                            const progressBar = document.getElementById('progress-bar');
                            const progressPercent = document.getElementById('progress-percent');

                            if (applicants > 0) {
                              const progress = (applicants / selectedCandidates) * 100;

                              // 소수점 둘째 자리까지 반올림
                              const roundedProgress = Math.round(progress * 100) / 100;

                              progressBar.style.width = roundedProgress + '%';
                              progressPercent.textContent = roundedProgress + '%';
                            }
                          </script>
                          
					        <div class="font_13 ls_1 categoryview" style="text-align: left; margin: 10px;">
					            <a class="rows_cate" style="margin-right: 5px;" href="${pageContext.request.contextPath}/detail/${best.id}">
					                <span id="categoryOutput-${best.id}">${best.mainCategory} ${best.subCategory} </span>
					            </a>
					            <span class="common_rows_dday" style="color: #0067ff;">D-${best.daysUntilEndDate()}</span>
					        </div>
					
					        <script type="text/javascript">
					            // 각 best에 대한 mainCategory 값 확인
					            var mainCategory = "${best.mainCategory}";
					            var categoryOutput = document.getElementById("categoryOutput-${best.id}");
					
								if (mainCategory === "방문") {
					                categoryOutput.innerHTML = "${best.region} ${best.city}";
					            }
					        </script>

                        </div>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container_auto" style="display:flex; justify-content:space-between; margin:75px auto;">
		<div><img src="${pageContext.request.contextPath}/resources/images/banner/banner1.png" width="740" height="220"></div>
		<div><img src="${pageContext.request.contextPath}/resources/images/banner/banner2.png" width="740" height="220"></div>
</div>
	
<div class="list">
  <div class="container_auto">
    <div class="cate_box">
      <div class="f_l main_title_text">
        <a href="html_file.php?file=all_premium.html&amp;file2=default_auto.html">새로운 캠페인</a>
      </div>
      <div class="cate_search_area">
        <div class="campaignbox">
          <c:forEach var="New" items="${News}">
            <div class="cate_list_rows">
              <table align="center" width="100" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr>
                    <td width="20" align="center" valign="top">
                      <div id="" class="list_graph_rows" style="width: 233px; height=233px; margin: 0px;">
                        <div id="">
                          <div>
                            <div class="flexslider" style="border-radius: 7px; overflow: hidden;">
                              <ul>
                                <li>
								<c:set var="linkPath" value="${pageContext.request.contextPath}/${New.id}" />
								<c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a href="${linkPath}">
								            <img src="${pageContext.request.contextPath}/resources/images/${New.imageFileName}" style="width: 233px; height: 233px !important;" class="mainimage">
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a href="${linkPath}/${userInfo.nickName}">
								            <img src="${pageContext.request.contextPath}/resources/images/${New.imageFileName}" style="width: 233px; height: 233px !important;" class="mainimage">
								        </a>
								    </c:otherwise>
								</c:choose>
                                </li>
                              </ul>
                            </div>
                            <div style="text-align: left; margin: 10px;">
                              <c:forEach items="${New.campaignTypes}" var="campaignType">
                                <img src="${pageContext.request.contextPath}/resources/images/snsIcon/${campaignType}.png" width="20px" alt="Sub Image">
                              </c:forEach>
                              <c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}">
								            ${New.campaignName}
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}/${userInfo.nickName}">
								            ${New.campaignName}
								        </a>
								    </c:otherwise>
								</c:choose>
								<c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}">
								            ${New.campaignPrice}
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}/${userInfo.nickName}">
								            ${New.campaignPrice}
								        </a>
								    </c:otherwise>
								</c:choose>       
                            </div>
                            <div style="">
                              <div class="common_rows_graph01">
                                <div class="common_rows_people" style="text-align: left; margin: 10px;">
                                  <span>신청 ${New.selectedCandidates}</span>/${New.applicants}명
                                </div>
                                <div class="common_rows_percent" id="progress-percent" style="color: #adceff; margin: 10px;">0%</div>
                              </div>
                              <div class="common_rows_graph02 af_clear" style="margin: 10px;">
                                <div id="progress-bar" style="background: #adceff;  width: 0%; height: 4px; float: left; border-radius: 4px;"></div>
                              </div>
                            </div>
                          </div>
                          <script>
                            const applicants = ${New.applicants};
                            const selectedCandidates = ${New.selectedCandidates};
                            const progressBar = document.getElementById('progress-bar');
                            const progressPercent = document.getElementById('progress-percent');

                            if (applicants > 0) {
                              const progress = (applicants / selectedCandidates) * 100;

                              // 소수점 둘째 자리까지 반올림
                              const roundedProgress = Math.round(progress * 100) / 100;

                              progressBar.style.width = roundedProgress + '%';
                              progressPercent.textContent = roundedProgress + '%';
                            }
                          </script>
                          <div class="font_13 ls_1 categoryview" style="text-align: left; margin: 10px;">
                            <a class="rows_cate" style="margin-right: 5px;" href="${pageContext.request.contextPath}/detail/${New.id}">
                              ${New.region} ${New.city}
                            </a>
                            <span class="common_rows_dday" style="color: #0067ff;">D-${New.daysUntilEndDate()}</span>
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="list">
  <div class="container_auto">
    <div class="cate_box">
      <div class="f_l main_title_text">
        <a href="html_file.php?file=all_premium.html&amp;file2=default_auto.html">마감임박 캠페인</a>
      </div>
      <div class="cate_search_area">
        <div class="campaignbox">
          <c:forEach var="Dday" items="${Ddays}">
            <div class="cate_list_rows">
              <table align="center" width="100" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr>
                    <td width="20" align="center" valign="top">
                      <div id="" class="list_graph_rows" style="width: 233px; height=233px; margin: 0px;">
                        <div id="">
                          <div>
                            <div class="flexslider" style="border-radius: 7px; overflow: hidden;">
                              <ul>
                                <li>
								<c:set var="linkPath" value="${pageContext.request.contextPath}/${Dday.id}" />
								<c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a href="${linkPath}">
								            <img src="${pageContext.request.contextPath}/resources/images/${Dday.imageFileName}" style="width: 233px; height: 233px !important;" class="mainimage">
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a href="${linkPath}/${userInfo.nickName}">
								            <img src="${pageContext.request.contextPath}/resources/images/${Dday.imageFileName}" style="width: 233px; height: 233px !important;" class="mainimage">
								        </a>
								    </c:otherwise>
								</c:choose>
                                </li>
                              </ul>
                            </div>
                            <div style="text-align: left; margin: 10px;">
                              <c:forEach items="${Dday.campaignTypes}" var="campaignType">
                                <img src="${pageContext.request.contextPath}/resources/images/snsIcon/${campaignType}.png" width="20px" alt="Sub Image">
                              </c:forEach>
                              <c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}">
								            ${Dday.campaignName}
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}/${userInfo.nickName}">
								            ${Dday.campaignName}
								        </a>
								    </c:otherwise>
								</c:choose>
								<c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}">
								            ${Dday.campaignPrice}
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}/${userInfo.nickName}">
								            ${Dday.campaignPrice}
								        </a>
								    </c:otherwise>
								</c:choose>       
                            </div>
                            <div style="">
                              <div class="common_rows_graph01">
                                <div class="common_rows_people" style="text-align: left; margin: 10px;">
                                  <span>신청 ${Dday.selectedCandidates}</span>/${Dday.applicants}명
                                </div>
                                <div class="common_rows_percent" id="progress-percent" style="color: #adceff; margin: 10px;">0%</div>
                              </div>
                              <div class="common_rows_graph02 af_clear" style="margin: 10px;">
                                <div id="progress-bar" style="background: #adceff;  width: 0%; height: 4px; float: left; border-radius: 4px;"></div>
                              </div>
                            </div>
                          </div>
                          <script>
                            const applicants = ${Dday.applicants};
                            const selectedCandidates = ${Dday.selectedCandidates};
                            const progressBar = document.getElementById('progress-bar');
                            const progressPercent = document.getElementById('progress-percent');

                            if (applicants > 0) {
                              const progress = (applicants / selectedCandidates) * 100;

                              // 소수점 둘째 자리까지 반올림
                              const roundedProgress = Math.round(progress * 100) / 100;

                              progressBar.style.width = roundedProgress + '%';
                              progressPercent.textContent = roundedProgress + '%';
                            }
                          </script>
                          <div class="font_13 ls_1 categoryview" style="text-align: center;">
                            <a class="rows_cate" style="margin-right: 5px;" href="${pageContext.request.contextPath}/detail/${Dday.id}">
                              ${Dday.region} ${Dday.city}
                            </a>
                            <span class="common_rows_dday" style="color: #0067ff;">마감임박 D-${Dday.daysUntilEndDate()}</span>
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</div>


<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>
