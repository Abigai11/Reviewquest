<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" flush="false" />
<%@ page import="com.project.reviewquest.campaign.CampaignDTO" %>
<html>
<head>
    <title>Title</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      
</head>
<body>
<style>
.mainimage{
  border-radius: 5px;
}
.categorysearch {
  padding: 10px 20px 10px 20px;
}

.category {
  margin: 20px 0px;/* 아이템 간의 가로 간격 설정 */
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
  width:100%;
  display: flex;
  justify-content: flex-start; /* 가운데 정렬 */
}

.cate_search_area {
  margin: 5% 0 10% 0;
}

.campaignbox {
  margin: 5% 0% 5% 0%;
  display: grid;
  grid-template-columns: repeat(7, 1fr); /* 가로로 5개씩 배치 */
  grid-gap: 20px; /* 아이템 간의 간격 설정 */
  justify-content: center; /* 아이템을 가운데 정렬 */
  position: relative; /* 부모 요소를 relative로 설정 */
}


.cate_list_rows {
  flex: 0 0 calc(20% - 20px); /* 가로로 5개씩 배치하므로 20%로 설정하고 간격 고려 */
}

  .list {
    display: flex;
    justify-content: center;
    border-top:1px solid #ddd;
  }
  
/* 검색 버튼 스타일 */
input[type="submit"] {
  width: 200px;
  height: 50px;
  background-color: #0067ff;
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
  margin-top: -30px;
}

input[type="submit"]:hover {
  background-color: #fff;
  color: #0067ff;
  border:1px solid #5e72e4;
}

.register {
  width: 100px;
  height: 50px;
  background-color: #0067ff;
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
    cursor:pointer;
  
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
    bottom: 10px;
    left: 50%;
    margin-top:20px;
    
}

.category-item {
    z-index: 1;
}
.paging button {
    background-color: #0067ff;
    color: white;
    border: 1px solid #fff;
    padding: 10px 20px;
    margin: 0 5px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
}

.paging button:hover {
    background-color: #fff;
    color: #0067ff;
    border: 1px solid #0067ff;
    padding: 10px 20px;
    margin: 0 5px;
    text-decoration: none;
    border-radius: 10px;
    font-weight:bold;
    cursor:pointer;
    
}

.paging_active {
    background-color: #fff !important;
    color: #0067ff !important;
    border: 1px solid #0067ff !important;
    padding: 10px 20px !important;
    margin: 0 5px !important;
    text-decoration: none !important;
    border-radius: 10px !important;
    font-weight:bold !important;
    cursor:pointer !important;
    
}


.category-item button {
    background-color: #0067ff;
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
    cursor:pointer;
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
  /* 말줄임 */
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}


.category-item select:hover {
  border: 1px solid #0067ff;
  outline: 3px solid #F8E4FF;
  cursor:pointer;
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
  border: 1px solid #0067ff;
  box-sizing: border-box;
  border-radius: 10px;
  cursor: pointer;
  text-align: center;
  /* 말줄임 */
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}

/* 공통 스타일 */
#catemenu {
    border-bottom: 3px solid #0067ff;
    color: #000;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    padding: 10px 12px 8px 10px;
    font-size: 20px;
}

#catemenu:hover {
    border-bottom: 3px solid #0067ff;
    color: #000;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    padding: 10px 12px 8px 10px;
    font-size: 20px;
}

/* 메뉴 바 스타일 */
.categorybox {
    text-align: center;
}

.menubar {
    list-style: none;
    padding: 0;
    display: flex;
    justify-content: flex-start;
    margin: 20px 0 0 4%;
}

.menubar li {
    margin: 0 10px;
    font-size:30px;
    font-weight: bold;
}

/* 카테고리 메뉴 스타일 */
.categorymenu {
    list-style: none;
    padding: 0;
    display: flex;
    justify-content: flex-start;
    margin: 20px 0 0 4%;
}

.categorymenu2 {
    list-style: none;
    padding: 0;
    display: flex;
    justify-content: flex-start;
    margin: 20px 0 0 4%;
}

/* 선택된 항목 스타일 */
button.selected {
    background-color: #e74c3c;
}S

.noto400{
	display:flex;
}

.all_menu_left_area1{
	width:100%;
	display:flex;
	flex-wrap: wrap;
}


.menu_2st {
    display: flex;
    flex-wrap: wrap;
}

.menu_2st a {
    margin-right: 10px;
    margin-bottom: 10px;
}
    
.menu_2st {
        display: none;
    }
    
.all_menu_content1 .menu_2st a:hover {
	background: #0067ff;
	color:#FFF;
	cursor:pointer;
}    

.all_menu_content1 .menu_1st:hover {
	color: #0067ff;
	cursor:pointer;
}

