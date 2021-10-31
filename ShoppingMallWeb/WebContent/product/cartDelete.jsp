<%@page import="shop.cart.CartDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	String sessionID = (String)session.getAttribute("sessionID");
 	int cart_num = Integer.parseInt(request.getParameter("cart_num"));

 	CartDBBean db = new CartDBBean().getInstance();
 	
 	if(sessionID == null || sessionID.equals("")) {
 %>
		<script>alert("로그인 후 이용해주시길 바랍니다."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// 섹션값(로그인이)이 있어 있으면, 장바구니 데이터 삭제하는 로직 실행.	
		} else {		
 			int re = db.deleteCart(cart_num);
			if(re == 1) {
	%>
				<script>alert("선택하신 장바구니 상품이 삭제되었습니다."); 
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