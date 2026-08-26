<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.BoardEntity" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성/수정</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        padding: 0;
        font-family: Arial, "맑은 고딕", sans-serif;
        background-color: #f4f6f8;
        color: #333;
    }

    .container {
        width: 700px;
        margin: 60px auto;
        background-color: white;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.12);
    }

    .page-title {
        font-size: 28px;
        margin-bottom: 10px;
        color: #222;
    }

    .sub-title {
        font-size: 14px;
        color: #777;
        margin-bottom: 30px;
    }

    .form-group {
        margin-bottom: 22px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #444;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 12px 14px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
        outline: none;
    }

    input[type="text"]:focus,
    textarea:focus {
        border-color: #2f80ed;
        box-shadow: 0 0 0 3px rgba(47, 128, 237, 0.15);
    }

    textarea {
        height: 220px;
        resize: none;
        line-height: 1.5;
    }

    .btn-area {
        display: flex;
        justify-content: space-between;
        margin-top: 30px;
    }

    .btn {
        border: none;
        padding: 11px 22px;
        border-radius: 8px;
        font-size: 15px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
    }

    .submit-btn {
        background-color: #2f80ed;
        color: white;
    }

    .submit-btn:hover {
        background-color: #1c65c9;
    }

    .back-btn {
        background-color: #e0e0e0;
        color: #333;
    }

    .back-btn:hover {
        background-color: #cfcfcf;
    }
</style>

</head>
<body>

<jsp:useBean id="selectBoard" class="common.BoardDataBase" scope="page" />
<script src="MovePage.js"></script>
<%
    String brd_id = request.getParameter("brd_id");

    String brd_role = "작성";
    String id = "";
	String content = "";
	String title = "";
    BoardEntity board = new BoardEntity();
    String actionPage = "InsertBoard.jsp";
    
    if (brd_id != null && !brd_id.trim().equals("")) {
        brd_role = "수정";
        board = selectBoard.getSelectBoard(Integer.parseInt(brd_id));
        id = board.getId();
        content = board.getContent();
        title = board.getTitle();
        actionPage = "UpdateBoard.jsp";
    }
%>

<div class="container">
    <h1 class="page-title">게시판 <%= brd_role %></h1>
    <p class="sub-title">게시글의 제목과 내용을 입력하세요.</p>

    <form method="post" name="editForm">
        
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" placeholder="작성자 아이디를 입력하세요" value="<%=id %>">
        </div>

        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" placeholder="제목을 입력하세요" value="<%= title %>">
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" placeholder="내용을 입력하세요"><%= content %></textarea>
        </div>

        <div class="btn-area">
            <a href="BoardList.jsp" class="btn back-btn">목록으로</a>
	        <%
	            if (brd_id != null) {
	        %>
            	<button class="btn submit-btn" name="brd_id" value="<%=brd_id %>"onclick="MovePage('RemoveBoard.jsp')">삭제</button>
	        <%
	            }
	        %>
            <button class="btn submit-btn" name ="brd_id" value="<%=brd_id %>" onclick="MovePage('<%=actionPage %>')"><%= brd_role %></button>
        </div>
    </form>
</div>

</body>
</html>
