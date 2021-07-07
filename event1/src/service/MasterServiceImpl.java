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
	
	
/*	��縮�� �ۼ��ϱ� action		*/
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

	
/*	��縮�� �����ϱ�	*/
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


	public int modifyAction(int hidx, String file, String cata, String hloca, String startdate, String enddate, String price, String people, String target, String staff, String company, String title, String content) {
		
		System.out.println("�����ϱ� ���� �޼ҵ� �Դϴ�.");
		
		int value=0;
		
		String sql = "update EVE_REVIEW "
				+ "set hname=?, "
				+ "hdate=?, "
				+ "hcata=?, "
				+ "hprice=?, "
				+ "htarget=?, "
				+ "hloca=?, "
				+ "hpeople=?, "
				+ "htext=?, "
				+ "himg=?, "
				+ "henddate=?, "
				+ "hcompany=?, "
				+ "hstaff=? "
				+ "where hidx=?";

		System.out.println("sql : "+sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, startdate);
			pstmt.setString(3, cata);
			pstmt.setString(4, price);
			pstmt.setString(5, target);
			pstmt.setString(6, hloca);
			pstmt.setString(7, people);
			pstmt.setString(8, content);
			pstmt.setString(9, file);
			pstmt.setString(10, enddate);
			pstmt.setString(11, company);
			pstmt.setString(12, staff);
			pstmt.setInt(13, hidx);
			value = pstmt.executeUpdate();
			
			System.out.println("value�� ? "+value);
			
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
		System.out.println("value��??! "+value);
		return value;
	}
	

}
