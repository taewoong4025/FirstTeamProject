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
			alert("삭제");
			location.href="management.jsp";
		</script>
	}else if(re==-1){
		%>
		<script type="text/javascript">
			alert("삭제에 실패했습니다.");
			history.go(-1);
		</script>
		<%
	}
%>