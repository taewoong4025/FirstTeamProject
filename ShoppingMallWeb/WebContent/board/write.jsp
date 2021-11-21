<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="shop.board.BoardBean"%>
<%@page import="shop.board.BoardDBBean"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
String pageNum = request.getParameter("pageNum");

int id = 0, b_ref = 1, b_step = 0, b_level = 0;
String b_title = "";

if (request.getParameter("id") != null) {
	System.out.println("@@@### write.jsp id ===>" + request.getParameter("id"));

	id = Integer.parseInt(request.getParameter("id"));
}

BoardDBBean db = BoardDBBean.getInstance();
BoardBean board = db.getBoard(id, false);

if (board != null) {
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

<!-- header.jsp include -->
<jsp:include page="../header.jsp"></jsp:include></head>
<br>
<br>
<br>

</head>
<body>
		<h2 align="center">공지사항 작성</h2>

		<form name="form" method="post" action="write_ok.jsp">
			<input type="hidden" name="id" value="<%=id%>">
			 <input type="hidden" name="b_ref" value="<%=b_ref%>"> 
				<input type="hidden" name="b_step" value="<%=b_step%>"> 
				<input type="hidden" name="b_level" value="<%=b_level%>">

			<div class="container">
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>
								<%
								if (id == 0) {
								%> <input type="text" class="form-control" placeholder="글 제목" name="b_title" maxlength="40"> <%
 								} else {
								 %> <input type="text" class="form-control" placeholder="글 제목" name="b_title" maxlength="40" value="[답변]:<%=b_title%>" readonly="readonly"> <%
 								}
 								%>
							</td>
						</tr>
						<tr>
							<td><textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="b_content" maxlength="1024" style="height: 400px;"></textarea></td>
						</tr>
						<tr>
							<td><input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password" maxlength="40">
							</td>
						</tr>
					</tbody>
				</table>
					<input type="button" class="btn btn-primary btn-sm" value="글쓰기" onclick="check_ok()">
					 <input type="reset" class="btn btn-primary btn-sm" value="다시작성">
					 <input type="button" class="btn btn-primary btn-sm" value="글목록" onclick="location.href='list.jsp?<%=pageNum%>'">&nbsp;
			</div>
		</form>

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











