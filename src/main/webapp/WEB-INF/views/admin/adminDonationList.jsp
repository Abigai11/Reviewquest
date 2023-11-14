<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="userInfo" value="${sessionScope.userInfo}" /> 
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="../resources/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../resources/assets/img/favicon.png">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <!-- Nucleo Icons -->
    <link href="${contextPath}/resources/assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="${contextPath}/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link href="${contextPath}/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- CSS Files -->
    <link id="pagestyle" href="${contextPath}/resources/assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
    $(document).ready(function() {
        // 삭제 버튼 클릭 시 실행할 함수
        $(".delBtn").on("click", function() {
            var donationNum = $(this).data("donation-num"); // 클릭한 버튼의 고유 번호 가져오기
            
            // 삭제 확인 다이얼로그 표시 (선택사항)
            if (confirm("삭제하시겠습니까?")) {
                // jQuery Ajax 요청을 사용하여 삭제 작업을 서버에 전송
                $.ajax({
                    type: "POST",
                    url: "${contextPath}/donation/remove?num=" + donationNum, // 고유 번호를 URL에 추가
                    success: function(data) {
                        // 삭제 작업이 성공하면 수행할 동작
                        alert("삭제되었습니다.");
                        // 페이지 새로고침 또는 필요한 동작 수행
                        window.location.href = "${contextPath}/donation/adminList";
                    },
                    error: function() {
                        // 삭제 작업이 실패한 경우 처리 (예: 오류 메시지 표시)
                        alert("삭제에 실패했습니다.");
                    }
                });
            }
        });
    });
</script>
<style type="text/css">
.underpage {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.paging {
    flex: 1;
    text-align: center;
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
          <a class="nav-link " href="${pageContext.request.contextPath}/admin/list?mainCategory=&region=&page=1">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">캠페인 관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/donation/adminList">
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
			                            <img src="../resources/assets/img/team-2.jpg"class="avatar avatar-sm me-3">
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
        <div class="card">
        	<div class="card-header pb-0">
              <h6>기부 관리</h6>
              <div class="d-flex justify-content-end" style="margin-right: 20px;">
		            <button class="btn btn-icon btn-3 btn-primary" type="button">
		                <span class="btn-inner--icon"><i class="ni ni-button-play"></i></span>
		                <a href="${contextPath }/donation/admin" class="btn-inner--text" style="color: white;">기부글쓰기</a>
		            </button>
		        </div>
            </div>
            
            <div class="table-responsive">
                <table class="table align-items-center mb-0">
                    <thead>
                        <tr>
                            <th class="text-center text-uppercase text-secondary text-base font-weight-bolder opacity-7">업체명</th>
                            <th class="text-center text-uppercase text-secondary text-base font-weight-bolder opacity-7 ps-2">제목</th>
                            <th class="text-center text-uppercase text-secondary text-base font-weight-bolder opacity-7">모금금액</th>
                            <th class="text-center text-uppercase text-secondary text-base font-weight-bolder opacity-7">기간</th>
                            <th class="text-center text-uppercase text-secondary text-base font-weight-bolder opacity-7">수정 | 삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="donationList" items="${donationList}">
                            <tr>
                                <td class="align-middle text-center text-s">
                                       
                                        <div class="d-flex flex-column justify-content-center">
                                            <h6 class="mb-0 text-s" >${donationList.office }</h6>
                                        </div>

                                </td>
                                <td class="align-middle text-center text-s"><a href="${contextPath}/donation/read?num=${donationList.num}">
                                        <p class="text-s font-weight-bold mb-0">${donationList.title }</p>
                                    </a></td>
                                <td class="align-middle text-center text-s"><span class="text-secondary text-s font-weight-bold">
                                        <fmt:formatNumber value="${donationList.targetAmount}" pattern="###,###,###원" />
                                    </span></td>
                                <td class="align-middle text-center"><span class="text-secondary text-s font-weight-bold">
                                        <fmt:formatDate value="${donationList.date}" pattern="yyyy-MM-dd" /></span></td>
                                <td class="align-middle text-center">
		                                <span class="badge badge-sm bg-gradient-warning" style="width: 70px;">
		                    		<a href="<c:url value='/donation/modify?num=${donationList.num}'/>" class="font-weight-bold text-s" data-toggle="tooltip" data-original-title="Edit user" style="color: white !important;">수정</a>
		                     	</span> 
		                    	<span class="badge badge-sm bg-gradient-danger" style="color:red; width: 70px;">
		                    		<button class="font-weight-bold text-s delBtn" data-toggle="tooltip" data-donation-num="${donationList.num}" style="color: white !important; background-color: transparent; border: none;">삭제</button>
		                     	</span>
		                     	</td>
                            </tr>
                            
                        </c:forEach>
                    </tbody>
                </table>
                <br><br>
            </div>
        </div>
        <br>
        <div class="underpage">
           	<div class="paging">
                 <c:forEach begin="${donationAdminList.startPage}" end="${donationAdminList.endPage}" var="page">
                     <a href="${contextPath}/donation/adminList/${donationAdminList.makeSearch(page)}">
                     	<button>${page}</button>
                     </a>
                 </c:forEach>
            </div> 
        </div>
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
        </c:when>
    <c:otherwise>
        <c:redirect url="/WEB-INF/views/error/error404.jsp" />
    </c:otherwise>
</c:choose>
</body>

</html>