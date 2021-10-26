<%@page import="shop.product.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="shop.product.ProductDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//���� ���ε� ó�� �κ�
	String path = request.getServletContext().getRealPath("productimg");
	System.out.print(path);
	int size = 1024*1024*10;
	String file = "";
	String originalFile = "";
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	file=multi.getFilesystemName(str);
	originalFile = multi.getOriginalFileName(str);

	//<jsp:useBean~~> ��� ProductBean�� �־��ִ� �κ�
	ProductBean product = new ProductBean();
	product.setPro_num(Integer.parseInt(multi.getParameter("pro_num")));
	product.setPro_name(multi.getParameter("pro_name"));
	product.setPro_code(multi.getParameter("pro_code"));
	product.setPro_stock(Integer.parseInt(multi.getParameter("pro_stock")));
	product.setPro_price(Integer.parseInt(multi.getParameter("pro_price")));
	product.setPro_description(multi.getParameter("pro_description"));
	product.setPro_img(file);
	product.setPro_regdate(new Timestamp(System.currentTimeMillis()));
	ProductDBBean manger = ProductDBBean.getInstance();
	int re = manger.insertProduct(product);
	if(re == 1){
		%>
			<script>alert("�߰� ����");
			document.location.href="productView.jsp";</script>
			
		<%
		}else{
		%>
			<script>alert("�߰� ����");
			document.location.href="productReg.jsp";</script>
		<%
		}
%>