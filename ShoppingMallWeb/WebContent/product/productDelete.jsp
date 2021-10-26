<%@page import="java.io.File"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int pro_num = Integer.parseInt(request.getParameter("pro_num"));
	String pro_img = request.getParameter("pro_img");
	System.out.println(pro_img);
	ProductDBBean db = ProductDBBean.getInstance();
	int re = db.deleteProduct(pro_num);
	if(re==1){
		%>
		<script >
			alert("삭제");
		</script>
		<%
		File deletefile = new File(request.getServletContext().getRealPath("productImg")+"\\"+pro_img);
		if(deletefile.exists())deletefile.delete();
		response.sendRedirect("productView.jsp");
	}else if(re==-1){
		%>
		<script type="text/javascript">
			alert("삭제에 실패했습니다.");
			history.go(-1);
		</script>
		<%
	}
%>