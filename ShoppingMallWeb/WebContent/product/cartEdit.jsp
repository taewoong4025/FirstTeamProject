<%@page import="shop.cart.CartDBBean"%>
<%@page import="shop.cart.CartBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int cart_num = Integer.parseInt(request.getParameter("cart_num"));
	int cart_stock = Integer.parseInt(request.getParameter("cart_stock"));
	String sessionID = (String)session.getAttribute("sessionID");

	CartBean cart = new CartBean();
	cart.setCart_num(cart_num);
	cart.setCart_stock(cart_stock);
	
	out.print(cart_num);
	out.print(cart_stock);
	
	CartDBBean db = new CartDBBean().getInstance();
	int re = db.editCart(cart);
	
	if(sessionID == null || sessionID.equals("")){
	%>
		<script>alert("�α��� �� �̿����ֽñ� �ٶ��ϴ�."); 
		document.location.href="../member/login.html";
		</script>
	<%	
	} else {
		if(re == 1){
		%>
			<script>document.location.href="cart.jsp";</script>
			
		<%
		}else{
		%>
			<script>alert("���� ����");
			document.location.href="cart.jsp";</script>
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