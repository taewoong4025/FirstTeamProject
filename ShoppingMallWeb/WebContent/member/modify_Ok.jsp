<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����ó��</title>
 <!-- header.jsp include -->
		<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<%-- �ڹٺ� ���� �׼��±� ��� --%>
	<jsp:useBean id="memberBean" class="shop.member.MemberBean"></jsp:useBean>
	<jsp:setProperty property="*" name="memberBean"/>
	
	<%
		//���ǿ��� ���̵� ������ MemberBean�� �����Ѵ�.
		String id = session.getAttribute("sessionID").toString();
		memberBean.setId(id);
	
		String phone = request.getParameter("phone");
	
		String phone1 = phone.substring(0,3);
		String phone2 = phone.substring(4,8);
		String phone3 = phone.substring(9,13);
		
		memberBean.setPhone1(phone1);
		memberBean.setPhone2(phone2);
		memberBean.setPhone3(phone3);
		
		MemberDBBean manager = MemberDBBean.getInstance();
		manager.updateMember(memberBean);
	%>
	
	<p align="center">
	<br><br>
	<font size="5" color="gray">ȸ�������� �����Ǿ����ϴ�.</font>
    <br><br>
    <input type="button" value="��������" onclick="javascript:window.location='../index.jsp'"/></p>


    	<br><br><br>
 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>