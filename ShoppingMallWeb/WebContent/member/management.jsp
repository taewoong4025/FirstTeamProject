<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include>

<style type="text/css">
	table{
		margin: auto;
		margin-top: 60;
		margin-bottom: 100;
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
	<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
               
        
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
				MemberBean mem = memberlist.get(i);
				id = mem.getId();
				if(!id.equals("admin")){
				password = mem.getPassword();
				name = mem.getName();
				gender = mem.getGender();
				birthday = mem.getYy() + mem.getMm() + mem.getDd();
				mail = mem.getMail();
				phone = mem.getPhone1() + "-"+ mem.getPhone2() + "-"+ mem.getPhone3();
				address = mem.getAddress1() + mem.getAddress2();
				reg = mem.getReg();
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
	</div>
	</section>
			<br><br><br>
 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
 	