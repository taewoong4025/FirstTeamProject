<%@page import="shop.cart.CartDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	String sessionID = (String)session.getAttribute("sessionID");
 	int cart_num = Integer.parseInt(request.getParameter("cart_num"));

 	CartDBBean db = new CartDBBean().getInstance();
 	
 	if(sessionID == null || sessionID.equals("")) {
 %>
		<script>alert("�α��� �� �̿����ֽñ� �ٶ��ϴ�."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// ���ǰ�(�α�����)�� �־� ������, ��ٱ��� ������ �����ϴ� ���� ����.	
		} else {		
 			int re = db.deleteCart(cart_num);
			if(re == 1) {
	%>
				<script>alert("�����Ͻ� ��ٱ��� ��ǰ�� �����Ǿ����ϴ�."); 
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