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
		<script>alert("�α��� �� �̿����ֽñ� �ٶ��ϴ�."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// ���ǰ�(�α�����)�� �־� ������, ��ٱ��� ������ �����ϴ� ���� ����.	
		} else {		
			// ��ǰ ���� �� ��� ������Ʈ�� ���� ����
			CartBean cart = db.getCart(cart_num, sessionID);
			int cart_stock = cart.getCart_stock();
	
			// ��ٱ��� �����ϴ� ����
 			int re = db.deleteCart(cart_num, sessionID);
			if(re == 1) {
				ProductDBBean pro_db = new ProductDBBean().getInstance();
				ProductBean product = new ProductBean();
				product = pro_db.getProduct(pro_num);
				product.setPro_stock(product.getPro_stock() + cart_stock);
				pro_db.editProduct(product);
				
	%>
				<script>alert("�����Ͻ� ��ٱ��� ��ǰ�� �����Ǿ����ϴ�."); 
				document.location.href="./cart.jsp";
				</script>
	<%				
			}
 		}
	%>
 