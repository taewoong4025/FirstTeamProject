<%@page import="shop.cart.buyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.cart.CartDBBean"%>
<%@page import="shop.reviewBoard.reviewBoardDBBean"%>
<%@page import="shop.reviewBoard.reviewBoardBean"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

	String pageNum = request.getParameter("pageNum");

	//�������� ���� ���̵� �޾Ƽ� ��ǰ �����ϱ� ����.
	String buy_id = session.getAttribute("sessionID").toString();
	//������ ���̵��� ��ǰ�� �����ϱ� ���� ����Ʈ
	CartDBBean manager = CartDBBean.getInstance();
	ArrayList<buyBean> buyList = manager.listBuy(buy_id);

	int id=0, b_ref=1, b_step=0, b_level=0;
	String b_title="";
	String pro_name="";
	
	if(request.getParameter("id") != null){
		System.out.println("@@@### write.jsp id ===>"+request.getParameter("id"));
		
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	reviewBoardDBBean db = reviewBoardDBBean.getInstance();
	reviewBoardBean board = db.getBoard(id, false);
	
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

<!-- header.jsp include -->
<jsp:include page="../header.jsp"></jsp:include></head>
<br>
<br>
<br>

<body>
		<h2 align="center">���� �ۼ�</h2>
		
		<form name="form" method="post" action="reviewWrite_ok.jsp" enctype="multipart/form-data">
			<input type="hidden" name="id" value="<%= id %>">
			<input type="hidden" name="b_ref" value="<%= b_ref %>">
			<input type="hidden" name="b_step" value="<%= b_step %>">
			<input type="hidden" name="b_level" value="<%= b_level %>">
			
				<div class="container">
				<table class="table table-hover">
					<tbody>
						<tr>
							<td>
								<%
								if (id == 0) {
								%> <input type="text" class="form-control" placeholder="�� ����" name="b_title" maxlength="40"> <%
 								} else {
								 %> <input type="text" class="form-control" placeholder="�� ����" name="b_title" maxlength="40" value="[�亯]:<%=b_title%>" readonly="readonly"> <%
 								}
 						%>
							</td>
						</tr>
						<tr>
							<td><textarea type="text" class="form-control" placeholder="�� ������ �ۼ��ϼ���" name="b_content" maxlength="1024" style="height: 400px;"></textarea></td>
						</tr>
				
						<tr>
							<td><input type="password" class="form-control" placeholder="��й�ȣ�� �Է��ϼ���" name="password" maxlength="40">
							</td>
						<tr>
							<td><input id="file" type="file" class="form-control" placeholder="����÷��" name="b_img" accept='image/jpeg,image/gif,image/png'>
							</td>
						</tr>
						<tr>
							<td><select name="pro_name" class="form-control">
							<option selected>��ǰ�� ������.</option>
						<!-- ȸ���� ������ �� ��ŭ ��ǰ�� ����ִ�. -->
				<%
					for(int i = 0; i<buyList.size(); i++){
						buyBean buy = buyList.get(i);
						pro_name = buy.getPro_name();
					
				%>
				<option value="<%=pro_name%>"> <%=pro_name%> </option>
				
			<%} %>
				</select>
				</td>
				</tr>
				</tbody>
				</table>
					<input type="button" class="btn btn-primary btn-sm" value="�۾���" onclick="check_ok()">
					 <input type="reset" class="btn btn-primary btn-sm" value="�ٽ��ۼ�">
					 <input type="button" class="btn btn-primary btn-sm" value="�۸��" onclick="location.href='reviewList.jsp?<%=pageNum%>'">&nbsp;
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











