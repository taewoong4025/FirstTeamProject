<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.cart.CartBean"%>
<%@page import="shop.cart.CartDBBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
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
	<link rel="stylesheet" href="../css/styles.css">
	<script type="text/javascript">
                        
		function logout(){
			location.href="member/logout.jsp";
		}
    </script>        
<style type="text/css">
	body {
		background-color: white;	
	}
	
	td {
		vertical-align: middle;
	}
	
	#center_td {
		text-align: center;
	}
	
	#right_td {
		text-align: right;
	}
	
	#input_stock {
		width: 50px;
		text-align: right;
	}
	
</style>
</head>
<body>
	
	<%
	// ���ڸ� õ ������ �����ϴ� ����
	DecimalFormat dFormat = new DecimalFormat("###,###,###");
	// ���ǿ� ����� ���̵� ��������
	String sessionID = (String)session.getAttribute("sessionID");
    
	MemberDBBean manager = MemberDBBean.getInstance();
	MemberBean member = manager.getMember(sessionID);
    %>
	
	<%
	if(sessionID == null || sessionID.equals("")) {
		
	%>
		<script>alert("�α��� �� �̿����ֽñ� �ٶ��ϴ�."); 
		document.location.href="../member/login.html";
		</script>
	<%
	// ���ǰ�(�α�����)�� �־� ������, ��ٱ��Ϸ� �߰��ϴ� ���� ����.	
	} else {
	%>
	<!-- 11/7�� �׺���̼� �� �߰�.  -->
	 <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="../index.jsp">Gear Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="../index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="../board/list.jsp">�̿�ȳ�</a></li>
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
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='./cart.jsp' ">
                            <i class="bi-cart-fill me-1"></i>
                            	��ٱ���
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                
                        </button>
                        
                        &nbsp;&nbsp;
                        <script type="text/javascript">
                        
                        	function logout(){
                        		location.href="member/logout.jsp";
                        	}
                        </script>                   
                        
                      	<%
                    	
                    	if(sessionID==null){ // �α����� �ȵǾ��� ��
	                    
	                    %>	  
                        <!-- login -->
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='member/login.html'">
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
                                <li style="text-align:center"><b>�ݰ����ϴ�,<%=sessionID %>��  </b></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">
                                <li><a class="dropdown-item" href="../member/UserInfo.jsp">
								<button class="btn btn-outline-dark" type="button">
		                        <i class="bi bi-file-person-fill"></i>	
        	                 	   ȸ������&nbsp;</button></a>
							</li>
                                &nbsp;&nbsp;&nbsp;<button class="btn btn-outline-dark" type="button" onclick="logout()">
                        			<i class="bi bi-file-person-fill"></i>	  
            		              �α׾ƿ�&nbsp;
	                	        </button>
    	                	    </a>
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
                                <button class="btn btn-outline-dark" type="button" onclick="location.href='product/productView.jsp'">
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
	 
	<div style="padding-top: 50px; margin:40px;">
		<table class="table table-hover">
			<tr>
				<th>��ǰ</th>
				<th>����</th>
				<th>����</th>
				<th>�Ұ�</th>
				<th>���</th>
			</tr>
			<% 
			int amount = 0;
			
			CartDBBean db = CartDBBean.getInstance();
			ArrayList<CartBean> cartList = db.listCart(sessionID);
			
			String pro_name = "";
			int cart_num=0, pro_num=0, pro_price=0, cart_stock;
			
			for(int i=0; i<cartList.size(); i++){
				CartBean cart = cartList.get(i);
				cart_num = cart.getCart_num();
				pro_name = cart.getPro_name();
				pro_num = cart.getPro_num();
				pro_price = cart.getPro_price();
				cart_stock = cart.getCart_stock();
				
				int total = pro_price * cart_stock;
				amount += total;
			%>
			<tr>
			<form method="post" action="./cartEdit.jsp">
					<td><%= pro_name %></td>
					<td>\<%= dFormat.format(pro_price) %></td>
					<td>
							<input type="hidden" name="cart_num" value="<%= cart_num %>">
							<input id="input_stock" name="cart_stock" type="number" value="<%= cart_stock %>" min="1"> �� 
							<input type="submit" value="����">
					</td>
			</form>
					<td>\<%= dFormat.format((pro_price * cart_stock)) %></td>
					<td><a href="./cartDelete.jsp?cart_num=<%= cart_num %>&pro_num=<%=pro_num %>" class="badge badge-danger" style="background-color:red;">����</a></td>
				</tr>
			<%
			}
			
			%>
				<tr>
					<th></th>
					<th></th>
					<th>�Ѿ�</th>
					<th>\<%= dFormat.format(amount) %></th>
					<th></th>
				</tr>
				<tr>
					<th colspan="5" id="right_td">
						<!--<input type="button" value="������ ��ٱ��� ��� ����" onclick="#"> -->
						<input type="button" value="��ٱ��� ��ü ����" onclick="location.href='./cartAllDelete.jsp?allDel=<%= "all" %>'">
					</th>
				</tr>
				<tr>
					<th colspan="5" id="center_td">
						<input type="button" value="�ֹ� �ϱ�" onclick="location.href='../product/pay.jsp?sessionID=<%= sessionID%>&amount=<%=amount%>'"> 
						<input type="button" value="�ֹ� ���" onclick="location.href='../index.jsp'">
					</th>
				</tr>
		</table>
	
	</div>
	<%
	}
	%>
	 <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>