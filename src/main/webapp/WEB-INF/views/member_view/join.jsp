<%--
  Created by IntelliJ IDEA.
  User: UserK
  Date: 2023-08-24
  Time: 오전 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.project.reviewquest.member.InfluencerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans+KR" media="all">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/FlexSlider.css" type="text/css" media="screen">
<title>회원가입</title>
<style>
  /* 스크롤바를 가진 div 요소에 스타일 적용 */
  .scrollable-content {
    max-height: 400px; /* 스크롤바의 최대 높이를 조정 */
    overflow-y: auto; /* 세로 스크롤바를 표시하도록 함 */
    border: 1px solid #ccc; /* 테두리 스타일을 추가 (선택 사항) */
    padding: 10px; /* 내용과 테두리 사이의 간격 (선택 사항) */
    background-color : #fafafa;
  }
	 /* 체크박스를 크게 만들기 */
	input[type="checkbox"] {
	    width: 20px; /* 너비 조절 */
	    height: 20px; /* 높이 조절 */
	}
  
</style>

</head>
<body>
<div id="wrap">



<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>


  
  <!-- custom scrollbar plugin -->

    

  <div class="container">
    <form name="chkform" id="chkform">
      <input type="hidden" name="member_group" value="">
      <input type="hidden" name="mode" value="">


      <!-- 아이핀추가 hun -->
      <div class="member_agree">
        
        <h2 style="font-size: 26px; letter-spacing: -1px;  color: #101010; margin: 45px 0 35px 0;">
          회원가입 약관동의
          <span style="font-size: 15px; letter-spacing: -1px;  color: #a6a6a6; font-weight:normal">
				회원가입에 필요한 약관을 확인해주세요.
			</span>
        </h2>
        
        <div class="step_check">
          <div style="text-align:left">
            <img src="http://adblog.cgimall.co.kr/skin/adblog/img/skin_icon/make_icon/skin_icon_797.jpg" alt="약관동의">
          </div>
          <div style="text-align:center">
            <img src="http://adblog.cgimall.co.kr/skin/adblog/img/join_step_02.jpg" alt="정보입력">
          </div>
          <div style="text-align:right">
            <img src="http://adblog.cgimall.co.kr/skin/adblog/img/join_step_03.jpg" alt="가입완료">
          </div>
        </div>

        <div class="member_allcheck">
          <div class="f_l txt">
            아래 모든 약관의 내용을 확인하고 전체 동의합니다.
          </div>
          <div class="f_r h_form">
            <label class="h-check check_margin_font20">
              <input type="checkbox" name="all_checked" id="all_checked" style="cursor:pointer">
              <span style="font-size:20px; font-weight:500 !important;">모든 약관에 동의합니다.</span>
            </label>
          </div>
        </div>
        
         <h3 class="title" style="margin-top:25px">
          회원정보이용
        </h3>
        
      <div class="scrollable-content">
        <p>[제1장&nbsp; 총칙]</p>

        <p>제1조 (목적)<br>
          본 약관은 .jars조에서 운영하는 업체정보(이하 "신규업체정보"이라 한다)에서제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 이용자의 권리·의무 및 책임사항을 규정함으로써 고객의 권익을 보호함을 목적으로 합니다.</p>

        <p>제2조 (정의)<br>
          ① 신규업체정보란 신규업체정보가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>
          ② 이용자란 신규업체정보에 접속하여 이 약관에 따라 신규업체정보가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
          ③ 회원이라 함은 신규업체정보에 개인정보를 제공하여 회원등록을 한 자로서, 신규업체 정보의 정보를 지속적으로 제공받으며, 신규업체정보에서 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
          ④ 비회원이라 함은 회원에 가입하지 않고 신규업체정보가 제공하는 서비스를 이용하는 자를 말합니다.</p>

        <p>제3조 (약관의 명시와 개정)<br>
          ① 신규업체정보는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 신규업체정보 인터넷 서비스 초기페이지에 게시합니다.<br>
          ② 신규업체정보는 약관의 규제등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
          ③ 신규업체정보는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 신규업체정보의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.<br>
          ④ 신규업체정보는 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 신규업체정보의 "이용자가 상당한 기간 내에 변경 약관에 대한 동의 여부를 표명하지 아니하는 때에는 변경약관의 적용을 받는 것으로 본다"는 취지의 통지를 하였음에도 이용고객이 동의 여부를 표명하지 아니한 경우 또는 부득이하게 그러한 통지를 할 수 없는 경우에는 개정 전에 체결된 계약에도 개정약관이 적용됩니다.<br>
          ⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</p>

        <p>내용(생략)</p>
      	</div>
					
        
        
        
        <div class="f_r h_form" style="padding:17px 0">
          <label class="h-check  check_margin_font14">
            <input type="checkbox" name="chk_ok" id="chk_ok" style="cursor:pointer" class="join_check">
            <span style="font-size:14px;">회원이용약관 내용에 동의합니다.</span>
          </label>
        </div>
        
        
        
        
        
        <h3 class="title" style="margin-top:25px">
          개인정보 취급방침
        </h3>
        
 	<div class="scrollable-content">
            
              ReviewQuest(ReviewQuest.com 이하 "회사"라 함)는 이용자들의 개인정보보호를 매우 중요시하며, 이용자가 회사의 서비스(이하 "ReviewQuest 서비스" 또는 "ReviewQuest"라 함)를 이용함과 동시에 온라인상에서 회사에 제공한 개인정보가 보호 받을 수 있도록 최선을 다하고 있습니다.<br>
              이에 회사는 통신비밀보호법,전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련 법규상의 개인정보보호 규정 및 정보통신부가 제정한 개인정보보호지침을 준수하고 있습니다.<br>
              회사는 개인정보 보호정책을 통하여 이용자들이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다</p>

            <p>회사는 개인정보 보호정책을 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 용이하게 보실 수 있도록 조치하고 있습니다.</p>

            <p>회사의 개인정보 보호정책은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인하여 수시로 변경될 수 있고, 이에 따른 개인정보 보호정책의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다.그리고 개인정보 보호정책을 개정하는 경우 회사는 개인정보 보호정책 변경 시행 7일전부터 HAPPYCGI공지사항을 통하여 공지하고 버전번호 및 개정일자 등을 부여하여 개정된 사항을 이용자들이 쉽게 알아볼 수 있도록 하고 있습니다.</p>

            <p>ReviewQuest의 개인정보 보호정책은 다음과 같은 내용을 담고 있습니다.</p>

            <p>가. 개인정보 수집에 대한 동의<br>
              나. 개인정보의 수집목적 및 이용목적<br>
              다. ReviewQuest가 수집하는 개인정보 항목 및 수집방법<br>
              라. ReviewQuest가 수집하는 개인정보의 보유 및 이용기간<br>
              마. ReviewQuest가 수집한 개인정보의 공유 및 제공<br>
              바. 이용자 자신의 개인정보 관리(열람,정정,삭제 등)에 관한 사항<br>
              사. 쿠키(cookie)의 운영에 관한 사항<br>
              아. 개인정보관련 기술적-관리적 대책<br>
              자. 개인정보의 위탁처리<br>
              차. 개인정보관련 의견수렴 및 불만처리에 관한 사항<br>
              카. 어린이 정보보호에 관한 사항<br>
              타. ReviewQuest 개인정보 관리책임자 및 담당자의 소속-성명 및 연락처<br>
              파. 네이버 고객센터 안내<br>
              하. 고지의 의무</p>

            <p><br>
              가. 개인정보 수집에 대한 동의</p>

            <p>회사는 이용자들이 회사의 개인정보 보호정책 또는 이용약관의 내용에 대하여 「동의」버튼 또는 「취소」 버튼을 클릭할 수 있는 절차를 마련하여, 「동의」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.</p>

            <p><br>
              나. 개인정보의 수집목적 및 이용목적</p>

            <p>"개인정보"라 함은 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다.</p>

            <p>대부분의 ReviewQuest 서비스는 별도의 사용자 등록이 없이 언제든지 사용할 수 있습니다. 그러나 회사는 회원서비스(메일, 네이버폰, 카페, 블로그, 데스크톱, 포토앨범,마이스톡 등 현재 제공 중이거나 향후 제공될 로그인 기반의 서비스) 및 쥬니어네이버, 아크로드 등을 통하여 이용자들에게 맞춤식 서비스를 비롯한 보다 더 향상된 양질의 서비스를 제공하기 위하여 이용자 개인의 정보를 수집하고 있습니다.</p>

            <p>내용(생략)</p>

            <p>...</p>

          </div>
          
         
        <div class="f_r h_form" style="padding:17px 0">
          <label class="h-check check_margin_font14">
            <input type="checkbox" name="chk_ok1" id="chk_ok1" style="cursor:pointer" class="join_check">
            <span style="font-size:14px;">개인정보보호정책에 동의합니다.</span>
          </label>
        </div>
        
        
        
        
        
        
        
        <h3 class="title" style="margin-top:25px">
          개인정보 수집ㆍ이용
        </h3>
 <div class="scrollable-content">
  
              <b>■ 수집하는 개인정보 항목</b><br>
                <span>회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</span></font><br>
              <span >ο 수집항목 : 이름 , 로그인ID , 비밀번호 , 이메일</span><br >
              <span >ο 개인정보 수집방법 : 홈페이지(회원가입)<br></span>
              <br>
             <b>■ 개인정보의 수집 및 이용목적</b><br >
              <span>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다..</span><br >
             
              <span  >ο 서비스 제공에 관한 계약 이행 </span><br>
              <span  >- 콘텐츠 제공</span><br >
              <span  >ο 회원 관리</span><br>
              <span  >- 회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지</span>
              <br>
              <span  >ο 마케팅 및 광고에 활용</span><br >
              <span  >- 이벤트 등 광고성 정보 전달</span><br>
              <br>
              <b >■ 개인정보의 보유 및 이용기간</b><br>
              <span  >원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.</span><br >
              <span  >단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계시령에서 정한 일정한 기간 동안 회원정보를 보관합니다.</span><br >
              <br >
              <span  >보존 항목 : 이름 , 로그인ID , 이메일</span><br>
              <span  >보존 근거 : 회원식별</span><br>
              <span  >보존 기간 : 회원탈퇴시까지</span></p>

          </div>
     
        <div class="f_r h_form aa" style="padding:17px 0; overflow:hidden; margin-bottom:30px">
          <label class="h-check join_check check_margin_font14">
            <input type="checkbox" name="chk_ok2" id="chk_ok2" style="cursor:pointer" class="join_check">
            <span style="font-size:14px;">개인정보 수집 이용에 동의합니다.</span>
          </label>
        </div>
        
        
        
        
        
        
      </div>
    </form>
      </div>
    
    
	 
      
	<div class="join_group_button" style="display: flex; justify-content: center; width: 100%" >
      <table align="center" width="395" border="0" cellpadding="0" cellspacing="5">
        <tbody>
	        <tr>
	          <td>
		          <a href="input?division=company" class="join" >
			          <img src="http://adblog.cgimall.co.kr/skin/adblog/upload/happy_member_group/1679014106-740791.png" width="190" border="0" align="middle">
			      </a>
			  </td>
		 	  <td>
			      <a href="input?division=influencer" class="join">
			          <img src="http://adblog.cgimall.co.kr/skin/adblog/upload/happy_member_group/1588743696-544206.png" width="190" border="0" align="middle">
		          </a>
	          </td>
	        </tr>
	        <tr>
	        </tr>
        </tbody>
       </table>
    </div>
    

  
  
  <script>
  function checkAllAgreements() {
	  // "모든 약관에 동의합니다." 체크박스를 선택합니다.
	  const allCheckedCheckbox = document.getElementById("all_checked");

	  // 나머지 세 개의 체크박스를 선택합니다.
	  const chkOkCheckbox = document.getElementById("chk_ok");
	  const chkOk1Checkbox = document.getElementById("chk_ok1");
	  const chkOk2Checkbox = document.getElementById("chk_ok2");

	  // "class"가 "join"인 a 태그를 선택합니다.
	  const joinLinks = document.querySelectorAll("a.join");

	  // 이미지를 클릭할 때 모든 체크박스가 이미 체크되어 있는지 확인하고
	  // 아니면 경고(alert) 창을 표시하고 페이지 이동을 막습니다.
	  joinLinks.forEach((link) => {
	    link.addEventListener("click", function (event) {
	      if (chkOkCheckbox.checked && chkOk1Checkbox.checked && chkOk2Checkbox.checked) {
	        // 모든 약관에 동의한 경우에는 페이지로 이동합니다.
	        // 기본 동작을 중지합니다.
	        event.preventDefault();
	        window.location.href = this.getAttribute("href");
	      } else {
	        alert("모든 약관에 동의해야 가입이 가능합니다.");
	        event.preventDefault(); // 페이지 이동을 막습니다.
	      }
	    });
	  });

	  // "모든 약관에 동의합니다." 체크박스를 클릭할 때 다른 세 개의 체크박스도 체크되도록 합니다.
	  allCheckedCheckbox.addEventListener("click", function () {
	    // "모든 약관에 동의합니다." 체크박스의 상태를 가져옵니다.
	    const isChecked = allCheckedCheckbox.checked;

	    // "회원이용약관 내용에 동의합니다." 체크박스의 상태를 설정합니다.
	    chkOkCheckbox.checked = isChecked;

	    // "개인정보보호정책에 동의합니다." 체크박스의 상태를 설정합니다.
	    chkOk1Checkbox.checked = isChecked;

	    // "개인정보 수집 이용에 동의합니다." 체크박스의 상태를 설정합니다.
	    chkOk2Checkbox.checked = isChecked;
	  });
	}

	// 페이지 로드 시 함수를 호출하여 스크립트를 실행합니다.
	checkAllAgreements();

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>
</div>
</body>
</html>
