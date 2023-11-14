<%--
  Created by IntelliJ IDEA.
  User: UserK
  Date: 2023-08-24
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.project.reviewquest.member.InfluencerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<head>
	<script>
	      // JavaScript 코드를 추가합니다.
	      function showAlert(message) {
	          alert(message);
	      }
	
	      // 파라미터를 확인하고 경고창을 표시
	      if (${param.showAlert} == true) {
	          showAlert('가입이 완료되었습니다.');
	      }
	</script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>   
	<script type="text/javascript">
   function naverLogin() {
       var naver_id_login = new naver_id_login("ydCFwsO3tUla3oFBFnVU", "http://localhost:8080/reviewquest/naverLogin");
       var state = naver_id_login.getUniqState();
       naver_id_login.setButton("white", 2,40);
       naver_id_login.setDomain("http://localhost:8080");
       naver_id_login.setState(state);
       naver_id_login.setPopup();
       naver_id_login.init_naver_id_login();
   }
	</script>	
	<style>
	.radio-parent{
		display: flex;
		justify-content: center;
	}
	.custom-radio input[type="radio"] {
	    display: none; /* 원본 라디오버튼 숨김 */
	}	
	.custom-radio {
	    display: flex;
	    justify-content: center; /* 수평 가운데 정렬 */
	    align-items: center; /* 수직 가운데 정렬 */
	    width: 50%; /* 네모 block 크기 조절 */
	    height: 60px; /* 네모 박스의 크기 조절 */
	    border: 1px solid #e5e5e5; /* 네모 박스의 테두리 스타일 */  
	}
	.custom-radio input[type=radio]+label {
	    display: inline-block;
	    width: 100%; /* 네모 박스의 크기 조절 */
	    height: 60px; /* 네모 박스의 크기 조절 */
	    text-align: center; /* 글씨 가운데 정렬 */
	    margin-right: 10x;  /* 라디오버튼 사이 간격 조절 */
	    line-height: 50px; /* 수직 가운데 정렬을 위한 높이와 동일한 line-height 설정 */        
	    cursor: pointer;
	}
	.custom-radio input[type=radio]:checked+label{
	    background-color: #fff;
	    color: #4b93ff;
	    /* 네모 박스의 테두리 스타일 */
		border-left: 1px solid #e5e5e5;
		border-right: 1px solid #e5e5e5;
		border-top: 4px solid #4b93ff;
		border-bottom: none;     
	}
	</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
	
	<div class="cell" style="width:20%; margin: 5% auto;">
		<form action="${contextPath}/member/loginCheck" method="post" name="happy_member_login_form"> 
			<div style="margin-bottom: 10px;">
				<h3 class="noto500" style="font-size:30px">
			         로그인하세요
			     </h3>
			</div>
			<div class="radio-parent" style="margin-bottom: 10px !important;">
			    <div class="custom-radio">
			        <input type="radio" id="companyRadio" name="division" value="company" checked> 
			        <label for="companyRadio">가맹점</label>
			    </div>
			    <div class="custom-radio">
			        <input type="radio" id="influencerRadio" name="division" value="influencer"> 
			        <label for="influencerRadio">인플루언서</label>
			    </div>
			</div>                 
			<div class="h_form" >
			    <div style="margin-bottom:10px">
					<input type="text" name="id" value="a" style="height:60px" placeholder="아이디">
				</div>
				<div style="margin-bottom:10px">
					<input type="password" name="password" value="1" style="height:60px" placeholder="비밀번호">
				</div>
				<div>
			    	<button type="submit" class="h_btn_l h_btn_st1 login_btn_icon uk-icon" uk-icon="icon: unlock; ratio: 1" style="font-size:20px">로그인하기</button>
				</div>     
			</div>
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>
</body>