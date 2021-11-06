<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
		}
		input{
			width: 300px;
			height: 30px;
		}
		#button{
			width: 150px;
			height: 25px;
		}
		#file{
			padding-top: 10px;
		}
		#button:hover {
   		 	background-color: gray;
   		 	color: white;
   		}
	</style>
</head>
<body>
	<form name="productform" method="post" action="productReg_ok.jsp" enctype="multipart/form-data">
		<table border="1" rules="none">
			<tr>
				<td colspan="2" id="title"><h1>��ǰ ���</h1></td>
			</tr>
			<tr>
				<td id="first">��ǰ ��ȣ</td>
				<td><input type="text" name="pro_num" placeholder="���ڸ� �Է� ����"></td>
			</tr>
			<tr>
				<td id="first">��ǰ �̸�</td>
				<td><input type="text" name="pro_name"></td>
			</tr>
			<tr>
				<td id="first">��ǰ �ڵ�</td>
				<td><input type="text" name="pro_code"></td>
			</tr>
			<tr>
				<td id="first">��ǰ ����</td>
				<td><input type="text" name="pro_stock" placeholder="���ڸ� �Է� ����"></td>
			</tr>
			<tr>
				<td id="first">��ǰ ����</td>
				<td><input type="text" name="pro_price" placeholder="���ڸ� �Է� ����"></td>
			</tr>
			<tr>S
				<td id="first">��ǰ ����</td>
				<td><input type="text" name="pro_description"></td>
			</tr>
			<tr>
				<td id="first">��ǰ �̹���</td>
				<td><input id="file" type="file" name="pro_img" size="50" accept='image/jpeg,image/gif,image/png' ></td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input id="button" type="button" value="Ȯ��" onclick="check_ok()">&nbsp;&nbsp;&nbsp;
					<input id="button" type="button" value="���" onclick="location.href='productView.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>


