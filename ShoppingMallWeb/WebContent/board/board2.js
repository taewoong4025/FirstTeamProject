function check_ok(){

	if(document.form.b_title.value.length==0){
		alert("제목을 입력하세요.");
		form.b_title.focus();
		return;
	}
	if(document.form.b_content.value.length==0){
		alert("내용을 입력하세요.");
		form.b_content.focus();
		return;
	}
	if(document.form.password.value.length==0){
		alert("비밀번호를 입력하세요.");
		form.password.focus();
		return;
	}
	
	
	document.form.submit();
	
}

function delete_ok(){
	if(document.form.password.value.length==0){
		alert("비밀번호를 입력하세요.");
		form.password.focus();
		return;
	}
	document.form.submit();
}
