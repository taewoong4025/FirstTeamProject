function check_ok(){
	if(document.register.id.value.length==0){
		alert("아이디를 써주세요");
		return;
	}
	if(document.register.id.value.length<4){
		alert("아이디는 4글자이상이어야 합니다.");
		return;
	}
	if(document.register.password.value.length==0){
		alert("패스워드는 반드시 입력해야 합니다.");
		return;
	}
	if(document.register.password.value != document.register.passwordcheck.value){
		alert("패스워드가 일치하지 않습니다.");
		return;
	}
	if(document.register.name.value.length==0){
		alert("이름을  써주세요.");
		return;
	}
	if(document.register.mail.value.length==0){
		alert("Email을  써주세요.");
		return;
	}
	document.register.submit();
}

