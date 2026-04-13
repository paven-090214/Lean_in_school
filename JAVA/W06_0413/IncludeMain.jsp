<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String OuterPath = "./OuterPage.jsp";
%>
<html>
<head>
<%
	request.setAttribute("name_1", "안수환");
	pageContext.setAttribute("name_2", "안수환");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>20230882_안수환 / 4월 13일</h2>
	<jsp:include page="./OuterPage.jsp" />
	<jsp:include page="<%=OuterPath %>" />
</body>
</html>