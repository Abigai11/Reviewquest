<%@page import="com.project.reviewquest.member.InfluencerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인플루언서 회원가입</title>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans+KR" media="all">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${contextPath}/resources/css/FlexSlider.css" type="text/css" media="screen">
<script language="JavaScript" type="text/javascript" src="js/happy_member.js?ver=202308171209"></script>
<script language="JavaScript" type="text/javascript" src="inc/lib.js?ver=202308171209"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/input_top.js"></script>
<script>
/*<!-- 아이디 중복 확인 시작-->*/
$(document).ready(function() {
    // 아이디 입력 필드의 "input" 이벤트 핸들러 추가
    $("#idInput").on("input", function() {
        var idToCheck = $(this).val();
        var resultMessage = $("#id_resultMessage"); // 결과 메시지의 ID를 사용

        if (idToCheck.length >= 8) {
        // 중복 확인 실행 코드
        $.ajax({
            type: "POST",
            url: "member/overlapped_id",
            data: { id: idToCheck },
            dataType: "text",
            success: function(response) {
                resultMessage.text(response);
                if (response.includes("중복")) {
                    resultMessage.css("color", "red");
                    isIdValid = false;
                } else {
                    resultMessage.css("color", "blue");
                    isIdValid = true;
                }
            },
            error: function(error) {
                console.error("오류 발생: " + JSON.stringify(error));
            }
        });
        } else {
            resultMessage.text("8글자 이상 입력해주세요.");
            resultMessage.css("color", "red");
        }
    });
	 // 폼 제출 이벤트 핸들러 추가
	    $("form[name='happy_member_reg']").on("submit", function(event) {
	        if (!isIdValid) {
	            event.preventDefault(); // 아이디가 유효하지 않으면 폼 제출을 중단
	            alert("아이디가 유효하지 않습니다.");
	        }
	    });
	});
/*<!-- 아이디 중복 확인 종료-->*/

</script>
<style>
input[type="date"] {
	width: 200px; /* 너비 조정 */
	height: 30px; /* 높이 조정 */
	background-color: #ffffff; /* 배경 색상 설정 */
	padding-left: 5px; /* 내부 패딩 설정 */
	border: 1px solid #ccc; /* 테두리 설정 */
	cursor: pointer; /* 커서 스타일 변경 (포인터로 변경) */
	box-shadow: 0 0 5px #007bff; /* 포커스 시 그림자 효과 추가 */
}
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
</style>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
<div class="container">
	<div class="member_agree">
		<h2 style="font-size: 26px; letter-spacing: -1px;  color: #101010; margin: 45px 0 35px 0;">
			<span style="color:#0067ff">블로거회원</span> 회원가입 정보입력
			<span style="font-size: 15px; letter-spacing: -1px;  color: #a6a6a6; font-weight:normal">
				사이트 이용의 편의를 위한 것이며, 회원님의 정보는 타용도로 사용하지 않습니다.
			</span>
		</h2>

<div class="step_check">
	<div style="text-align:left">
		<img src="http://adblog.cgimall.co.kr/skin/adblog/img/join_step_01.jpg" alt="약관동의">
	</div>
	<div style="text-align:center">
		<img src="http://adblog.cgimall.co.kr/skin/adblog/img/skin_icon/make_icon/skin_icon_798.jpg" alt="정보입력">
	</div>
	<div style="text-align:right">
		<img src="http://adblog.cgimall.co.kr/skin/adblog/img/join_step_03.jpg" alt="가입완료">
	</div>
</div>
			
