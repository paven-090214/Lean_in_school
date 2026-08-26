<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.BoardEntity" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>

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
        width: 900px;
        margin: 60px auto;
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .page-title {
        font-size: 28px;
        margin-bottom: 10px;
        color: #222;
    }

    .sub-title {
        color: #777;
        margin-bottom: 25px;
        font-size: 14px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    thead {
        background-color: #2f80ed;
        color: white;
    }

    th, td {
        padding: 14px 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        font-weight: bold;
        font-size: 15px;
    }

    td {
        font-size: 14px;
    }

    tbody tr:hover {
        background-color: #f1f7ff;
    }

    .title {
        text-align: left;
        font-weight: bold;
        color: #333;
    }

    .empty {
        padding: 40px;
        text-align: center;
        color: #777;
        font-size: 18px;
    }

    .btn-area {
        margin-top: 25px;
        text-align: right;
    }

    .write-btn {
        display: inline-block;
        padding: 10px 18px;
        background-color: #2f80ed;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-size: 14px;
    }

    .write-btn:hover {
        background-color: #1c65c9;
    }
</style>

</head>
<body>

<jsp:useBean id="brdDataBase" class="common.BoardDataBase" scope="page" />

<%
    ArrayList<BoardEntity> selectBrd = brdDataBase.getBoardResult();
    int count = selectBrd.size();
%>

<div class="container">
    <h1 class="page-title">게시판 목록</h1>
    <p class="sub-title">등록된 게시글을 확인할 수 있습니다.</p>

    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>글쓴이</th>
                <th>제목</th>
                <th>작성일</th>
            </tr>
        </thead>

        <tbody>
            <%
                if (count > 0) {
                    for (BoardEntity brd : selectBrd) {
            %>
                        <tr>
                            <td><a href="EditBoard.jsp?brd_id=<%=brd.getBrd_id() %>"><%= brd.getBrd_id() %></a></td>
                            <td><%= brd.getId() %></td>
                            <td class="title"><%= brd.getTitle() %></td>
                            <td><%= brd.getRegdata() %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="4" class="empty">
                            게시글이 없습니다.
                        </td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <div class="btn-area">
        <a href="EditBoard.jsp" class="write-btn">글쓰기</a>
    </div>
</div>

</body>
</html>