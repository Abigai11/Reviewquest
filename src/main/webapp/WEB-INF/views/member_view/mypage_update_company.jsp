<%@page import="com.project.reviewquest.member.InfluencerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가맹점 마이페이지수정</title>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans+KR" media="all">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/FlexSlider.css" type="text/css" media="screen">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${contextPath}/resources/js/input_top.js"></script>
<style>
.h_form button, .h_form a, .h_form input[type="button"] {
border: 1px solid #e5e5e5;
}

.h_form button:hover, .h_form a:hover, .h_form input[type="button"]:hover, .h_form button:focus, .h_form a:focus, .h_form input[type="button"]:focus {
  border-color: #b2b2b2;
  }

#sendcode, #buttn_st{
    display: flex;
     flex-direction: column;
     justify-content: center;
     align-items: center;
   width: 100px;
   height: 40px;
   border-color: #b2b2b2;
   background-color: #e5e5e5;
   border-radius: 0.3em;
   margin: 0 5px;
   }
   .goback:hover{
   background-color: #0057b3 !important;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
<c:choose>
    <c:when test="${not empty sessionScope.admin_onemember}">
        <c:set var="editInfo" value="${sessionScope.admin_onemember}" />
    </c:when>
    <c:otherwise>
        <c:set var="editInfo" value="${sessionScope.userInfo}" />
    </c:otherwise>
</c:choose>

<div class="container af_clear" style="margin-bottom:70px">
<div class="site_location"><span uk-icon="icon:home; ratio:1" class="uk-icon home_icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="home"><polygon points="18.65 11.35 10 2.71 1.35 11.35 0.65 10.65 10 1.29 19.35 10.65"></polygon><polygon points="15 4 18 4 18 7 17 7 17 5 15 5"></polygon><polygon points="3 11 4 11 4 18 7 18 7 12 12 12 12 18 16 18 16 11 17 11 17 19 11 19 11 13 8 13 8 19 3 19"></polygon></svg></span><a href="http://adblog.cgimall.co.kr">홈</a><span uk-icon="icon:chevron-right; ratio:1" class="uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="chevron-right"><polyline fill="none" stroke="#000" stroke-width="1.03" points="7 4 13 10 7 16"></polyline></svg></span><a href="#">마이페이지</a></div>
<div style="display:flex;">
<div class="mypage_left_box">
	<div class="mypage_common_box" style="text-align:center; position:relative;">
		<a href="/happy_member.php?mode=modify" onfocus="this.blur()" alt="회원정보수정" title="회원정보수정" style="position:absolute; top:20px; right:20px; color:#c2c2c2;"><span uk-icon="icon:cog; ratio:1" class="uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="cog"><circle fill="none" stroke="#000" cx="9.997" cy="10" r="3.31"></circle><path fill="none" stroke="#000" d="M18.488,12.285 L16.205,16.237 C15.322,15.496 14.185,15.281 13.303,15.791 C12.428,16.289 12.047,17.373 12.246,18.5 L7.735,18.5 C7.938,17.374 7.553,16.299 6.684,15.791 C5.801,15.27 4.655,15.492 3.773,16.237 L1.5,12.285 C2.573,11.871 3.317,10.999 3.317,9.991 C3.305,8.98 2.573,8.121 1.5,7.716 L3.765,3.784 C4.645,4.516 5.794,4.738 6.687,4.232 C7.555,3.722 7.939,2.637 7.735,1.5 L12.263,1.5 C12.072,2.637 12.441,3.71 13.314,4.22 C14.206,4.73 15.343,4.516 16.225,3.794 L18.487,7.714 C17.404,8.117 16.661,8.988 16.67,10.009 C16.672,11.018 17.415,11.88 18.488,12.285 L18.488,12.285 Z"></path></svg></span></a>
		<div style="margin:35px 0 12px 0;">
			<a class="noto500 ls_1 font_24" style="color:#1f1f1f;" href="happy_member.php?mode=mypage">마이페이지</a>
		</div>
		<!-- 회원사진 및 정보-->
		<img src="${contextPath}/resources/images/profilephoto/${editInfo.profilephoto}" style="width:110px; height:110px; border-radius:50%;">
		<div style="border-bottom:1px solid #eaeaea; padding:7px 0 35px 0;">
			<span class="font_16 ls_1">${editInfo.nickName}</span><br>
			<span class="ls_1" style="color:#999999;">${editInfo.email}</span><br>
			<span class="ls_1" style="color:#0067ff;">${editInfo.division}의 마이페이지</span>
		</div>

	</div>
	<div class="left_menu" style="position:sticky; top:100px; z-index:199; width:250px"><div class="mypage_common_box">
<div class="mypage_left_menu_main">
<div class="mypage_left_menu_sub">
	<div class="mypage_common_box">
		<a href="happy_member.php?mode=camp_join_list&amp;b_stats=10" class="mypage_left_menu_sub_link">
		</div>
	</div>
</div>

<div class="mypage_left_menu_main">
	<a href="${pageContext.request.contextPath}/mypage_update_company" class="mypage_left_menu_main_link">
내정보 관리
<span uk-icon="icon:more-vertical; ratio:1" class="uk-icon"><svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="more-vertical"><circle cx="10" cy="3" r="2"></circle><circle cx="10" cy="10" r="2"></circle><circle cx="10" cy="17" r="2"></circle></svg></span>
</a>
<div class="mypage_left_menu_sub">
	<div class="mypage_common_box">
		<a href="${pageContext.request.contextPath}/mypage_update_company" class="mypage_left_menu_sub_link">
		회원정보수정
	</a>
	<a href="member/logout?id=${editInfo.id}&division=influencer_delete" class="mypage_left_menu_sub_link">
					회원탈퇴 
				</a>
			</div>
		</div>
	</div>

</div>
</div>
			</div>


<div class="mypage_right_box">
<c:set var="userInfo" value="${sessionScope.userInfo}" />
<c:if test="${userInfo != null && userInfo.division == 'admin'}">
	<div style="display: flex; justify-content: flex-end;margin-bottom: 30px;">
		<a href="${contextPath}/allmember_admin"><button class="goback" style="background-color: #0074e4;
    color: #fff;    border: none;    padding: 10px 20px;    border-radius: 4px;    cursor: pointer;    width: 150px; height: 40px;">목록으로 돌아가기</button></a>
	 </div>
</c:if>

<form action="member/mod" method="post" name="happy_member_reg" >
<input type="hidden" name="division" value="${editInfo.division}">
					${editInfo.division}의 수정이 진행됩니다!
<input type="hidden" name="nick_check" id="nick_check" value="ok">
<input type="hidden" name="blank_3" id="blank_3" value="">
<input type="hidden" name="email" id="combined_email">
<input type="hidden" name="phoneNo" id="combined_phone">
<input type="hidden" name="address" id="combined_address">


<div class="mypage_common_box">
	<div class="mypage_sub_title">
		회원정보수정
		<span class="right_text"><img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" alt="필수항목" title="필수항목"> 표시는 필수입력 사항이므로 빠짐없이 입력해주세요.</span>
	</div>
	<div style="padding:30px 30px 80px 30px;">
		<table cellspacing="0" cellpadding="0" style="width:100%; border-top:1px solid #eaeaea;" class="happy_membder_join_form">
	<tbody>
	
	<tr>
		<th>
			<span class="happy_member_join_form_title">
				<span class="happy_member_icon_check">
					<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
				</span>아이디
			</span>
		</th>
		<td class="h_form">
			${editInfo.id}
		</td>
	</tr>

	<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
											<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>패스워드
									</span>
								</th>
								<td class="h_form">
								<div style="display: flex; align-items: center;" >
									<input type="password" name="password" class="m_w_100" style="width:20%;" minlength="8" maxlength="20" >
									<div>
										<span class="guide_txt" style="color: red;">* 입력하지 않을 시, 수정되지 않습니다.</span><br>
										<span class="guide_txt">* 영문,숫자 조합 8자 이상 입력해 주세요.</span><br>
										<div id="passwordMismatchMessage1" class="error-message" style="margin-left:15px;"></div>
									</div>
								</div>
								</td>
							</tr>
								
							<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
											<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>패스워드 확인
									</span>
								</th>
								<td class="h_form">
								<div style="display: flex; align-items: center;" >
									<input type="password" name="password2" class="m_w_100" style="width:20%;" minlength="8" maxlength="20" >
									<div>
										<span class="guide_txt">* 비밀번호를 다시 한 번 입력해주세요.</span>
										<div id="passwordMismatchMessage2" class="error-message" style="margin-left:15px;"></div>
									</div>
								</div>
								</td>
							</tr>
							
							
							
							
	
	
							<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
											<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>이름
									</span>
								</th>
								<td class="h_form">
									${editInfo.name}
								</td>
							</tr>
							
							
							
							
							<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
											<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>닉네임
									</span>
								</th>
								<td class="h_form">
									${editInfo.nickName}
								</td>
							</tr>
							
							
						
						
								
			 	<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
											<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>이메일
									</span>
								</th>
								  <c:set var="email" value="${editInfo.email}" />
								<%
								  // @를 기준으로 분리하여 앞쪽 문자열을 email_at_user에, 뒤쪽 문자열을 email_at_host에 할당합니다.
								  String[] emailParts = ((String)pageContext.getAttribute("email")).split("@");
								  String email_at_user = emailParts[0];
								  String email_at_host = emailParts[1];
								%>
								
								<td class="h_form">
								<div style="display: flex;">
									<input type="text" name="email_at_user" class="join_input_e_01" value="<%= email_at_user %>">@
									<input type="text" name="email_at_host" id="user_email_at_host" class="join_input_e_02" value="<%= email_at_host %>"> 
									<select style="width:80px;" name="user_email_at_hostSel" id="user_email_at_hostSel" class="join_select_e">
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="" selected="">직접입력</option>
									</select> 
									<a id="sendcode"  onclick="sendEmailVerification()" style="cursor: pointer">이메일인증</a><br><br>
								</div>
									<input type="text" id="verificationCodeInput" placeholder="인증 코드 입력" style="width:20%;" required>
									<span id="verificationResult" class="check_txt"></span>
								</td>
							</tr>






							<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
											<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>휴대폰
									</span>
								</th>
								
								<c:set var="phoneNo" value="${editInfo.phoneNo}" />
								<%
								  // @를 기준으로 분리하여 앞쪽 문자열을 email_at_user에, 뒤쪽 문자열을 email_at_host에 할당합니다.
								  String[] phoneNoParts = ((String)pageContext.getAttribute("phoneNo")).split("-");
								  String phone_first = phoneNoParts[0];
								  String phone_second = phoneNoParts[1];
								  String phone_third = phoneNoParts[2];
								%>
								
								<td class="h_form">
									<input type="text" style="width:80px;" name="phone_first" value="<%= phone_first %>" required> -	<!-- !! - 기호 지우시면 아니되옵니다!! -->				
									<input type="text" style="width:80px;" name="phone_second" maxlength="4" value="<%= phone_second %>" required> - <!-- !! - 기호 지우시면 아니되옵니다!! -->
									<input type="text" style="width:80px;" name="phone_third" maxlength="4" value="<%= phone_third %>" required>
									<span id="phoneNo_resultMessage" class="check_txt"></span>
								</td>
							</tr>
				
							 <c:set var="address" value="${editInfo.address}" />
								<%
								  // /를 기준으로 분리하여 변수에 할당합니다.
								  String[] addressParts = ((String)pageContext.getAttribute("address")).split("/");
								  String address_first = addressParts[0];
								  String address_second = addressParts[1];
								  String address_third = addressParts[2];
								%>


							<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
										<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>주소
									</span>
								</th>
								
								<td class="h_form">
								<div style="display: flex; margin-bottom: 5px;">
								  <input type="text" id="sample6_postcode" name="address_first" value="<%= address_first %>" placeholder="우편번호" style="width: 120px;" readonly="readonly" required >
							      <input type="button" id="buttn_st" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="cursor:pointer;"><br>
							     </div>
							     
							      <input type="text" id="sample6_address" name="address_second" value="<%= address_second %>" placeholder="주소" style="width:60%; margin-bottom: 5px;" maxlength="50" readonly="readonly" required><br>
							      <input type="text" id="sample6_detailAddress" name="address_third" value="<%= address_third %>" placeholder="상세주소" style="width:60%;" required >
							      </div>
								</td>
							</tr>
							
							
						
						
						
						

						
						
						
						
						
						
							
							
							
							
		
							
					<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
											<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>회사명
									</span>
								</th>
								<td class="h_form">
									<input type="text" id="companyName" name="companyName" class="m_w_100" value="${editInfo.companyName}" style="width:20%;" maxlength="10" required>
									<span class="guide_txt"></span>
								</td>
							</tr>
							
							<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
											<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>사업자 등록 번호
									</span>
								</th>
								<td class="h_form">
									<input type="text" id="businessNO" name="businessNO" class="m_w_100" value="${editInfo.businessNO}" style="width:20%; " disabled>
									
								</td>
							</tr>
							 
							
							<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
											
										</span>회사전화번호
									</span>
								</th>
								<td class="h_form">
									<input type="text" id="companyTel" name="companyTel" class="m_w_100" value="${editInfo.companyTel}" style="width:20%;" maxlength="10" >
									<span class="guide_txt"></span>
								</td>
							</tr> 
							
							
								
							<tr>
								<th>
									<span class="happy_member_join_form_title">
										<span class="happy_member_icon_check">
										<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
										</span>하고싶은말
									</span>
								</th>
								<td class="h_form">
									<textarea name="introduce" style="width:100%; height:150px;" required>${editInfo.introduce}</textarea>
								</td>
							</tr>


						





</tbody></table>

		<div class="h_form" style="display:flex; justify-content: center; text-align:center; margin-top:50px;">
			<button type="submit" uk-icon="icon: check; ratio:1" class="h_btn_st1 h_btn_b icon_b uk-icon" onclick="combineAndSubmit()">수정하기
				<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="check">
					<polyline fill="none" stroke="#ffffff" stroke-width="1.1" points="4,10 8,15 17,4"></polyline>
				</svg>
			</button>

			
			<a href="javascript:history.back()" class="h_btn_b icon_b uk-icon" uk-icon="icon:reply; ratio:1" style="margin:0 5px;">뒤로가기<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="reply"><path d="M17.7,13.11 C16.12,10.02 13.84,7.85 11.02,6.61 C10.57,6.41 9.75,6.13 9,5.91 L9,2 L1,9 L9,16 L9,12.13 C10.78,12.47 12.5,13.19 14.09,14.25 C17.13,16.28 18.56,18.54 18.56,18.54 C18.56,18.54 18.81,15.28 17.7,13.11 L17.7,13.11 Z M14.82,13.53 C13.17,12.4 11.01,11.4 8,10.92 L8,13.63 L2.55,9 L8,4.25 L8,6.8 C8.3,6.86 9.16,7.02 10.37,7.49 C13.3,8.65 15.54,10.96 16.65,13.08 C16.97,13.7 17.48,14.86 17.68,16 C16.87,15.05 15.73,14.15 14.82,13.53 L14.82,13.53 Z"></path></svg></a>
			<a href="member/logout?id=${editInfo.id}&division=company_delete" class="h_btn_b icon_b uk-icon" uk-icon="icon:close; ratio:1">회원탈퇴<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="close"><path fill="none" stroke="#000" stroke-width="1.06" d="M16,16 L4,4"></path><path fill="none" stroke="#000" stroke-width="1.06" d="M16,4 L4,16"></path></svg></a>
		</div>
	</div>
</div>
</form>
</div></div></div>


<!-- 목록레이어 -->
<div id="listLayer" class="my_camp_layer_box" style="display:none; position:absolute;"></div>
<!-- 목록레이어 -->

<!-- 목록레이어 -->
<div id="listLayer2" style="display:none;"></div>
<!-- 목록레이어 -->
						






<div id="happyMessageSoundLayer" style="position:absolute;width:0px;height:0px;left:0px;top:0px;padding:0px;"></div>
<div id="happyMessageAlertLayer" style="position: absolute; width: 150px; height: 100px; left: 1096px; top: 1081px; padding: 0px; z-index: 10000; display: none;"></div>
<!-- <div id="happyMessageMusicLayer" style='display:none'><embed src='message.mp3' autostart=false id='happyMessageMusic'></embed></div> -->




<!-- 실제 디자인 해야 할 부분 : happyMessageOriginalLayer 레이어 안에 디자인 하면 됩니다!-->
<div id="happyMessageOriginalLayer" style="display:none">
	<div id="messageAlertLyr__kwak_num__" style="background:url('skin/adblog/img/message/bg_mess.gif'); width:172px; height:120px; position:fixed; bottom:5px; right:5px; ">
		<div style="position:absolute; top:5px; right:5px;"><a href="#1" onclick="happyMessageLayerClear('messageAlertLyr__kwak_num__');"><img src="skin/adblog/img/message/bt_messend.gif" border="0" align="middle"></a></div>
		<div style="margin:0 auto; width:154px; padding-top:40px; cursor:pointer;" onclick="goMessageViewer('__kwak_num__'); happyMessageLayerClear('messageAlertLyr__kwak_num__');">
			<div style="background:url('skin/adblog/img/message/message_icon.gif'); float:left; margin-right:10px; width:50px; height:50px;" alt="쪽지가 도착하였습니다." title="쪽지가 도착하였습니다."></div>
			<div style="padding-top:5px;"><strong style="font-family:'맑은고딕'; letter-spacing:-1px; color:#0087df; ">새로운 쪽지가 도착하였습니다.</strong></div>
			<div style="clear:both;"></div>
		</div>
	</div>
</div>
<!-- 실제 디자인 해야 할 부분 종료 -->






<a href="http://www.cgimall.co.kr" target="_blank">
<div style="position:fixed; bottom:10px; left:10px; z-index:999999;" class="cgimallalert_layers cgialert_shadows">
<img src="http://www.cgimall.co.kr/img/cgialert_img.png" alt="현재 보고계신 사이트는 cgimall솔루션 사용자데모입니다.">
</div>
</a><br><center><font style="font-size:11px;color=gray">Query Time : 0.33 sec</font></center>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>
<script>
/* submit, onclick 실행 */
function combineAndSubmit()
{
    var isPhoneValid = validphoneForm();

    if ( !isPhoneValid) {
    	event.preventDefault();
        return false;
    }
  
	combineEmailFields();
    combinePhoneFields();
    combineaddressFields();
    
}
</script>
<script type="text/javascript" src="${contextPath}/resources/js/input_bottom.js"></script>

</body>
</html>