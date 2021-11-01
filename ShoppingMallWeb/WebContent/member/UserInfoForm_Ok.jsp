<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 권한 확인2</title>
</head>
<body>
	<%
		String id = session.getAttribute("sessionID").toString();
		String pw = request.getParameter("password");
		
		MemberDBBean manager = MemberDBBean.getInstance();
		int check = manager.userCheck(id, pw);
		
		if(check == 1){
		
		
	%>
	
	<br><br>
	<b><font size="4" color="gray">회원 정보 변경이 가능합니다!</font></b><br>
	
	<input type="button" value="확인" onclick="location.href='../member/modify.jsp'">
	
	<%
	}else{
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>