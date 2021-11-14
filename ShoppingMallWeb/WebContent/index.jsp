<%@page import="shop.cart.CartDBBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	// 숫자를 천 단위로 구분하는 포맷
	DecimalFormat format = new DecimalFormat("###,###,###");
%>
<html lang="ko">
   
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
        <link href="css/styles.css" rel="stylesheet" />
    </head>
   
     <body>
            
        <%
        String sessionID = (String)session.getAttribute("sessionID");
        
    	MemberDBBean manager = MemberDBBean.getInstance();
    	MemberBean member = manager.getMember(sessionID);
    	
    	CartDBBean cartDB = new CartDBBean().getInstance();
    	int total = cartDB.myCartTotal(sessionID);
        %>
        
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">Gear Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <!--
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">대기</a></li>
                    -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">게시판</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                  <li><a class="dropdown-item" href="board/list.jsp">공지사항</a></li>
                                <li><a class="dropdown-item" href="board/reviewList.jsp">리뷰게시판</a></li>
                            	
                            </ul>
                        </li>
                    </ul>
                    
                            
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='product/cart.jsp' ">
                            <i class="bi-cart-fill me-1"></i>
                            	장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%= total %></span>
                
                        </button>
                        
                        &nbsp;&nbsp;
                        <script type="text/javascript">
                        
                        	function logout(){
                        		location.href="member/logout.jsp";
                        	}
                        </script>                   
                        
                      	<%
                    	
                    	if(sessionID==null){ // 로그인이 안되었을 때
	                    
	                    %>	  
                        <!-- login -->
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='member/login.html'">
                        <i class="bi bi-file-person-fill"></i>	
                            login&nbsp;
                        </button>
	                    
	                    <%
	                      }
	                      else if(member.getUser_level()!=9 && sessionID != null){ //로그인했을 때 관리자가 아닌 경우
	                    %>
	                       <div class="btn btn-outline-dark">
	                        <li class="nav-item dropdown" style="list-style: none;">
                              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="bi-menu-up me-1"></i>Menu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li style="text-align:center"><b>반갑습니다.<br><%=sessionID %>님</b></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">
                                <li><a class="dropdown-item" href="./member/UserInfo.jsp">
								<button class="btn btn-outline-dark" type="button">
		                        <i class="bi bi-file-person-fill"></i>	
        	                 	   회원정보&nbsp;</button></a>
							</li>
							  <li><a class="dropdown-item" href="member/buyInfo.jsp">
								<button class="btn btn-outline-dark" type="button">
		                        <i class="bi bi-bag-check-fill"></i>	
        	                 	   구매정보&nbsp;</button></a>
							</li>
                                &nbsp;&nbsp;&nbsp;<button class="btn btn-outline-dark" type="button" onclick="logout()">
                        			<i class="bi bi-file-person-fill"></i>	  
            		              로그아웃&nbsp;
	                	        </button>
    	                	    </a>
        	               	  </li>
                            </ul>
                            </li>
	               	 	</div>
	                    
	               	   <%
	                      }else{ // 관리자일 경우
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
                        			상품목록&nbsp;
	                	        </button>
    	                	    </a>
        	               	  </li>
                                <li><a class="dropdown-item" href="./member/management.jsp">
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
                    <p class="lead fw-normal text-white-50 mb-0">All Items in the World</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <%
			ProductDBBean db = ProductDBBean.getInstance();
			ArrayList<ProductBean> productList = db.listProduct();
			String pro_name="", pro_code="", pro_description="", pro_img="";
			int pro_num=0, pro_stock=0, pro_price=0;
			//String path = request.getServletContext().getRealPath("productImg");
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
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${pageContext.request.contextPath}/productImg/<%= pro_img %>" width="550" height="200"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%= pro_name %></h5>
                                    <!-- Product price-->
                                     \<%= format.format(pro_price) %>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="./product/productPage.jsp?pro_num=<%= pro_num%>">View options</a></div>
                            </div>
                        </div>
                     </div>
                  <%
				}
			   	  %>
       		 	</div>
       		 </div>
        </section> 
        
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
