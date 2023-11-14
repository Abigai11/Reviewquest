<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="userInfo" value="${sessionScope.userInfo}" /> 
<!--
=========================================================
* Argon Dashboard 2 - v2.0.4
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../resources/assets/img/favicon.png">
  <title>
    Argon Dashboard 2 by Creative Tim
  </title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../resources/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../resources/assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
<style>
.bg-gradient-waiting {
    background-image: linear-gradient(310deg, #FF5733 0%, #FFC300 100%); /* 대기 중 배경색 */
}

.bg-gradient-in-progress {
    background-image: linear-gradient(310deg, #2dce89 0%, #2dcecc 100%); /* 진행 중 배경색 */
}

.bg-gradient-complete {
    background-image: linear-gradient(310deg, #007BFF 0%, #00BFFF 100%); /* 선정 완료 배경색 */
}

.bg-gradient-registration {
    background-image: linear-gradient(310deg, #FF6347 0%, #FFA07A 100%); /* 등록 중 배경색 */
}

.bg-gradient-ended {
    background-image: linear-gradient(310deg, #808080 0%, #A9A9A9 100%); /* 종료 배경색 */
}

.categorysearch {
  display: flex;
  padding : 10px 20px 10px 20px;
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

.category-item p{
  text-align:center;
}

/* 검색 버튼 스타일 */
input[type="submit"] {
  width: 100px;
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

.register a:hover {
  background-color: #fff;
  color: #5e72e4;
  border:1px solid #5e72e4;
  border-radius: 10px;
}

.underpage {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.paging {
    flex: 1;
    text-align: center;
    transform: translateX(10%);
}

.category-item {
    z-index: 1;
}
.paging button {
    background-color: #5e72e4;
    color: white;
  	border:1px solid #5e72e4;
    padding: 10px 20px;
    margin: 0 5px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
}

.paging button:hover {
  background-color: #fff;
  color: #5e72e4;
  border:1px solid #5e72e4;
    padding: 10px 20px;
    margin: 0 5px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
}

.category-item button {
   background-color: #5e72e4;
   color: white;
   border:1px solid #5e72e4;
   padding: 10px 20px;
   text-decoration: none;
   border-radius: 10px;
   font-weight:bold;
}

.category-item button:hover {
  background-color: #fff;
  color: #5e72e4;
  border:1px solid #5e72e4;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
}

.category-item select {
  width: 150px;
  padding : 10px 20px 10px 20px;
  font-size: 12px;
  background-color: #fff;
  border: 1px solid #C4C4C4;
  box-sizing: border-box;
  border-radius: 10px;
  cursor: pointer;
  text-align: left;
  /* 말줄임 */
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
	left:0;
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

.lower {
  display:flex;
}


.paging_active {
    background-color: #fff !important;
    color: #5e72e4 !important;
    border: 1px solid #5e72e4 !important;
    padding: 10px 20px !important;
    margin: 0 5px !important;
    text-decoration: none !important;
    border-radius: 10px !important;
    font-weight:bold !important;
    cursor:pointer !important;
    
}

</style>
</head>

<style>
.mx-3{
	margin-top:150px !important;
}
</style>
<body class="g-sidenav-show   bg-gray-100">
<c:choose>  
    <c:when test="${userInfo.division == 'admin'}">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
  <aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main" data-color="primary">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="${pageContext.request.contextPath}/admin/index " target="_blank">
        <img src="../resources/assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
       <span class="ms-1 font-weight-bold">관리자 페이지</span>
      </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/admin/index">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">대시보드</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/admin/list?mainCategory=&region=&page=1">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">캠페인 관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="${pageContext.request.contextPath}/donation/adminList">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">기부 관리</span>
          </a>
        </li>
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">회원관리</h6>
        </li>
        <li class="nav-item">
         <a class="nav-link " href="${pageContext.request.contextPath}/member/allmember_admin?division=${userInfo.division}">

            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">회원조회</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="${pageContext.request.contextPath}/index">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-world-2 text-danger text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">홈페이지</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="sidenav-footer mx-3 ">
      <a class="btn btn-primary btn-sm mb-0 w-100" id="logout" href="${pageContext.request.contextPath}/member/logout?id=${userInfo.id}&division=logout" type="button">로그아웃</a>
    </div>
    
	<script>
    document.getElementById("logout").onclick = function(event) {
        var result = confirm("로그아웃 하시겠습니까?");
        if (result) {
            alert("로그아웃 되었습니다.");
        } else {
            event.preventDefault();
        }
    };
    </script>	
  </aside>
  <main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur" data-scroll="false">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="javascript:;">페이지</a></li>
            <li class="breadcrumb-item text-sm text-white active" aria-current="page">대시보드</li>
          </ol>
          <h6 class="font-weight-bolder text-white mb-0">대시보드</h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-flex align-items-center">
              <a href="" class="nav-link text-white font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">${userInfo.name} 관리자님 환영합니다!!</span>
              </a>
            </li>
            <li class="nav-item px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0">
                <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
              </a>
            </li>
			    <li class="nav-item dropdown pe-2 d-flex align-items-center">
			        <a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
			            <i class="fa fa-bell cursor-pointer"></i>
			        </a>
			        <ul class="dropdown-menu dropdown-menu-end px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
			            <li class="mb-2">
			                <a class="dropdown-item border-radius-md" href="javascript:;">
			                    <c:forEach var="campaign" items="${campaigns}">
			                    <div class="d-flex py-1">
			                        <div class="my-auto">
			                            <img src="../resources/assets/img/team-2.jpg" class="avatar avatar-sm me-3">
			                        </div>
			                        
			                        <div class="d-flex flex-column justify-content-center">
			                            <h6 class="text-sm font-weight-normal mb-1">
			                                <span class="font-weight-bold">${campaign.applications.nickName}</span> 님이 ${campaign.campaignName} 캠페인을 신청하셨습니다.
			                            </h6>
			                            <p class="text-xs text-secondary mb-0">
			                                <i class="fa fa-clock me-1"></i>
			                                ${campaign.applications.registrationDate}
			                            </p>
			                        </div>
			                    </div>
			                     </c:forEach>
			                </a>
			            </li>
			            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
			                <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
			                    <div class="sidenav-toggler-inner">
			                        <i class="sidenav-toggler-line bg-white"></i>
			                        <i class="sidenav-toggler-line bg-white"></i>
			                        <i class="sidenav-toggler-line bg-white"></i>
			                    </div>
			                </a>
			            </li>
			        </ul>
			    </li>
			</ul>
        </div>
      </div>
    </nav>

    <!-- End Navbar -->
    
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>캠페인</h6>
            </div>
            <!-- 카테고리 선택 폼 -->
		    <form method="get" action="${pageContext.request.contextPath}/admin/list">
			  <div class="categorysearch">
			  <div class="category">
			    <div class="category-item">
			      <p>1차 카테고리</p>
			      <!-- 첫 번째 카테고리 선택 -->
			      <select id="mainCategory" name="mainCategory">
			        <option value="">전체</option>
			        <option value="방문">방문</option>
			        <option value="제품">제품</option>
			      </select>
			    </div>
			  </div>
			  <div class="category">
			    <div class="category-item">
			      <p>2차 카테고리</p>
			      <!-- 두 번째 카테고리 선택 -->
			      <select id="subCategory" name="subCategory">
			        <option value="">전체</option>
			      </select>
			    </div>
			  </div>
					
              <div class="category">
             	<div class="category-item">
			      <p>지역</p>	
				<select id="region" name="region">
					<option value="">전체</option>
					<option value="서울">서울</option>
					<option value="경기도">경기도</option>
					<option value="인천">인천</option>
					<option value="부산">부산</option>
					<option value="대구">대구</option>
					<option value="광주">광주</option>
					<option value="대전">대전</option>
					<option value="울산">울산</option>
					<option value="강원도">강원도</option>
					<option value="경상남도">경상남도</option>
					<option value="경상북도">경상북도</option>
					<option value="전라남도">전라남도</option>
					<option value="전라북도">전라북도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
					<option value="제주도">제주도</option>
					<option value="세종시">세종시</option>
				</select>
			    </div>
			  </div>
			  
			  
             	<div class="category">
             	  <div class="category-item">
			      <p>구</p>
				<select id="city" name="city">
					<option value="">전체</option>
				</select>
			    </div>
			  </div>

        <input type="submit" value="검색">

	</form>

			<div class="register">
				<a href="<c:url value='/admin/add'/>">등록</a>
			</div>

		 
    	  </div>
    	  
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-m font-weight-bolder opacity-7">캠페인명</th>
                      <th class="text-uppercase text-secondary text-m font-weight-bolder opacity-7 ps-2">상세 카테고리</th>
                      <th class="text-uppercase text-secondary text-m font-weight-bolder opacity-7 ps-2">지역 카테고리</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bolder opacity-7">캠페인 유형</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bolder opacity-7">캠페인 상태</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bolder opacity-7">캠페인 등록일</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bolder opacity-7">관리</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                    <c:forEach var="campaign" items="${campaigns}">

                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                             <!-- 이미지 표시 -->
                    		<a href="${pageContext.request.contextPath}/${campaign.id}">
                    			<img src="${pageContext.request.contextPath}/resources/images/${campaign.imageFileName}" class="avatar avatar-sm me-3" width="300px" alt="${campaign.imageFileName}">
                    		</a>
                          </div>
                          <div class="d-flex flex-column justify-content-center">
                          	<a href="${pageContext.request.contextPath}/${campaign.id}">
                            	<h6 class="mb-0 text-m">${campaign.campaignName}</h6>
                            	<p class="text-xs text-secondary mb-0">${campaign.campaignPrice}</p>
                         	</a> 
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-s font-weight-bold mb-0">${campaign.mainCategory}</p>
                        <p class="text-xs text-secondary mb-0">${campaign.subCategory}</p>
                      </td>
                      <td>
                        <p class="text-s font-weight-bold mb-0">${campaign.region}</p>
                        <p class="text-xs text-secondary mb-0">${campaign.city}</p>
                      </td>
                      <td class="align-middle text-center text-s">
	                      	<c:forEach items="${campaign.campaignTypes}" var="campaignType">
							    <img src="${pageContext.request.contextPath}/resources/images/snsIcon/${campaignType}.png" width="20px" alt="Sub Image">
							</c:forEach>
                      </td>
                      <td class="align-middle text-center text-s">
                        <span class="badge text-s ${campaign.getCampaignStatusClass()}">${campaign.campaignStatus}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-s font-weight-bold">${campaign.registrationDate}</span>
                      </td>

                      <td class="align-middle">
                    	<span class="badge badge-sm bg-gradient-success">
                    		<a href="<c:url value='/admin/application/${campaign.id}'/>" class="font-weight-bold text-s" data-toggle="tooltip" data-original-title="Edit user" style="color: white !important;">선정</a>
                     	</span> 
                    	<span class="badge badge-sm bg-gradient-warning">
                    		<a href="<c:url value='/admin/${campaign.id}/edit'/>" class="font-weight-bold text-s" data-toggle="tooltip" data-original-title="Edit user" style="color: white !important;">수정</a>
                     	</span> 
                    	<span class="badge badge-sm bg-gradient-danger" style="color:red;">
                    		<a href="<c:url value='/admin/${campaign.id}/delete'/>" id="deleteCampaign"class="font-weight-bold text-s" data-toggle="tooltip" data-original-title="Edit user" style="color: white !important;">삭제</a>
                     	</span> 
                      </td>
                    </tr>
                    
             		<script>
					    document.getElementById("deleteCampaign").onclick = function(event) {
					        var result = confirm("삭제하시겠습니까?");
					        if (result) {
					            alert("삭제되었습니다.");
					        } else {
					            event.preventDefault();
					        }
					    };
				    </script>	
				    
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>


    <c:if test="${not empty errorMessage}">
	    <script>
	        alert("${errorMessage}");
	    </script>
	</c:if>

	<div class="lower">
	 <div class="category-item">
    	<form method="get" action="${pageContext.request.contextPath}/admin/list">
	    <select name="searchBy">
	        <option value="campaignName">캠페인 이름</option>
	        <option value="campaignPrice">캠페인 제공내역</option>
	        <option value="campaignTypes">캠페인 유형</option>
	        <option value="providedDetails">제공내역</option>
	        <option value="keyword">키워드</option>
	        <option value="companyInformation">업체정보</option>
	    </select>
	
	    <!-- 입력 폼 -->
	    <input type="text" class="input-box" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요">	    
	    <button type="submit">검색</button>	   
    	</form>
 	  </div>
	 	  	
	<div class="underpage">
	    <div class="paging"> 
	        <!-- 페이지 버튼을 생성 -->
	        <c:if test="${totalPages > 1}">
	            <div>
	                <c:url var="firstPageUrl" value="/admin/list">
	                    <c:param name="mainCategory" value="${param.mainCategory}" />
	                    <c:param name="subCategory" value="${param.subCategory}" />
	                    <c:param name="region" value="${param.region}" />
	                    <c:param name="city" value="${param.city}" />
	                    <c:param name="page" value="1" />
	                </c:url>
	                <a href="${firstPageUrl}">
	                    <button>처음</button>
	                </a>
	                
	                <c:url var="prevPageUrl" value="/admin/list">
	                    <c:param name="mainCategory" value="${param.mainCategory}" />
	                    <c:param name="subCategory" value="${param.subCategory}" />
	                    <c:param name="region" value="${param.region}" />
	                    <c:param name="city" value="${param.city}" />
	                    <c:param name="page" value="${param.page - 1}" />
	                </c:url>
	                <a href="${prevPageUrl}">
	                    <button>이전</button>
	                </a>
	
	                <!-- 숫자 버튼 유지 -->
	                <c:forEach begin="1" end="${totalPages}" var="pageNumber">
	                    <c:url var="pageUrl" value="/admin/list">
	                        <c:param name="mainCategory" value="${param.mainCategory}" />
	                        <c:param name="subCategory" value="${param.subCategory}" />
	                        <c:param name="region" value="${param.region}" />
	                        <c:param name="city" value="${param.city}" />
	                        <c:param name="page" value="${pageNumber}" />
	                    </c:url>
	                    <a href="${pageUrl}">
	                        <button <c:if test="${param.page == pageNumber}">class="paging_active"</c:if>>${pageNumber}</button>
	                    </a>
	                </c:forEach>
	
	                <c:url var="nextPageUrl" value="/admin/list">
	                    <c:param name="mainCategory" value="${param.mainCategory}" />
	                    <c:param name="subCategory" value="${param.subCategory}" />
	                    <c:param name="region" value="${param.region}" />
	                    <c:param name="city" value="${param.city}" />
	                    <c:param name="page" value="${param.page + 1}" />
	                </c:url>
	                <a href="${nextPageUrl}">
	                    <button>다음</button>
	                </a>
	                
	                <c:url var="lastPageUrl" value="/admin/list">
	                    <c:param name="mainCategory" value="${param.mainCategory}" />
	                    <c:param name="subCategory" value="${param.subCategory}" />
	                    <c:param name="region" value="${param.region}" />
	                    <c:param name="city" value="${param.city}" />
	                    <c:param name="page" value="${totalPages}" />
	                </c:url>
	                <a href="${lastPageUrl}">
	                    <button>맨끝</button>
	                </a>
	            </div>
	        </c:if>
	    </div>
	</div>
 	  </div>
    </div>
  </main>
  
   <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="fa fa-cog py-2"> </i>
    </a>
    <div class="card shadow-lg">
      <div class="card-header pb-0 pt-3 ">
        <div class="float-start">
          <h5 class="mt-3 mb-0">설정</h5>
          <p>대시보드 옵션</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="fa fa-close"></i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0 overflow-auto">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">사이드바 색상</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">사이드바 배경</h6>
          <p class="text-sm">두가지 중 선택하세요.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
          <button class="btn bg-gradient-primary w-100 px-3 mb-2" data-class="bg-default" onclick="sidebarType(this)">Dark</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">PC버전에서만 수정 가능합니다..</p>
        <!-- Navbar Fixed -->
        <div class="d-flex my-3">
          <h6 class="mb-0">사이드바 고정</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
        <div class="mt-2 mb-5 d-flex">
          <h6 class="mb-0">화이트 테마 / 다크 테마</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../resources/assets/js/core/popper.min.js"></script>
  <script src="../resources/assets/js/core/bootstrap.min.js"></script>
  <script src="../resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../resources/assets/js/argon-dashboard.min.js?v=2.0.4"></script>
  
     <script>
    // jQuery 코드를 문서 로드 이후에 실행
$(document).ready(function () {
    var mainCategorySelect = $("#mainCategory");
    var subCategoryOptions = $("#subCategory");
    var selectedMainCategoryInput = $("#selectedMainCategory");
    var selectedSubCategoryInput = $("#selectedSubCategory");
    
    // 선택한 첫 번째 카테고리에 따라 두 번째 카테고리 option 값 추가 함수
    function setSubCategoryOptions(mainCategory, subCategory) {
        // 두 번째 카테고리 option 값 초기화
        subCategoryOptions.empty();

        // 선택한 첫 번째 카테고리에 따라 나머지 옵션 값 추가
        if (mainCategory === "방문") {
            subCategoryOptions.append("<option value=''>전체</option>");
            subCategoryOptions.append("<option value='맛집'>맛집</option>");
            subCategoryOptions.append("<option value='숙박'>숙박</option>");
            subCategoryOptions.append("<option value='문화'>문화</option>");
        } else if (mainCategory === "제품") {
            subCategoryOptions.append("<option value=''>전체</option>");
            subCategoryOptions.append("<option value='생활'>생활</option>");
            subCategoryOptions.append("<option value='유아동'>유아동</option>");
            subCategoryOptions.append("<option value='뷰티'>뷰티</option>");
            subCategoryOptions.append("<option value='디지털'>디지털</option>");
            subCategoryOptions.append("<option value='패션'>패션</option>");
            subCategoryOptions.append("<option value='도서'>도서</option>");
            subCategoryOptions.append("<option value='식품'>식품</option>");
        }

        // 초기 설정값에 따라 두 번째 카테고리 option 값 설정
        subCategoryOptions.val(subCategory);
    }
    

    // URL에서 파라미터 값을 읽어오는 함수
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
        var results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    // 초기에 mainCategory 값을 설정
    var initialMainCategory = getUrlParameter("mainCategory");
    mainCategorySelect.val(initialMainCategory);

    // 초기 subCategory 값을 설정
    var initialSubCategory = getUrlParameter("subCategory");
    setSubCategoryOptions(initialMainCategory, initialSubCategory);
    

    // 첫 번째 카테고리가 변경될 때 이벤트 핸들러
    mainCategorySelect.change(function () {
        var mainCategory = $(this).val();
        // 선택한 첫 번째 카테고리에 따라 두 번째 카테고리 option 값 변경
        setSubCategoryOptions(mainCategory, "");
        // 첫 번째 카테고리가 변경될 때 hidden input 값을 업데이트
        selectedMainCategoryInput.val(mainCategory);
        selectedSubCategoryInput.val("");
    });

    // 두 번째 카테고리가 변경될 때 이벤트 핸들러
    subCategoryOptions.change(function () {
        var subCategory = $(this).val();
        // 두 번째 카테고리가 변경될 때 hidden input 값을 업데이트
        selectedSubCategoryInput.val(subCategory);
    });
    
});

$(document).ready(function () {
    var regionSelect = $("#region");
    var cityOptions = $("#city");
    var selectedRegionInput = $("#selectedRegion");
    var selectedCityInput = $("#selectedCity");

    // 선택한 첫 번째 카테고리에 따라 두 번째 카테고리 option 값 추가 함수
    function setCityOptions(region, city) {
    	// 두 번째 카테고리 option 값 초기화
        cityOptions.empty();

     // 선택한 첫 번째 카테고리에 따라 나머지 옵션 값 추가
        if (region === "서울") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='강남구'>강남구</option>");
            cityOptions.append("<option value='강동구'>강동구</option>");
            cityOptions.append("<option value='강북구'>강북구</option>");
            cityOptions.append("<option value='강서구'>강서구</option>");
            cityOptions.append("<option value='관악구'>관악구</option>");
            cityOptions.append("<option value='광진구'>광진구</option>");
            cityOptions.append("<option value='구로구'>구로구</option>");
            cityOptions.append("<option value='금천구'>금천구</option>");
            cityOptions.append("<option value='노원구'>노원구</option>");
            cityOptions.append("<option value='도봉구'>도봉구</option>");
            cityOptions.append("<option value='동대문구'>동대문구</option>");
            cityOptions.append("<option value='동작구'>동작구</option>");
            cityOptions.append("<option value='마포구'>마포구</option>");
            cityOptions.append("<option value='서대문구'>서대문구</option>");
            cityOptions.append("<option value='서초구'>서초구</option>");
            cityOptions.append("<option value='성동구'>성동구</option>");
            cityOptions.append("<option value='성북구'>성북구</option>");
            cityOptions.append("<option value='송파구'>송파구</option>");
            cityOptions.append("<option value='양천구'>양천구</option>");
            cityOptions.append("<option value='영등포구'>영등포구</option>");
            cityOptions.append("<option value='용산구'>용산수</option>");
            cityOptions.append("<option value='은평구'>은평구</option>");
            cityOptions.append("<option value='종로구'>종로구</option>");
            cityOptions.append("<option value='중구'>중구</option>");
            cityOptions.append("<option value='중랑구'>중랑구</option>");
        } else if (region === "경기도") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='가평군'>가평군</option>");
            cityOptions.append("<option value='고양시 덕양구'>고양시 덕양구</option>");
            cityOptions.append("<option value='고양시 일산동구'>고양시 일산동구</option>");
            cityOptions.append("<option value='고양시 일산서구'>고양시 일산서구</option>");
            cityOptions.append("<option value='과천시'>과천시</option>");
            cityOptions.append("<option value='광명시'>광명시</option>");
            cityOptions.append("<option value='광주시'>광주시</option>");
            cityOptions.append("<option value='구리시'>구리시</option>");
            cityOptions.append("<option value='군포시'>군포시</option>");
            cityOptions.append("<option value='김포시'>김포시</option>");
            cityOptions.append("<option value='남양주시'>남양주시</option>");
            cityOptions.append("<option value='동두천시'>동두천시</option>");
            cityOptions.append("<opti=on value='부천시'>부천시</option>");
            cityOptions.append("<option value='성남시 분당구'>성남시 분당구</option>");
            cityOptions.append("<option value='성남시 수정구'>성남시 수정구</option>");
            cityOptions.append("<option value='성남시 중원구'>성남시 중원구</option>");
            cityOptions.append("<option value='성남시 권선구'>성남시 권선구</option>");
            cityOptions.append("<option value='성남시 영통구'>성남시 영통구</option>");
            cityOptions.append("<option value='성남시 장안구'>성남시 장안구</option>");
            cityOptions.append("<option value='성남시 팔달구'>성남시 팔달구</option>");
            cityOptions.append("<option value='시흥시'>시흥시</option>");
            cityOptions.append("<option value='안산시 단원구'>안산시 단원구</option>");
            cityOptions.append("<option value='안산시 상록구'>안산시 상록구</option>");
            cityOptions.append("<option value='안성시'>안성시</option>");
            cityOptions.append("<option value='안양시 동안구'>안양시 동안구</option>");
            cityOptions.append("<option value='안양시 만안구'>안양시 만안구</option>");
            cityOptions.append("<option value='양주시'>양주시</option>");
            cityOptions.append("<option value='양평군'>양평군</option>");
            cityOptions.append("<option value='여주시'>여주시</option>");
            cityOptions.append("<option value='연천군'>연천군</option>");
            cityOptions.append("<option value='오산시'>오산시</option>");
            cityOptions.append("<option value='용인시 기흥구'>용인시 기흥구</option>");
            cityOptions.append("<option value='용인시 수지구'>용인시 수지구</option>");
            cityOptions.append("<option value='용인시 처인구'>용인시 처인구</option>");
            cityOptions.append("<option value='의왕시'>의왕시</option>");
            cityOptions.append("<option value='의정부시'>의정부시</option>");
            cityOptions.append("<option value='이천시'>이천시</option>");
            cityOptions.append("<option value='파주시'>파주시</option>");
            cityOptions.append("<option value='평택시'>평택시</option>");
            cityOptions.append("<option value='포천시'>포천시</option>");
            cityOptions.append("<option value='하남시'>하남시</option>");
            cityOptions.append("<option value='화성시'>화성시</option>");
        } else if (region === "인천") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='강화군'>강화군</option>");
            cityOptions.append("<option value='계양구'>계양구</option>");
            cityOptions.append("<option value='남동구'>남동구</option>");
            cityOptions.append("<option value='동구'>동구</option>");
            cityOptions.append("<option value='미추홀구'>미추홀구</option>");
            cityOptions.append("<option value='부평구'>부평구</option>");
            cityOptions.append("<option value='서구'>서구</option>");
            cityOptions.append("<option value='연수구'>연수구</option>");
            cityOptions.append("<option value='옹진군'>옹진군</option>");
            cityOptions.append("<option value='중구'>중구</option>");
        } else if (region === "부산") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='강서구'>강서구</option>");
            cityOptions.append("<option value='금정구'>금정구</option>");
            cityOptions.append("<option value='기장군'>기장군</option>");
            cityOptions.append("<option value='남구'>남구</option>");
            cityOptions.append("<option value='동구'>동구</option>");
            cityOptions.append("<option value='동래구'>동래구</option>");
            cityOptions.append("<option value='부산진구'>부산진구</option>");
            cityOptions.append("<option value='북구'>북구</option>");
            cityOptions.append("<option value='사상구'>사상구</option>");
            cityOptions.append("<option value='사하구'>사하구</option>");
            cityOptions.append("<option value='서구'>서구</option>");
            cityOptions.append("<option value='수영구'>수영구</option>");
            cityOptions.append("<option value='연제구'>연제구</option>");
            cityOptions.append("<option value='영도구'>영도구</option>");
            cityOptions.append("<option value='중구'>중구</option>");
            cityOptions.append("<option value='해운대구'>해운대구</option>");
        } else if (region === "대구") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='남구'>남구</option>");
            cityOptions.append("<option value='달서구'>달서구</option>");
            cityOptions.append("<option value='달성군'>달성군</option>");
            cityOptions.append("<option value='동구'>동구</option>");
            cityOptions.append("<option value='북구'>북구</option>");
            cityOptions.append("<option value='서구'>서구</option>");
            cityOptions.append("<option value='수성구'>수성구</option>");
            cityOptions.append("<option value='중구'>중구</option>");
        } else if (region === "광주") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='광산구'>광산구</option>");
            cityOptions.append("<option value='남구'>남구</option>");
            cityOptions.append("<option value='동구'>동구</option>");
            cityOptions.append("<option value='북구'>북구</option>");
            cityOptions.append("<option value='서구'>서구</option>");
        } else if (region === "대전") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='대덕구'>대덕구</option>");
            cityOptions.append("<option value='동구'>동구</option>");
            cityOptions.append("<option value='서구'>서구</option>");
            cityOptions.append("<option value='유성구'>유성구</option>");
            cityOptions.append("<option value='중구'>중구</option>");
        } else if (region === "울산") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='남구'>남구</option>");
            cityOptions.append("<option value='동구'>동구</option>");
            cityOptions.append("<option value='북구'>북구</option>");
            cityOptions.append("<option value='울주군'>울주군</option>");
            cityOptions.append("<option value='중구'>중구</option>");
        } else if (region === "강원도") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='강릉시'>강릉시</option>");
            cityOptions.append("<option value='고성군'>고성군</option>");
            cityOptions.append("<option value='동해시'>동해시</option>");
            cityOptions.append("<option value='삼척시'>삼척시</option>");
            cityOptions.append("<option value='속초시'>속초시</option>");
            cityOptions.append("<option value='양구군'>양구군</option>");
            cityOptions.append("<option value='양양군'>양양군</option>");
            cityOptions.append("<option value='영월군'>영월군</option>");
            cityOptions.append("<option value='원주시'>원주시</option>");
            cityOptions.append("<option value='인제군'>인제군</option>");
            cityOptions.append("<option value='정선군'>정선군</option>");
            cityOptions.append("<option value='철원군'>철원군</option>");
            cityOptions.append("<option value='춘천시'>춘천시</option>");
            cityOptions.append("<option value='태백시'>태백시</option>");
            cityOptions.append("<option value='평창군'>평창군</option>");
            cityOptions.append("<option value='홍천군'>홍천군</option>");
            cityOptions.append("<option value='화천군'>화천군</option>");
            cityOptions.append("<option value='횡성군'>횡성군</option>");
        } else if (region === "경상남도") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='거제시'>거제시</option>");
            cityOptions.append("<option value='거창군'>거창군</option>");
            cityOptions.append("<option value='고성군'>고성군</option>");
            cityOptions.append("<option value='김해시'>김해시</option>");
            cityOptions.append("<option value='남해군'>남해군</option>");
            cityOptions.append("<option value='밀양시'>밀양시</option>");
            cityOptions.append("<option value='사천시'>사천시</option>");
            cityOptions.append("<option value='사천군'>사천군</option>");
            cityOptions.append("<option value='양산시'>양산시</option>");
            cityOptions.append("<option value='의령군'>의령군</option>");
            cityOptions.append("<option value='진주시'>진주시</option>");
            cityOptions.append("<option value='창녕군'>창녕군</option>");
            cityOptions.append("<option value='창원시 마산합포구'>창원시 마산합포구</option>");
            cityOptions.append("<option value='창원시 마산회원구'>창원시 마산회원구</option>");
            cityOptions.append("<option value='창원시 성산구'>창원시 성산구</option>");
            cityOptions.append("<option value='창원시 의창구'>창원시 의창구</option>");
            cityOptions.append("<option value='창원시 진해구'>창원시 진해구</option>");
            cityOptions.append("<option value='하동군'>하동군</option>");
            cityOptions.append("<option value='함안군'>함안군</option>");
            cityOptions.append("<option value='함양군'>함양군</option>");
            cityOptions.append("<option value='합천군'>합천군</option>");
        } else if (region === "경상북도") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='경산시'>경산시</option>");
            cityOptions.append("<option value='경주시'>경주시</option>");
            cityOptions.append("<option value='고령군'>고령군</option>");
            cityOptions.append("<option value='구미시'>구미시</option>");
            cityOptions.append("<option value='군위군'>군위군</option>");
            cityOptions.append("<option value='김천시'>김천시</option>");
            cityOptions.append("<option value='문경시'>문경시</option>");
            cityOptions.append("<option value='봉화군'>봉화군</option>");
            cityOptions.append("<option value='상주시'>상주시</option>");
            cityOptions.append("<option value='성주군'>성주군</option>");
            cityOptions.append("<option value='안동시'>안동시</option>");
            cityOptions.append("<option value='영덕군'>영덕군</option>");
            cityOptions.append("<option value='영양군'>영양군</option>");
            cityOptions.append("<option value='영주시'>영주시</option>");
            cityOptions.append("<option value='영천시'>영천시</option>");
            cityOptions.append("<option value='예천군'>예천군</option>");
            cityOptions.append("<option value='을릉군'>을릉군</option>");
            cityOptions.append("<option value='울진군'>울진군</option>");
            cityOptions.append("<option value='의성군'>의성군</option>");
            cityOptions.append("<option value='청도군'>청도군</option>");
            cityOptions.append("<option value='청송군'>청송군</option>");
            cityOptions.append("<option value='칠곡군'>칠곡군</option>");
            cityOptions.append("<option value='포항시 남구'>포항시 남구</option>");
            cityOptions.append("<option value='포항시 북구'>포항시 북구</option>");
        } else if (region === "전라남도") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='강진군'>강진군</option>");
            cityOptions.append("<option value='고흥군'>고흥군</option>");
            cityOptions.append("<option value='곡성군'>곡성군</option>");
            cityOptions.append("<option value='광양시'>광양시</option>");
            cityOptions.append("<option value='구례군'>구례군</option>");
            cityOptions.append("<option value='나주시'>나주시</option>");
            cityOptions.append("<option value='담양군'>담양군</option>");
            cityOptions.append("<option value='목포시'>목포시</option>");
            cityOptions.append("<option value='무안군'>무안군</option>");
            cityOptions.append("<option value='보성군'>보성군</option>");
            cityOptions.append("<option value='순천시'>순천시</option>");
            cityOptions.append("<option value='신안군'>신안군</option>");
            cityOptions.append("<option value='여수시'>여수시</option>");
            cityOptions.append("<option value='영광군'>영광군</option>");
            cityOptions.append("<option value='영암군'>영암군</option>");
            cityOptions.append("<option value='완도군'>완도군</option>");
            cityOptions.append("<option value='장성군'>장성군</option>");
            cityOptions.append("<option value='장흥군'>장흥군</option>");
            cityOptions.append("<option value='진도군'>진도군</option>");
            cityOptions.append("<option value='함평군'>함평군</option>");
            cityOptions.append("<option value='해남군'>해남군</option>");
            cityOptions.append("<option value='화순군'>화순군</option>");
        } else if (region === "전라북도") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='고창군'>고창군</option>");
            cityOptions.append("<option value='군산시'>군산시</option>");
            cityOptions.append("<option value='김제시'>김제시</option>");
            cityOptions.append("<option value='남원시'>남원시</option>");
            cityOptions.append("<option value='무주군'>무주군</option>");
            cityOptions.append("<option value='부안군'>부안군</option>");
            cityOptions.append("<option value='순창군'>순창군</option>");
            cityOptions.append("<option value='완주군'>완주군</option>");
            cityOptions.append("<option value='익산시'>익산시</option>");
            cityOptions.append("<option value='임실군'>임실군</option>");
            cityOptions.append("<option value='장수군'>장수군</option>");
            cityOptions.append("<option value='전주시 덕진구'>전주시 덕진구</option>");
            cityOptions.append("<option value='전주시 완산구'>전주시 완산구</option>");
            cityOptions.append("<option value='정읍시'>정읍시</option>");
            cityOptions.append("<option value='진안군'>진안군</option>");
        } else if (region === "충청남도") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='계룡시'>계룡시</option>");
            cityOptions.append("<option value='공주시'>공주시</option>");
            cityOptions.append("<option value='금산군'>금산군</option>");
            cityOptions.append("<option value='논산시'>논산시</option>");
            cityOptions.append("<option value='당진군'>당진군</option>");
            cityOptions.append("<option value='당진시'>당진시</option>");
            cityOptions.append("<option value='보령시'>보령시</option>");
            cityOptions.append("<option value='부여군'>부여군</option>");
            cityOptions.append("<option value='서산시'>서산시</option>");
            cityOptions.append("<option value='서천군'>서천군</option>");
            cityOptions.append("<option value='아산시'>아산시</option>");
            cityOptions.append("<option value='연기군'>연기군</option>");
            cityOptions.append("<option value='예산군'>예산군</option>");
            cityOptions.append("<option value='천안시 동남구'>천안시 동남구</option>");
            cityOptions.append("<option value='천안시 서북구'>천안시 서북구</option>");
            cityOptions.append("<option value='청양군'>청양군</option>");
            cityOptions.append("<option value='태안군'>태안군</option>");
            cityOptions.append("<option value='홍성군'>홍성군</option>");
        } else if (region === "충청북도") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='괴산군'>괴산군</option>");
            cityOptions.append("<option value='단양군'>단양군</option>");
            cityOptions.append("<option value='보은군'>보은군</option>");
            cityOptions.append("<option value='영동군'>영동군</option>");
            cityOptions.append("<option value='옥천군'>옥천군</option>");
            cityOptions.append("<option value='음성군'>음성군</option>");
            cityOptions.append("<option value='제천시'>제천시</option>");
            cityOptions.append("<option value='증평군'>증평군</option>");
            cityOptions.append("<option value='진천군'>진천군</option>");
            cityOptions.append("<option value='청주시 상당구'>청주시 상당구</option>");
            cityOptions.append("<option value='청주시 서원구'>청주시 서원구</option>");
            cityOptions.append("<option value='청주시 청원구'>청주시 청원구</option>");
            cityOptions.append("<option value='청주시 흥덕구'>청주시 흥덕구</option>");
            cityOptions.append("<option value='충주시'>충주시</option>");
        } else if (region === "제주도") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='제주시'>제주시<option>");
            cityOptions.append("<option value='서귀포시'>서귀포시</option>");
        } else if (region === "세종시") {
            cityOptions.append("<option value=''>전체</option>");
            cityOptions.append("<option value='가람동'>가람동</option>");
            cityOptions.append("<option value='고운동'>고운동</option>");
            cityOptions.append("<option value='금남면'>금남면</option>");
            cityOptions.append("<option value='나성동'>나성동</option>");
            cityOptions.append("<option value='다정동'>다정동</option>");
            cityOptions.append("<option value='대평동'>대평동</option>");
            cityOptions.append("<option value='도담동'>도담동</option>");
            cityOptions.append("<option value='반곡동'>반곡동</option>");
            cityOptions.append("<option value='보람동'>보람동</option>");
            cityOptions.append("<option value='부강면'>부강면</option>");
            cityOptions.append("<option value='새롬동'>새롬동</option>");
            cityOptions.append("<option value='소담동'>소담동</option>");
            cityOptions.append("<option value='소정면'>소정면</option>");
            cityOptions.append("<option value='아름동'>아름동</option>");
            cityOptions.append("<option value='어진동'>어진동</option>");
            cityOptions.append("<option value='연기면'>연기면</option>");
            cityOptions.append("<option value='연동면'>연동면</option>");
            cityOptions.append("<option value='연서면'>연서면</option>");
            cityOptions.append("<option value='장군면'>장군면</option>");
            cityOptions.append("<option value='전동면'>전동면</option>");
            cityOptions.append("<option value='전의면'>전의면</option>");
            cityOptions.append("<option value='조치원읍'>조치원읍</option>");
            cityOptions.append("<option value='종촌동'>종촌동</option>");
            cityOptions.append("<option value='한솔동'>한솔동</option>");
        } 
     
        // 초기 설정값에 따라 두 번째 카테고리 option 값 설정
        cityOptions.val(city);
    }


    // URL에서 파라미터 값을 읽어오는 함수
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
        var results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    // 초기값을 URL 파라미터에서 가져와 설정
    var initialRegion = getUrlParameter("region"); // URL에서 'region' 파라미터 값을 가져옴
    regionSelect.val(initialRegion); // 초기값 설정

    var initialCity = getUrlParameter("city"); // URL에서 'city' 파라미터 값을 가져옴
    setCityOptions(initialRegion, initialCity); // 초기값 설정

    // 첫 번째 카테고리가 변경될 때 이벤트 핸들러
    regionSelect.change(function () {
        var region = $(this).val();
        setCityOptions(region, "");
        selectedRegionInput.val(region);
        selectedCityInput.val("");
    });

	 // 두 번째 카테고리가 변경될 때 이벤트 핸들러
    cityOptions.change(function () {
        var city = $(this).val();
        selectedCityInput.val(city);
    });
});  


