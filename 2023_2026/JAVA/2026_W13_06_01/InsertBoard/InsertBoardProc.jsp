<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="boardObject" class="common.BoardEntity" scope="page" />
	<jsp:useBean id="selectQuery" class="common.BoardDataBase" scope="page" />
	<jsp:setProperty name="boardObject" property=* />
	
	<%
	boolean success = selectQuery.getSaveBoard(boardObject);
	
	if (success) {
		out.println("<script>");
		out.println("alert('입력 성공, 이름 : "+ boardObject.getName() + "');");
		out.println("location.href = 'listBoard.jsp';");
		out.println("</script>");
	}
	%>
	
</body>
</html>