<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>안수환_20230882 / W06_0413</h2><hr />
	<h3>이름과 점수 입력</h3>
	<form action="GradeOut.jsp" method="post">
	이름 : <input type="text" name="name" /><br />
	점수 : <input type="text" name="point" /><br />
	<input type="submit" value="전송" />
	<input type="reset" value="초기화" />
	</form>
</body>
</html>