<%@page import="java.text.DecimalFormat"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.product.ProductBean"%>
<%@page import="shop.product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
 <!-- header.jsp include -->
<jsp:include page="../header.jsp"></jsp:include>
	
<%
DecimalFormat format = new DecimalFormat("###,###.##");
String sessionID = (String) session.getAttribute("sessionID");
MemberDBBean manager = MemberDBBean.getInstance();
MemberBean member = manager.getMember(sessionID);
System.out.print("####$$@@@"+request.getParameter("pro_num"));
int pro_num = Integer.parseInt(request.getParameter("pro_num"));
ProductDBBean db = ProductDBBean.getInstance();
ProductBean product = db.getProduct(pro_num);

String pro_img = product.getPro_img();
%>
<script type="text/javascript" src="product.js" charset="utf-8" ></script>

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
					<form name="addCartForm" action="./addCart.jsp" method="post">
						<div class="d-flex">
							<input type="hidden" name="pro_num" value="<%=product.getPro_num()%>"> 
								<input class="form-control text-center me-3" name="cart_stock" type="number" value="1" style="max-width: 6rem" min="1" max="<%= product.getPro_stock() %>"/>
							<button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="cart_check()">
								<i class="bi-cart-fill me-1"></i> 장바구니
							</button>
							&nbsp; &nbsp;
							<button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="location.href='./cart.jsp'">
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
	<br><br><br>
 <!-- footer.jsp include -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
