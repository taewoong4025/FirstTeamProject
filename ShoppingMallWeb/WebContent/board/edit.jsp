<%@page import="shop.board.BoardBean"%>
<%@page import="shop.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int id = Integer.parseInt(request.getParameter("id"));
	
	BoardDBBean db = BoardDBBean.getInstance();
	//BoardBean board = db.getBoard(id);
	BoardBean board = db.getBoard(id, false);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="board2.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>상품 리뷰 수정</h1>
		<form name="form" method="post" action="edit_ok.jsp?id=<%= id %>&pageNum=<%= pageNum %>">
			<table>
				<tr height="30">
					<td width="80">제목</td>
					<td colspan="3">
						<input type="text" name="b_title" maxlength="80" size="50" value="<%= board.getB_title() %>" >
					</td>
				</tr>
				<tr height="30">
				<td width="100" align="center">
					내용
				</td>
					<td colspan="3" width="100">
						<textarea name="b_content" rows="10" cols="65">
							<%=board.getB_content()%>
						</textarea>
					</td>
				</tr>
				<tr>
					<td width="80">비밀번호 : </td>
					<td colspan="3">
						<input type="password" name="password" maxlength="12" size="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="button" value="글수정" onclick="check_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>








