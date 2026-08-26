<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 1. 여기서 자바스크립크 파일 movePage.js을 불러옵니다.폼의 각 입력 값 검토와 각 page로 이동시키는 함수 구현 -->  
	<script language=JavaScript src="MovePage.js"></script>
	<title>게시판 기본 예제 : 게시 폼 작성</title>
</head>
	
<body>

<%@ page import="univ.*" %>
<%
		String name = ""; 
		String email = ""; 
		String title = ""; 
		String content = ""; 
		String headline = "등록";
		
		String id = request.getParameter("id");
		
%>

<h2>게시판 <%=headline %> 프로그램 </h2> <hr>
  
 <center>
 
 <form name="boardForm" method="post">

<table width=100% border=0 cellspacing=0 cellpadding=7>
 <tr><td align=center>

   <table border=0>
	<tr> <td colspan=2>
		<table>
		    <tr>
		     <td width=50>이 름 : </td>
		     <td width=100>
				<input type=text name=name value="<%=name%>" size=30 maxlength=20></td>
		     <td width=80>전자메일 :</td>
		     <td width=100>
				<input type=text name=email size=30 value="<%=email%>" maxlength=30></td>
		    </tr>	
			<tr >
		     <td width=50>제 목 : </td>
		     <td colspan=3>
				<input type=text name=title size=80 value="<%=title%>" maxlength=100></td>
			</tr>
		</table>
	</td> </tr>

    <tr><td colspan=2>
			<textarea name=content rows=10 cols=90><%=content%></textarea></td></tr>
	<tr>
     <td colspan=2>비밀번호 :
	     <input type=password name=passwd size=20 maxlength=15><font color=red>  
         	현재 게시 내용을 수정 또는 삭제하려면 이미 등록한 비밀번호가 필요합니다.</font></td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=2></td>
    </tr>
	<tr>
     <td colspan=2>
		<% if (id == null) { %>
			<input type="button" value="등록" onClick="MovePage('InsertBoard.jsp')" />
			<%
			}
			else {
			%>
			<input type="button" value="수정완료" onClick="MovePage('UpdateBoard.jsp')" />
			<input type="button" value="삭제" onClick="MovePage('DeleteBoard.jsp')" />
		<%
		}
		%>
			
		<!-- 목록보기 버튼은 listBoard.jsp로 이동 -->
		<input type=button value="목록보기" onClick="location.href='listBoard.jsp'"> 
      	<input type=reset value="취소"> 
	 </td>
    </tr> 
   </table>
  </td></tr>
</table>

</form>
</center>
</body>
</html>