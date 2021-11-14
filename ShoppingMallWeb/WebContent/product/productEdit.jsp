<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


        <%
        String sessionID = (String)session.getAttribute("sessionID");
        
    	MemberDBBean manager = MemberDBBean.getInstance();
    	MemberBean member = manager.getMember(sessionID);
    	int pro_num = Integer.parseInt(request.getParameter("pro_num"));
    	ProductDBBean db = ProductDBBean.getInstance();
    	ProductBean product = db.getProduct(pro_num);
    	//새 이미지를 선택하지 않을 경우 사용할 이전 이미지 이름(ex-oo.jpg)
    	String ori_img = product.getPro_img();
        %>
    </head>
   
 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include>

	<script type="text/javascript" src="product.js" charset="utf-8" ></script>
<style type="text/css">
		table{
			margin: auto;
			margin-top: 60;
			width:800px;
		}
		h1 {
			text-align: center;
			margin: 50px;
		}
		td {
			width: 600px;
			height: 50px;
			padding-left: 100px;
		}
		#first {
			width: 200px;
			text-align: center;
			font-weight: bolder;
		}
		input{
			width: 300px;
			height: 30px;
		}
		#button{
			width: 150px;
			height: 25px;
		}
		
		#button:hover {
   		 	background-color: gray;
   		 	color: white;
   		}
	
	</style>
</head>
<body>
	<form name="productform1" method="post" action="productEdit_ok.jsp?ori_img=<%=ori_img %>" enctype="multipart/form-data">
		<table border="1" rules="none">
			<tr>
				<td colspan="2" id="title"><h1>등록된 제품 수정하기</h1></td>
			</tr>
			<tr>
				<td id="first">제품 번호</td>
				<td><input type="text" name="pro_num" value="<%= product.getPro_num() %>" readonly="readonly" ></td>
			</tr>
			<tr>
				<td id="first">제품 이름</td>
				<td><input type="text" name="pro_name" value="<%= product.getPro_name() %>"></td>
			</tr>
			<tr>
				<td id="first">제품 코드</td>
				<td><input type="text" name="pro_code" value="<%= product.getPro_code() %>"></td>
			</tr>
			<tr>
				<td id="first">제품 수량</td>
				<td><input type="text" name="pro_stock" value="<%= product.getPro_stock()%>"></td>
			</tr>
			<tr>
				<td id="first">제품 가격</td>
				<td><input type="text" name="pro_price" value="<%=product.getPro_price() %>"></td>
			</tr>
			<tr>
				<td id="first">제품 설명</td>
				<td><input type="text" name="pro_description" value="<%=product.getPro_description()%>"></td>
			</tr>
			<tr>
				<td id="first">제품 이미지</td>
				<td><input type="file" name="pro_img" size="50" accept='image/jpeg,image/gif,image/png'></td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr id="tr_height">
				<td colspan="2" align="center">
					<input type="button" type="button" value="확인" onclick="check_ok1()">
					<input type="button" type="button" value="취소" onclick="location.href='productView.jsp'">
				</td>
			</tr>
		</table>
					
	</form>
		<br><br><br>
 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>



