<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	session.setAttribute("userId", request.getParameter("id"));
	%>
	<h2><%=session.getAttribute("userId") %>님, 환영합니다.</h2><hr />
	<form action="Cart.jsp" method="post">
		<select name="games">
			<option>Blue Archive</option>
			<option>Tekken 8</option>
			<option>Limbus Company</option>
			<option>Wiuthering Waves</option>
			<option>The Hungry Lamb</option>
		</select>
			<input type="submit" value="추가" />
	</form>
	<a href="Result.jsp">계산</a>
</body>
</html>