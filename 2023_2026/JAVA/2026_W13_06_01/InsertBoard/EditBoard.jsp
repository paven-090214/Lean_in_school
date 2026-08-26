<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 40px;
        color: #333;
    }

    .write-container {
        width: 600px;
        margin: 0 auto;
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
    }

    .form-group {
        margin-bottom: 18px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
    }

    input,
    textarea {
        width: 100%;
        padding: 10px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
    }

    textarea {
        height: 180px;
        resize: vertical;
    }

    .button-area {
        text-align: right;
        margin-top: 25px;
    }

    button {
        padding: 10px 18px;
        border: none;
        border-radius: 6px;
        background-color: #4a90e2;
        color: white;
        font-size: 14px;
        cursor: pointer;
    }

    button:hover {
        background-color: #357abd;
    }

    .cancel-btn {
        background-color: #999;
        margin-right: 8px;
    }

    .cancel-btn:hover {
        background-color: #777;
    }
</style>
</head>

<body>
	<jsp:useBean id="selectQuery" class="common.BoardDataBase" scope="page" />
	<%
	
	String name = "";
	String content = "";
	String passwd = "";
	String title = "";
	String headLine = "작성";
	
	String id = request.getParameter("id");
	
	if (id != null) {
		int boardId = Integer.parseInt(id);
		headLine = "수정 / 삭제";
		BoardEntity brd = selectQuery.getSelect(boardId);
		name = brd.getName();
		title = brd.getTitle();
		content = brd.getContent();
		passwd = brd.getPasswd();
	}
	
	%>

    <div class="write-container">
        <h2>게시물 <%=headLine %></h2>

        <form action="InsertBoardProc.jsp" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름을 입력하세요" value="<%= name%>">
            </div>

            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" placeholder="제목을 입력하세요" value="<%= title%>">
            </div>

            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" placeholder="내용을 입력하세요"><%=content %></textarea>
            </div>

            <div class="form-group">
                <label for="passwd">비밀번호</label>
                <input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요" value="<%= passwd%>">
            </div>

            <div class="button-area">
                <button type="button" class="cancel-btn" onclick="location.href='MainBoard.jsp'">목록</button>
                <button type="submit"><%=headLine %></button>
            </div>
        </form>
    </div>
</body>
</html>