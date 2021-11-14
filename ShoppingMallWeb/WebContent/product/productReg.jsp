<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include>
		<br><br><br>

	<script type="text/javascript" src="productJS.js" charset="utf-8" ></script>
	 <style type="text/css">
		table{
			margin: auto;
			margin-top: 60;
			width:800px;
		}
		h1 {
			text-align: center;
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
			align:center;
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
		<div class="container">
			<form name="productform" method="post" action="productReg_ok.jsp" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td colspan="2" id="title"><h2 align="center">제품 등록</h2></td>
			</tr>
			<tr>
				<td id="first">제품 번호</td>
				<td><input type="text" name="pro_num" placeholder="숫자만 입력 가능"></td>
			</tr>
			<tr>
				<td id="first">제품 이름</td>
				<td><input type="text" name="pro_name"></td>
			</tr>
			<tr>
				<td id="first">제품 코드</td>
				<td><input type="text" name="pro_code"></td>
			</tr>
			<tr>
				<td id="first">제품 수량</td>
				<td><input type="text" name="pro_stock" placeholder="숫자만 입력 가능"></td>
			</tr>
			<tr>
				<td id="first">제품 가격</td>
				<td><input type="text" name="pro_price" placeholder="숫자만 입력 가능"></td>
			</tr>
			<tr>
				<td id="first">제품 설명</td>
				<td><input type="text" name="pro_description"></td>
			</tr>
			<tr>
				<td id="first">제품 이미지</td>
				<td><input type="file" name="pro_img" size="50" accept='image/jpeg,image/gif,image/png' ></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input id="button" type="button" value="확인" onclick="check_ok()">&nbsp;&nbsp;&nbsp;
					<input id="button" type="button" value="취소" onclick="location.href='productView.jsp'">
				</td>
			</tr>
		</table>
		</form>
		</div>
	
		<br><br><br>
 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
        
</body>
</html>


