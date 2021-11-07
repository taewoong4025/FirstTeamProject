<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.member.MemberDBBean"%>
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
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='../product/cart.jsp' ">
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
                   
	                     if(member.getUser_level()==9 && sessionID != null){ // �������� ��츸
	                   
	                    %>
	                   <div class="btn btn-outline-dark">
	                        <li class="nav-item dropdown" style="list-style: none;">
                              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="bi-menu-up me-1"></i>Menu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li style="text-align:center"><b><%=sessionID %></b></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#">
								<button class="btn btn-outline-dark" type="button" onclick="location.href='../product/productView.jsp'">
                        			<i class="bi bi-bag-plus"></i>
                        			��ǰ���&nbsp;
	                	        </button>
    	                	    </a>
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
                    <p class="lead fw-normal text-white-50 mb-0">�����ڸ� ���ü� �ִ� productView Page</p>
                </div>
            </div>
        </header>
<style type="text/css">
	table{
		margin: auto;
		margin-top: 60;
		margin-bottom: 100;
		width: 1200px;
		text-align: center;
		border-collapse: collapse;
	}
	td{
		border-bottom: 1px solid;
		padding: 10px;
		height: 30px;
	}
	#first_line{
			background-color: #d3d3d3;
			font-size: 15px;
			border-top: 1px solid;
			font-weight: bolder;
	}
	#button:hover {
   		 	background-color: gray;
   		 	color: white;
   	}
</style>
	<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
               
        
	<table>
		<tr id="first_line">
			<td>���̵�</td>
			<td>��й�ȣ</td>
			<td>�̸�</td>
			<td>����</td>
			<td>����</td>
			<td>�̸���</td>
			<td>�޴���</td>
			<td>�ּ�</td>
			<td>���Գ�¥</td>
			<td>Ż��</td>
		</tr>
		<%
			MemberDBBean db = MemberDBBean.getInstance();
			ArrayList<MemberBean> memberlist = db.listMember();
			String id="", password="", name="", gender="", mail="";
			String phone="", address="";
			String birthday="";
			Timestamp reg;
			System.out.println("memberlist.size()"+memberlist.size());
			for(int i=0; i<memberlist.size(); i++){
				MemberBean mem = memberlist.get(i);
				id = mem.getId();
				if(!id.equals("admin")){
				password = mem.getPassword();
				name = mem.getName();
				gender = mem.getGender();
				birthday = mem.getYy() + mem.getMm() + mem.getDd();
				mail = mem.getMail();
				phone = mem.getPhone1() + "-"+ mem.getPhone2() + "-"+ mem.getPhone3();
				address = mem.getAddress1() + mem.getAddress2();
				reg = mem.getReg();
				%>
				<tr>
					<td><%= id %></td>
					<td><%= password %></td>
					<td><%= name %></td>
					<td><%= gender %></td>
					<td><%= birthday %></td>
					<td><%= mail %></td>
					<td><%= phone %></td>
					<td><%= address %></td>
					<td><%= reg %></td>
					<td><input id="button" type="button" value="Ż��" onclick="location.href='managementDelete.jsp?id=<%=id %>'"></td>
				</tr>
				<%
				}
			}
		%>
	</table>
	</div>
	</section>
</body>
</html>
 		<!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>