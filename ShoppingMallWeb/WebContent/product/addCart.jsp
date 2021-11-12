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
	
	//���� ���� ������ ������ ���� �� �� ����, �ٷ� �α���â���� ������.
	if(sessionID == null || sessionID.equals("")) {
	%>
		<script>alert("�α��� �� �̿����ֽñ� �ٶ��ϴ�."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// ���ǰ�(�α�����)�� �־� ������, ��ٱ��Ϸ� �߰��ϴ� ���� ����.	
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
			// �����ͺ��̽��� ���������� �߰��� �Ǹ�, insertCart()�޼ҵ尡 1�� ��ȯ��. 
			if(re==1) {
				// ��ٱ��� �߰� ��, ��� ������Ʈ
				product.setPro_stock((product.getPro_stock() - cart.getCart_stock()));
				db.editProduct(product);
			%>
				<script>alert("��ǰ�� ��ٱ��Ͽ� �߰��Ͽ����ϴ�.");
				document.location.href="productPage.jsp?pro_num=" + <%=pro_num%>;
				</script>
				
			<%
			}else{
			%>
				<script>alert("�߰� ����");
				document.location.href="productPage.jsp?pro_num=" + <%=pro_num%>;</script>
			<%
			}
	}
			%>

</body>
</html>