.menu_3st {
	font-size: 18px;
    color: #000;
    border-radius: 20px;
    min-width: 80px;
    height: 40px;
    margin: 0 10px 13px 0;
    line-height: 36px;
    display: inline-block;
    text-align: center;
    padding: 0 10px;
}
.all_menu_content1 .menu_1st{
	font-size: 18px;
    color: #999;
    background: #fff;
    border: 1px solid #999;
    font-weight: bold;
    border-radius: 20px;
    width: 100px;
    height: 40px;
    margin: 0 10px 13px 0;
    line-height: 36px;
    display: inline-block;
    text-align: center;
    padding:0 10px;
}
.menu1 {
    cursor: pointer;
    border: 2px solid #f2b22a;
    border-radius: 10px;
    font-size: 20px;
    height: 50px;
    background-image: none;
    -webkit-box-align: center;
    align-items: center;
    display: inline-flex;
    justify-content: center;
    padding: 0 20px 0 25px;
    background-color: #f2b22a;
    color: #3e3a39;
    font-weight: 600;
    position: relative;
}

.menu_2st a {
	font-size: 15px;
    color: #999;
    background: #fff;
    border: 1px solid #999;
    border-radius: 20px;
    width: auto;
    min-width:80px;
    height: 40px;
    margin: 0 10px 13px 0;
    line-height: 36px;
    display: inline-block;
    text-align: center;
    padding:0px 20px;
}

.div_category_background{
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.8);
      z-index: 1;
      overflow: auto;
}

.div_category{
            background-color: #f9f9f9;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%) scale(0.9);
            transform-origin: center;
            width: 80%;
            max-width: 1100px; /* 팝업 너비를 조정 */
            padding: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            z-index: 2;
            transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
            border-radius: 8px; /* 팝업을 둥글게 만듦 */
}

.close-button {
    float: right;
    font-size: 24px;
    color: #333;
}

.close-button:hover {
	cursor: pointer;
}

.area_select_popup .pop .txt_bold {
    border: none;
    padding-bottom: 0;
    display: inline-block;
    margin: 5px 10px 0 0;
    line-height: 40px;
}

.txt_bold>span {
    color: #0067ff;
}

a.all_area {
    font-size: 18px;
    color: #fff;
    font-weight: 700;
    background-color: #0067ff;
    padding: 0 25px;
    height: 40px;
    margin-left: 5px;
    -webkit-box-align: center;
    align-items: center;
    display: flex;
    justify-content: center;
    border-radius: 25px;
}

/* 메뉴 1st를 가로로 배치하기 위해 Flexbox를 사용합니다. */
.menu-container {
    display: flex;
    flex-direction: row;
}

.menu-box {
    margin-right: 20px; /* 메뉴 간격 조절 */
}

/* 하위 메뉴 3st 요소를 초기에 숨깁니다. */
.sub-menu-container {
    display: none;
}

/* 하위 메뉴를 보여줄 때의 스타일 */
.sub-menu-container.active {
    display: block;
    position: relative;
    background: #fff;
    border: 1px solid #ccc;
    padding: 10px;
    z-index: 1;
    width:100%;
}

.menu {
    cursor: pointer;
    border: 2px solid #0067ff;
    border-radius: 4px;
    font-size: 20px;
    height: 50px;
    background-image: none;
    -webkit-box-align: center;
    align-items: center;
    display: inline-flex;
    justify-content: center;
    padding: 0 20px 0 25px;
    background-color: #0067ff;
    color: #fff;
    font-weight: 600;
    position: relative;
}

.menu_text{
	display: inline-flex;
    font-size: 20px;
    color: #fff;
    font-weight: 600;
}

.menu_3st:hover{
	color:#0067ff;
	cursor:pointer;
}

/* 활성화된 탭의 스타일 */
.categorymenu button.active,
.categorymenu2 button.active {
    border-bottom: 3px solid #0067ff !important;

}

.rows_cate {
	background:#0067ff;
	color:#fff;
}

.rows_cate:hover {
	color:#fff;
	cursor:auto;
}
</style>

