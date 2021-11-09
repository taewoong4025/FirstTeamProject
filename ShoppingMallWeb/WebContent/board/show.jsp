<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="shop.board.BoardBean"%>
<%@page import="shop.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int Id = Integer.parseInt(request.getParameter("id"));
	String sessionID = request.getParameter("sessionID");
	
	System.out.print("@@@###sessionID => : " + sessionID);

	BoardDBBean db = BoardDBBean.getInstance();
	BoardBean board = db.getBoard(Id, true);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int id=0, b_hit=0;
	String b_title="", b_content="";
	Timestamp b_date=null;
	
	id = board.getId();
	b_title = board.getB_title();
	b_content = board.getB_content();
	b_date = board.getB_date();
	b_hit = board.getB_hit();
%>
<html>
<head>
<meta charset="EUC-KR">


</head>
<body>
	<center>
		<h1>�Խù� ��ȸ</h1>
		<table border="1" width="800" cellspacing="0">
			<tr height="30" align="center">
				<td width="100">
					��ȣ
				</td>
				<td width="200">
					<%= id %>
				</td>
				
				<td width="100">
					��ȸ��
				</td>
				<td width="200">
					<%= b_hit %>
				</td>
				
			</tr>
			<tr height="30" align="center">
				
				<td width="100">
					�ۼ���
				</td>
				<td width="200">
					<%= sdf.format(b_date) %>
				</td>
				<td width="100">
					�ϴ� ����
				</td>
				<td width="200">
				
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					����
				</td>
				<td colspan="3" width="100">
					<%= b_title %>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					����
				</td>
				<td colspan="3" width="100">
					<pre>
						<%= b_content %>
					</pre>
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right">
					
					<%
						if(sessionID.equals("admin")){
					%>
					<input type="button" value="�ۼ���" onclick="location.href='edit.jsp?id=<%= id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="�ۻ���" onclick="location.href='delete.jsp?id=<%= id %>&pageNum=<%= pageNum %>'">
					<%
						}
					%>
					<!--�������� �̹Ƿ� �亯�� x-->
					<!--  <input type="button" value="�亯��" onclick="location.href='write.jsp?id=<%= id %>&pageNum=<%= pageNum %>'">-->
					<input type="button" value="�۸��" onclick="location.href='list.jsp?<%= pageNum %>'">
				</td>
			</tr>
		</table>
	</center>
</body>
</html>








