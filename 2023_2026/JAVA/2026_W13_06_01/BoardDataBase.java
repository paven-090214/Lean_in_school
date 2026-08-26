package univ;

import java.sql.*; 
import java.util.*; 
import javax.sql.*; 
import javax.naming.*; 

//DBCP를 이용한 테이블 board 처리 데이터베이스 연동 자바빈즈 프로그램
public class BoardDataBase {

	// 데이터베이스 연결관련 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	
	// 데이터베이스 연결 관련 상수 선언
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String DB_NAME = "univdb"; 
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/univdb"; 
	private static final String USER = "root";
	private static final String PASSWD = "dongyang";
	// 생성자 JDBC 드라이버 로드 메소드
	public BoardDataBase() {
		try {
			Class.forName(JDBC_DRIVER);
			System.out.println("driver class ok ");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	// 데이터베이스 연결 메소드 
	public void dbConnect() {
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);			
		    System.out.println("univdb 연결 ok ");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 데이터베이스 연결 헤제 메소드 
	public void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 게시판의 모든 레코드를 반환 메서드
	public ArrayList<BoardEntity> getBoardList() {
		dbConnect();
		
		ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
		
		String SQL = "select * from board";
		
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("select sql 실행 ok");
			while (rs.next()) {
				BoardEntity brd = new BoardEntity();
				brd.setId(rs.getInt("id"));
				brd.setName(rs.getString("name"));
				brd.setPasswd(rs.getString("passwd"));
				brd.setTitle(rs.getString("title"));
				brd.setEmail(rs.getString("email"));
				brd.setRegdate(rs.getString("regdate"));
				brd.setContent(rs.getString("content"));
				//리스트에 추가
				list.add(brd);
			}
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}

	// 주 키 id의 레코드를 반환하는 메서드
	public BoardEntity getBoard(int id) {
		return null;
	}
		

	// 게시물 등록 메서드
	public boolean insertDB(BoardEntity board) {
	    
	    String SQL = "INSERT INTO board (name, passwd, title, email, content) VALUES (?, ?, ?, ?, ?)";
	    boolean success = false; 
	    dbConnect();
	    
	    try {
	        pstmt = con.prepareStatement(SQL);
	        
	        pstmt.setString(1, board.getName());
	        pstmt.setString(2, board.getPasswd());
	        pstmt.setString(3, board.getTitle());
	        pstmt.setString(4, board.getEmail());
	        pstmt.setString(5, board.getContent());
	        
	        pstmt.executeUpdate();
	        success = true;
	        System.out.println("Insert ok");

	    } catch(Exception e) {
	        e.printStackTrace();
	        System.out.println("Insert err");
	    } finally {
	        disconnect();
	    }
	    
	    return success;
	}
}
	
	// 데이터 갱신을 위한 메서드
