<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String gameName = request.getParameter("games");
		ArrayList<String> gameList = (ArrayList<String>)session.getAttribute("productList");
		if (gameList == null) {
			gameList = new ArrayList<String>();
			session.setAttribute("productList", gameList);
		}
		gameList.add(gameName);
	%>
	<script>
	alert("<%= gameName %>를 추가했습니다.");
	history.go(-1);
	</script>
</body>
</html>