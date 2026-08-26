<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 기본 예제 : 게시 목록 표시</title>
</head>
<body>
<h2>게시판 목록 표시 프로그램 </h2>
<hr>
<center>

	<%@ page import="univ.BoardEntity" %>
	<jsp:useBean id="user_board" class="univ.BoardDataBase" scope="page" />
	<% 
		//게시 목록을 위한 배열리스트를 자바진즈를 이용하여 확보 
		 ArrayList<BoardEntity> list = user_board.getBoardList();
	   	int counter = list.size();
	   	int row = 0;
	   	
	   	if (counter > 0) {
	%>
    <table width=800 border=0 cellpadding=1 cellspacing=3>
    
    <tr>
       <th><font color=blue><b>번호</b></font></th>
       <th><font color=blue><b>제목</b></font></th>
       <th><font color=blue><b>작성자</b></font></th>
       <th><font color=blue><b>작성일</b></font></th>
       <th><font color=blue><b>전자메일</b></font></th>
    </tr>
	<%
		// for문 이용  
		for (BoardEntity brd : list) {
			String color = (row % 2 == 0) ? "#FFFFFF" : "#EEEEEE";
			row++;
	%>
    <tr bgcolor=<%=color %> 
		onmouseover="this.style.backgroundColor='SkyBlue'"
    	        onmouseout="this.style.backgroundColor='<%=color %>'">
		<!-- 수정과 삭제를 위한 링크로 id를 전송 -->
       <td align=center><a href="EditBoard.jsp?id=<%= brd.getId()%>"><%= brd.getId()%></a></td>
       <td align=left><%= brd.getTitle() %></td>
       <td align=center><%= brd.getName() %></td>
		
       <td align=center><%= (brd.getRegdate()) %></td>
       <td align=center><%= brd.getEmail() %></td>
    </tr>
	<%
	    }
	%>
	</table>
<% 	
	}
%>
<hr width=90%>
<p>조회된 게시판 목록 수가 <%=counter%>개 입니다.
</center><hr>
<center>
<form name=form method=post action=EditBoard.jsp>
      <input type=submit value="게시등록"> 
</form>
</center>
</body>
</html>