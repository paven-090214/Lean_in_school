<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="boardDB" class="common.BoardDataBase" scope="page" />
	<jsp:useBean id="brdEntity" class="common.BoardEntity" scope="page" />
	
	<jsp:setProperty name="brdEntity" property="*" />
	<%
		boolean success = boardDB.getUpdate(brdEntity);
		if (success) {
		    out.println("<script>");
		    out.println("alert('수정 성공');");
		    out.println("location.href = 'BoardList.jsp';");
		    out.println("</script>");
		} else {
		    out.println("<script>");
		    out.println("alert('입력 실패');");
		    out.println("history.back();");
		    out.println("</script>");
		}
	%>
</body>
</html>