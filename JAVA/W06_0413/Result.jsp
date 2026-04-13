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
	ArrayList<String> resultList = (ArrayList<String>)session.getAttribute("productList");
	%>
	<h2><%=session.getAttribute("userId") %>님의 목록</h2><hr />
	<%
		for(int i = 0; i < resultList.size(); i++){
			out.println((i + 1) + "번째 : " + resultList.get(i) + "<br />");
		}
	%>
</body>
</html>