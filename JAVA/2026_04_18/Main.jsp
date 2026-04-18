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
	<h1><jsp:getProperty name="user" property="name" />님, 안녕하세요</h1>
	<a href="UserDetail.jsp">본인 정보 확인</a>
	<hr>
	<h2>구매 가능 물품</h2>
	<form action="Cart.jsp" method="post">
		<select name="gameName">
			<option>Wuthering Waves</option>
			<option>BlueArchive</option>
			<option>Tekken 8</option>
			<option>Limbus Company</option>
			<option>The Hungry Lamb</option>
			<option>PRAGMATA</option>
		</select>
		<input type="submit" value="추가">
	</form>
	<a href="Result.jsp">계산하기</a>
</body>
</html>