function confirmDelete(campaignId) {
    if (confirm("삭제하시겠습니까?")) {
        // 사용자가 확인을 누르면 삭제 동작을 수행합니다.
        window.location.href = `<c:url value='/campaigns/${campaignId}/delete'/>`;
    } else {
        // 사용자가 취소를 누르면 아무 작업도 수행하지 않습니다.
    }
}

//campaignTypes 값 가져오기 (예: "youtube")
var campaignTypes = "${campaign.campaignTypes}";

// 이미지를 감싸는 레이블 엘리먼트 가져오기naverblogCheckboximg
var naverblogCheckboximg = document.getElementById("naverblogCheckboximg");
var instagramCheckboximg = document.getElementById("instagramCheckboximg");
var youtubeCheckboximg = document.getElementById("youtubeCheckboximg");

// campaignTypes에 따라 이미지 숨김 처리
if (campaignTypes === "naverblog") {
	youtubeCheckboximg.style.display = "none";
    instagramCheckboximg.style.display = "none";
} else if (campaignTypes === "instagram") {
    naverblogCheckboximg.style.display = "none";
    youtubeCheckboximg.style.display = "none";
} else if (campaignTypes === "youtube") {
    naverblogCheckboximg.style.display = "none";
    instagramCheckboximg.style.display = "none";
}

</script>
</c:when>
    <c:otherwise>
        <c:redirect url="/WEB-INF/views/error/error404.jsp" />
    </c:otherwise>
</c:choose>

	<script>
	// 사용자가 설정을 변경할 때마다 호출하는 함수
	function saveSettings() {
	  var isWindows = navigator.platform.indexOf('Win') > -1 ? true : false;
	  var settings = {
	    isWindows: isWindows,
	    // 다른 설정 항목을 여기에 추가
	  };
	  
	  // 설정을 로컬 스토리지에 저장
	  localStorage.setItem('userSettings', JSON.stringify(settings));
	}

	// 페이지를 로드할 때 호출하는 함수
	function loadSettings() {
	  // 로컬 스토리지에서 설정을 가져오기
	  var savedSettings = localStorage.getItem('userSettings');
	  if (savedSettings) {
	    var settings = JSON.parse(savedSettings);
	    // 설정을 사용하여 페이지의 초기 설정을 설정
	    if (settings.isWindows) {
	      // Windows 설정을 기반으로 페이지 초기화
	      // 예: Windows에 대한 설정을 적용
	    } else {
	      // 다른 설정에 대한 처리
	    }
	  }
	}

	// 페이지 로드 시 설정 적용
	</script>
</body>

</html>