<div id="div_category_background" class="div_category_background">
   <div id="div_category1" class="div_category">
                    <div id="table_category" class="div_cate_inner">
                    <span class="close-button" onclick="CategoryModal()">&times;</span>
                       <div style="-webkit-box-align: center;align-items: center;display: flex;margin-bottom: 20px;">
		                  <a href="" class="all_area">전체 지역 보기</a>
		               </div>
                        <div class="all_menu_content1">
                            <div class="all_menu_left_area1">                           
                                <div class="menu_box">
                                    <a class="menu_1st noto500">서울</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                    	<button class="menu_3st">강남구</button>
                                        <button class="menu_3st">강동구</button>
                                        <button class="menu_3st">강북구</button>
                                        <button class="menu_3st">강서구</button>
                                    	<button class="menu_3st">관악구</button>
                                        <button class="menu_3st">광진구</button>
                                        <button class="menu_3st">구로구</button>
                                        <button class="menu_3st">금천구</button>
                                    	<button class="menu_3st">노원구</button>
                                        <button class="menu_3st">도봉구</button>
                                        <button class="menu_3st">동대문구</button>
                                        <button class="menu_3st">동작구</button>
                                    	<button class="menu_3st">마포구</button>
                                        <button class="menu_3st">서대문구</button>
                                        <button class="menu_3st">서초구</button>
                                        <button class="menu_3st">성동구</button>     
                                        <button class="menu_3st">성북구</button>
                                        <button class="menu_3st">송파구</button>
                                    	<button class="menu_3st">양천구</button>
                                        <button class="menu_3st">영등포구</button>
                                        <button class="menu_3st">용산구</button>
                                        <button class="menu_3st">은평구</button>   
                                        <button class="menu_3st">종로구</button>
                                        <button class="menu_3st">중구</button>
                                        <button class="menu_3st">중랑구</button>                                                                                                                                                              
                                    </div>
                                </div>
                                <div class="menu_box">
                                    <a class="menu_1st noto500">경기도</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">가평군</button>
                                        <button class="menu_3st">고양시 덕양구</button>
                                        <button class="menu_3st">고양시 일산동구</button>
                                        <button class="menu_3st">고양시 일산서구</button>
                                        <button class="menu_3st">과천시</button>
                                        <button class="menu_3st">광명시</button>
                                        <button class="menu_3st">광주시</button>
                                        <button class="menu_3st">구리시</button>
                                        <button class="menu_3st">군포시</button>
                                        <button class="menu_3st">김포시</button>
                                        <button class="menu_3st">남양주시</button>
                                        <button class="menu_3st">동두천시</button>
                                        <button class="menu_3st">부천시</button>
                                        <button class="menu_3st">성남시 분당구</button>
                                        <button class="menu_3st">성남시 수정구</button>
                                        <button class="menu_3st">성남시 중원구</button>
                                        <button class="menu_3st">성남시 권선구</button>
                                        <button class="menu_3st">성남시 영통구</button>
                                        <button class="menu_3st">성남시 장안구</button>
                                        <button class="menu_3st">성남시 팔달구</button>
                                        <button class="menu_3st">시흥시</button>
                                        <button class="menu_3st">안산시 단원구</button>
                                        <button class="menu_3st">안산시 상록구</button>
                                        <button class="menu_3st">안성시</button>
                                        <button class="menu_3st">안양시 동안구</button>
                                        <button class="menu_3st">안양시 만안구</button>
                                        <button class="menu_3st">양주시</button>
                                        <button class="menu_3st">양평군</button>
                                        <button class="menu_3st">여주시</button>
                                        <button class="menu_3st">연천군</button>
                                        <button class="menu_3st">오산시</button>
                                        <button class="menu_3st">용인시 기흥구</button>
                                        <button class="menu_3st">용인시 수지구</button>
                                        <button class="menu_3st">용인시 처인구</button>
                                        <button class="menu_3st">의왕시</button>
                                        <button class="menu_3st">의정부시</button>
                                        <button class="menu_3st">이천시</button>
                                        <button class="menu_3st">파주시</button>
                                        <button class="menu_3st">평택시</button>
                                        <button class="menu_3st">포천시</button>
                                        <button class="menu_3st">하남시</button>
                                        <button class="menu_3st">화성시</button>
                                    </div>
                                </div>

                                <div class="menu_box">
                                    <a class="menu_1st noto500">인천</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">강화군</button>
                                        <button class="menu_3st">계양구</button>
                                        <button class="menu_3st">남동구</button>
                                        <button class="menu_3st">동구</button>
                                        <button class="menu_3st">미추홀구</button>
                                        <button class="menu_3st">부평구</button>
                                        <button class="menu_3st">서구</button>
                                        <button class="menu_3st">연수구</button>
                                        <button class="menu_3st">옹진군</button>
                                        <button class="menu_3st">중구</button>
                                    </div>
                                </div>

                                <div class="menu_box">
                                    <a class="menu_1st noto500">부산</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">강서구</button>
                                        <button class="menu_3st">금정구</button>
                                        <button class="menu_3st">기장군</button>
                                        <button class="menu_3st">남구</button>
                                        <button class="menu_3st">동구</button>
                                        <button class="menu_3st">동래구</button>
                                        <button class="menu_3st">부산진구</button>
                                        <button class="menu_3st">북구</button>
                                        <button class="menu_3st">사상구</button>
                                        <button class="menu_3st">사하구</button>
                                        <button class="menu_3st">서구</button>
                                        <button class="menu_3st">수영구</button>                                        
                                        <button class="menu_3st">연제구</button>
                                        <button class="menu_3st">영도구</button>
                                        <button class="menu_3st">중구</button>
                                        <button class="menu_3st">해운대구</button>      
                                    </div>
                                </div>
                                <div class="menu_box">
                                    <a class="menu_1st noto500">대구</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">남구</button>
                                        <button class="menu_3st">달서구</button>
                                        <button class="menu_3st">달성군</button>
                                        <button class="menu_3st">동구</button>
                                        <button class="menu_3st">북구</button>
                                        <button class="menu_3st">서구</button>
                                        <button class="menu_3st">수성구</button>
                                        <button class="menu_3st">중구</button>    
                                    </div>
                                </div>
                                <div class="menu_box">
                                    <a class="menu_1st noto500">광주</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">광산구</button>
                                        <button class="menu_3st">남구</button>
                                        <button class="menu_3st">동구</button>
                                        <button class="menu_3st">북구</button>
                                        <button class="menu_3st">서구</button> 
                                    </div>
                                </div>  
                                <div class="menu_box">
                                    <a class="menu_1st noto500">대전</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">대덕구</button>
                                        <button class="menu_3st">동구</button>
                                        <button class="menu_3st">서구</button>
                                        <button class="menu_3st">유성구</button>
                                        <button class="menu_3st">중구</button> 
                                    </div>
                                </div> 
                                <div class="menu_box">
                                    <a class="menu_1st noto500">울산</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">남구</button>
                                        <button class="menu_3st">동구</button>
                                        <button class="menu_3st">북구</button>
                                        <button class="menu_3st">울주군</button>
                                        <button class="menu_3st">중구</button> 
                                    </div>
                                </div> 
                                <div class="menu_box">
                                    <a class="menu_1st noto500">강원도</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">강릉시</button>
                                        <button class="menu_3st">고성군</button>
                                        <button class="menu_3st">동해시</button>
                                        <button class="menu_3st">삼척시</button>
                                        <button class="menu_3st">속초시</button> 
									   	<button class="menu_3st">양구군</button>
                                        <button class="menu_3st">양양군</button>
                                        <button class="menu_3st">영월군</button>
                                        <button class="menu_3st">원주시</button>
                                        <button class="menu_3st">인제군</button>     
                                        <button class="menu_3st">정선군</button>
                                        <button class="menu_3st">철원군</button>
                                        <button class="menu_3st">춘천시</button>
                                        <button class="menu_3st">태백시</button> 
									   	<button class="menu_3st">평창군</button>
                                        <button class="menu_3st">홍천군</button>
                                        <button class="menu_3st">화천군</button>
                                        <button class="menu_3st">횡성군</button>                                                                           
                                    </div>
                                </div>  
                                <div class="menu_box">
                                    <a class="menu_1st noto500">경상남도</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">거제시</button>
                                        <button class="menu_3st">거창군</button>
                                        <button class="menu_3st">고성군</button>
                                        <button class="menu_3st">김해시</button>
                                        <button class="menu_3st">남해군</button> 
									   	<button class="menu_3st">밀양시</button>
                                        <button class="menu_3st">사천시</button>
                                        <button class="menu_3st">사천군</button>
                                        <button class="menu_3st">양산시</button>
                                        <button class="menu_3st">의령군</button>     
                                        <button class="menu_3st">진주시</button>
                                        <button class="menu_3st">창녕군</button>
                                        <button class="menu_3st">창원시 마산합포구</button>
                                        <button class="menu_3st">창원시 마산회원구</button> 
									   	<button class="menu_3st">창원시 성산구</button>
                                        <button class="menu_3st">창원시 의창구</button>
                                        <button class="menu_3st">창원시 진해구</button>
                                        <button class="menu_3st">하동군</button>                       
                                        <button class="menu_3st">함안군</button>
                                        <button class="menu_3st">함양군</button>
                                        <button class="menu_3st">합천군</button>                                                     
                                    </div>
                                </div>  
                                <div class="menu_box">
                                    <a class="menu_1st noto500">경상북도</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">경산시</button>
                                        <button class="menu_3st">경주시</button>
                                        <button class="menu_3st">고령군</button>
                                        <button class="menu_3st">구미시</button>
                                        <button class="menu_3st">군위군</button> 
									   	<button class="menu_3st">김천시</button>
                                        <button class="menu_3st">문경시</button>
                                        <button class="menu_3st">봉화군</button>
                                        <button class="menu_3st">상주시</button>
                                        <button class="menu_3st">성주군</button>     
                                        <button class="menu_3st">안동시</button>
                                        <button class="menu_3st">영덕군</button>
                                        <button class="menu_3st">영양군</button>
                                        <button class="menu_3st">영주시</button> 
									   	<button class="menu_3st">영천시</button>
                                        <button class="menu_3st">예천군</button>
                                        <button class="menu_3st">을릉군</button>
                                        <button class="menu_3st">울진군</button>                       
                                        <button class="menu_3st">의성군</button>
                                        <button class="menu_3st">청도군</button>
                                        <button class="menu_3st">청송군</button>                                                     
                                        <button class="menu_3st">칠곡군</button>
                                        <button class="menu_3st">포항시 남구</button>
                                        <button class="menu_3st">포항시 북구</button>        
                                    </div>
                                </div> 
                                <div class="menu_box">
                                    <a class="menu_1st noto500">전라남도</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                       <button class="menu_3st">강진군</button>
                                       <button class="menu_3st">고흥군</button>
                                       <button class="menu_3st">곡성군</button>
                                       <button class="menu_3st">광양시</button>
                                       <button class="menu_3st">구례군</button> 
									   <button class="menu_3st">나주시</button>
                                       <button class="menu_3st">담양군</button>
                                       <button class="menu_3st">목포시</button>
                                       <button class="menu_3st">무안군</button>
                                       <button class="menu_3st">보성군</button>     
                                       <button class="menu_3st">순천시</button>
                                       <button class="menu_3st">신안군</button>
                                       <button class="menu_3st">여수시</button>
                                       <button class="menu_3st">영광군</button> 
									   <button class="menu_3st">영암군</button>
                                       <button class="menu_3st">완도군</button>
                                       <button class="menu_3st">장성군</button>
                                       <button class="menu_3st">장흥군</button>                       
                                       <button class="menu_3st">진도군</button>
                                       <button class="menu_3st">함평군</button>
                                       <button class="menu_3st">해남군</button>                                                     
                                       <button class="menu_3st">화순군</button> 
                                    </div>
                                </div>   
                                <div class="menu_box">
                                    <a class="menu_1st noto500">전라북도</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">고창군</button>
                                        <button class="menu_3st">군산시</button>
                                        <button class="menu_3st">김제시</button>
                                        <button class="menu_3st">남원시</button>
                                        <button class="menu_3st">무주군</button>
									   	<button class="menu_3st">부안군</button>
                                        <button class="menu_3st">순창군</button>
                                        <button class="menu_3st">완주군</button>
                                        <button class="menu_3st">익산시</button>
                                        <button class="menu_3st">임실군</button>  
                                        <button class="menu_3st">장수군</button>
                                        <button class="menu_3st">전주시 덕진구</button>
                                        <button class="menu_3st">전주시 완산구</button>
                                        <button class="menu_3st">정읍시</button>
									   <button class="menu_3st">진안군</button>
                                    </div>
                                </div> 
                                <div class="menu_box">
                                    <a class="menu_1st noto500">충청남도</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">계룡시</button>
                                        <button class="menu_3st">공주시</button>
                                        <button class="menu_3st">금산군</button>
                                        <button class="menu_3st">논산시</button>
                                        <button class="menu_3st">당진군</button>
									  	<button class="menu_3st">당진시</button>
                                        <button class="menu_3st">보령시</button>
                                        <button class="menu_3st">부여군</button>
                                        <button class="menu_3st">서산시</button>
                                        <button class="menu_3st">서천군</button>    
                                        <button class="menu_3st">아산시</button>
                                        <button class="menu_3st">연기군</button>
                                        <button class="menu_3st">예산군</button>
                                        <button class="menu_3st">천안시 동남구</button>
									   	<button class="menu_3st">천안시 서북구</button>
                                        <button class="menu_3st">청양군</button>
                                        <button class="menu_3st">태안군</button>
									   	<button class="menu_3st">홍성군</button>
                                    </div>
                                </div>     
                                <div class="menu_box">
                                    <a class="menu_1st noto500">충청북도</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">괴산군</button>
                                        <button class="menu_3st">단양군</button>
                                        <button class="menu_3st">보은군</button>
                                        <button class="menu_3st">영동군</button>
                                        <button class="menu_3st">옥천군</button>
									   	<button class="menu_3st">음성군</button>
                                        <button class="menu_3st">제천시</button>
                                        <button class="menu_3st">증평군</button>
                                        <button class="menu_3st">진천군</button>
                                        <button class="menu_3st">청주시 상당구</button> 
                                        <button class="menu_3st">청주시 서원구</button>
                                        <button class="menu_3st">청주시 청원구</button>
                                        <button class="menu_3st">청주시 흥덕구</button>
                                    </div>
                                </div>      
                                <div class="menu_box">
                                    <a class="menu_1st noto500">제주도</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
                                        <button class="menu_3st">제주시</button>
                                        <button class="menu_3st">서귀포시</button>
                                    </div>
                                </div>     
                                <div class="menu_box">
                                    <a class="menu_1st noto500">세종시</a>
                                    <div class="menu_2st noto400">
                                    	<button class="menu_3st">전체</button>
								        <button class="menu_3st">가람동</button>
								        <button class="menu_3st">고운동</button>
								        <button class="menu_3st">금남면</button>
                                        <button class="menu_3st">나성동</button>
                                        <button class="menu_3st">다정동</button>
									   	<button class="menu_3st">대평동</button>
                                       	<button class="menu_3st">도담동</button>
                                        <button class="menu_3st">반곡동</button>
                                        <button class="menu_3st">보람동</button>
                                        <button class="menu_3st">부강면</button>   
                                        <button class="menu_3st">새롬동</button>
                                        <button class="menu_3st">소담동</button>
                                        <button class="menu_3st">소정면</button>
									   	<button class="menu_3st">아름동</button>
                                        <button class="menu_3st">어진동</button>
                                        <button class="menu_3st">연기면</button>
                                        <button class="menu_3st">연동면</button>
                                        <button class="menu_3st">연서면</button>  
                                        <button class="menu_3st">장군면</button>
                                        <button class="menu_3st">전동면</button>
                                        <button class="menu_3st">전의면</button>                                       
                                        <button class="menu_3st">조치원읍</button>
                                        <button class="menu_3st">종촌동</button>
                                        <button class="menu_3st">한솔동</button>
                                    </div>
                                </div>  
                                <div class="sub-menu-container">
							    <div class="sub-menu-content">
							        <!-- 여기에 하위 메뉴 3st 요소들이 동적으로 추가됩니다 -->
							    </div>
								</div>                                                                                                                                                                                                                                                                                                                                                                                            
                            </div>
                        </div>
                    </div>
                </div>
             </div>             
