<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
<head>
<link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/FlexSlider.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/bbs_style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>ReViewQuest</title>
<style type="text/css">
	.ck-editor__editable { height: 400px; }
	.ck-content { font-size: 13px; }
	
	.list_hover:hover {
	border : 1px solid #b2b2b2 !important;
}

.write_hover:hover {
	background: #0057b3 !important;
}
</style>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.influencerInfo}">
        <c:set var="userInfo" value="${sessionScope.influencerInfo}" />
    </c:when>
    <c:when test="${not empty sessionScope.companyInfo}">
         <c:set var="userInfo" value="${sessionScope.companyInfo}" />
    </c:when>
    <c:when test="${not empty sessionScope.adminInfo}">
        <c:set var="userInfo" value="${sessionScope.adminInfo}" />
    </c:when>
</c:choose>
	
	<div class="container af_clear">
	<jsp:include page="/WEB-INF/views/common/aside.jsp" flush="true"></jsp:include>
		<div class="f_l" style="width:1202px; margin:60px 0 70px 50px;">
			<script language="JAVASCRIPT">
function check_Valid()
{
	//이름 체크
	if ( regiform.bbs_name.value == "" )
	{
		alert("이름을 입력해 주세요.");
		regiform.bbs_name.focus();
		return false;
	}

	//제목 체크
	if ( regiform.bbs_title.value == "" )
	{
		alert("제목을 입력해 주세요.");
		regiform.bbs_title.focus();
		return false;
	}
	//이메일 체크
	if ( regiform.bbs_email_at_user != undefined && regiform.bbs_email_at_host != undefined )
	{
		if ( regiform.bbs_email_at_user.value == "" && regiform.bbs_email_at_host.value != "" )
		{
			alert("이메일 주소를 모두 입력하세요.");
			regiform.bbs_email_at_user.focus();
			return false;
		}

		if ( regiform.bbs_email_at_user.value != "" && regiform.bbs_email_at_host.value == "" )
		{
			alert("이메일 주소를 모두 입력하세요.");
			regiform.bbs_email_at_host.focus();
			return false;
		}

		if ( regiform.bbs_email_at_user.value != "" )
		{
			var pattern = /^[_a-zA-Z0-9-\.]+$/;

			if ( !pattern.test(regiform.bbs_email_at_user.value) )
			{
				alert("이메일 주소를 올바르게 입력하세요.");
				regiform.bbs_email_at_user.focus();
				return false;
			}
		}

		if ( regiform.bbs_email_at_host.value != "" )
		{
			var pattern = /^[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;

			if ( !pattern.test(regiform.bbs_email_at_host.value) )
			{
				alert("이메일 주소를 올바르게 입력하세요.");
				regiform.bbs_email_at_host.focus();
				return false;
			}
		}

		if ( regiform.bbs_email_at_user.value != "" && regiform.bbs_email_at_host.value != "" )
		{
			if ( regiform.bbs_email != undefined )
			{
				regiform.bbs_email.value = regiform.bbs_email_at_user.value + "@" + regiform.bbs_email_at_host.value;
			}
		}
	}
	//내용 체크
	if( CKEDITOR.instances['bbs_review'].getData() == '' ) {
		alert('내용을 입력하세요');
		return false;
	}

	return true;
}

function bbs_email_at_host_select(obj)
{
	if ( regiform.bbs_email_at_host != undefined )
	{
		regiform.bbs_email_at_host.value = obj.options[obj.selectedIndex].value;

		if ( regiform.bbs_email_at_host.value == "" )
		{
			regiform.bbs_email_at_host.focus();
		}
	}
}
</script>
<c:choose>
    <c:when test="${empty userInfo}">       
    	<div><div class="noto500 ls_1" style="font-size:30px; color:#333; padding-bottom:50px;">로그인 후 이용가능합니다.</div></div>    
    	<a href="${contextPath}/forum/" class="h_btn_b icon_b uk-icon" uk-icon="icon:list; ratio:1">목록보기<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="list"><rect x="6" y="4" width="12" height="1"></rect><rect x="6" y="9" width="12" height="1"></rect><rect x="6" y="14" width="12" height="1"></rect><rect x="2" y="4" width="2" height="1"></rect><rect x="2" y="9" width="2" height="1"></rect><rect x="2" y="14" width="2" height="1"></rect></svg></a>	     
    </c:when>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    <c:otherwise>
        

<form name="regiform" method="post" action="${contextPath}/forum/form?name=${userInfo.nickName}" onsubmit="return check_Valid();" enctype="multipart/form-data" target="h_blank">
<input type="hidden" name="mode" value="add_ok">
<input type="hidden" name="tb" value="board_free">
<input type="hidden" name="bbs_num" value="">
<input type="hidden" name="bbs_email" value="">
<input type="hidden" name="links_number" value="">
<input type="hidden" name="boardCallType" value="">

<div style="width:100%;">

	<!-- 게시판상단 -->
	<div><div class="noto500 ls_1" style="font-size:30px; color:#333; padding-bottom:50px;">자유게시판</div></div>
	<!-- 게시판상단 -->

	<div style="border-top:1px solid #4d4d4d;" class="bbs_reg_table">
		<table>
		<tbody>
		<tr>
			<th>등록인</th>
			<td class="h_form">
				<input type="text" name="name" value="${userInfo.nickName }" disabled>
			</td>
		</tr>

		<tr>
			<th>이메일</th>
			<td class="h_form">
				<input type="text" name="email" value="${userInfo.email }" disabled> 
			</td>
		</tr>		
		<tr>
			<th>제목</th>
			<td class="h_form"><input name="title" type="text" value=""></td>
		</tr>
		<tr>
			<td colspan="2" style="padding:10px 0px;">
				<!-- 위지윅 시작 -->
				<!--  에디터 관련 CSS -->
			<textarea id="content" name="content"></textarea>
				<!-- 위지윅끝 -->
			</td>
		</tr>
		</tbody></table>
	</div>
	<!-- 게시판버튼 -->
	<div style="border-top: 1px solid #4d4d4d;" class="h_form bbs_reg_bottom_btn" >
		<div style="display: flex; justify-content: center;">
	    	<div>
			    <a href="${contextPath}/forum/" class="uk-icon list_hover" style=" padding: 12px 20px; border: 1px solid #e5e5e5; line-height: 1; border-radius: 4px;">
			        <i class="fa fa-list" style="font-size: 20px; margin-right: 5px;"></i>
			        <span>목록보기</span>
			    </a>
		    </div>
		    <div>
			    <button id="searchBtn" class="d-flex align-items-center write_hover" style=" padding: 12px 20px; border: 1px solid #e5e5e5; line-height: 1; background: #0067ff;color: #ffffff; border-radius: 4px;">
			        <i class="fa fa-pencil" style="font-size: 20px; margin-right: 5px;"></i>
			        <span>작성하기</span>
			    </button>
		    </div>
	    </div>
	</div>
 </c:otherwise>
</c:choose>
	<!-- 게시판버튼 -->

	<!-- 게시판하단 -->
	<div></div>
	<!-- 게시판하단 -->

</div></form></div></div>
<script>
 $('#content').summernote({
		height: 300,
		width : 1200,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: "ko-KR",
		callbacks: {
	          onImageUpload : function(files, editor, welEditable){
	                // 파일 업로드(다중업로드를 위해 반복문 사용)
	                for (var i = files.length - 1; i >= 0; i--) {
	                    sendFile(files[i], this);
	                    }
	                },
	                onMediaDelete: function ($target, editor, $editable) {
	                    if (confirm('이미지를 삭제 하시겠습니까?')) {
	                        var deletedImageUrl = $target
	                            .attr('src')
	                            .split('/')
	                            .pop();

	                        // 이미지 삭제 함수 호출
	                        deleteSummernoteImageFile(deletedImageUrl, editor);
	                    }
	                }
	     } 
	});
		
	function sendFile(file, editor){
		var data = new FormData();
		data.append("file", file);
		console.log(file);
		$.ajax({
			data : data,
			type : "POST",
			url : "SummerNoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
	            var json = JSON.parse(data);
	            $(editor).summernote('editor.insertImage',json["url"]);
	        	},
		        error : function(e) {
		            console.log(e);
		        }
	    	});
	}
	
	function deleteSummernoteImageFile(imageName) {
        data = new FormData()
        data.append('file', imageName)
        $.ajax({
            data: data,
            type: 'POST',
            url: 'deleteSummernoteImageFile',
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
        })
    }
</script>
<br><br><br>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>