<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="userInfo" value="${sessionScope.userInfo}" /> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../../resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../../resources/assets/img/favicon.png">
  <title>
    Argon Dashboard 2 by Creative Tim
  </title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
   <!-- jQuery 및 ajaxfileupload.js 스크립트 포함 -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="path/to/ajaxfileupload.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxfileupload/1.0.3/ajaxfileupload.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.3.0/dropzone.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.3.0/dropzone.js"></script>

<style>
:root {
  --bgColor: #3a3a3a;
  --hoverBg: #616161;
  --text: #bbb;
}

.container {
  width: clamp(0px, 100%, 512px);
  margin: 32px auto;
  text-align: center;
}

.label {
  width: 100%;
  margin: 0px auto;
  cursor: pointer;
}

.inner {
  width: 100%;
  height: 128px
  margin: 64px auto;
  border-radius: 8px;
  font-size: 16px;
  line-height: 128px;
  color: var(--text);
}

@media (any-hover: hover){
  .inner:hover{
    background-color: #5e72e4;
  }
}

.label--hover{
  background-color: #5e72e4;
}

.preview-title{
  font-size: 32px;
  margin-bottom: 8px;
}

.preview {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
  padding: 16px;
  margin-bottom: 16px;
  border-radius: 8px;
  align-items: center;
  border: 2px dashed #5e72e4;
}

.preview-title2{
  font-size: 32px;
  margin-bottom: 8px;
}

.preview2 {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
  padding: 16px;
  margin-bottom: 16px;
  border-radius: 8px;
  align-items: center;
  border: 2px dashed #5e72e4;
}

.preview-title3{
  font-size: 32px;
  margin-bottom: 8px;
}

.preview3 {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
  padding: 16px;
  margin-bottom: 16px;
  border-radius: 8px;
  align-items: center;
  border: 2px dashed #5e72e4;
}

.embed-img{
  width: 100%;
  height: 128px;
  object-position: center;
  object-fit: cover;
  border-radius: 8px;
}

html, body {
  height: 100%;
}
#actions {
  margin: 2em 0;
}


/* Mimic table appearance */
div.table {
  display: table;
}
div.table .file-row {
  display: table-row;
}
div.table .file-row > div {
  display: table-cell;
  vertical-align: top;
  border-top: 1px solid #ddd;
  padding: 8px;
}
div.table .file-row:nth-child(odd) {
  background: #f9f9f9;
}



/* The total progress gets shown by event listeners */
#total-progress {
  opacity: 0;
  transition: opacity 0.3s linear;
}

/* Hide the progress bar when finished */
#previews .file-row.dz-success .progress {
  opacity: 0;
  transition: opacity 0.3s linear;
}

/* Hide the delete button initially */
#previews .file-row .delete {
  display: none;
}

/* Hide the start and cancel buttons and show the delete button */

#previews .file-row.dz-success .start,
#previews .file-row.dz-success .cancel {
  display: none;
}
#previews .file-row.dz-success .delete {
  display: block;
}



input[type=file]::file-selector-button {
  width: 90px;
  background: #fff;
  border: 1px #fff;
  color: #5e72e4;
  border-radius: 10px;
  cursor: pointer;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}

    .drop-zone {
        border: 2px dashed #5e72e4;
        border-radius: 10px;
        padding: 20px;
        text-align: center;
        cursor: pointer;
    }

    .drag-over {
        background-color: #5e72e4;
    }

    .drop-zone-text {
        font-size: 18px;
        color: #666;
    }

    .image-preview {
        margin-top: 10px;
    }

    .delete-button {
    	width:100px;
        display: none;
        margin: 10px 0 10px 0;
        background-color: #5e72e4;
        border-radius: 10px;
        color: white;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        display:inline-block;
    }
    
    .delectContainer{
      text-align:right;
    }
  .image-container {
    display: inline-block;
    max-width: 100%;
    overflow-x: auto;
    white-space: nowrap;
  }

  .image-container img {
    max-width: 100%;
    height: auto;
  }

.categorysearch {
  display: flex;
  justify-content: space-between;
  padding : 10px 20px 10px 20px;
  margin-bottom:50px;
}
  
  .category-item select {
  width: 300px;
  height: 50px;
  padding : 10px 20px 10px 20px;
  font-size: 20px;
  background-color: #fff;
  border: 1px solid #C4C4C4;
  box-sizing: border-box;
  border-radius: 10px;
  cursor: pointer;*/
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}


.category-item select:hover {
  border: 1px solid #9B51E0;
  outline: 3px solid #F8E4FF;
}

