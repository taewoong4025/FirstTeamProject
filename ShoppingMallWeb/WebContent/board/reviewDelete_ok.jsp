<%@page import="shop.reviewBoard.reviewBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	String pageNum = request.getParameter("pageNum");
	int id = Integer.parseInt(request.getParameter("id"));
	String password = request.getParameter("password");
	
	System.out.print("@@@@###==>" + password);
	
	reviewBoardDBBean db = reviewBoardDBBean.getInstance();
	int re = db.deleteBoard(id, password);
	
if(re == 1){
		
		response.sendRedirect("reviewList.jsp?pageNum="+pageNum);
		%>
		<script type="text/javascript">
			alert("해당 게시물이 삭제되었습니다!");
		</script>
	<%
		
	}else if(re == 0){
		%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
		<%
	}else if(re == -1){
		%>
			<script type="text/javascript">
				alert("삭제에 실패하였습니다.");
				history.go(-1);
			</script>
		<%
	}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>