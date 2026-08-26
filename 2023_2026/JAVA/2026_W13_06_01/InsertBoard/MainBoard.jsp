<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.BoardEntity" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 40px;
        color: #333;
    }

    .board-container {
        width: 800px;
        margin: 0 auto;
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #222;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th {
        background-color: #4a90e2;
        color: white;
        padding: 12px;
        font-size: 15px;
    }

    td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    tbody tr:hover {
        background-color: #f0f6ff;
    }

    .title {
        text-align: left;
    }

    .count {
        margin-top: 20px;
        text-align: right;
        font-size: 15px;
        color: #555;
    }

    .empty {
        text-align: center;
        padding: 30px;
        color: #777;
    }
</style>
</head>

<body>
    <jsp:useBean id="selectQuery" class="common.BoardDataBase" scope="page" />

    <%
        ArrayList<BoardEntity> boardList = selectQuery.getSelectAll();
        int count = boardList.size();
    %>

    <div class="board-container">
        <h2>게시글 목록</h2>

        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>글쓴이</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
            </thead>

            <tbody>
                <%
                    if (boardList.size() == 0) {
                %>
                    <tr>
                        <td colspan="4" class="empty">등록된 게시글이 없습니다.</td>
                    </tr>
                <%
                    } else {
                        for (BoardEntity brd : boardList) {
                %>
                    <tr>
                        <td><a href="EditBoard.jsp?id=<%= brd.getId() %>"><%= brd.getId() %></a></td>
                        <td><%= brd.getName() %></td>
                        <td class="title"><%= brd.getTitle() %></td>
                        <td><%= brd.getRegdate() %></td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
		<div>
			<button onClick="location.href='EditBoard.jsp'">글쓰기</button>
		</div>
        <div class="count">
            총 <strong><%= count %></strong>개의 게시글이 있습니다.
        </div>
    </div>
</body>
</html>