<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
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
    	int pro_num = Integer.parseInt(request.getParameter("pro_num"));
    	ProductDBBean db = ProductDBBean.getInstance();
    	ProductBean product = db.getProduct(pro_num);
    	//새 이미지를 선택하지 않을 경우 사용할 이전 이미지 이름(ex-oo.jpg)
    	String ori_img = product.getPro_img();
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
                        <li class="nav-item"><a class="nav-link" href="../board/list.jsp">이용안내</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">상품</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">상품리뷰</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            	
                            </ul>
                        </li>
                    </ul>
                    
                            
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='../product/cart.jsp' ">
                            <i class="bi-cart-fill me-1"></i>
                            	장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                
                        </button>
                        
                        &nbsp;&nbsp;
                        <script type="text/javascript">
                        
                        	function logout(){
                        		location.href="../member/logout.jsp";
                        	}
                        </script>                   
                        
                      	<%
                   
	                     if(member.getUser_level()==9 && sessionID != null){ // 관리자인 경우만
	                   
	                    %>
	                   <div class="btn btn-outline-dark">
	                        <li class="nav-item dropdown" style="list-style: none;">
                              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="bi-menu-up me-1"></i>Menu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li style="text-align:center"><b><%=sessionID %></b></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#">
								<button class="btn btn-outline-dark" type="button">
		                        <i class="bi bi-file-person-fill"></i>	
        	                 		  회원관리&nbsp;</button></a>
							</li>
							   <li><a class="dropdown-item" href="#">
								<button class="btn btn-outline-dark" type="button" onclick="logout()">
		                        <i class="bi bi-file-person-fill"></i>	
        	               			 로그아웃&nbsp;</button></a>
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
                    <p class="lead fw-normal text-white-50 mb-0">상품등록하는 productReg Page</p>
                </div>
            </div>
        </header>

	<script type="text/javascript" src="product.js" charset="utf-8" ></script>
<style type="text/css">
		h2{
			margin-top:150px;
			text-align: center;
		}
		
		table {
			widht: 500px;
			margin-top: 50px;
			margin-left: auto;
			margin-right: auto;
		}
		
		td {
			width: 100px;
		}
		
		#tr_height {
			height: 60px;
		}
	
	</style>
</head>
<body>
<h2>등록된 제품 수정하기</h2>
	<form name="productform1" method="post" action="productEdit_ok.jsp?ori_img=<%=ori_img %>" enctype="multipart/form-data">
		<table border="1" rules="none">
			<tr>
				<td>1.제품 번호</td>
				<td><input type="text" name="pro_num" value="<%= product.getPro_num() %>" readonly="readonly" ></td>
			</tr>
			<tr>
				<td>2.제품 이름</td>
				<td><input type="text" name="pro_name" value="<%= product.getPro_name() %>"></td>
			</tr>
			<tr>
				<td>3.제품 코드</td>
				<td><input type="text" name="pro_code" value="<%= product.getPro_code() %>"></td>
			</tr>
			<tr>
				<td>4.제품 수량</td>
				<td><input type="text" name="pro_stock" value="<%= product.getPro_stock()%>"></td>
			</tr>
			<tr>
				<td>5.제품 가격</td>
				<td><input type="text" name="pro_price" value="<%=product.getPro_price() %>"></td>
			</tr>
			<tr>
				<td>6.제품 설명</td>
				<td><input type="text" name="pro_description" value="<%=product.getPro_description()%>"></td>
			</tr>
			<tr>
				<td>7.제품 이미지</td>
				<td><input type="file" name="pro_img" size="50" accept='image/jpeg,image/gif,image/png'></td>
			</tr>
			<tr id="tr_height">
				<td colspan="2" align="center">
					<input type="button" value="확인" onclick="check_ok1()">
					<input type="button" value="취소" onclick="location.href='productView.jsp'">
				</td>
			</tr>
		</table>
					
	</form>
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