<div>
	<form action="member/join" method="post" name="happy_member_reg" enctype="multipart/form-data" >
		<input type="hidden" name="division" value="${division}">
		${division}의 회원 가입이 진행됩니다!
	
	<!-- <input type="hidden" name="birthday" id="combined_birth"> -->
	<input type="hidden" name="email" id="combined_email">
	<input type="hidden" name="phoneNo" id="combined_phone">
	<input type="hidden" name="address" id="combined_address">
	
	<div>
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
			        <input type="text" id="idInput" name="id" class="m_w_100" style="width:20%;" minlength="8" maxlength="20" required>
			        <div id="id_resultMessage"></div>
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
					<input type="password" name="password" class="m_w_100" style="width:20%;" minlength="8" maxlength="20" required>
					<span class="guide_txt">* 영문,숫자 조합 8자 이상 입력해 주세요.</span>
					<div id="passwordMismatchMessage1" class="error-message">test</div>
				</td>
			</tr>
				
			<tr>
				<th>
					<span class="happy_member_join_form_title">
						<span class="happy_member_icon_check">
							<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle" >
						</span>패스워드 확인
					</span>
				</th>
				<td class="h_form">
					<input type="password" name="password2" class="m_w_100" style="width:20%;" minlength="8" maxlength="20" required>
					<span class="guide_txt">* 비밀번호를 다시 한 번 입력해주세요.</span>
					<div id="passwordMismatchMessage2" class="error-message"></div>
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
					<input type="text" name="name" class="m_w_100" style="width:20%;" minlength="2" maxlength="10" required >
					<span class="guide_txt">* 실명으로 입력해 주세요. </span>
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
					<input type="text" id="nickNameInput" name="nickName" class="m_w_100" style="width:20%; "minlength="3" maxlength="10" required >
					<div id="nickName_resultMessage" class="check_txt"></div>
				</td>
			</tr>
			
			
			
			
			
			
			<tr>
				<th>
					<span class="happy_member_join_form_title">
						<span class="happy_member_icon_check">
							<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle">
						</span>생년월일
					</span>
				</th>
				<td class="h_form">
					<input type="date" name="birthday"  min="1900-01-01" max="3000-12-31" class="m_w_100" required>
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
			
				
				
				<td class="h_form">
				<div style="display: flex;">
					<input type="text" name="email_at_user" class="join_input_e_01" required> @ 
					<input type="text" name="email_at_host" id="user_email_at_host" class="join_input_e_02" required> 
					<select style="width:80px;" name="user_email_at_hostSel" id="user_email_at_hostSel" class="join_select_e" onchange="updateInputValue()" required>
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
						</span>프로필 사진
					</span>
				</th>
				<td class="h_form">
					<input type="file" name="photo" class="m_w_100" required >
					<span class="guide_txt">1:1 비율로 맞춰주세요 </span>
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
				<td class="h_form">
					<select style="width:80px;" name="phone_first" required>
						<option value="">선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>	
						<option value="016">016</option>	
						<option value="017">017</option>	
						<option value="018">018</option>	
						<option value="019">019</option>
					</select> - <!-- !! - 기호 지우시면 아니되옵니다!! -->
					
					<input type="text" style="width:80px;" name="phone_second" maxlength="4"  required> - <!-- !! - 기호 지우시면 아니되옵니다!! -->
					<input type="text" style="width:80px;" name="phone_third" maxlength="4" required>
					<span id="phoneNo_resultMessage" class="check_txt"></span>
				</td></tr>
			
			
			
	
	
	
	
	
			
			
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
				  <input type="text" id="sample6_postcode" name="address_first" placeholder="우편번호" style="width: 120px;" readonly="readonly" required >
			      <input type="button" id="buttn_st" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="cursor:pointer;"><br>
			     </div>
			      <input type="text" id="sample6_address" name="address_second" placeholder="주소" style="width:60%; margin-bottom: 5px;" maxlength="50" readonly="readonly" required><br>
			      <input type="text" id="sample6_detailAddress" name="address_third" placeholder="상세주소" style="width:60%;" required >
				</td>
			</tr>
			
			
			
			
			
			
			
			
			
			
			
			
			
				
				
				
												
				<tr>
					<th>
						<span class="happy_member_join_form_title">
							<span class="happy_member_icon_check">
							<img src="http://adblog.cgimall.co.kr/img/form_icon1.gif" align="middle"></span>하고싶은말
						</span>
					</th>
					<td class="h_form">
						<textarea name="introduce" style="width:100%; height:150px;" required></textarea>
					</td>
				</tr>
				
				
				
				
				<tr>
					<th>
						<span class="happy_member_join_form_title">
							<span class="happy_member_icon_check"></span>인스타그램
						</span>
					</th>
					<td class="h_form">
						<input type="text" name="urlSNS"  class="m_w_100" style="width:30%;"> 
						<span class="guide_txt2">* 인스타그램 URL을 입력하셔야 인스타그램으로 리뷰어 신청을 하실 수 있습니다.</span>
					</td>
				</tr>
				<tr>
					<th>
						<span class="happy_member_join_form_title">
							<span class="happy_member_icon_check"></span>유튜브
						</span>
					</th>
					<td class="h_form">
						<input type="text" name="urlYoutube"  class="m_w_100" style="width:30%;"> 
						<span class="guide_txt2">* 유튜브 URL을 입력하시면 유튜브로 리뷰어 신청을 하실 수 있습니다.</span>
					</td>
				</tr>
				<tr>
					<th>
						<span class="happy_member_join_form_title">
							<span class="happy_member_icon_check"></span>네이버
						</span>
					</th>
					<td class="h_form">
						<input type="text" name="urlNaver"  class="m_w_100" style="width:30%;"> 
						<span class="guide_txt2">* 네이버블로그 URL을 입력하셔야 네이버블로그로 리뷰어 신청을 하실 수 있습니다.</span>
					</td>
				</tr>
				
				
				
				
			</tbody>
		</table>			
	</div>
	<div style="display:flex; justify-content: center;  text-align:center; margin:20px 0 80px 0;" class="h_form noto400">
		<button type="submit" uk-icon="icon: check; ratio:1" class="h_btn_st1 h_btn_b icon_b uk-icon" onclick="combineAndSubmit()">가입하기
			<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="check">
				<polyline fill="none" stroke="#ffffff" stroke-width="1.1" points="4,10 8,15 17,4"></polyline>
			</svg>
		</button>
		
		<a href="javascript:history.back()" uk-icon="icon: reply; ratio:1" class="h_btn_b icon_b uk-icon" style="margin-left:5px;">뒤로가기
				<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="reply">
					<path d="M17.7,13.11 C16.12,10.02 13.84,7.85 11.02,6.61 C10.57,6.41 9.75,6.13 9,5.91 L9,2 L1,9 L9,16 L9,12.13 C10.78,12.47 12.5,13.19 14.09,14.25 C17.13,16.28 18.56,18.54 18.56,18.54 C18.56,18.54 18.81,15.28 17.7,13.11 L17.7,13.11 Z M14.82,13.53 C13.17,12.4 11.01,11.4 8,10.92 L8,13.63 L2.55,9 L8,4.25 L8,6.8 C8.3,6.86 9.16,7.02 10.37,7.49 C13.3,8.65 15.54,10.96 16.65,13.08 C16.97,13.7 17.48,14.86 17.68,16 C16.87,15.05 15.73,14.15 14.82,13.53 L14.82,13.53 Z">
					</path>
				</svg>
			</a>
		</div>
	</form>
</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>
<script>
/* submit, onclick 실행 */
function combineAndSubmit()
{						
	var isSnsValid=validSnsForm();
    var isPhoneValid = validphoneForm();
    if (!isPhoneValid ||!isSnsValid ) {     
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