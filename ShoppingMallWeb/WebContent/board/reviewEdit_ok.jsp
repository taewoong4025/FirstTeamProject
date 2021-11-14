<%@page import="shop.reviewBoard.reviewBoardDBBean"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="shop.reviewBoard.reviewBoardBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ori_img = request.getParameter("ori_img");
	
	String path = request.getServletContext().getRealPath("reviewImg");
	int size = 1024*1024*10;
	String file = "";
	String originalFile = "";
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	file=multi.getFilesystemName(str);
	originalFile = multi.getOriginalFileName(str);
	
	String pageNum = request.getParameter("pageNum");
	int id = Integer.parseInt(request.getParameter("id"));
	String sessionID = request.getParameter("sessionID");
	reviewBoardBean reviewboard = new reviewBoardBean();
	reviewboard.setId(id);
	
	reviewboard.setB_title(multi.getParameter("b_title"));
	reviewboard.setB_content(multi.getParameter("b_content"));
	reviewboard.setPassword(multi.getParameter("password"));
	
	if(file != null){
		//새 파일 있음
		reviewboard.setB_img(file);
		//이전 파일 삭제
		File deletefile = new File(request.getServletContext().getRealPath("reviewImg")+"\\"+ori_img);
		if(deletefile.exists())deletefile.delete();
	}else{
		//새 파일 없음 -> 이전파일 그대로 사용
		reviewboard.setB_img(ori_img);
	}
	
	reviewBoardDBBean manager = reviewBoardDBBean.getInstance();
			int re = manager.editBoard(reviewboard);
			
			if(re == 1){
				%>
					<script>alert("수정 성공");
					document.location.href="reviewShow.jsp?pageNum=<%=pageNum%>&id=<%=id%>&sessionID=<%=sessionID%>";</script>
					
				<%
				}else{
				%>
					<script>alert("비밀번호가 틀립니다.");
					document.location.href="reviewEdit.jsp?pageNum=<%=pageNum%>&id=<%=id%>&sessionID=<%=sessionID%>";</script>
				<%
				}
		%>
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>