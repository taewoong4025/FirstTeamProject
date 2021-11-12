<%@page import="java.sql.Timestamp"%>
<%@page import="shop.cart.CartBean"%>
<%@page import="shop.cart.CartDBBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@page import="shop.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	out.print(request.getParameter("pro_num"));
	out.print(request.getParameter("cart_stock"));
	
	int pro_num = Integer.parseInt(request.getParameter("pro_num"));
	int cart_stock = Integer.parseInt(request.getParameter("cart_stock"));
	
	String sessionID = (String)session.getAttribute("sessionID");
	
	//세션 값이 없으면 페이지 접근 할 수 없고, 바로 로그인창으로 가도록.
	if(sessionID == null || sessionID.equals("")) {
	%>
		<script>alert("로그인 후 이용해주시길 바랍니다."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// 섹션값(로그인이)이 있어 있으면, 장바구니로 추가하는 로직 실행.	
	} else {
		
		ProductDBBean db = ProductDBBean.getInstance();
		ProductBean product = db.getProduct(pro_num);
		
		CartBean cart = new CartBean();
		
		cart.setPro_name(product.getPro_name());
		cart.setUser_id(sessionID);
		cart.setPro_num(product.getPro_num());
		cart.setPro_price(product.getPro_price());
		cart.setCart_stock(cart_stock);
		cart.setCart_regdate(new Timestamp(System.currentTimeMillis()));
		
		CartDBBean cartDB = CartDBBean.getInstance();
		
		int re = cartDB.insertCart(cart);
			// 데이터베이스에 정상적으로 추가가 되면, insertCart()메소드가 1을 반환함. 
			if(re==1) {
				// 장바구니 추가 시, 재고량 업데이트
				product.setPro_stock((product.getPro_stock() - cart.getCart_stock()));
				db.editProduct(product);
			%>
				<script>alert("상품을 장바구니에 추가하였습니다.");
				document.location.href="productPage.jsp?pro_num=" + <%=pro_num%>;
				</script>
				
			<%
			}else{
			%>
				<script>alert("추가 실패");
				document.location.href="productPage.jsp?pro_num=" + <%=pro_num%>;</script>
			<%
			}
	}
			%>

</body>
</html>