function MovePage(url) {
	const form = document.editForm;
	if (url == 'InsertBoard.jsp') {
		if (form.id.value == "") {
			alert("아이디를 입력해 주세요.");
			form.id.focus();
			return;
		}
	}
	form.action=url;
	form.submit();
}