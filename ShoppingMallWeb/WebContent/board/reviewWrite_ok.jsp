<%@page import="shop.reviewBoard.reviewBoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="shop.reviewBoard.reviewBoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	reviewBoardDBBean db = reviewBoardDBBean.getInstance();
	
	String path = request.getServletContext().getRealPath("reviewImg");
	System.out.println(path);
	int size = 1024*1024*10;
	String file = "";
	String originalFile = "";
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	file=multi.getFilesystemName(str);
	originalFile = multi.getOriginalFileName(str);
	System.out.println(path);
	
	reviewBoardBean reviewboard = new reviewBoardBean();
	
	reviewboard.setB_date(new Timestamp(System.currentTimeMillis()));
	reviewboard.setB_title(multi.getParameter("b_title"));
	reviewboard.setB_content(multi.getParameter("b_content"));
	reviewboard.setPassword(multi.getParameter("password"));
	reviewboard.setB_img(file);
	
	if(db.insertBoard(reviewboard)==1){
		response.sendRedirect("reviewList.jsp");
	}else{
		response.sendRedirect("reviewWrite.jsp");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>