<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="StdResult.jsp" method="post">
		<h2>학생 정보</h2>
		학생 아이디 : <input type="text" name="id" /><br />
		학생 이름 : <input type="text" name="name" /><br />
		학생 번호 : <input type="text" name="stdNum" /><br />
		학생 메일 : <input type="text" name="email" /><br />
		태어난 해 : 
		<select name="years">
			<option>2000</option>
			<option>2001</option>
			<option>2002</option>
			<option>2003</option>
			<option>2004</option>
		</select>
		<br />
		비밀번호 : <input type="password" name="pw"><br />
		<input type="submit" value="입력 완료" />
		<input type="reset" value="초기화" />
	</form>
</body>
</html>