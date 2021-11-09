<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 처리</title>
</head>
 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include>


<body>
	<%
		String id = (String)session.getAttribute("sessionID");
		String pw = request.getParameter("password");
		
		MemberDBBean manager = MemberDBBean.getInstance();
		int check = manager.deleteMember(id, pw);

		
		if(check == 1){
			session.invalidate();
		
	%>
	
	<br><br>
	<p align="center">
	<b><font size="4" color="gray">회원정보가 삭제되었습니다.<탈퇴 완료></font></b><br>
	
	<input type="button" value="확인" onclick="location.href='../index.jsp'">
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
</body>

 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
</html>