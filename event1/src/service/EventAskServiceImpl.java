package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dbconn.DBconn;

public class EventAskServiceImpl {

	private PreparedStatement pstmt;
	private Connection conn;
	
	public EventAskServiceImpl(){
		
		DBconn dbconn = new DBconn();
		this.conn =dbconn.getConnection();
		
	}
	
	
	
	/*	상담글 작성하기	*/	
	public int insertAdvice(String cata, String title, String content, String fileName , String midx) {

		System.out.println("cara"+cata);
		System.out.println("title"+title);
		System.out.println("content"+content);
		System.out.println("file"+fileName);
		System.out.println("midx"+midx);
	
		int value=0;
		
	    String sql= "insert into EVE_BOARD (BIDX, BCATA, BMENU, BTITLE, BCONTENTS, BWRITEDAY, BCOUNT, BFILE, MIDX, ORIGINBIDX, DEPTH, LLEVEL)"
	               +"values(EVENTASK_SEQ.NEXTVAL , ? , '상담신청' , ? , ? , TO_CHAR(SYSDATE,'YYYY-MM-DD') , 0 , ? , ? , 0 , 0 , 0)";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cata);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, fileName);
			pstmt.setString(5, midx);

			
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
}
