<%@page import="shop.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int id = Integer.parseInt(request.getParameter("id"));
	String password = request.getParameter("password");
	
	System.out.print("@@@@###==>" + password);
	
	BoardDBBean db = BoardDBBean.getInstance();
	int re = db.deleteBoard(id, password);
	
	if(re == 1){
		
		response.sendRedirect("list.jsp?pageNum="+pageNum);
		%>
		<script type="text/javascript">
			alert("�ش� �Խù��� �����Ǿ����ϴ�!");
		</script>
	<%
		
	}else if(re == 0){
		%>
			<script type="text/javascript">
				alert("��й�ȣ�� ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
		<%
	}else if(re == -1){
		%>
			<script type="text/javascript">
				alert("������ �����Ͽ����ϴ�.");
				history.go(-1);
			</script>
		<%
	}
%>