<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="student" class="javaBean.StudentBean" scope="page" />
	<jsp:setProperty property="*" name="student" />
	<h2>학생 정보 출력</h2>
	학생 ID : <jsp:getProperty name="student" property="id" /><br>
	학생 이름 : <jsp:getProperty name="student" property="name" /><br>
	학생 번호 : <jsp:getProperty name="student" property="stdNum" /><br>
	나이(생년) : <%=student.getAge() %>(<jsp:getProperty name="student" property="years" />)<br>
	암호 : <jsp:getProperty name="student" property="pw" /><br>
	메일 : <jsp:getProperty name="student" property="email" /><br>
</body>
</html>