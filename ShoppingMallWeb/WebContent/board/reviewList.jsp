<%@page import="shop.reviewBoard.reviewBoardDBBean"%>
<%@page import="shop.reviewBoard.reviewBoardBean"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
 
 <%
String pageNum = request.getParameter("pageNum");

System.out.println("@@@### pageNum ===>" + pageNum);

if (pageNum == null) {
	pageNum = "1";
}

reviewBoardDBBean db = reviewBoardDBBean.getInstance();
ArrayList<reviewBoardBean> boardList = db.listBoard(pageNum);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

int id = 0, b_hit = 0, b_level = 0;
String b_title, b_content;
Timestamp b_date;

String sessionID = (String)session.getAttribute("sessionID");
MemberDBBean manager = MemberDBBean.getInstance();
MemberBean member = manager.getMember(sessionID);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- header.jsp include -->
<jsp:include page="../header.jsp"></jsp:include></head>
<br>
<br>
<br>

<h1 align="center">리뷰게시판</h1><br><br>
	
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
				<%
				for(int i=0; i<boardList.size(); i++){
					reviewBoardBean board = boardList.get(i);
					id = board.getId();
					b_title = board.getB_title();
					b_content = board.getB_content();
					b_date = board.getB_date();
					b_hit = board.getB_hit();
					b_level = board.getB_level();
			%>
			
			<tbody>
				<tr>
					<td><%=id %></td>
					<td><%if(b_level > 0){ for(int j=0; j<b_level; j++){
										%>
											&nbsp;
										<%
									}
									%>
										<img src="../images/AnswerLine.gif" width="16" height="16">
									<%
								}
							%>
							<a style="text-decoration:none" href="reviewShow.jsp?id=<%= id %>&pageNum=<%= pageNum %>&sessionID=<%=sessionID%>"><%= b_title %></a></td>
					<td><a style="text-decoration:none" href="mailto:>"><%= id %></a></td>
					<td><%= sdf.format(b_date)%></td>
					<td><%= b_hit %></td>
				</tr>
			</tbody>
			<%
				}
			%>
		</table>
		<hr/>
		
			<%
				if(sessionID != null && member.getUser_level()!=9){
			%>
		
			<a class="btn btn-primary btn-sm float-end" href="reviewWrite.jsp?pageNum=<%=pageNum%>">글쓰기</a>
			
			<%
				}
			%>
	<center>
		<%= reviewBoardBean.pageNumer(4) %>
	</center>
</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>