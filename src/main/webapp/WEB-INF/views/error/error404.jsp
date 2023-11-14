<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 error</title>
<style>
  body {
    background-color: #003181; /* 원하는 배경 색상으로 변경 */
    color: white; /* 텍스트 색상을 흰색으로 설정 */
  }

  .logo {
  	width:200px;
  	height: 50px;
  }
</style>
</head>
<body>
<div style="width: 100%; text-align: center;">
	<img src="${pageContext.request.contextPath}/resources/images/error/error404.png">
</div>
<div style="display: flex; justify-content: center; align-items: center; width:100%; flex-direction: column;">
	<a href="${pageContext.request.contextPath}/index" style="text-decoration: none; color: white; font-weight: bold;">
  		홈으로 돌아가기
	</a><br>
	<a href="${pageContext.request.contextPath}/index">
		<img class="logo" src="${pageContext.request.contextPath}/resources/images/logo/logo.png">
	</a>
</div>
</body>
</html>