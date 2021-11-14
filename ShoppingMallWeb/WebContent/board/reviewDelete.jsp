<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String pageNum = request.getParameter("pageNum");
	int id = Integer.parseInt(request.getParameter("id"));
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="board2.js" charset="utf-8" ></script>
 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include></head>
		<br><br><br>
<body>
		<div class="container" align="center">
		<h2>리뷰 삭제</h2>
		<form name="form" method="post" action="reviewDelete_ok.jsp?id=<%= id %>&pageNum=<%= pageNum %>">
			<table>
				<tr height="50">
					<td colspan="2">
						<b> ※ 게시물에 해당되는 비밀번호를 입력하세요 ※ </b>
					</td>
				</tr>
				<tr>
					<td width="80">비밀번호</td>
					<td>
						<input type="password" name="password" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="2">
						<input type="button" value="글삭제" onclick="delete_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='reviewList.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
		</div>
		
		<br><br><br><br><br><br>
	     
	 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>