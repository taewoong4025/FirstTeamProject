<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <jsp:useBean id = "memBean" class ="shop.member.MemberBean"></jsp:useBean>
    <jsp:setProperty property="*" name="memBean"/>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<%
		
			MemberDBBean manager = MemberDBBean.getInstance();
			String id = request.getParameter("id");	
			String password = request.getParameter("password");
			
			MemberBean mb = manager.getMember(id);
			int check = manager.userCheck(id, password);
			
			if(mb==null){
		 		%>
		 		<script>
		 			alert("존재하지 않는 회원입니다.");
		 			history.go(-1);
		 		</script>
		 		<% 
		 	}
		 	else{
				String sessionID = mb.getId();
				
		 		if(check==1){
		 			
		 			session.setAttribute("sessionID" , sessionID);
		 			session.setAttribute("Member" , "yes");
		 			response.sendRedirect("../index.jsp");
		 		}else if(check==0){
		 			%>
		 			 <script>
		 			alert("비밀번호가 맞지 않습니다.");
		 			history.go(-1);
		 		</script>
		 			<% 
		 		}else{
		 			%>
					 <script>
					alert("아이디가 맞지 않습니다.");
		 			history.go(-1);
				</script>
					<%
		 		}
		 	}
		%>
		
		
</body>
</html>