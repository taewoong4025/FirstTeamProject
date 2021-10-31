<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="shop.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="board" class="shop.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	board.setB_date(new Timestamp(System.currentTimeMillis()));

	InetAddress address = InetAddress.getLocalHost();
	String ip = address.getHostAddress();
	
	//board.setB_ip(request.getRemoteAddr());
	board.setB_ip(ip);

	BoardDBBean db = BoardDBBean.getInstance();
	if(db.insertBoard(board) == 1){
		response.sendRedirect("list.jsp");
	}else{
		response.sendRedirect("write.jsp");
	}
%>