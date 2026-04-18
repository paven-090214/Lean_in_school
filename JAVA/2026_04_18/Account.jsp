<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1><hr>
<form method="post" action="AccountCheck.jsp">
    아이디 : <input type="text" name="id"><br>
    비밀번호 : <input type="password" name="pw"><br>
    비밀번호 확인 : <input type="password" name="pwCheck"><br>
    이름 : <input type="text" name="name"><br>
    생년 :
    <select name="year">
        <option>2000</option>
        <option>2001</option>
        <option>2002</option>
        <option>2003</option>
        <option>2004</option>
        <option>2005</option>
        <option>2006</option>
        <option>2007</option>
        <option>2008</option>
    </select><br>
    메일 : <input type="text" name="email"><br>
    <input type="submit" value="회원가입">
</form>
</body>
</html>