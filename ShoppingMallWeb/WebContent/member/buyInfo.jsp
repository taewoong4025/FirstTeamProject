<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.cart.buyBean"%>
<%@page import="shop.cart.CartDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include>
		
<br>
<br>
<br>
<meta charset="UTF-8">
<body>

	<div class="container">
		<table class="table table-striped">
		<thead>
			<tr>
				<td>상품</td>
				<td>가격</td>
				<td>개수</td>
				<td>결제날짜</td>
			</tr>
			</thead>
	<%
		String user_id = (String)session.getAttribute("sessionID");
		CartDBBean manager = CartDBBean.getInstance();
		ArrayList<buyBean> buyList = manager.listBuy(user_id);

		
		String pro_name=null;
		int pro_price=0;
	 	int cart_stock=0;
		Timestamp cart_regdate=null;
				
		for(int i=0; i<buyList.size(); i++){
			buyBean buy = buyList.get(i);
			pro_name = buy.getPro_name();
			pro_price = buy.getPro_price();
			cart_stock = buy.getCart_stock();
			cart_regdate = buy.getCart_regdate();
		
	%>
		
			<tr>
				<td><%=pro_name%></td>
				<td><%=pro_price%></td>
				<td><%=cart_stock%></td>
				<td><%=cart_regdate%></td>
			</tr>
		<%
			}
		%>
		</table>
	</div>
		
	<br><br><br>
 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>