<%@page import="java.text.DecimalFormat"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
DecimalFormat format = new DecimalFormat("###,###.##");
String sessionID = (String) session.getAttribute("sessionID");
MemberDBBean manager = MemberDBBean.getInstance();
MemberBean member = manager.getMember(sessionID);
int pro_num = Integer.parseInt(request.getParameter("pro_num"));
ProductDBBean db = ProductDBBean.getInstance();
ProductBean product = db.getProduct(pro_num);

String pro_img = product.getPro_img();
%>

<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script type="text/javascript" src="product.js" charset="utf-8" ></script>
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="../index.jsp">Gear Shop</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#!">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">상품</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">상품리뷰</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">Popular Items</a></li>
							<li><a class="dropdown-item" href="#!">New Arrivals</a></li>

						</ul></li>
				</ul>

				<form class="d-flex">
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href='../product/cart.jsp' ">
						<i class="bi-cart-fill me-1"></i> 장바구니 <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>

					</button>

					&nbsp;&nbsp;
					<script type="text/javascript">
						function logout() {
							location.href = "../member/logout.jsp";
						}
					</script>

					<%
					if (sessionID == null) { // 로그인이 안되었을 때
					%>
					<!-- login -->
					<button class="btn btn-outline-dark" type="button"
						onclick="location.href='member/login.html'">
						<i class="bi bi-file-person-fill"></i> login&nbsp;
					</button>

					<%
					} else if (member.getUser_level() != 9 && sessionID != null) { //로그인했을 때 관리자가 아닌 경우
					%>
					<div class="btn btn-outline-dark">
						<li class="nav-item dropdown" style="list-style: none;"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi-menu-up me-1"></i>Menu
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li style="text-align: center"><b><%=sessionID%>님, Hi~
								</b></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item" href="#!">
										<button class="btn btn-outline-dark" type="button"
											onclick="logout()">
											<i class="bi bi-file-person-fill"></i> 로그아웃&nbsp;
										</button>
								</a></li>
								<li><a class="dropdown-item" href="./member/UserInfo.jsp">
										<button class="btn btn-outline-dark" type="button">
											<i class="bi bi-file-person-fill"></i> 회원정보&nbsp;
										</button>
								</a></li>
							</ul></li>
					</div>

					<%
					} else { // 관리자일 경우
					%>
					<div class="btn btn-outline-dark">
						<li class="nav-item dropdown" style="list-style: none;"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi-menu-up me-1"></i>Menu
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li style="text-align: center"><b><%=sessionID%></b></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item" href="#!">
										<button class="btn btn-outline-dark" type="button"
											onclick="location.href='productView.jsp'">
											<i class="bi bi-bag-plus"></i> 상품등록&nbsp;
										</button>
								</a></li>
								<li><a class="dropdown-item" href="#">
										<button class="btn btn-outline-dark" type="button">
											<i class="bi bi-file-person-fill"></i> 회원관리&nbsp;
										</button>
								</a></li>
								<li><a class="dropdown-item" href="#">
										<button class="btn btn-outline-dark" type="button"
											onclick="logout()">
											<i class="bi bi-file-person-fill"></i> 로그아웃&nbsp;
										</button>
								</a></li>
							</ul></li>
					</div>
					<%
					}
					%>
				</form>
			</div>
		</div>
	</nav>
	<!-- Product section-->

	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="${pageContext.request.contextPath}/productImg/<%= pro_img %>"
						width="600" height="700" alt="..." />
				</div>
				<div class="col-md-6">
					<!-- 제품 코드 가져오기. -->
					<div class="small mb-1">
						<%=product.getPro_code()%></div>
					<!-- 제품명 가져 오기. -->
					<h1 class="display-5 fw-bolder"><%=product.getPro_name()%></h1>
					<div class="fs-5 mb-5">
						<span><b>\</b><%=format.format(product.getPro_price())%></span><br>
						<span><b>재고량 : </b><%=format.format(product.getPro_stock())%>개</span>
					</div>
					<!-- 제품 설명 -->
					<p class="lead"><%=product.getPro_description()%></p>

					<!-- 제품 번호와 구매수량을 addCartForm에 넘겨 데이터베이스 처리하기 -->
					<form name="addCartForm" action="../product/addCart.jsp" method="post">
						<div class="d-flex">
							<input type="hidden" name="pro_num"
								value="<%=product.getPro_num()%>"> <input
								class="form-control text-center me-3" name="cart_stock"
								type="number" value="1" style="max-width: 6rem" min="1" max="<%= product.getPro_stock() %>"/>
							<button class="btn btn-outline-dark flex-shrink-0" type="button"
								onclick="cart_check()">
								<i class="bi-cart-fill me-1"></i> 장바구니
							</button>
							&nbsp; &nbsp;
							<button class="btn btn-outline-dark flex-shrink-0" type="button"
								onclick="location.href='./cart.jsp'">
								<i class="bi-bucket-fill me-1"></i> 구매
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Popular items section-->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">Popular products</h2>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<%
				ProductDBBean db2 = ProductDBBean.getInstance();
				ArrayList<ProductBean> productList = db2.rankProduct();
				String pro_name = "", pro_code = "", pro_description = "", pro_img2 = "";
				int pro_num2 = 0, pro_stock = 0, pro_price = 0;
				int pro_count = 0;
				if (productList.size() < 5) {
					for (int i = 0; i < productList.size(); i++) {
						ProductBean product2 = productList.get(i);
						pro_num2 = product2.getPro_num();
						if (pro_num != pro_num2) {
					pro_name = product2.getPro_name();
					pro_code = product2.getPro_code();
					pro_stock = product2.getPro_stock();
					pro_price = product2.getPro_price();
					pro_description = product2.getPro_description();
					pro_img2 = product2.getPro_img();
				%>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/productImg/<%= pro_img2 %>"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=pro_name%></h5>
								<!-- Product price-->
								<b>\</b><%=format.format(pro_price)%>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="productPage.jsp?pro_num=<%=pro_num2%>">View options</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}

				}
				} else {
				for (int i = 0; i < 4; i++) {
				ProductBean product2 = productList.get(i);
				pro_num2 = product2.getPro_num();
				if (pro_num != pro_num2) {
				pro_name = product2.getPro_name();
				pro_code = product2.getPro_code();
				pro_stock = product2.getPro_stock();
				pro_price = product2.getPro_price();
				pro_description = product2.getPro_description();
				pro_img2 = product2.getPro_img();
				pro_count += 1;
				%>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/productImg/<%= pro_img2 %>"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=pro_name%></h5>
								<!-- Product price-->
								<b>\</b><%=format.format(pro_price)%>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="productPage.jsp?pro_num=<%=pro_num2%>">View options</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				}
				if (pro_count < 4) {
				ProductBean product2 = productList.get(4);
				pro_num2 = product2.getPro_num();
				pro_name = product2.getPro_name();
				pro_code = product2.getPro_code();
				pro_stock = product2.getPro_stock();
				pro_price = product2.getPro_price();
				pro_description = product2.getPro_description();
				pro_img2 = product2.getPro_img();
				%>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/productImg/<%= pro_img2 %>"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=pro_name%></h5>
								<!-- Product price-->
								<b>\</b><%=format.format(pro_price)%>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="productPage.jsp?pro_num=<%=pro_num2%>" target="_self">View
									options</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}

				}
				%>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
