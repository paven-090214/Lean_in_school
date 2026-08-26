package common;
import java.sql.*;
import java.util.*;

public class BoardDataBase {
	private String DRIVER = "com.mysql.cj.jdbc.Driver";
	private String URL = "jdbc:mysql://localhost:3306/jsp_db";
	private String USER = "root";
	private String PASS = "02140607";
	Connection con = null;
	PreparedStatement pstmt = null;
	
	public BoardDataBase() {
		try {
			Class.forName(DRIVER);
			System.out.print("드라이버 연결 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.print("드라이버 연결 실패");
		}
	}
	
	public void connection() {
		try {
			con = DriverManager.getConnection(URL, USER, PASS);
			System.out.print("connection 연결 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.print("connection 연결 실패");
		}
		
	}
	
	public void disConnection() {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			
			if (con != null) {
				con.close();
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardEntity> getBoardResult() {
		connection();
		ArrayList<BoardEntity> boardEntity = new ArrayList<BoardEntity>();
		try {
			String SQL = "SELECT * FROM board";
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardEntity brd = new BoardEntity();
				brd.setBrd_id(rs.getInt(1));
				brd.setTitle(rs.getString(2));
				brd.setContent(rs.getString(3));
				brd.setId(rs.getString(4));
				brd.setRegdata(rs.getString(5));
				boardEntity.add(brd);
			}
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.print("boardList 불러오지 못함");
		}
		disConnection();
		return boardEntity;
	}
	
	public BoardEntity getSelectBoard(int board_id) {
		connection();
		BoardEntity board = new BoardEntity();
		try {
			String SQL = "SELECT * FROM board WHERE brd_id = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, board_id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				board.setId(rs.getString(4));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
			}
			rs.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		disConnection();
		return board;
	}
	
	public boolean getInsert(BoardEntity board) {
		connection();
		String SQL = "INSERT INTO board (title, content, id) VALUES (?, ?, ?)";
		boolean success = false;
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getId());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				success = true;				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		disConnection();
		return success;
	}
	
	public boolean getUpdate(BoardEntity board) {
		connection();
		boolean success = false;
		String SQL = "UPDATE board SET id=?, title=?, content=? WHERE brd_id=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getBrd_id());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				success = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		disConnection();
		return success;
	}
	
	public boolean getRemove(BoardEntity board) {
		String SQL = "DELETE FROM board WHERE brd_id=?";
		connection();
		boolean success = false;
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, board.getBrd_id());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				success = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		disConnection();
		return success;
	}
	
}
