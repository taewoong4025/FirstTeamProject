<%@page import="shop.product.ProductDBBean"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.cart.CartDBBean"%>
<%@page import="shop.cart.CartBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int cart_num = Integer.parseInt(request.getParameter("cart_num"));
	int cart_stock = Integer.parseInt(request.getParameter("cart_stock"));
	int update_cartStock = 0;
	int result = 0;
	String sessionID = (String)session.getAttribute("sessionID");
	CartBean cart = new CartBean();
	ProductBean product = new ProductBean();
	
	CartDBBean db = new CartDBBean().getInstance();
	CartBean getCart = db.getCart(cart_num, sessionID);
	//int ori_cartStock = getCart.getCart_stock();
	//int pro_num = getCart.getPro_num();
	
	/* if(ori_cartStock > cart_stock) {
		update_cartStock = ori_cartStock - cart_stock;
		
	} else if(ori_cartStock < cart_stock) {
		result = cart_stock - ori_cartStock;
		update_cartStock = ori_cartStock + result;
	} else {
		update_cartStock = ori_cartStock;
	} */

	getCart.setCart_num(cart_num);
	/* cart.setCart_stock(update_cartStock); */
	getCart.setCart_stock(cart_stock);
	
	int re = db.editCart(getCart);
	
	if(sessionID == null || sessionID.equals("")){
	%>
		<script>alert("로그인 후 이용해주시길 바랍니다."); 
		document.location.href="../member/login.html";
		</script>
	<%	
	} else {
		/* if(re == 1){
			ProductDBBean Prodb = new ProductDBBean().getInstance();
			product = Prodb.getProduct(pro_num);
			int pro_stock = product.getPro_stock();
			
			if(ori_cartStock > cart_stock) {
				result = ori_cartStock - cart_stock;
				product.setPro_stock(pro_stock + result);
				
			} else if(ori_cartStock < cart_stock) {
				result = cart_stock - ori_cartStock;
				product.setPro_stock(pro_stock - result);
			} else {
				product.setPro_stock(pro_stock);
			}
			
			Prodb.editProduct(product); */
			
		%>
			<script>document.location.href="cart.jsp";</script>
			
		<%

		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>