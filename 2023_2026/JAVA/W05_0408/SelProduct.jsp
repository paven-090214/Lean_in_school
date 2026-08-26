<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	session.setAttribute("userId", request.getParameter("id"));
%>
<body>
	<h2><%=session.getAttribute("userId") %>님, 환영합니다.</h2><hr />
	<form action="AddCart.jsp" method="post">
		<select name="product">
			<option>사과</option>
			<option>귤</option>
			<option>복숭아</option>
			<option>포도</option>
			<option>수박</option>
		</select>
		<input type="submit" value="추가">
	</form>
	<a href="CheckOut.jsp">계산</a>
</body>
</html>