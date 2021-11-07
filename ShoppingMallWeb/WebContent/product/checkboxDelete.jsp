<%@page import="shop.cart.CartBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.cart.CartDBBean"%>
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
String sessionID = (String)session.getAttribute("sessionID");
	CartDBBean db = CartDBBean.getInstance();
	ArrayList<CartBean> cartList = db.listCart(sessionID);
	
	String[] checkbox = request.getParameterValues("checkbox");
	int cart_num;
	if(checkbox != null){
		for(int i=0; i<checkbox.length; i++){
			CartBean cart = cartList.get(i);
			cart_num = cart.getCart_num();
			db.deleteCart(cart_num);
		}
	}
%>
</body>
</html>