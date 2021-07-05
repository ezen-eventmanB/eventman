package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dbconn.DBconn;

public class MasterServiceImpl {

	private PreparedStatement pstmt;
	private Connection conn;
	
	public MasterServiceImpl(){
		
		DBconn dbconn = new DBconn();
		this.conn =dbconn.getConnection();
		
	};
	
	
/*	행사리뷰 작성하기 action		*/
	public int insertReview(String title, String target, String startdate, String enddate, String price, String staff, String company, String content, String file, String cata, String loca, String people, int gidx) {
		int value = 0;
		
		String sql = "INSERT INTO EVE_REVIEW(HIDX, HDATE, HENDDATE, HPRICE, HPEOPLE, HTARGET, HSTAFF, HCOMPANY, HNAME, HTEXT, HCATA, HIMG, GIDX, HLOCA)" 
				    +"VALUES(HIDX_SEQ.NEXTVAL,TO_DATE(?,'YY-MM-DD'),TO_DATE(?,'YY-MM-DD'),?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,startdate);
			pstmt.setString(2,enddate);
			pstmt.setString(3,price);
			pstmt.setString(4,people);
			pstmt.setString(5,target);
			pstmt.setString(6,staff);
			pstmt.setString(7,company);
			pstmt.setString(8,title);
			pstmt.setString(9,content);
			pstmt.setString(10,cata);
			pstmt.setString(11,file);
			pstmt.setInt(12,gidx);
			pstmt.setString(13,loca);
			value = pstmt.executeUpdate();
			
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

	
/*	행사리뷰 삭제하기	*/
	public int reviewDelete(int hidx) {
		
		
		int value=0;
		
		String sql = "update EVE_REVIEW set hdelyn='Y' where hidx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hidx);
			value = pstmt.executeUpdate();
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
		
		System.out.println("value : "+value);
		
		return value;
	}

}
