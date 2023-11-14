<%--
  Created by IntelliJ IDEA.
  User: UserK
  Date: 2023-08-24
  Time: 오전 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="footer"><div id="footer">
  <div class="footer_top" style="border-top:1px solid #e6e8ed;">
    <div class="af_clear" style="background:#ffffff; width:1500px; margin:0 auto; margin-top:30px; margin-bottom:30px;">
      <div class="f_l">
        <p class="noto700" style="color: #111111; font-size: 36px; margin-bottom:4px;">070-8065-3082</p>

        <p class="noto500" style="color:#111111; letter-spacing: -1px; font-size: 13px;">평일 09:00 ~ 18:00 / 점심시간 12:00 ~ 13:00</p>

        <p class="noto400" style="color:#999999; letter-spacing: -1px; font-size:13px;">주말, 공휴일 제외</p>

        <div style="margin-top:15px;"><a class="noto500" href="/bbs_list.php?tb=board_customer" style="color:#333333; letter-spacing: -1px; font-size:13px; padding:6px 39px 6px 12px; border:1px solid #e6e8ed; border-radius:3px; background:url(/skin/adblog/img/footer_btn_arrow.jpg) no-repeat 90% center; margin-right:2px;">질문과 답변</a> <a class="noto500" href="/bbs_list.php?tb=board_faq" style="color:#333333; letter-spacing: -1px; font-size:13px; padding:6px 37px 6px 10px; border:1px solid #e6e8ed; border-radius:3px; background:url(/skin/adblog/img/footer_btn_arrow.jpg) no-repeat 90% center;">자주하는 질문</a></div>

        <div class="copy_count_text" style="display:inline-block; margin:45px 0;">
          <span class="count_text">인플루언서</span>
          <span class="count_number" style="">${influencerCount}</span>
          <span class="count_text">캠페인</span>
          <span class="count_number">${campaignCount}</span>
        </div>
      </div>
      <div class="f_r footer_menu">
        <div class="f_l" style="margin-right:70px;">
          <span class="footer_menu_title noto700">방문</span>
          <ul>
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=방문&subCategory=맛집&region=">맛집</a></li>
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=방문&subCategory=숙박&region=">숙박</a></li>
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=방문&subCategory=문화&region=">문화</a></li>
          </ul>
        </div>
        <div class="f_l" style="margin-right:70px;">
          <span class="footer_menu_title noto700">제품</span>
          <ul>
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=생활&region=">생활</a></li>
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=유아동&region=">유아동</a></li>
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=뷰티&region=">뷰티</a></li>
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=디지털&region=">디지털</a></li>
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=패션&region=">패션</a></li>
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=도서&region=">도서</a></li>            
            <li><a class="footer_menu_text" href="${pageContext.request.contextPath}/list?mainCategory=제품&subCategory=식품&region=">식품</a></li>      
          </ul>
        </div>
        <div class="f_l" style="margin-right:75px;">
          <a href="bbs_index.php" class="footer_menu_title noto700">커뮤니티</a>
          <table cellspacing="0" cellpadding="0" border="0" width="100%"><tbody><tr><td><a class="footer_menu_text noto400" href="${contextPAth }/news/">공지사항</a>
          </td></tr><tr><td><a class="footer_menu_text noto400" href="${contextPath }/forum/">자유게시판</a>
          </td></tr></tbody></table>
        </div>
      </div>
    </div>
  </div>
  <div class="footer_bottom" style="border-top:1px solid #e6e8ed; padding:35px 0;">
    <div class="af_clear noto500" style="background:#ffffff; width:1500px; margin:0 auto; position:relative;">
      <div class="copy_link_text">
        <a href="html_file.php?file=stipulation02.html">이용약관</a>
        <a href="html_file.php?file=stipulation01.html">개인정보취급방침</a>
        <a href="#noemail" onclick="window.open('html_file.php?file=email_no_collect.html&amp;file2=default_blank.html','popwin','top=22,left=0,width=600,height=275');">이메일무단수집거부</a>
        <a href="#" onclick="window.open('happy_message.php?mode=send&amp;receiveid=cgimalladmin&amp;receiveAdmin=y&amp;adminMode=n','happy_message','width=700,height=680,toolbar=no,scrollbars=no')">관리자쪽지</a>
      </div>
      <div style="margin-top:23px;">
        <p class="noto400" style="font-size:13px; letter-spacing:-0.75px; color:#999999; line-height: 1.6;">리뷰퀘스트&nbsp; &nbsp; &nbsp;&nbsp;대표: 신현민&nbsp; &nbsp; &nbsp;&nbsp;주소: 경상남도 창원시 의창구 소계로 13&nbsp; &nbsp; &nbsp;&nbsp;고객센터: 070-8065-3082</p>

        <p class="noto400" style="font-size:13px; letter-spacing:-0.75px; color:#999999; display:inline-block;">사업자등록번호: 378-38-00890&nbsp; &nbsp; &nbsp;&nbsp;통신판매등록번호: 두호 제433&nbsp; &nbsp; &nbsp;&nbsp;이메일: tls9081@naver.com&nbsp; &nbsp; &nbsp;&nbsp;<a href="https://cgimall.co.kr/" style="color:111111;">Hosting by CGIMALL</a></p>


            

        <!--POWERED BY CGIMALL-->
        <a href="${contextPath }/index" style="margin-left:17px;"><img src="${contextPath}/resources/images/logo/logo.png" width="220px" alt="리뷰퀘스트 체험단" title="리뷰퀘스트 체험단"></a>
        <div class="ls_1" style="color:#111111; font-size:13px; margin-top:12px;">
          Copyright(c) 2020 ReViewQuest All Rights Reserved.
        </div>
      </div>
    </div>
  </div>
</div>


</div>
</div>

<script defer="" src="js/FlexSlider/jquery.flexslider.js"></script>
<script type="text/javascript">

  $(document).ready(function() {
    $('.flexslider').flexslider({
      animation: 'slide'
    });
  });

</script>







<script language="JavaScript">
  function setCookie( name, value, expiredays )
  {
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
  }
  function closeWin( cookie_name, formName, layerName )
  {
    if ( document.forms[formName].no_popup.checked )
    {
      setCookie( cookie_name , "no" , 3);
    }

    document.getElementById(layerName).style.visibility = 'hidden';
  }
</script>


<style>
  .cgialert_shadows{
    box-shadow: 0 0 20px rgb(0 0 0 / 10%);
    -moz-box-shadow: 0 0 20px rgba(0,0,0, .1);
    -webkit-box-shadow: 0 0 20px rgb(0 0 0 / 10%);
  }
  .cgimallalert_layers {
    border-radius:20px;
    background-color:#fff;
    border:solid 1px #eaeaea;
    text-align:center;
    padding:15px 8px 13px 8px;
    box-sizing: border-box;
  }
  
  .footer_menu_text:hover{
  	color : #0067ff !important;
  }
</style>
</body>
</html>
