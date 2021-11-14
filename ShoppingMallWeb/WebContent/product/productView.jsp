<%@page import="java.text.DecimalFormat"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	// 숫자를 천 단위로 구분하는 포맷
	DecimalFormat format = new DecimalFormat("###,###,###");
%>
<!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include>
    <style type="text/css">
		table{
			margin: auto;
			margin-top: 60;
			width: 1000px;
			border-collapse: collapse;
		}
		td {
			vertical-align: middle;
			border-bottom: 1px solid;
			padding: 10px;	
			width: 100px;
		}
		#none{
			border-top: none;
			border-collapse: none;
			border-bottom: 1px solid;		
		}
		#first_line{
			background-color: #d3d3d3;
			font-size: 15px;
		}
		#first_line td{
			font-weight: bolder;
		}
		tr{
			height: 50px;
		}
		#regbutton {
			width: 200px;
			height: 30px;
		}
		#button:hover {
   		 	background-color: gray;
   		 	color: white;
   		}
		#desc {
			width: 200px;
		}
	</style>
	 <section class="py-5">
             
	<table>
		<tr>
			<td id="none" colspan="8" align="right">
				<input id="regbutton" type="button" value="상품등록" onclick="location.href='productReg.jsp'">
			</td>
		</tr>
		<tr id="first_line" align="center">
			<td>제품번호</td> 
			<td>제품이름</td>
			<td>제품코드</td>
			<td>제품수량</td>
			<td>제품가격</td>
			<td id="desc">제품설명</td>
			<td>제품사진</td>
			<td>제품관리</td>
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
					<td><%= format.format(pro_price) %></td>
					<td><%= pro_description  %></td>
					<td><img src="${pageContext.request.contextPath}/productImg/<%= pro_img %>" width="100" height="100"></td>
					<td>
						<input id="button" type="button" value="상품 수정" onclick="location.href='productEdit.jsp?pro_num=<%= pro_num %>'"><br><br>
						<form method="post" name="del_form" action="productDelete.jsp">
							<input type="hidden" value="<%= pro_num %>" name="pro_num">
							<input type="hidden" value="<%= pro_img %>" name="pro_img">
							<input id="button" type="submit" value="상품 삭제">
						</form>

					</td>
				</tr>
				<%
			}
		%>
		<tr>
	</table>

	</section>
</body>
</html>
      	<br><br><br>
 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
    </body>
</html>
