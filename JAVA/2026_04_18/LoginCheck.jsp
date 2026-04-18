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
	String LoginId = request.getParameter("userId");
	String LoginPw = request.getParameter("userPw");
	String CheckId = (String)session.getAttribute("AccountId");
	String CheckPw = (String)session.getAttribute("AccountPw");
	if (LoginId != null && LoginPw != null) {
		if (LoginId.equals(CheckId) && LoginPw.equals(CheckPw)) {
			response.sendRedirect("Main.jsp");
		}
		else {
	        out.println("<script>");
	        out.println("alert('비밀번호가 일치하지 않습니다.');");
	        out.println("location.href='Login.jsp';");
	        out.println("</script>");
		}
	}
	%>
</body>
</html>