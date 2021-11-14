<%@page import="shop.reviewBoard.reviewBoardBean"%>
<%@page import="shop.reviewBoard.reviewBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    String pageNum = request.getParameter("pageNum");
	int id = Integer.parseInt(request.getParameter("id"));
	
	reviewBoardDBBean db = reviewBoardDBBean.getInstance();
	reviewBoardBean board = db.getBoard(id, false);
	
	String ori_img = board.getB_img();
	
    %>
<html>
<head>
<meta charset="EUC-KR">
	<script type="text/javascript" src="board2.js" charset="utf-8" ></script>
	
	
<!-- header.jsp include -->
<jsp:include page="../header.jsp"></jsp:include></head>
<br>
<br>
<br>

<body>

		<form name="form" method="post" action="reviewEdit_ok.jsp?id=<%= id %>&pageNum=<%= pageNum %>&ori_img=<%=ori_img%>" enctype="multipart/form-data">
		
		<div class="container">
			<h2 align="center">리뷰 수정</h2>
				<table class="table table-hover">
						<tbody>
						<tr>
							<td>
							<input type="text" class="form-control" placeholder="글 제목" name="b_title" maxlength="40" value=<%=board.getB_title() %>>	
							</td>
						</tr>
						<tr>
							<td>
							<pre>
							<textarea type="text" class="form-control" name="b_content" maxlength="1024" style="height: 400px;"><%=board.getB_content()%></textarea>
    					  	</pre>
      					</td>
						</tr>
						<tr>
							<td><input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password" maxlength="40">
							</td>
						</tr>
							<tr>
							<td><input id="file" type="file" class="form-control" placeholder="파일첨부" name="b_img" size="50" accept='image/jpeg,image/gif,image/png'>
							</td>
						</tr>
				</tbody>				
				</table>
				<input type="button" value="글수정" onclick="check_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='reviewList.jsp?pageNum=<%= pageNum %>'">
			</div>
		</form>
	
	<!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>


</body>
</html>