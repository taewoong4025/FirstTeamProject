<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃 처리</title>
</head>
<body>
	<%
		session.invalidate(); //모든 세션정보 삭제
		response.sendRedirect("login.html");
	
	%>
</body>
</html>