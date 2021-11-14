<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="shop.board.BoardBean"%>
<%@page import="shop.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	int Id = Integer.parseInt(request.getParameter("id"));
	String sessionID = request.getParameter("sessionID");
	
	System.out.print("@@@###sessionID => : " + sessionID);

	BoardDBBean db = BoardDBBean.getInstance();
	BoardBean board = db.getBoard(Id, true);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int id=0, b_hit=0;
	String b_title="", b_content="";
	Timestamp b_date=null;
	
	id = board.getId();
	b_title = board.getB_title();
	b_content = board.getB_content();
	b_date = board.getB_date();
	b_hit = board.getB_hit();
%>
<html>
<head>
<meta charset="EUC-KR">

  <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include></head>
		<br><br><br>

<body>
		<h2 align="center">공지사항 글</h2><br><br>
	<div class="container">
	
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="2"><%=b_title %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">관리자</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td colspan="2"><%=b_hit %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=sdf.format(b_date) %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: center;"><%=b_content%></td>
					</tr>
				</tbody>
			</table>

<%
						if(sessionID.equals("admin")){
					%>
					<a class="btn btn-primary btn-sm" href="edit.jsp?id=<%= id %>&pageNum=<%= pageNum %>">수정</a>				
					<a class="btn btn-primary btn-sm" href="delete.jsp?id=<%= id %>&pageNum=<%= pageNum %>">삭제</a>				
					<%
						}
					%>
					<!--공지사항 이므로 답변글 x-->
					<!--  <input type="button" value="답변글" onclick="location.href='write.jsp?id=<%= id %>&pageNum=<%= pageNum %>'">-->
					<a class="btn btn-primary btn-sm" href="list.jsp?<%= pageNum %>">목록</a>				
		</div>
		
		

	<br><br><br><br><br><br>
	     
	 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
		
</body>
</html>








