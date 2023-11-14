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
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    Argon Dashboard 2 by Creative Tim
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../../resources/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../../resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../../resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../../resources/assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
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
        <img src="../../resources/assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
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
              <h6>${campaign.campaignName}</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bold opacity-7">신청일</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bold opacity-7">선정상태</th>
                      <th class="text-uppercase text-secondary text-m font-weight-bold opacity-7">이름/이메일</th>
                      <th class="text-uppercase text-secondary text-m font-weight-bold opacity-7 ps-2">신청 한마디</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bold opacity-7">SNS 주소</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bold opacity-7">수령인</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bold opacity-7">주소</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bold opacity-7">휴대폰</th>
                      <th class="text-center text-uppercase text-secondary text-m font-weight-bold opacity-7">관리</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="application" items="${applications}">
                    <tr>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-400">${application.registrationDate}</span>
                      </td>
                      <td class="align-middle text-center text-s">
                        <span class="badge badge-s ${application.getApplicationStatusClass()}">${application.status}</span>
                      </td>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-m">${application.name}</h6>
                            <p class="text-xs text-secondary mb-0">${application.email}</p>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-s font-weight-400 mb-0">${application.comment}</p>
                      </td>
						<td class="align-middle text-center text-s">
						    <c:forEach items="${application.snsURL}" var="snsURL" varStatus="loop">
						        <c:if test="${not empty snsURL}">
						            <c:choose>
						                <c:when test="${loop.index % 3 == 0}">
						                    <img src="${pageContext.request.contextPath}/resources/images/snsIcon/instagram.png">
						                    <span class="text-secondary text-s font-weight-400" style="margin-left:5px;">${snsURL}</span>
						                </c:when>
						                <c:when test="${loop.index % 2 == 0}">
						                    <img src="${pageContext.request.contextPath}/resources/images/snsIcon/naverblog.png">
						                    <span class="text-secondary text-s font-weight-400" style="margin-left:5px;">${snsURL}</span>
						                </c:when>
						                <c:otherwise>
						                    <img src="${pageContext.request.contextPath}/resources/images/snsIcon/youtube.png">
						                    <span class="text-secondary text-s font-weight-400" style="margin-left:5px;">${snsURL}</span>
						                </c:otherwise>
						            </c:choose>
						            <br>
						        </c:if>
						    </c:forEach>
						</td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-s font-weight-400">${application.recipient}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-400">${application.address}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-s font-weight-400">${application.phone}</span>
                      </td>
                      <td class="align-middle text-center">
                       	<span class="badge badge-sm bg-gradient-success">
                    		<a href="<c:url value='/admin/application/${application.campaignNum}/${application.id}'/>" class="font-weight-bold text-m" data-toggle="tooltip" data-original-title="Edit user" style="color: white !important;">선정</a>
                     	</span> 
                    	<span class="badge badge-sm bg-gradient-warning">
                    		<a href="<c:url value='/admin/application/${application.campaignNum}/${application.id}/not'/>" class="font-weight-bold text-m" data-toggle="tooltip" data-original-title="Edit user" style="color: white !important;">미선정</a>
                     	</span>                      
                        <span class="badge badge-sm bg-gradient-danger" style="color:red;">
                    		<a href="<c:url value='/admin/application/${application.campaignNum}/${application.id}/cancel'/>" id="deleteApplication"class="font-weight-bold text-m" data-toggle="tooltip" data-original-title="Edit user" style="color: white !important;">선정취소</a>
                     	</span>           
                      </td>
                    </tr>
                    <script>
					    document.getElementById("deleteApplication").onclick = function(event) {
					        var result = confirm("삭제하시겠습니까?");
					        if (result) {
					            alert("삭제되었습니다.");
					        } else {
					            event.preventDefault();
					        }
					    };
				    </script>	
	</c:forEach>
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

  <script src="../../resources/assets/js/core/popper.min.js"></script>
    <script src="../../resources/assets/js/core/bootstrap.min.js"></script>
    <script src="../../resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../../resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script>
      var win = navigator.platform.indexOf('Win') > -1;
      if (win && document.querySelector('#sidenav-scrollbar')) {
        var options = {
          damping: '0.5'
        }
        Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
      }
    </script>
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script src="../../resources/assets/js/argon-dashboard.min.js?v=2.0.4"></script>
   </c:when>
    <c:otherwise>
        <c:redirect url="/WEB-INF/views/error/error404.jsp" />
    </c:otherwise>
</c:choose>
</body>

</html>