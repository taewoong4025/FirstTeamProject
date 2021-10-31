<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int pro_num = Integer.parseInt(request.getParameter("pro_num"));
	ProductDBBean db = ProductDBBean.getInstance();
	ProductBean product = db.getProduct(pro_num);
	//새 이미지를 선택하지 않을 경우 사용할 이전 이미지 이름(ex-oo.jpg)
	String ori_img = product.getPro_img();
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="product.js" charset="utf-8" ></script>
<style type="text/css">
		h2{
			margin-top:150px;
			text-align: center;
		}
		
		table {
			widht: 500px;
			margin-top: 50px;
			margin-left: auto;
			margin-right: auto;
		}
		
		td {
			width: 100px;
		}
		
		#tr_height {
			height: 60px;
		}
	
	</style>
</head>
<body>
	<h2>등록된 제품 수정하기</h2>
	<form name="productform1" method="post" action="productEdit_ok.jsp?ori_img=<%=ori_img %>" enctype="multipart/form-data">
		<table border="1" rules="none">
			<tr>
				<td>1.제품 번호</td>
				<td><input type="text" name="pro_num" value="<%= product.getPro_num() %>" readonly="readonly" ></td>
			</tr>
			<tr>
				<td>2.제품 이름</td>
				<td><input type="text" name="pro_name" value="<%= product.getPro_name() %>"></td>
			</tr>
			<tr>
				<td>3.제품 코드</td>
				<td><input type="text" name="pro_code" value="<%= product.getPro_code() %>"></td>
			</tr>
			<tr>
				<td>4.제품 수량</td>
				<td><input type="text" name="pro_stock" value="<%= product.getPro_stock()%>"></td>
			</tr>
			<tr>
				<td>5.제품 가격</td>
				<td><input type="text" name="pro_price" value="<%=product.getPro_price() %>"></td>
			</tr>
			<tr>
				<td>6.제품 설명</td>
				<td><input type="text" name="pro_description" value="<%=product.getPro_description()%>"></td>
			</tr>
			<tr>
				<td>7.제품 이미지</td>
				<td><input type="file" name="pro_img" size="50" accept='image/jpeg,image/gif,image/png'></td>
			</tr>
			<tr id="tr_height">
				<td colspan="2" align="center">
					<input type="button" value="확인" onclick="check_ok1()">
					<input type="button" value="취소" onclick="location.href='productView.jsp'">
				</td>
			</tr>
		</table>
					
	</form>
</body>
</html>