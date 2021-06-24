package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;

public class BoardServiceImpl {
	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public BoardServiceImpl(){
		
		DBconn dbconn = new DBconn();
		this.conn =dbconn.getConnection();
		
	}
	
/*	상담글 작성하기	*/	
	public int insertAdvice(String cata, String title, String content, String file , String midx ,String hidx) {
		
		int value=0;
		
		String sql = "insert into EVE_EVENTASK(sidx , scata , stitle ,stext, sfile , midx , hidx , writeday)"
				    + "values(EVENTASK_SEQ.NEXTVAL , ? , ? , ? , ? , ? , ? ,  TO_CHAR(SYSDATE,'YYYY-MM-DD'))";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cata);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, file);
			pstmt.setString(5, midx);
			pstmt.setString(6, hidx);
			
			value=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		}
		
		
		return value; 
	}
	

/* 마이페이지에서 본인이 작성한 글 불러오기	*/
	public ArrayList selectmyboardlist() {
		
		ArrayList alistboard = new ArrayList();
		
		//작성해야함
		String sql = "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return alistboard;
	}

}
