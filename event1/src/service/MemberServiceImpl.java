package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import dbconn.DBconn;
import vo.EvMemberVo;

public class MemberServiceImpl {
	
	private PreparedStatement pstmt;
	private Connection conn;
	
	/* dao�� ȣ���Ҷ� �����ڸ� ���ؼ� DBconn�� ��ü�� ��Ű�� dbconn���� getConnerction()�� ȣ���Ѵ�.*/
	public MemberServiceImpl() {
			DBconn dbconn = new DBconn();	
		   this.conn = dbconn.getConnection();
	}
	
	/*
	 * 		�α��� üũ Dao
	 * */
	public int memberLoginCheck(String memberId, String memberPwd){
		int midx=0;
		MemberServiceImpl msi = new MemberServiceImpl();
		
		
		String sql ="select midx"
				+ " from EVE_MEMBER where memberId=? and memberPwd=?";
		System.out.println("conn "+conn);
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				midx = rs.getInt("midx");
			}			
				
			} catch (SQLException e) {			
				e.printStackTrace();
			}		
		
		return midx;
	}

	
	/* ���̵� ã�� ��ư Ŭ���� �޼ҵ� (Ȳ��ȣ) */
	public String findId(String name, String phone) {
		
		System.out.println("MemberServiceImpl findId() ����");
		
		String id="";
		
		ResultSet rs=null;
		EvMemberVo mv = null;
		String sql = "select * from EVE_MEMBER where mname=? and mphn=?";	
		
		System.out.println("sql");
		System.out.println("conn"+conn);
		try {	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,phone);
			rs = pstmt.executeQuery();
			
			/*ResultSet�� if���� ���ؼ� next�� �����ϸ� �ްڴ�! �� ������Ѵ�.*/
			if (rs.next()) {
				mv = new EvMemberVo();	
				mv.setMemberId(rs.getString("mid"));
				id = mv.getMemberId();
				System.out.println("*******rs.getString(mid)"+rs.getString("mid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				pstmt.close();										
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}				
		}
		
		return id;
	}

}
