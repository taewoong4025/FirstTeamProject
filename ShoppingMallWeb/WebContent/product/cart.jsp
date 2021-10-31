<%@page import="java.util.ArrayList"%>
<%@page import="shop.cart.CartBean"%>
<%@page import="shop.cart.CartDBBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/styles.css">
<style type="text/css">
	body {
		background-color: white;	
	}
	
	td {
		vertical-align: middle;
	}
	
	#center_td {
		text-align: center;
	}
	
	#right_td {
		text-align: right;
	}
	
	#input_stock {
		width: 50px;
		text-align: right;
	}
	

</style>
</head>
<body>
	<%
	// ���ڸ� õ ������ �����ϴ� ����
	DecimalFormat dFormat = new DecimalFormat("###,###,###");
	// ���ǿ� ����� ���̵� ��������
	String sessionID = (String)session.getAttribute("sessionID");
	%>
	
	<%
	if(sessionID == null || sessionID.equals("")) {
		
	%>
		<script>alert("�α��� �� �̿����ֽñ� �ٶ��ϴ�."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// ���ǰ�(�α�����)�� �־� ������, ��ٱ��Ϸ� �߰��ϴ� ���� ����.	
	} else {
	%>
		<div class="jumbotron"> 
			<div class="container">
				<h1 class="display-3">��ٱ���</h1>
			</div>
		</div>
	
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="../index.jsp">�̵�����</a></td>
				</tr>
			</table>
		</div>
	</div>
	
	<div style="padding-top: 50px; margin:40px;">
		<table class="table table-hover">
			<tr>
				<th>��ǰ</th>
				<th>����</th>
				<th>����</th>
				<th>�Ұ�</th>
				<th>���</th>
			</tr>
			<% 
			int amount = 0;
			
			CartDBBean db = CartDBBean.getInstance();
			ArrayList<CartBean> cartList = db.listCart(sessionID);
			
			String pro_name = "";
			int cart_num=0, pro_num=0, pro_price=0, cart_stock;
			
			for(int i=0; i<cartList.size(); i++){
				CartBean cart = cartList.get(i);
				cart_num = cart.getCart_num();
				pro_name = cart.getPro_name();
				pro_num = cart.getCart_num();
				pro_price = cart.getPro_price();
				cart_stock = cart.getCart_stock();
				
				int total = pro_price * cart_stock;
				amount += total;
			%>
				<tr>
			<form method="post" action="./cartEdit.jsp">
					<td><%= pro_name %></td>
					<td>\<%= dFormat.format(pro_price) %></td>
					<td>
							<input type="hidden" name="cart_num" value="<%= cart_num %>">
							<input id="input_stock" name="cart_stock" type="number" value="<%= cart_stock %>" min="1"> �� 
							<input type="submit" value="����">
					</td>
			</form>
					<td>\<%= dFormat.format((pro_price * cart_stock)) %></td>
					<td><a href="./cartDelete.jsp?cart_num=<%= cart_num %>" class="badge badge-danger" style="background-color:red;">����</a></td>
				</tr>
			<%
			}
			
			%>
				<tr>
					<th></th>
					<th></th>
					<th>�Ѿ�</th>
					<th>\<%= dFormat.format(amount) %></th>
					<th></th>
				</tr>
				<tr>
					<th colspan="5" id="right_td">
						<input type="button" value="������ ��ٱ��� ��� ����" onclick="#"> 
						<input type="button" value="��ٱ��� ��ü ����" onclick="location.href='./cartAllDelete.jsp?allDel=<%= "all" %>'">
					</th>
				</tr>
				<tr>
					<th colspan="5" id="center_td">
						<input type="button" value="�ֹ� �ϱ�" onclick="#"> <input type="button" value="�ֹ� ���" onclick="location.href='../index.jsp'">
					</th>
				</tr>
		</table>
	
	
	</div>
	<%
	}
	%>
	
</body>
</html>