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

 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include></head>
 
    <br><br>

	<%
		String id = session.getAttribute("sessionID").toString();
		String pw = request.getParameter("password");
		
		MemberDBBean manager = MemberDBBean.getInstance();
		int check = manager.userCheck(id, pw);
		
		if(check == 1){
		
		
	%>
	
	<p align="center">
	<br><br>
	<b><font size="4" color="gray">회원 정보 변경이 가능합니다!</font></b><br>
	
	<input type="button" value="확인" onclick="location.href='../member/modify.jsp'">
	</p>
	
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
	
	<br><br><br>
	     
	 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>