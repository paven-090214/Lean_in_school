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
	<jsp:setProperty property="id" name="user"/>
	<jsp:setProperty property="email" name="user"/>
	<jsp:setProperty property="name" name="user"/>
	<jsp:setProperty property="year" name="user"/>
	<%
	String pw_1 = request.getParameter("pw");
	String pw_2 = request.getParameter("pwCheck");
	if (pw_1 != null && pw_2 != null) {
		if (pw_1.equals(pw_2)) {
			user.setPw(pw_1);
			session.setAttribute("AccountId", request.getParameter("id"));
			session.setAttribute("AccountPw", request.getParameter("pw"));
			response.sendRedirect("Login.jsp");
		}
		else {
	        out.println("<script>");
	        out.println("alert('비밀번호가 일치하지 않습니다.');");
	        out.println("location.href='Account.jsp';");
	        out.println("</script>");
		}
	}
	%>
</body>
</html>