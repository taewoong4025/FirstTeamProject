<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="productJS.js" charset="utf-8" ></script>
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
	<h2>제품 등록하기</h2>
	<form name="productform" method="post" action="productReg_ok.jsp" enctype="multipart/form-data">
		<table border="1" rules="none">
			<tr>
				<td>1.제품 번호</td>
				<td><input type="text" name="pro_num"></td>
			</tr>
			<tr>
				<td>2.제품 이름</td>
				<td><input type="text" name="pro_name"></td>
			</tr>
			<tr>
				<td>3.제품 코드</td>
				<td><input type="text" name="pro_code"></td>
			</tr>
			<tr>
				<td>4.제품 수량</td>
				<td><input type="text" name="pro_stock"></td>
			</tr>
			<tr>
				<td>5.제품 가격</td>
				<td><input type="text" name="pro_price"></td>
			</tr>
			<tr>
				<td>6.제품 설명</td>
				<td><input type="text" name="pro_description"></td>
			</tr>
			<tr>
				<td>7.제품 이미지</td>
				<td><input type="file" name="pro_img" size="50" accept='image/jpeg,image/gif,image/png' ></td>
			</tr>
			<tr id="tr_height">
				<td colspan="2" align="center">
					<input type="button" value="확인" onclick="check_ok()">
					<input type="button" value="취소" onclick="location.href='productView.jsp'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>