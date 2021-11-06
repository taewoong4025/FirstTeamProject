<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.product.ProductDBBean"%>
<%@page import="shop.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title> Gear Shop </title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
        
        <%
        String sessionID = (String)session.getAttribute("sessionID");
        
    	MemberDBBean manager = MemberDBBean.getInstance();
    	MemberBean member = manager.getMember(sessionID);
        %>
    </head>
    <body>
    
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="../index.jsp">Gear Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="../board/list.jsp">����Խ���</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">��ǰ</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">��ǰ����</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            	
                            </ul>
                        </li>
                    </ul>
                            
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='cart.jsp' ">
                            <i class="bi-cart-fill me-1"></i>
                            	��ٱ���
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                
                        </button>
                        
                        &nbsp;&nbsp;
                        <script type="text/javascript">
                        
                        	function logout(){
                        		location.href="../member/logout.jsp";
                        	}
                        </script>                   
                        
                      	<%
                    	
                    	if(sessionID==null){ // �α����� �ȵǾ��� ��
	                    
	                    %>	  
                        <!-- login -->
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='../member/login.html'">
                        <i class="bi bi-file-person-fill"></i>	
                            login&nbsp;
                        </button>
	                    
	                    <%
	                      }
	                      else if(member.getUser_level()!=9 && sessionID != null){ //�α������� �� �����ڰ� �ƴ� ���
	                    %>
	                       <div class="btn btn-outline-dark">
	                        <li class="nav-item dropdown" style="list-style: none;">
                              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="bi-menu-up me-1"></i>Menu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li style="text-align:center"><b><%=sessionID %>��, Hi~ </b></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">
                                <button class="btn btn-outline-dark" type="button" onclick="logout()">
                        			<i class="bi bi-file-person-fill"></i>	  
            		                �α׾ƿ�&nbsp;
	                	        </button>
    	                	    </a>
        	               	  </li>
                                <li><a class="dropdown-item" href="../member/UserInfo.jsp">
								<button class="btn btn-outline-dark" type="button">
		                        <i class="bi bi-file-person-fill"></i>	
        	                 	   ȸ������&nbsp;</button></a>
							</li>
                            </ul>
                            </li>
	               	 	</div>
	                    
	               	   <%
	                      }else{ // �������� ���
	                    %>
	                        <div class="btn btn-outline-dark">
	                        <li class="nav-item dropdown" style="list-style: none;">
                              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="bi-menu-up me-1"></i>Menu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li style="text-align:center"><b><%=sessionID %></b></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">
                                <button class="btn btn-outline-dark" type="button" onclick="location.href='productView.jsp'">
                        			<i class="bi bi-bag-plus"></i>
                        			��ǰ���&nbsp;
	                	        </button>
    	                	    </a>
        	               	  </li>
                                <li><a class="dropdown-item" href="#">
								<button class="btn btn-outline-dark" type="button">
		                        <i class="bi bi-file-person-fill"></i>	
        	                 		  ȸ������&nbsp;</button></a>
							</li>
							   <li><a class="dropdown-item" href="#">
								<button class="btn btn-outline-dark" type="button" onclick="logout()">
		                        <i class="bi bi-file-person-fill"></i>	
        	               			 �α׾ƿ�&nbsp;</button></a>
							</li>
                            </ul>
                            </li>
	               	 	</div>
	                    <%	
	                      }
                      	%>
                    </form>
                </div>
            </div>
        </nav>
		 <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Gear Shop</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>	
	<style type="text/css">
		table{
			margin: auto;
			margin-top: 60;
			width: 1000px;
			border-collapse: collapse;
		}
		td {
			vertical-align: middle;
			border-bottom: 1px solid;
			padding: 10px;	
			width: 100px;
		}
		#none{
			border-top: none;
			border-collapse: none;
			border-bottom: 1px solid;		
		}
		#first_line{
			background-color: #d3d3d3;
			font-size: 15px;
		}
		#first_line td{
			font-weight: bolder;
		}
		tr{
			height: 50px;
		}
		#regbutton {
			width: 200px;
			height: 30px;
		}
		#button:hover {
   		 	background-color: gray;
   		 	color: white;
   		}
		#desc {
			width: 200px;
		}
	</style>
	<table>
		<tr>
			<td id="none" colspan="8" align="right">
				<input id="regbutton" type="button" value="��ǰ���" onclick="location.href='productReg.jsp'">
			</td>
		</tr>
		<tr id="first_line" align="center">
			<td>��ǰ��ȣ</td> 
			<td>��ǰ�̸�</td>
			<td>��ǰ�ڵ�</td>
			<td>��ǰ����</td>
			<td>��ǰ����</td>
			<td id="desc">��ǰ����</td>
			<td>��ǰ����</td>
			<td>��ǰ����</td>
		</tr>
		<%
			DecimalFormat format = new DecimalFormat("###,###.##");
			ProductDBBean db = ProductDBBean.getInstance();
			ArrayList<ProductBean> productList = db.listProduct();
			
			String pro_name="", pro_code="", pro_description="", pro_img="", pro_imgpath="";
			int pro_num=0, pro_stock=0, pro_price=0;
			
			for(int i=0; i<productList.size(); i++){
				ProductBean product = productList.get(i);
				pro_num = product.getPro_num();
				pro_name = product.getPro_name();
				pro_code = product.getPro_code();
				pro_stock = product.getPro_stock();
				pro_price = product.getPro_price();
				pro_description = product.getPro_description();
				pro_img = product.getPro_img();
				%>
				<tr align="center">
					<td><%= pro_num %></td>
					<td><%= pro_name %></td>
					<td><%= pro_code %></td>
					<td><%= pro_stock %></td>
					<td><%= format.format(pro_price) %></td>
					<td><%= pro_description  %></td>
					<td><img src="${pageContext.request.contextPath}/productImg/<%= pro_img %>" width="100" height="100"></td>
					<td>
						<input id="button" type="button" value="��ǰ ����" onclick="location.href='productEdit.jsp?pro_num=<%= pro_num %>'"><br><br>
						<form method="post" name="del_form" action="productDelete.jsp">
							<input type="hidden" value="<%= pro_num %>" name="pro_num">
							<input type="hidden" value="<%= pro_img %>" name="pro_img">
							<input id="button" type="submit" value="��ǰ ����">
						</form>

					</td>
				</tr>
				<%
			}
		%>
		<tr>
	</table>
</body>
</html>