select option {
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


</style>
</head>
<body>

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
          <a class="nav-link active " href="${pageContext.request.contextPath}/admin/list?mainCategory=&region=&page=1">
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
   
  <form action="<c:url value='/admin/${campaign.id}/editCampaign'/>" method="post" enctype="multipart/form-data">
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-md-8">
          <div class="card">
            <div class="card-header pb-0">
              <div class="d-flex align-items-center">
                <p class="mb-0">캠페인 수정</p>
                <button class="btn btn-primary btn-sm ms-auto">등록</button>
              </div>
            </div>
            <div class="card-body">
              <p class="text-uppercase text-sm">캠페인 정보</p>
              <div class="row">
     
				
				<main class="container">
				    <label class="label" id="label" for="imageFile">대표 이미지 업로드</label>
				<div class="drop-zone" id="imageDropZone">  <span class="drop-zone-text">파일을 드래그 앤 드랍하세요.</span>
				    <input id="imageFile" name="imageFile" class="input" accept="image/*" type="file" required multiple>
				</div>
				
				
				    <p class="preview-title">preview</p>
				    <div class="preview" id="preview">
				    </div>        
				</main>
				
				<main class="container">
				    <label class="label" id="label" for="subImageFiles">서브 이미지 업로드</label>
				<div class="drop-zone" id="imageDropZone">  <span class="drop-zone-text">파일을 드래그 앤 드랍하세요.</span>
				    <input id="subImageFiles" name="subImageFiles" class="input" accept="image/*" type="file" required multiple>
				</div>
				
				    <p class="preview-title2">preview</p>
				    <div class="preview2" id="preview2">
				
				    </div>
				
				</main>
				
				
				<main class="container">
				    <label class="label" id="label" for="detailImageFiles">상세 페이지 업로드</label>
				<div class="drop-zone" id="imageDropZone">  <span class="drop-zone-text">파일을 드래그 앤 드랍하세요.</span>
				          <input id="detailImageFiles" name="detailImageFiles" class="input" accept="image/*" type="file" required multiple ></div>
				    <p class="preview-title3">preview</p>
				    <div class="preview3" id="preview3">
				
				    </div>
				
				</main>
			
				<script>
				
				var input = document.getElementById("imageFile");
				var subinput = document.getElementById("subImageFiles");
				var detailinput = document.getElementById("detailImageFiles");
				var initLabel = document.getElementById("label");
				
				input.addEventListener("change", (event) => {
				  const files = changeEvent(event);
				  handleUpdate(files);
				});
				
				subinput.addEventListener("change", (event) => {
					  const files = changeEvent(event);
					  handleUpdate2(files);
				});
				
				detailinput.addEventListener("change", (event) => {
					  const files = changeEvent(event);
					  handleUpdate3(files);
				});
				
				initLabel.addEventListener("mouseover", (event) => {
				  event.preventDefault();
				  const label = document.getElementById("label");
				  label?.classList.add("label--hover");
				});
				
				initLabel.addEventListener("mouseout", (event) => {
				  event.preventDefault();
				  const label = document.getElementById("label");
				  label?.classList.remove("label--hover");
				});
				
				document.addEventListener("dragenter", (event) => {
				  event.preventDefault();
				  console.log("dragenter");
				  if (event.target.className === "inner") {
				    event.target.style.background = "#616161";
				  }
				});
				
				document.addEventListener("dragover", (event) => {
				  console.log("dragover");
				  event.preventDefault();
				});
				
				document.addEventListener("dragleave", (event) => {
				  event.preventDefault();
				  console.log("dragleave");
				  if (event.target.className === "inner") {
				    event.target.style.background = "#3a3a3a";
				  }
				});
				
				document.addEventListener("drop", (event) => {
				  event.preventDefault();
				  console.log("drop");
				  if (event.target.className === "inner") {
				    const files = event.dataTransfer?.files;
				    event.target.style.background = "#3a3a3a";
				    handleUpdate([...files]);
				  }
				});
				
				function changeEvent(event){
				  const { target } = event;
				  return [...target.files];
				};
				
				function handleUpdate(fileList){
				  const preview = document.getElementById("preview");
				
				  fileList.forEach((file) => {
				    const reader = new FileReader();
				    reader.addEventListener("load", (event) => {
				      const img = el("img", {
				        className: "embed-img",
				        src: event.target?.result,
				      });
				      const imgContainer = el("div", { className: "container-img" }, img);
				      preview.append(imgContainer);
				    });
				    reader.readAsDataURL(file);
				  });
				};
				
				function handleUpdate2(fileList){
				  const preview = document.getElementById("preview2");
				
				  fileList.forEach((file) => {
				    const reader = new FileReader();
				    reader.addEventListener("load", (event) => {
				      const img = el("img", {
				        className: "embed-img",
				        src: event.target?.result,
				      });
				      const imgContainer = el("div", { className: "container-img" }, img);
				      preview.append(imgContainer);
				    });
				    reader.readAsDataURL(file);
				  });
				};
				
				function handleUpdate3(fileList){
				  const preview = document.getElementById("preview3");
				
				  fileList.forEach((file) => {
				    const reader = new FileReader();
				    reader.addEventListener("load", (event) => {
				      const img = el("img", {
				        className: "embed-img",
				        src: event.target?.result,
				      });
				      const imgContainer = el("div", { className: "container-img" }, img);
				      preview.append(imgContainer);
				    });
				    reader.readAsDataURL(file);
				  });
				};
				
				function el(nodeName, attributes, ...children) {
				  const node =
				    nodeName === "fragment"
				      ? document.createDocumentFragment()
				      : document.createElement(nodeName);
				
				  Object.entries(attributes).forEach(([key, value]) => {
				    if (key === "events") {
				      Object.entries(value).forEach(([type, listener]) => {
				        node.addEventListener(type, listener);
				      });
				    } else if (key in node) {
				      try {
				        node[key] = value;
				      } catch (err) {
				        node.setAttribute(key, value);
				      }
				    } else {
				      node.setAttribute(key, value);
				    }
				  });
				
				  children.forEach((childNode) => {
				    if (typeof childNode === "string") {
				      node.appendChild(document.createTextNode(childNode));
				    } else {
				      node.appendChild(childNode);
				    }
				  });
				
				  return node;
				}
				</script>

    
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
				</div>
			
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">캠페인명</label>
                    <input class="form-control" type="text" name="campaignName" value="${campaign.campaignName}">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                  
                    <label for="example-text-input" class="form-control-label">제공단가</label>
                    <input class="form-control" type="text" name="campaignPrice" value="${campaign.campaignPrice}">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">캠페인 신청 시작일</label>
                    <input class="form-control" type="date" name="startDate" value="${campaign.startDate}">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">캠페인 신청 종료일</label>
                    <input class="form-control" type="date" name="endDate" value="${campaign.endDate}">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">캠페인 선정일</label>
                    <input class="form-control" type="date" name="selectDate" value="${campaign.selectDate}">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">캠페인 등록 시작일</label>
                    <input class="form-control" type="date" name="registrationStart" value="${campaign.selectDate}">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">캠페인 등록 종료일</label>
                    <input class="form-control" type="date" name="registrationEnd" value="${campaign.selectDate}">
                  </div>
                </div>
                <div class="col-md-6">
				  <div class="form-group">
				    <label for="example-text-input" class="form-control-label">선정자 수</label>
				    <input class="form-control" type="number" name="selectedCandidates" min="0" value="${campaign.selectedCandidates}">
				  </div>
				</div>  
              </div>
              
<p class="text-uppercase text-sm">캠페인 유형</p>
<label>
    <input type="checkbox" id="naverblogCheckbox" name="campaignTypes" value="naverblog">
    <img src="../../resources/images/snsIcon/naverblog.png" alt="">
</label>
<label>
    <input type="checkbox" id="instagramCheckbox" name="campaignTypes" value="instagram">
    <img src="../../resources/images/snsIcon/instagram.png" alt="">
</label>
<label>
    <input type="checkbox" id="youtubeCheckbox" name="campaignTypes" value="youtube">
    <img src="../../resources/images/snsIcon/youtube.png" alt="">
</label>

<script>
//campaignTypes 값 가져오기 (예: ["youtube", "instagram"])
var campaignTypes = "${campaign.campaignTypes};" 

var naverblogCheckbox = document.getElementById("naverblogCheckbox");
var instagramCheckbox = document.getElementById("instagramCheckbox");
var youtubeCheckbox = document.getElementById("youtubeCheckbox");

// 배열에서 해당 값을 찾아 체크박스를 체크하거나 해제합니다.
if (campaignTypes.includes("naverblog")) {
    naverblogCheckbox.checked = true;
}

if (campaignTypes.includes("instagram")) {
    instagramCheckbox.checked = true;
}

if (campaignTypes.includes("youtube")) {
    youtubeCheckbox.checked = true;
}

</script>
	              
              <hr class="horizontal dark">
              <p class="text-uppercase text-sm">상세정보</p>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">제공내역</label>
                    <textarea class="form-control" id="multiline-input" name="providedDetails" rows="4" cols="50">${campaign.providedDetails}</textarea>
	                <div class="col-md-12">
	                  <div class="form-group">
	                    <label for="example-text-input" class="form-control-label">키워드</label>
	                    <input class="form-control" type="text" name="keyword" value="${campaign.keyword}">
	                  </div>
	                </div>    
	                <div class="col-md-12">
	                  <div class="form-group">
	                    <label for="example-text-input" class="form-control-label">안내사항</label>
	                     <textarea class="form-control" id="multiline-input" name="notification" rows="4" cols="50">${campaign.notification}</textarea>
	                  </div>
	                </div>    
	                <div class="col-md-12">
	                  <div class="form-group">
	                    <label for="example-text-input" class="form-control-label">업체정보</label>
	                   <textarea class="form-control" id="multiline-input" name="companyInformation" rows="4" cols="50">${campaign.companyInformation}</textarea>
	                  </div>
	                </div>              
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        </form>
       
	
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
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../../resources/assets/js/argon-dashboard.min.js?v=2.0.4"></script>

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
    

    // 초기에 mainCategory 값을 설정
    var initialMainCategory = "${campaign.mainCategory}"; // 이 값을 적절한 값으로 설정해야 합니다.
    mainCategorySelect.val(initialMainCategory);
    
    // 초기 subCategory 값을 설정
    var initialSubCategory = "${campaign.subCategory}"; // 서버에서 가져온 값을 설정해야 합니다.
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


    // 초기에 "${campaign.region}" 카테고리를 설정
    var initialRegion = "${campaign.region}"; // 서버에서 가져온 값을 설정해야 합니다.
    regionSelect.val(initialRegion);

    // 초기 설정값에 따라 두 번째 카테고리 option 값 설정
    var initialCity = "${campaign.city}"; // 서버에서 가져온 값을 설정해야 합니다.
    setCityOptions(initialRegion, initialCity);

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


$(document).ready(function() {
    // 파일 드래그 앤 드롭 영역 설정
    function setDropZone(dropZoneId, fileInputId, previewId, deleteButtonId) {
        var dropZone = document.getElementById(dropZoneId);
        var fileInput = document.getElementById(fileInputId);
        var preview = document.getElementById(previewId);
        var deleteButton = document.getElementById(deleteButtonId);

        dropZone.addEventListener("dragover", function(e) {
            e.preventDefault();
            dropZone.classList.add("drag-over");
        });

        dropZone.addEventListener("dragleave", function(e) {
            e.preventDefault();
            dropZone.classList.remove("drag-over");
        });

        dropZone.addEventListener("drop", function(e) {
            e.preventDefault();
            dropZone.classList.remove("drag-over");

            var files = e.dataTransfer.files;
            fileInput.files = files;

            // 파일 선택을 통한 업로드 시 미리보기 업데이트
            updatePreview(files, preview, deleteButton);
        });

        // 파일 선택(input) 이벤트 처리
        fileInput.addEventListener("change", function() {
            var files = fileInput.files;
            // 파일 선택을 통한 업로드 시 미리보기 업데이트
            updatePreview(files, preview, deleteButton);
        });
    }


 // 이미지 미리보기 업데이트 함수
    function updatePreview(files, preview, deleteButton, fileInput) {
        // 이미지 추가할 컨테이너 선택
        var container = preview;
        
        // 파일 갯수 업데이트
        var fileCountDisplay = document.getElementById("fileCountDisplay");
        fileCountDisplay.textContent = files.length + "개 파일 선택됨"; // 파일 갯수 업데이트
        
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            if (file.type.startsWith("image/")) {
                var reader = new FileReader();
                reader.onload = function(event) {
                    var img = document.createElement("img");
                    img.src = event.target.result;
                    img.width = 300; // 이미지 크기 조절
                    container.appendChild(img);

                    // 삭제 버튼 클릭 시 해당 이미지 및 삭제 버튼 제거
                    var deleteButton = document.createElement("button");
                    deleteButton.className = "delete-button";
                    deleteButton.innerText = "삭제";
                    deleteButton.onclick = function() {
                        container.removeChild(img); // 이미지 제거
                        container.removeChild(deleteButton); // 삭제 버튼 제거
                        // 해당 이미지와 관련된 파일을 파일 입력 필드에서 제거
                        var index = Array.from(fileInput.files).indexOf(file);
                        if (index !== -1) {
                            fileInput.files = Array.from(fileInput.files).filter(
                                (_, i) => i !== index
                            );
                        }
                    };
                    container.appendChild(deleteButton);
                };
                reader.readAsDataURL(file);
            }
        }
    }

       // 대표 이미지 드래그 앤 드랍 설정
       setDropZone("imageDropZone", "imageFile", "imagePreview", "deleteImage");

       // 서브 이미지 드래그 앤 드랍 설정
       setDropZone("subImageDropZone", "subImageFiles", "subImagePreview", "deleteSubImages");

       // 상세 페이지 이미지 드래그 앤 드랍 설정
       setDropZone("detailImageDropZone", "detailImageFile", "detailImagePreview", "deleteDetailImages");

       // 대표 이미지 업로드
       $("#uploadImage").on("click", function() {
           // 업로드 코드는 이전 예제와 동일하게 사용 가능
       });

       // 서브 이미지 업로드
       $("#uploadSubImages").on("click", function() {
           // 업로드 코드는 이전 예제와 동일하게 사용 가능
       });

       // 상세 페이지 이미지 업로드
       $("#uploadDetailImages").on("click", function() {
           // 업로드 코드는 이전 예제와 동일하게 사용 가능
       });
       
    // 대표 이미지 삭제 버튼 클릭 시
       $("#deleteImage").on("click", function() {
           // 대표 이미지 업로드 필드 초기화
           var imageFile = document.getElementById("imageFile");
           imageFile.value = '';

           // 대표 이미지 미리보기 초기화
           var imagePreview = document.getElementById("imagePreview");
           imagePreview.innerHTML = '';
       });

       // 서브 이미지 삭제 버튼 클릭 시
       $("#deleteSubImages").on("click", function() {
           // 서브 이미지 업로드 필드 초기화
           var subImageFiles = document.getElementById("subImageFiles");
           subImageFiles.value = '';

           // 서브 이미지 미리보기 초기화
           var subImagePreview = document.getElementById("subImagePreview");
           subImagePreview.innerHTML = '';
       });

       // 상세 페이지 이미지 삭제 버튼 클릭 시
       $("#deleteDetailImages").on("click", function() {
           // 상세 페이지 이미지 업로드 필드 초기화
           var detailImageFile = document.getElementById("detailImageFiles");
           detailImageFile.value = '';

           // 상세 페이지 이미지 미리보기 초기화
           var detailImagePreview = document.getElementById("detailImagePreview");
           detailImagePreview.innerHTML = '';
       });


       $("#deleteImage").on("click", function(event) {
   	    event.preventDefault();
   	    // 폼 제출 방지 코드 추가
   	    // 이 부분에 파일 삭제 및 관련 동작을 추가할 수 있습니다.
   	});
      
      $("#deleteSubImages").on("click", function(event) {
  	    event.preventDefault();
  	    // 폼 제출 방지 코드 추가
  	    // 이 부분에 파일 삭제 및 관련 동작을 추가할 수 있습니다.
	   	});
      
      $("#deleteDetailImages").on("click", function(event) {
  	    event.preventDefault();
  	    // 폼 제출 방지 코드 추가
  	    // 이 부분에 파일 삭제 및 관련 동작을 추가할 수 있습니다.
	   	});
       

   });




//Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
var previewNode = document.querySelector("#template");
previewNode.id = "";
var previewTemplate = previewNode.parentNode.innerHTML;
previewNode.parentNode.removeChild(previewNode);

var myDropzone = new Dropzone(".container", { // Make the whole body a dropzone
  url: "https://httpbin.org/post", // Set the url
  thumbnailWidth: 80,
  thumbnailHeight: 80,
  parallelUploads: 20,
  previewTemplate: previewTemplate,
  autoQueue: false, // Make sure the files aren't queued until manually added
  previewsContainer: "#previews", // Define the container to display the previews
  clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
});

myDropzone.on("addedfile", function(file) {
  // Hookup the start button
  file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file); };
});

// Update the total progress bar
myDropzone.on("totaluploadprogress", function(progress) {
  document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
});

myDropzone.on("sending", function(file) {
  // Show the total progress bar when upload starts
  document.querySelector("#total-progress").style.opacity = "1";
  // And disable the start button
  file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
});

// Hide the total progress bar when nothing's uploading anymore
myDropzone.on("queuecomplete", function(progress) {
  document.querySelector("#total-progress").style.opacity = "0";
});

// Setup the buttons for all transfers
// The "add files" button doesn't need to be setup because the config
// `clickable` has already been specified.
document.querySelector("#actions .start").onclick = function() {
  myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
};
document.querySelector("#actions .cancel").onclick = function() {
  myDropzone.removeAllFiles(true);
};


</script>
</c:when>
    <c:otherwise>
        <c:redirect url="/WEB-INF/views/error/error404.jsp" />
    </c:otherwise>
</c:choose>
</body>
</body>
</html>