<%@page import="java.util.ArrayList"%>
<%@page import="shop.cart.CartBean"%>
<%@page import="shop.cart.CartDBBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/styles.css">
<style type="text/css">
	body {
		background-color: white;	
	}
	
	td {
		vertical-align: middle;
	}
	
	#center_td {
		text-align: center;
	}
	
	#right_td {
		text-align: right;
	}
	
	#input_stock {
		width: 50px;
		text-align: right;
	}
	

</style>
</head>
<body>
	<%
	// 숫자를 천 단위로 구분하는 포맷
	DecimalFormat dFormat = new DecimalFormat("###,###,###");
	// 섹션에 저장된 아이디값 가져오기
	String sessionID = (String)session.getAttribute("sessionID");
	%>
	
	<%
	if(sessionID == null || sessionID.equals("")) {
		
	%>
		<script>alert("로그인 후 이용해주시길 바랍니다."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// 섹션값(로그인이)이 있어 있으면, 장바구니로 추가하는 로직 실행.	
	} else {
	%>
		<div class="jumbotron"> 
			<div class="container">
				<h1 class="display-3">장바구니</h1>
			</div>
		</div>
	
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="../index.jsp">이동하자</a></td>
				</tr>
			</table>
		</div>
	</div>
	
	<div style="padding-top: 50px; margin:40px;">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<% 
			int amount = 0;
			
			CartDBBean db = CartDBBean.getInstance();
			ArrayList<CartBean> cartList = db.listCart(sessionID);
			
			String pro_name = "";
			int cart_num=0, pro_num=0, pro_price=0, cart_stock;
			
			for(int i=0; i<cartList.size(); i++){
				CartBean cart = cartList.get(i);
				cart_num = cart.getCart_num();
				pro_name = cart.getPro_name();
				pro_num = cart.getCart_num();
				pro_price = cart.getPro_price();
				cart_stock = cart.getCart_stock();
				
				int total = pro_price * cart_stock;
				amount += total;
			%>
				<tr>
			<form method="post" action="./cartEdit.jsp">
					<td><%= pro_name %></td>
					<td>\<%= dFormat.format(pro_price) %></td>
					<td>
							<input type="hidden" name="cart_num" value="<%= cart_num %>">
							<input id="input_stock" name="cart_stock" type="number" value="<%= cart_stock %>" min="1"> 개 
							<input type="submit" value="적용">
					</td>
			</form>
					<td>\<%= dFormat.format((pro_price * cart_stock)) %></td>
					<td><a href="./cartDelete.jsp?cart_num=<%= cart_num %>" class="badge badge-danger" style="background-color:red;">삭제</a></td>
				</tr>
			<%
			}
			
			%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th>\<%= dFormat.format(amount) %></th>
					<th></th>
				</tr>
				<tr>
					<th colspan="5" id="right_td">
						<input type="button" value="선택한 장바구니 목록 삭제" onclick="#"> 
						<input type="button" value="장바구니 전체 삭제" onclick="location.href='./cartAllDelete.jsp?allDel=<%= "all" %>'">
					</th>
				</tr>
				<tr>
					<th colspan="5" id="center_td">
						<input type="button" value="주문 하기" onclick="#"> <input type="button" value="주문 취소" onclick="location.href='../index.jsp'">
					</th>
				</tr>
		</table>
	
	
	</div>
	<%
	}
	%>
	
</body>
</html>