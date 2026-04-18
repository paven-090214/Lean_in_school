<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" class="JavaBean.UserBean" scope="session" />
	<h1><%=user.getName()%>님의 주문 목록</h1><hr>
	<ul>
		<%
			ArrayList<String> UserResult = (ArrayList<String>)session.getAttribute("result");
			if (UserResult != null) {
				for (int i = 0; i < UserResult.size(); i++){
					%>
					<li>
						<%
						out.println(UserResult.get(i));
						%>
					</li>
				<%}
			}
		%>
	</ul>
</body>
</html>