<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" class="JavaBean.UserBean" scope="session" />
	<ul>
		<li>이름 : <jsp:getProperty name="user" property="name"/></li>
		<li>아이디 : <jsp:getProperty name="user" property="id"/></li>
		<li>비밀번호 : <jsp:getProperty name="user" property="pw"/></li>
		<li>메일 : <jsp:getProperty name="user" property="email"/></li>
		<li>년생 / 나이 : <jsp:getProperty name="user" property="year"/> / <%=user.getAge() %></li>
	</ul>
	<a href="Main.jsp">뒤로가기</a>
</body>
</html>