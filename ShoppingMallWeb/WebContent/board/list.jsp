<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="shop.board.BoardBean"%>
<%@page import="shop.board.BoardDBBean"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		
	String pageNum = request.getParameter("pageNum");

	System.out.println("@@@### pageNum ===>"+pageNum);
	
	if(pageNum == null){
		pageNum="1";
	}
	
	BoardDBBean db = BoardDBBean.getInstance();
	ArrayList<BoardBean> boardList = db.listBoard(pageNum);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int id=0, b_hit=0, b_level=0;
	String b_title, b_content;
	Timestamp b_date;
	
   	String sessionID = (String)session.getAttribute("sessionID");
   	MemberDBBean manager = MemberDBBean.getInstance();
   	MemberBean member = manager.getMember(sessionID);
%>

       
<html>
<head>
<meta charset="EUC-KR">

  <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include></head>
<body>
	<center>
		<h1>공지사항</h1>
		<table width="600">
			<tr>
			<%
			if(sessionID != null){
				if (member.getUser_level() == 9) {
			%>
				<td align="right">
					<a href="write.jsp?pageNum=<%= pageNum %>">글 쓰 기</a>
				</td>
				<%
				   }
			  }
				%>
				<td align="right">
					<a href="../index.jsp">홈으로</a>
				</td>
			</tr>
		</table>
		<table width="800" border="1" cellspacing="0" >
			<tr height="25">
				<td width="40" align="center">번호</td>
				<td width="450" align="center">글제목</td>
				<td width="120" align="center">작성자</td>
				<td width="130" align="center">작성일</td>
				<td width="60" align="center">조회수</td>
			</tr>
			<%
				for(int i=0; i<boardList.size(); i++){
					BoardBean board = boardList.get(i);
					id = board.getId();
					b_title = board.getB_title();
					b_content = board.getB_content();
					b_date = board.getB_date();
					b_hit = board.getB_hit();
					b_level = board.getB_level();
			%>
					<tr height="25" bgcolor="#f7f7f7" 
									onmouseover="this.style.backgroundColor='#eeeeef'" 
									onmouseout="this.style.backgroundColor='#f7f7f7'">
						<td align="center">
							<%= id %>
						</td>
						<td>
							<%
								if(b_level > 0){
									for(int j=0; j<b_level; j++){
										%>
											&nbsp;
										<%
									}
									%>
										<img src="../images/AnswerLine.gif" width="16" height="16">
									<%
								}
							%>
							<a href="show.jsp?id=<%= id %>&pageNum=<%= pageNum %>&sessionID=<%=sessionID%>"><%= b_title %></a>
						</td>
						<td align="center">
							<a href="mailto:>"><%= id %></a>
						</td>
						<td align="center">
							<%= sdf.format(b_date)%>
						</td>
						<td align="right">
							<%= b_hit %>
						</td>
					</tr>
			<%
				}
	
			%>
		</table>
	</center>
	<center>
		<%= BoardBean.pageNumer(4) %>
		
	</center>
	     
	 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>