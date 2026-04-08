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
%>
	<h2><%=session.getAttribute("userId") %>님의 계산 목록</h2><hr />
	<%
	ArrayList<String> checkList = (ArrayList<String>)session.getAttribute("productList");
	if(checkList == null){
		out.print("주문 목록이 비어있습니다.");
	}
	else{
		for(int i = 0; i < checkList.size(); i++){
			out.println(checkList.get(i));
		}
	}
	%>
</body>
</html>