<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="shop.board.BoardBean"%>
<%@page import="shop.board.BoardDBBean"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

	String pageNum = request.getParameter("pageNum");

	int id=0, b_ref=1, b_step=0, b_level=0;
	String b_title="";
	
	if(request.getParameter("id") != null){
		System.out.println("@@@### write.jsp id ===>"+request.getParameter("id"));
		
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	BoardDBBean db = BoardDBBean.getInstance();
	BoardBean board = db.getBoard(id, false);
	
	if(board != null){
		b_title = board.getB_title();
		b_ref = board.getB_ref();
		b_step = board.getB_step();
		b_level = board.getB_level();
	}
	
%>
<html>
	<script type="text/javascript" src="board2.js" charset="utf-8"></script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>상품 리뷰</h1>
		
		<form name="form" method="post" action="write_ok.jsp">
			<input type="hidden" name="id" value="<%= id %>">
			<input type="hidden" name="b_ref" value="<%= b_ref %>">
			<input type="hidden" name="b_step" value="<%= b_step %>">
			<input type="hidden" name="b_level" value="<%= b_level %>">
			<table>
				<tr height="30">
					<td width="80">
						제목
					</td>
					<td colspan="3">
						<%
							if(id == 0){
								%>
						 			<input name="b_title" type="text" size="33" >
								<%
							}else{
								%>
									<input name="b_title" type="text" size="50" value="[답변]:<%= b_title %>" readonly="readonly">
								<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="b_content" rows="10" cols="65"></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">
						비밀번호
					</td>
					<td colspan="3">
						<input name="password" type="password" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="button" value="글쓰기" onclick="check_ok()" >&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<input type="button" value="글목록"  onclick="location.href='list.jsp?<%=pageNum %>'" >&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>











