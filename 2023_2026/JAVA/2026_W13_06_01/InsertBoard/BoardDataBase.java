package common;
import java.sql.*;
import java.util.*;

public class BoardDataBase {
	private String URL = "jdbc:mysql://localhost/univdb";
	private String USER = "root";
	private String PASS = "dongyang";
	private String CLASS = "com.mysql.cj.jdbc.Driver";
	
	ArrayList<BoardEntity> boardList = new ArrayList<BoardEntity>();
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	public BoardDataBase() {
		try {
			Class.forName(CLASS);
			System.out.println("드라이버 로드 성공");
		} catch(Exception  e){
			e.printStackTrace();
			System.out.println("mysql연결 실패");
		}
	}
	
	public void createPstmt() {
		try {
			con = DriverManager.getConnection(URL, USER, PASS);
			System.out.println("con 연결");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("con 실패");
		}
	}
	
	public ArrayList<BoardEntity> getSelectAll() {
		createPstmt();
		String SQL = "SELECT * FROM board";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardEntity brd = new BoardEntity();
				brd.setId(rs.getInt("id"));
				brd.setName(rs.getString("name"));
				brd.setPasswd(rs.getString("passwd"));
				brd.setTitle(rs.getString("title"));
				brd.setContent(rs.getString("content"));
				brd.setRegdate(rs.getString("regdate"));
				boardList.add(brd);
			}
		} catch(Exception e) {
			System.out.println("쿼리 실행 오류");
			e.printStackTrace();
		}
		return boardList;
	}
	
	public BoardEntity getSelect(int id) {
		BoardEntity brd = new BoardEntity();
		createPstmt();
		String SQL = "SELECT * FROM board WHERE id = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				brd.setId(rs.getInt("id"));
				brd.setName(rs.getString("name"));
				brd.setTitle(rs.getString("title"));
				brd.setContent(rs.getString("content"));
				brd.setPasswd(rs.getString("passwd"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return brd;
	}
	
	public boolean getSaveBoard(BoardEntity brd) {
		createPstmt();
		
		try {
			if (brd.getId() == 0) {
				String SQL = "INSERT INTO board (name, passwd, title, regdate, content) VALUES (?, ?, ?, NOW(), ?)";
				pstmt = con.prepareStatement(SQL);
				
				pstmt.setString(1, brd.getName());
				pstmt.setString(2, brd.getPasswd());
				pstmt.setString(3, brd.getTitle());
				pstmt.setString(4, brd.getContent());
				
				pstmt.executeUpdate();
			}
			return true;
			
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
