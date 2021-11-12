<%@page import="shop.cart.CartDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String sessionID = (String)session.getAttribute("sessionID");
		CartDBBean manager = CartDBBean.getInstance();
		manager.buytbl_insert(sessionID);
	%>
	<script>
		alert("구매가 완료되었습니다. 감사합니다.");
		document.location.href = "../index.jsp";
	</script>

</body>
</html>