<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mb" class="shop.member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<%

	//mem_regdate �־��ֱ�
	mb.setReg(new Timestamp(System.currentTimeMillis()));

	MemberDBBean manager = MemberDBBean.getInstance();
	
	if(manager.confirmID(mb.getId()) == 1){
%>
		<script type="text/javascript">
			alert("�ߺ��Ǵ� ���̵� �����մϴ�.");
			//document.location.href="register.jsp";
			history.back();	//�ٷ� �� �������� ���ư�
		</script>
<%
	}else{
		int re = manager.insertMember(mb);
		
		if(re == 1){
%>
			<script>
				alert("ȸ�������� ���ϵ帳�ϴ�.\nȸ������ �α��� ���ּ���.");
				//��� �� �� ȭ�� �ƴ϶� �̵�
				document.location.href="login.html";
			</script>
<%
%>
			<script>
				alert("ȸ�����Կ� �����߽��ϴ�.");
				document.location.href="login.html";
			</script>
<%
		}
	}
%>