<section>
  <form method="get" action="${pageContext.request.contextPath}/list">
    <div class="categorybox">
      <ul class="menubar">
        <li>
	        <button class="menu" type="button" onclick="CategoryModal()">지역 선택 
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
			  <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
			</svg>
	        	<a class="menu_text"></a>
		        <span class="bi bi-chevron-down">
		        </span>
	        </button>
        </li>
      </ul>
      <ul class="categorymenu">
        <li><button id="catemenu" value="">전체</button></li>
        <li><button id="catemenu" value="맛집">맛집</button></li>
        <li><button id="catemenu" value="숙박">숙박</button></li>
        <li><button id="catemenu" value="문화">문화</button></li>
      </ul>
      
      <ul class="categorymenu2">
        <li><button id="catemenu" value="">전체</button></li>
        <li><button id="catemenu" value="생활">생활</button></li>
        <li><button id="catemenu" value="유아동">유아동</button></li>
        <li><button id="catemenu" value="뷰티">뷰티</button></li>
        <li><button id="catemenu" value="디지털">디지털</button></li>
        <li><button id="catemenu" value="패션">패션</button></li>
        <li><button id="catemenu" value="도서">도서</button></li>
        <li><button id="catemenu" value="식품">식품</button></li>
      </ul>
      
      <!-- 숨겨진 input 요소를 추가하여 선택한 값을 전달 -->
      <input type="hidden" name="region" id="regionInput">
      <input type="hidden" name="city" id="cityInput">
      <input type="hidden" name="subCategory" id="subCategoryInput">
    </div>
  </form>
