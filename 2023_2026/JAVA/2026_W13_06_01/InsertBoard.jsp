<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="brd" class="univ.BoardEntity" scope="page" />
	<jsp:useBean id="brddb" class="univ.BoardDataBase" scope="page" />
	
	<jsp:setProperty name="brd" property="name" />
	<jsp:setProperty name="brd" property="title" />
	<jsp:setProperty name="brd" property="email" />
	<jsp:setProperty name="brd" property="content" />
	<jsp:setProperty name="brd" property="passwd" />
	
	<%
	    boolean success = brddb.insertDB(brd);
	
	    if (success) {
	        out.println("<script>");
	        out.println("alert('입력성공 이름: " + brd.getName() + "');");
	        out.println("location.href = 'listBoard.jsp';");
	        out.println("</script>");
	    } else {
	        out.println("<script>");
	        out.println("alert('입력 실패했습니다.');");
	        out.println("history.back();");
	        out.println("</script>");
	    }
	%>
</body>
</html>