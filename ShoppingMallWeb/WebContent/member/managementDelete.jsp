<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");
	System.out.println("iddddddddddddd"+id);
	MemberDBBean db = MemberDBBean.getInstance();
	int re = db.deleteManagment(id);
	if(re==1){
		%>
		<script >
			alert("����");
			location.href="management.jsp";
		</script>
	}else if(re==-1){
		%>
		<script type="text/javascript">
			alert("������ �����߽��ϴ�.");
			history.go(-1);
		</script>
		<%
	}
%>