</section>

<script>
document.addEventListener("DOMContentLoaded", function () {
    var menuContainers = document.querySelectorAll(".menu_box");
    var subMenuContainer = document.querySelector(".sub-menu-container");
    var menu_3stButtons = document.querySelectorAll('.menu_3st');
    var regionButtons = document.querySelectorAll('.menu_2st button');
    var mainCategoryButtons = document.querySelectorAll('.categorymenu button');
    var mainCategory2Buttons = document.querySelectorAll('.categorymenu2 button');
    
    // URL에서 city 값과 mainCategory 값 가져오기
    const urlParams = new URLSearchParams(window.location.search);

    const city = urlParams.get("city");
    const mainCategory = urlParams.get("mainCategory");
    const subCategory = urlParams.get("subCategory");
    var categorymenu = document.querySelector('.categorymenu');
    var categorymenu2 = document.querySelector('.categorymenu2');
    
    if (subCategory === "맛집") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="맛집"]');
            restaurantButton.classList.add("active");
    } else if(subCategory === "숙박") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="숙박"]');
        restaurantButton.classList.add("active");
    } else if(subCategory === "문화") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="문화"]');
        restaurantButton.classList.add("active");
    } else if(subCategory === "생활") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="생활"]');
        restaurantButton.classList.add("active");
    } else if(subCategory === "유아동") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="유아동"]');
        restaurantButton.classList.add("active");
    } else if(subCategory === "뷰티") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="뷰티"]');
        restaurantButton.classList.add("active");
    } else if(subCategory === "디지털") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="디지털"]');
        restaurantButton.classList.add("active");
    } else if(subCategory === "패션") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="패션"]');
        restaurantButton.classList.add("active");
    } else if(subCategory === "도서") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="도서"]');
        restaurantButton.classList.add("active");
    } else if(subCategory === "식품") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value="식품"]');
        restaurantButton.classList.add("active");
    } else if(subCategory === "") {
        var restaurantButton = document.querySelector('button[id="catemenu"][value=""]');
        restaurantButton.classList.add("active");
    } 
    
    // mainCategory 값에 따라 카테고리 메뉴를 표시 또는 숨깁니다.
	if (mainCategory == "제품" ||subCategory == "생활" || subCategory == "유아동" || subCategory == "뷰티" || subCategory== "디지털" || subCategory == "패션" || subCategory == "도서" || subCategory == "식품") {
        categorymenu.style.display = "none";
        categorymenu2.style.display = "flex";
    } else {
        categorymenu.style.display = "flex";
        categorymenu2.style.display = "none";
    } 
    
    // city 값이 있으면 menu_text에 출력
    if (city) {
        var menuText = document.querySelector(".menu_text");
        menuText.textContent = city;
    }

    menuContainers.forEach(function (menuContainer) {
        var menu1st = menuContainer.querySelector(".menu_1st");
        var menuText = menu1st.textContent; // 메뉴 텍스트 가져오기

        mainCategoryButtons = document.querySelectorAll('.categorymenu button');
      	 mainCategoryButtons.forEach(button => {
      	   button.addEventListener('click', function() {
      	     const selectedValue = button.value;
      	     document.getElementById('subCategoryInput').value = selectedValue;
      	   });
      	 });
      	 
       mainCategory2Buttons = document.querySelectorAll('.categorymenu2 button');
      	 mainCategory2Buttons.forEach(button => {
      	   button.addEventListener('click', function() {
      	     const selectedValue = button.value;
      	     document.getElementById('subCategoryInput').value = selectedValue;
      	  	 
      	   });
      	 });
 
        menuContainer.addEventListener("click", function () {
            // 현재 클릭한 메뉴의 3st 메뉴 목록을 가져오기
            var menu2st = menuContainer.querySelector(".menu_2st");
            var menu3stItems = menu2st.querySelectorAll(".menu_3st");
			
            // 3st 메뉴 목록을 기존의 컨테이너에 추가합니다.
            subMenuContainer.innerHTML = ""; // 기존 내용 초기화
            menu3stItems.forEach(function (menu3stItem) {
                subMenuContainer.appendChild(menu3stItem.cloneNode(true));
            });

            // 하위 메뉴 컨테이너를 활성화하여 보이도록 합니다.
            subMenuContainer.classList.add("active");
            
            // 메뉴 3st 버튼에 클릭 이벤트 핸들러 추가
            
            menu_3stButtons = document.querySelectorAll('.menu_3st');
            
            menu_3stButtons.forEach(button => {
                button.addEventListener('click', function() {
                    var selectedValue = button.textContent.trim(); // 앞뒤 공백 제거
                    var menu = document.querySelector(".menu_text");
                    var parentText = menu1st.textContent.trim(); // 부모 메뉴 텍스트
                    if (selectedValue !== "전체") {
                        document.getElementById('cityInput').value = selectedValue;
                        CategoryModal();
                        menu.textContent = selectedValue;
                    } else {
                        document.getElementById('regionInput').value = parentText;
                        CategoryModal();
                        menu.textContent = parentText;
                    }
                });
            });
        });
    });
});

