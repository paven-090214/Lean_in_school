<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이름과 나이 출력</h2><hr />
	<jsp:useBean id="me" class="javaBean.PersonBean" scope="page" />
	<jsp:setProperty property="*" name="me"/>
	
	이름 : <jsp:getProperty name="me" property="name" /><br>
	나이 : <jsp:getProperty name="me" property="age" /><br>
	미성년자 여부 : <jsp:getProperty name="me" property="resultAge" />
</body>
</html>