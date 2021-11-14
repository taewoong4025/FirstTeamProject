<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.cart.CartBean"%>
<%@page import="shop.cart.CartDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	String sessionID = (String)session.getAttribute("sessionID");
 	int cart_num = Integer.parseInt(request.getParameter("cart_num"));
 	int pro_num = Integer.parseInt(request.getParameter("pro_num"));

 	CartDBBean db = new CartDBBean().getInstance();
 	
 	if(sessionID == null || sessionID.equals("")) {
 %>
		<script>alert("로그인 후 이용해주시길 바랍니다."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// 섹션값(로그인이)이 있어 있으면, 장바구니 데이터 삭제하는 로직 실행.	
		} else {		
			// 상품 삭제 시 재고량 업데이트를 위한 로직
			CartBean cart = db.getCart(cart_num, sessionID);
			int cart_stock = cart.getCart_stock();
	
			// 장바구니 삭제하는 로직
 			int re = db.deleteCart(cart_num, sessionID);
			if(re == 1) {
				ProductDBBean pro_db = new ProductDBBean().getInstance();
				ProductBean product = new ProductBean();
				product = pro_db.getProduct(pro_num);
				product.setPro_stock(product.getPro_stock() + cart_stock);
				pro_db.editProduct(product);
				
	%>
				<script>alert("선택하신 장바구니 상품이 삭제되었습니다."); 
				document.location.href="./cart.jsp";
				</script>
	<%				
			}
 		}
	%>
 