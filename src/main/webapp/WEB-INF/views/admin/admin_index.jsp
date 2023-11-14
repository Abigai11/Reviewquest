<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
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
          <a class="nav-link active" href="${pageContext.request.contextPath}/admin/index">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">대시보드</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="${pageContext.request.contextPath}/admin/list?mainCategory=&region=&page=1">
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
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">인플루언서 회원수</p>
                    <h5 class="font-weight-bolder">
                      ${influencerCount} 명
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">가맹점 회원수</p>
                    <h5 class="font-weight-bolder">
                      ${companyCount} 명
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">등록된 캠페인 수</p>
                    <h5 class="font-weight-bolder">
                     ${campaignCount} 개
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">캠페인 신청 개수</p>
                    <h5 class="font-weight-bolder">
                     ${applicationCount} 건
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-lg-7 mb-lg-0 mb-4">
          <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize">가입자 현황</h6>
            </div>
            <div class="card-body p-3">
              <div class="chart">
                <canvas id="chart-line" class="chart-canvas" height="300"></canvas>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-5">
          <div class="card card-carousel overflow-hidden h-100 p-0">
            <div id="carouselExampleCaptions" class="carousel slide h-100" data-bs-ride="carousel">
              <div class="carousel-inner border-radius-lg h-100">
                <div class="carousel-item h-100 active" style="background-image: url('../resources/assets/img/carousel-1.jpg');
      background-size: cover;">
                  <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                    <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                      <i class="ni ni-camera-compact text-dark opacity-10"></i>
                    </div>
                    <h5 class="text-white mb-1">관리자 페이지에 오신것을 환영합니다.</h5>
                  </div>
                </div>
                <div class="carousel-item h-100" style="background-image: url('../resources/assets/img/carousel-2.jpg');
      background-size: cover;">
                  <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                    <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                      <i class="ni ni-bulb-61 text-dark opacity-10"></i>
                    </div>
                    <h5 class="text-white mb-1">No1 체험단 리뷰퀘스트</h5>
                  </div>
                </div>
              </div>
              <button class="carousel-control-prev w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-lg-7 mb-lg-0 mb-4">
          <div class="card ">
            <div class="card-header pb-0 p-3">
              <div class="d-flex justify-content-between">
                <h6 class="mb-2">실시간 인기 캠페인</h6>
              </div>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center ">
                <tbody>
                <c:forEach var="Best" items="${Bests}">
                  <tr>
                    <td class="w-30">
                      <div class="d-flex px-2 py-1 align-items-center">
                        <div>
                          <img src="${pageContext.request.contextPath}/resources/images/${Best.imageFileName}" width="25px;">
                        </div>
                        <div class="ms-4">
                          <p class="text-xs font-weight-bold mb-0">캠페인 명</p>
                          <h6 class="text-sm mb-0">${Best.campaignName}</h6>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="text-center">
                        <p class="text-xs font-weight-bold mb-0">신청자</p>
                        <h6 class="text-sm mb-0">${Best.applicants}</h6>
                      </div>
                    </td>
                    <td>
                      <div class="text-center">
                        <p class="text-xs font-weight-bold mb-0">지역</p>
                        <h6 class="text-sm mb-0">${Best.region}</h6>
                      </div>
                    </td>
                    <td class="align-middle text-sm">
                      <div class="col text-center">
                        <p class="text-xs font-weight-bold mb-0">구</p>
                        <h6 class="text-sm mb-0">${Best.city}</h6>
                      </div>
                    </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="col-lg-5">
          <div class="card">
            <div class="card-header pb-0 p-3">
              <h6 class="mb-0">신규캠페인</h6>
            </div>
            
            <div class="card-body p-3">
              <ul class="list-group">
              <c:forEach var="New" items="${News}">
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex align-items-center">
					<img src="${pageContext.request.contextPath}/resources/images/${New.imageFileName}" style="margin-right:10px; width:25px;">
                    <div class="d-flex flex-column">
                      <h6 class="mb-1 text-dark text-sm">${New.campaignName}</h6>
                      <span class="text-xs">${New.region} <span class="font-weight-bold">${New.city}</span></span>
                    </div>
                  </div>
                  <div class="d-flex">
                  	<a href="${pageContext.request.contextPath}/admin/list">
                    	<button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button>
                  	</a>
                  </div>
                </li>
               </c:forEach>
              </ul>
            </div>
            
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
  <script src="../resources/assets/js/plugins/chartjs.min.js"></script>
  <script>
  var ctx1 = document.getElementById("chart-line").getContext("2d");

  var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);
  gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
  gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
  gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');

  var gradientStroke2 = ctx1.createLinearGradient(0, 230, 0, 50);
  gradientStroke2.addColorStop(1, 'rgba(255, 99, 132, 0.2)');
  gradientStroke2.addColorStop(0.2, 'rgba(255, 99, 132, 0.0)');
  gradientStroke2.addColorStop(0, 'rgba(255, 99, 132, 0)');

  var influencerData = ${influencerData}; // ModelAndView에서 전달한 데이터
  var companyData = ${companyData};   

  new Chart(ctx1, {
      type: "line",
      data: {
          labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
          datasets: [
              {
                  label: "인플루언서",
                  tension: 0.4,
                  borderWidth: 0,
                  pointRadius: 0,
                  borderColor: "#5e72e4",
                  backgroundColor: gradientStroke1,
                  borderWidth: 3,
                  fill: true,
                  data: influencerData,
                  maxBarThickness: 6
              },
              {
                  label: "가맹점",
                  tension: 0.4,
                  borderWidth: 0,
                  pointRadius: 0,
                  borderColor: "#ff6384",
                  backgroundColor: gradientStroke2,
                  borderWidth: 3,
                  fill: true,
                  data: companyData,
                  maxBarThickness: 6
              }
          ],
      },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: true,
        }
      },
      interaction: {
        intersect: false,
        mode: 'index',
      },
      scales: {
        y: {
          grid: {
            drawBorder: false,
            display: true,
            drawOnChartArea: true,
            drawTicks: false,
            borderDash: [5, 5]
          },
          ticks: {
            display: true,
            padding: 10,
            color: '#fbfbfb',
            font: {
              size: 11,
              family: "Open Sans",
              style: 'normal',
              lineHeight: 2
            },
          }
        },
        x: {
          grid: {
            drawBorder: false,
            display: false,
            drawOnChartArea: false,
            drawTicks: false,
            borderDash: [5, 5]
          },
          ticks: {
            display: true,
            color: '#ccc',
            padding: 20,
            font: {
              size: 11,
              family: "Open Sans",
              style: 'normal',
              lineHeight: 2
            },
          }
        },
      },
    },
  });

  </script>
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