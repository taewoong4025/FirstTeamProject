<%@page import="java.io.File"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="shop.product.ProductDBBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="shop.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String ori_img = request.getParameter("ori_img");

	String path = request.getServletContext().getRealPath("productImg");
	int size = 1024*1024*10;
	String file = "";
	String originalFile = "";
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	file=multi.getFilesystemName(str);
	originalFile = multi.getOriginalFileName(str);

	ProductBean product = new ProductBean();
	product.setPro_num(Integer.parseInt(multi.getParameter("pro_num")));
	product.setPro_name(multi.getParameter("pro_name"));
	product.setPro_code(multi.getParameter("pro_code"));
	product.setPro_stock(Integer.parseInt(multi.getParameter("pro_stock")));
	product.setPro_price(Integer.parseInt(multi.getParameter("pro_price")));
	product.setPro_description(multi.getParameter("pro_description"));
	
	if(file != null){
		//�� ���� ����
		product.setPro_img(file);
		//���� ���� ����
		File deletefile = new File(request.getServletContext().getRealPath("productImg")+"\\"+ori_img);
		if(deletefile.exists())deletefile.delete();
	}else{
		//�� ���� ���� -> �������� �״�� ���
		product.setPro_img(ori_img);
	}
	ProductDBBean manger = ProductDBBean.getInstance();
	int re = manger.editProduct(product);
	if(re == 1){
		%>
			<script>alert("���� ����");
			document.location.href="productView.jsp";</script>
			
		<%
		}else{
		%>
			<script>alert("���� ����");
			document.location.href="productReg.jsp";</script>
		<%
		}
%>
	
	
%>