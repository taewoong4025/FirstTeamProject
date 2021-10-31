function check_ok1(){
	if(document.productform1.pro_name.value.length == 0){
		alert("제품이름을 입력해주세요.");
		productform1.pro_name.focus();
		return;
	}
	if(document.productform1.pro_code.value.length == 0){
		alert("제품코드를 입력해주세요.");
		productform1.pro_code.focus();
		return;
	}

	if(productform1.pro_stock.value.length == 0 || isNaN(productform1.pro_stock.value)){
		alert("제품 재고가 얼마 남았는지 입력해주세요.(숫자만)");
		productform1.pro_stock.focus();
		return;
	}
	if(productform1.pro_price.value.length == 0 || isNaN(productform1.pro_price.value)){
		alert("제품 가격을 입력해주세요.(숫자만)");
		productform1.pro_price.focus();
		return;
	}
	if(document.productform1.pro_description.value.length == 0){
		alert("제품설명을 입력해주세요.");
		productform1.pro_description.focus();
		return;
	}
	
	document.productform1.submit();
}

function cart_check() {
	if(document.addCartForm.cart_stock.value <= 0){
		alert("제품수량을 입력해주세요.")
		addCartForm.cart_stock.focus();
		return;
	}
	document.addCartForm.submit();
	
}
