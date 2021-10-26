<%@page import="java.util.ArrayList"%>
<%@page import="shop.product.ProductDBBean"%>
<%@page import="shop.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
<p>
	<input type="button" value="��ǰ���" onclick="location.href='productReg.jsp'">
	<input type="button" value="HOME���� ����" onclick="location.href='../index.jsp'">
</p>
	<table border="1" style="border-collapse: collapse">
		<tr align="center">
			<td>��ǰ��ȣ</td> 
			<td>��ǰ�̸�</td>
			<td>��ǰ�ڵ�</td>
			<td>��ǰ����</td>
			<td>��ǰ����</td>
			<td>��ǰ����</td>
			<td>��ǰ����</td>
			<td>��ǰ����</td>
		</tr>
		<%
			ProductDBBean db = ProductDBBean.getInstance();
			ArrayList<ProductBean> productList = db.listProduct();
			
			String pro_name="", pro_code="", pro_description="", pro_img="", pro_imgpath="";
			int pro_num=0, pro_stock=0, pro_price=0;
			
			for(int i=0; i<productList.size(); i++){
				ProductBean product = productList.get(i);
				pro_num = product.getPro_num();
				pro_name = product.getPro_name();
				pro_code = product.getPro_code();
				pro_stock = product.getPro_stock();
				pro_price = product.getPro_price();
				pro_description = product.getPro_description();
				pro_img = product.getPro_img();
				%>
				<tr align="center">
					<td><%= pro_num %></td>
					<td><%= pro_name %></td>
					<td><%= pro_code %></td>
					<td><%= pro_stock %></td>
					<td><%= pro_price %></td>
					<td><%= pro_description  %></td>
					<td><img src="${pageContext.request.contextPath}/images/<%= pro_img %>" width="100" height="100"></td>
					<td>
						<input type="button" value="��ǰ ����" onclick="location.href='productEdit.jsp?pro_num=<%= pro_num %>'"><br><br>
						<form method="post" name="del_form" action="productDelete.jsp">
							<input type="hidden" value="<%= pro_num %>" name="pro_num">
							<input type="hidden" value="<%= pro_img %>" name="pro_img">
							<input type="submit" value="��ǰ ����">
						</form>

					</td>
				</tr>
				
				<%
			}
		%>
		<tr>
	</table>
</body>
</html>