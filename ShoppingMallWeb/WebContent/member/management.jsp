<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table{
		margin: auto;
		margin-top: 60;
		width: 1200px;
		text-align: center;
		border-collapse: collapse;
	}
	td{
		border-bottom: 1px solid;
		padding: 10px;
		height: 30px;
	}
	#first_line{
			background-color: #d3d3d3;
			font-size: 15px;
			border-top: 1px solid;
			font-weight: bolder;
	}
	#button:hover {
   		 	background-color: gray;
   		 	color: white;
   	}
</style>
</head>
<body>
	<table>
		<tr id="first_line">
			<td>���̵�</td>
			<td>��й�ȣ</td>
			<td>�̸�</td>
			<td>����</td>
			<td>����</td>
			<td>�̸���</td>
			<td>�޴���</td>
			<td>�ּ�</td>
			<td>���Գ�¥</td>
			<td>Ż��</td>
		</tr>
		<%
			MemberDBBean db = MemberDBBean.getInstance();
			ArrayList<MemberBean> memberlist = db.listMember();
			String id="", password="", name="", gender="", mail="";
			String phone="", address="";
			String birthday="";
			Timestamp reg;
			System.out.println("memberlist.size()"+memberlist.size());
			for(int i=0; i<memberlist.size(); i++){
				MemberBean member = memberlist.get(i);
				id = member.getId();
				if(!id.equals("admin")){
				password = member.getPassword();
				name = member.getName();
				gender = member.getGender();
				birthday = member.getYy() + member.getMm() + member.getDd();
				mail = member.getMail();
				phone = member.getPhone1() + "-"+ member.getPhone2() + "-"+ member.getPhone3();
				address = member.getAddress1() + member.getAddress2();
				reg = member.getReg();
				%>
				<tr>
					<td><%= id %></td>
					<td><%= password %></td>
					<td><%= name %></td>
					<td><%= gender %></td>
					<td><%= birthday %></td>
					<td><%= mail %></td>
					<td><%= phone %></td>
					<td><%= address %></td>
					<td><%= reg %></td>
					<td><input id="button" type="button" value="Ż��" onclick="location.href='managementDelete.jsp?id=<%=id %>'"></td>
				</tr>
				<%
				}
			}
		%>
	</table>
</body>
</html>