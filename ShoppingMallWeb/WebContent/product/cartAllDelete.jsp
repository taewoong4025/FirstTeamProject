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
		<script>alert("�α��� �� �̿����ֽñ� �ٶ��ϴ�."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// ���ǰ�(�α�����)�� �־� ������, ��ٱ��� ������ �����ϴ� ���� ����.	
		} else {
			if(all.equals("all")) {
				// ��ٱ��� �� ��ǰ ��ü ���� �� ��� ������Ʈ�� ���� ����
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
				
				// ��ٱ��� ��ü �����ϴ� ����
				db.deleteAllCart(sessionID);
	%>
				<script>alert("��ٱ��� ��� ��ü�� �����Ǿ����ϴ�."); 
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