function CategoryModal() {
    var modal = document.getElementById('div_category1');
    var modalbackground = document.getElementById('div_category_background');
    modal.style.display = modal.style.display === 'block' ? 'none' : 'block';
    modalbackground.style.display = modalbackground.style.display === 'block' ? 'none' : 'block';
}
</script>



<div class="list">

	<div class="campaignbox">
	    <c:forEach var="campaign" items="${campaigns}">
	      <div class="cate_list_rows">
	        <table align="center" width="100" border="0" cellspacing="0" cellpadding="0">
	          <tbody>
	            <tr>
	              <td width="20" align="center" valign="top">
	                <div id="" class="list_graph_rows" style="width:233px; margin:0px;" >
	                  <div id="">
	                    <div>
	                      <div class="flexslider" style="border-radius: 7px; overflow: hidden;">
                              <ul>
                                <li>
								<c:set var="linkPath" value="${pageContext.request.contextPath}/${campaign.id}" />
								<c:choose>
								    <c:when test="${empty userInfo.nickName}">
								        <a href="${linkPath}">
								            <img src="${pageContext.request.contextPath}/resources/images/${campaign.imageFileName}" style="width: 233px; height: 233px !important;" class="mainimage">
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a href="${linkPath}/${userInfo.nickName}">
								            <img src="${pageContext.request.contextPath}/resources/images/${campaign.imageFileName}" style="width: 233px; height: 233px !important;" class="mainimage">
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
								            ${campaign.campaignName}
								        </a>
								    </c:when>
								    <c:otherwise>
								        <a class="common_rows_title ellipsis_line1 font_18"  href="${linkPath}/${userInfo.nickName}">
								            ${campaign.campaignName}
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
								            ${campaign.campaignPrice}
								        </a>
								    </c:otherwise>
								</c:choose>       
                            </div>
                            <div style="">
                              <div class="common_rows_graph01">
                                <div class="common_rows_people" style="text-align: left; margin: 10px;">
                                  <span>신청 ${campaign.selectedCandidates}</span>/${campaign.applicants}명
                                </div>
                                <div class="common_rows_percent" id="progress-percent" style="color: #adceff; margin: 10px;">0%</div>
                              </div>
                              <div class="common_rows_graph02 af_clear" style="margin: 10px;">
                                <div id="progress-bar" style="background: #adceff;  width: 0%; height: 4px; float: left; border-radius: 4px;"></div>
                              </div>
                            </div>
                          </div>

						<script>
						  // JavaScript를 사용하여 프로그래스 바 업데이트
						  const applicants = ${campaign.applicants};
						  const selectedCandidates = ${campaign.selectedCandidates};
						  const progressBar = document.getElementById('progress-bar');
						  const progressPercent = document.getElementById('progress-percent');
						
						  if (applicants > 0) {
						    const progress = (applicants/ selectedCandidates) * 100;
						
						    // 소수점 둘째 자리까지 반올림
						    const roundedProgress = Math.round(progress * 100) / 100;
						
						    progressBar.style.width = roundedProgress + '%';
						    progressPercent.textContent = roundedProgress + '%';
						  }
						</script>


	                    </div>
					        <div class="font_13 ls_1 noto500" style="text-align: left; margin: 10px;">
					            <a class="rows_cate" style="margin-right: 5px;" href="${pageContext.request.contextPath}/detail/${best.id}">
					                <span id="categoryOutput-${campaign.id}">${campaign.mainCategory} ${campaign.subCategory}</span>
					            </a>
					            <span class="common_rows_dday" style="color:#0067ff;">D-${campaign.daysUntilEndDate()}</span>
					        </div>
					
					        <script type="text/javascript">
					            // 각 best에 대한 mainCategory 값 확인
					            var mainCategory = "${campaign.mainCategory}";
					            var categoryOutput = document.getElementById("categoryOutput-${campaign.id}");
					
								if (mainCategory === "방문") {
					                categoryOutput.innerHTML = "${campaign.region} ${campaign.city}";
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
<div class="underpage">
	    <div class="paging"> 
	        <!-- 페이지 버튼을 생성 -->
	        <c:if test="${totalPages > 1}">
	            <div>
	                <c:url var="firstPageUrl" value="/list">
	                    <c:param name="mainCategory" value="${param.mainCategory}" />
	                    <c:param name="subCategory" value="${param.subCategory}" />
	                    <c:param name="region" value="${param.region}" />
	                    <c:param name="city" value="${param.city}" />
	                    <c:param name="page" value="1" />
	                </c:url>
	                <a href="${firstPageUrl}">
	                    <button>처음</button>
	                </a>
	                
	                <c:url var="prevPageUrl" value="/list">
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
	                    <c:url var="pageUrl" value="/list">
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
	
	                <c:url var="nextPageUrl" value="/list">
	                    <c:param name="mainCategory" value="${param.mainCategory}" />
	                    <c:param name="subCategory" value="${param.subCategory}" />
	                    <c:param name="region" value="${param.region}" />
	                    <c:param name="city" value="${param.city}" />
	                    <c:param name="page" value="${param.page + 1}" />
	                </c:url>
	                <a href="${nextPageUrl}">
	                    <button>다음</button>
	                </a>
	                
	                <c:url var="lastPageUrl" value="/list">
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
<script>

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
</script>
<jsp:include page="../common/footer.jsp" flush="true"></jsp:include>
</body>
</html>