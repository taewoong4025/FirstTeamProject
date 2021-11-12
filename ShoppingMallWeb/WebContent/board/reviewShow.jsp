<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shop.reviewBoard.reviewBoardBean"%>
<%@page import="shop.reviewBoard.reviewBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String pageNum = request.getParameter("pageNum");
	int Id = Integer.parseInt(request.getParameter("id"));
	String sessionID = request.getParameter("sessionID");
	
	System.out.print("@@@###sessionID => : " + sessionID);
	
	reviewBoardDBBean db = reviewBoardDBBean.getInstance();
	reviewBoardBean board = db.getBoard(Id, true);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int id=0, b_hit=0;
	String b_title="", b_content="", b_img="";
	Timestamp b_date=null;
	
	id = board.getId();
	b_img = board.getB_img();
	b_title = board.getB_title();
	b_content = board.getB_content();
	b_date = board.getB_date();
	b_hit = board.getB_hit();
    %>
<html>
<head>
<meta charset="UTF-8">
 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include></head>
		<br><br><br>

<body>
	<center>
		<h1>게시물 조회</h1>
		<table border="1" width="800" cellspacing="0">
			<tr height="30" align="center">
				<td width="100">
					번호
				</td>
				<td width="200">
					<%= id %>
				</td>
				
				<td width="100">
					조회수
				</td>
				<td width="200">
					<%= b_hit %>
				</td>	
			</tr>
			
			<tr height="30" align="center">
				
				<td width="100">
					작성일
				</td>
				<td width="200">
					<%= sdf.format(b_date) %>
				</td>
				<td width="100">
				이미지
				</td>
				<td width="200">
				    <!-- Product image-->
                <img src="${pageContext.request.contextPath}/reviewImg/<%= b_img %>" width="550" height="200"/>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					제목
				</td>
				<td colspan="3" width="100">
					<%= b_title %>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					내용
				</td>
				<td colspan="3" width="100">
					<pre>
						<%= b_content %>
					</pre>
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right">
					
					<%
						if(sessionID.equals("admin")){
					%>
					<input type="button" value="글수정" onclick="location.href='edit.jsp?id=<%= id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="글삭제" onclick="location.href='delete.jsp?id=<%= id %>&pageNum=<%= pageNum %>'">
					<%
						}
					%>
					<!--공지사항 이므로 답변글 x-->
					<!--  <input type="button" value="답변글" onclick="location.href='write.jsp?id=<%= id %>&pageNum=<%= pageNum %>'">-->
					<input type="button" value="글목록" onclick="location.href='reviewList.jsp?<%= pageNum %>'">
				</td>
			</tr>
		</table>
	</center>

	<br><br><br><br><br><br>
	     
	 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
</head>
<body>

</body>
</html>