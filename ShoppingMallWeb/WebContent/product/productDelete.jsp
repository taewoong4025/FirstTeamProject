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
			alert("����");
		</script>
		<%
		File deletefile = new File(request.getServletContext().getRealPath("productImg")+"\\"+pro_img);
		if(deletefile.exists())deletefile.delete();
		response.sendRedirect("productView.jsp");
	}else if(re==-1){
		%>
		<script type="text/javascript">
			alert("������ �����߽��ϴ�.");
			history.go(-1);
		</script>
		<%
	}
%>