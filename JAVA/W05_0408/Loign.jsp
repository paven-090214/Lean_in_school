<%@ page import="java.util.Collection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인</h2><hr />
	<form action="SelProduct.jsp" method="post">
		아이디 : <input type="text" name="id"><br />
		비밀번호 : <input type="password" name="pw"><br />
		<input type="submit" value="로그인"><input type="reset" value="리셋">
	</form>
</body>
</html>