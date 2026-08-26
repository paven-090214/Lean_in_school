function MovePage(targetUrl){
	if (targetUrl == 'InsertBoardProc.jsp') {
		if (form.name.value == '') {
			alert("이름을 입력해 주세요.");
			form.name.focus();
			return;
		}
		
		if (form.passwd.value == '') {
			alert("비밀번호를 입력해 주세요.");
			form.passwd.focus();
			return;
		}
		form.action = targetUrl;
		form.submit();
	}
}