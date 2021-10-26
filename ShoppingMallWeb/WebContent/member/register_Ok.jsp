<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mb" class="shop.member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<%

	//mem_regdate 넣어주기
	mb.setReg(new Timestamp(System.currentTimeMillis()));

	MemberDBBean manager = MemberDBBean.getInstance();
	
	if(manager.confirmID(mb.getId()) == 1){
%>
		<script type="text/javascript">
			alert("중복되는 아이디가 존재합니다.");
			//document.location.href="register.jsp";
			history.back();	//바로 전 페이지로 돌아감
		</script>
<%
	}else{
		int re = manager.insertMember(mb);
		
		if(re == 1){
%>
			<script>
				alert("회원가입을 축하드립니다.\n회원으로 로그인 해주세요.");
				//등록 후 빈 화면 아니라 이동
				document.location.href="login.html";
			</script>
<%
%>
			<script>
				alert("회원가입에 실패했습니다.");
				document.location.href="login.html";
			</script>
<%
		}
	}
%>