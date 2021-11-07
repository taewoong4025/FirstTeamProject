<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@page import="shop.cart.CartBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.cart.CartDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	String sessionID = (String)session.getAttribute("sessionID");
 	String all = request.getParameter("allDel");
 
 	CartDBBean db = new CartDBBean().getInstance();

 	if(sessionID == null || sessionID.equals("")) {
 %>
		<script>alert("로그인 후 이용해주시길 바랍니다."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// 섹션값(로그인이)이 있어 있으면, 장바구니 데이터 삭제하는 로직 실행.	
		} else {
			if(all.equals("all")) {
				// 장바구니 내 상품 전체 삭제 시 재고량 업데이트를 위한 로직
				ProductDBBean pro_db = new ProductDBBean().getInstance();
				ArrayList<ProductBean> proList = pro_db.listProduct();
				ArrayList<CartBean> cartList = db.listCart(sessionID);
				int cart_stock=0, pro_stock=0;
				int pro_num, cart_proNum;
				
				for(int i=0; i< proList.size(); i++){
					
					for(int j = 0; j < cartList.size(); j++){
						ProductBean product = proList.get(i);
						CartBean cart = cartList.get(j);
						
						pro_num = product.getPro_num();
						cart_proNum = cart.getPro_num();
						
						if(pro_num == cart_proNum) {
							pro_stock = product.getPro_stock();
							cart_stock = cart.getCart_stock();
							
							pro_stock = pro_stock + cart_stock;
							product.setPro_stock(pro_stock);
							
							pro_db.editProduct(product);
						}
						
					}
				}
				
				// 장바구니 전체 삭제하는 로직
				db.deleteAllCart(sessionID);
	%>
				<script>alert("장바구니 목록 전체가 삭제되었습니다."); 
				document.location.href="./cart.jsp";
				</script>
	<%			
			}		
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