<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>�α׾ƿ� ó��</title>
</head>
<body>
	<%
		session.invalidate(); //��� �������� ����
		response.sendRedirect("login.html");
	
	%>
</body>
</html>