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
	
	
<!-- header.jsp include -->
<jsp:include page="../header.jsp"></jsp:include></head>
<br>
<br>
<br>

<body>
		<form name="form" method="post" action="edit_ok.jsp?id=<%= id %>&pageNum=<%= pageNum %>">
		
		<div class="container">
			<h2 align="center">공지사항 수정</h2>
				<table class="table table-hover">
						<tbody>
						<tr>
							<td>
							<input type="text" class="form-control" name="b_title" maxlength="40" value="<%= board.getB_title() %>">
							</td>
						</tr>
						<tr>
							<td><pre><textarea type="text" class="form-control" name="b_content" maxlength="1024" style="height: 400px;"><%=board.getB_content()%></textarea></pre>      					</td>
						</tr>
						<tr>
							<td><input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password" maxlength="40">
							</td>
						</tr>
					</tbody>				
				</table>
				<input type="button" value="글수정" onclick="check_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%= pageNum %>'">
			</div>
		</form>
	
	<!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>








