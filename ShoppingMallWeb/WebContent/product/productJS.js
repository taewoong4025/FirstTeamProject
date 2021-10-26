function check_ok(){
	if(productform.pro_num.value.length == 0 || isNaN(productform.pro_num.value)){
		alert("제품 번호를 입력해주세요.(숫자만)");
		productform.pro_num.focus();
		return;
	}
	
	if(document.productform.pro_name.value.length == 0){
		alert("제품이름을 입력해주세요.");
		productform.pro_name.focus();
		return;
	}
	if(document.productform.pro_code.value.length == 0){
		alert("제품코드를 입력해주세요.");
		productform.pro_code.focus();
		return;
	}

	if(productform.pro_stock.value.length == 0 || isNaN(productform.pro_stock.value)){
		alert("제품 재고가 얼마 남았는지 입력해주세요.(숫자만)");
		productform.pro_stock.focus();
		return;
	}
	if(productform.pro_price.value.length == 0 || isNaN(productform.pro_price.value)){
		alert("제품 가격을 입력해주세요.(숫자만)");
		productform.pro_price.focus();
		return;
	}
	if(document.productform.pro_description.value.length == 0){
		alert("제품설명을 입력해주세요.");
		productform.pro_description.focus();
		return;
	}
	if(document.productform.pro_img.value.length == 0){
		alert("제품사진을 선택해주세요.");
		productform.pro_img.focus();
		return;
	}
	document.productform.submit();
}


function check_ok1(){
	if(productform1.pro_num.value.length == 0 || isNaN(productform1.pro_num.value)){
		alert("제품 번호를 입력해주세요.(숫자만)");
		productform1.pro_num.focus();
		return;
	}
	
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

