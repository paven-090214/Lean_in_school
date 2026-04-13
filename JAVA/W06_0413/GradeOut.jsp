<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>20230882_안수환 / W06_0413</h2><hr />
	<jsp:useBean id="std" class="javaBean.GradeBean" scope="page" />
	<jsp:setProperty name="std" property="name" />
	<jsp:setProperty name="std" property="point" />
	
	
	이름 : <jsp:getProperty name="std" property="name" /><br />
	점수 : <jsp:getProperty name="std" property="point" /><br />
	학점 : <jsp:getProperty name="std" property="grade" />
</body>
</html>