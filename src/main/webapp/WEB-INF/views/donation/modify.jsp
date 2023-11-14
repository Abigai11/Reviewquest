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
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href="${contextPath }/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/FlexSlider.css" rel="stylesheet" type="text/css">
<link href="${contextPath }/resources/css/bbs_style.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function () {
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".modBtn").on("click", function () {
			formObj.submit();
		});
		
		$(".cancelBtn").on("click", function () {
			history.go(-1);
		});
		
		$(".listBtn").on("click", function () {
			self.location = "${contextPath}/donation/";
		});
	});
</script>
<head>
<meta charset="UTF-8">
<title>ReViewQuest</title>
<style type="text/css">
.list_hover:hover {
	border : 1px solid #b2b2b2 !important;
}

.write_hover:hover {
	background: #0057b3 !important;
}
</style>
</head>
<body>
<div class="container af_clear">
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
<c:choose>
    <c:when test="${empty userInfo || userInfo.division ne 'admin'}">       
    	<div><div class="noto500 ls_1" style="font-size:30px; color:#333; padding-bottom:50px;">이용할 수 없는 페이지입니다.</div></div>                
    </c:when>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    <c:otherwise>
    <div style=" text-align: center; margin: 0 auto;">
	<form action="${contextPath }/donation/modify?num=${donationDTO.num}" method="post" enctype="multipart/form-data" id="frm">
	
	<div style="width:100%;">

	<!-- 게시판상단 -->
	<div><div class="noto500 ls_1" style="font-size:30px; color:#333; padding:50px 50px ">기부페이지 수정</div></div>
	<!-- 게시판상단 -->

	<div style="border-top:1px solid #4d4d4d; border-bottom:1px solid #4d4d4d;" class="bbs_reg_table">
		<table>
		<tr>
			<th>제목</th>
			<td class="h_form">
				<input type="text" name="title" value="${donationDTO.title }">
			</td>
		</tr>
		<tr>
			<th>기관명</th>
			<td class="h_form">
				<input type="text" name="office" value="${donationDTO.office }">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="padding:10px 0px;">
				<textarea id="content" name="content">${donationDTO.content }</textarea>
			</td>
		</tr>
		<tr>
			<th>목표날짜</th>
			<td class="h_form"><input name="endDate" type="date" value="${donationDTO.endDate }"></td>
		</tr>
		<tr>
			<th>목표금액</th>
			<td class="h_form"><input name="targetAmount" type="number" value="${donationDTO.targetAmount }"></td>
		</tr>
		<tr>
			<th>썸네일</th>
			<td class="h_form">
				<input type="file" name="file">
			</td>
		</tr>
		</table>
	</div>

	<!-- 게시판버튼 -->
	<div class="h_form bbs_reg_bottom_btn" >
		<div style="display: flex; justify-content: center;">
	    	<div>
			    <a href="${contextPath}/donation/" class="uk-icon list_hover" style=" padding: 12px 20px; border: 1px solid #e5e5e5; line-height: 1; border-radius: 4px;">
			        <i class="fa fa-list" style="font-size: 20px; margin-right: 5px;"></i>
			        <span>목록보기</span>
			    </a>
		    </div>
		    <div>
			    <button id="searchBtn" class="d-flex align-items-center write_hover" style=" padding: 12px 20px; border: 1px solid #e5e5e5; line-height: 1; background: #0067ff;color: #ffffff; border-radius: 4px;">
			        <i class="fa fa-pencil" style="font-size: 20px; margin-right: 5px;"></i>
			        <span>수정하기</span>
			    </button>
		    </div>
	    </div>
	</div>
</div>
	</form>
	</div>
</c:otherwise>
</c:choose>
</div>
<script>
 $('#content').summernote({
		height: 500,
		width : 1500,
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