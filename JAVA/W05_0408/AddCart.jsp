<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<%!
int count = 0;
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String oneProduct = request.getParameter("product");
	ArrayList<String> cart = (ArrayList<String>)session.getAttribute("productList");
	if(cart == null){
		cart = new ArrayList<String>();
		session.setAttribute("productList", cart);
	}
	cart.add(oneProduct);
	count++;
	%>
	<script type="text/javascript">
		alert("<%=oneProduct %>가 추가되었습니다.")
		history.go(-1);
	</script>
</body>
</html>