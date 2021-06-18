package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import dbconn.DBconn;
import vo.EvMemberVo;

public class MemberServiceImpl {
	
	private PreparedStatement pstmt; //������ ��� ��  ����
	private Connection conn; //�ڹٿ� ������ ���̽� ����
	private ResultSet rs; //����� �޾ƿ���
	
	/*
	 * 		�α��� Ŭ���� üũ Dao �żҵ�
	 * 	
	 * */
	public int memberLoginCheck(String memberId, String memberPwd){
		int midx=0;
		MemberServiceImpl msi = new MemberServiceImpl();
		
		String sql ="select midx"
				+ " from EVE_MEMBER where memberId=? and memberPwd=?";
		
		try {
			pstmt =conn.prepareStatement(sql); //sql ������ ���
			pstmt.setString(1, memberId); //ù��° '?' �Ű������� �޾ƿ� 'membeId'�� ����
			pstmt.setString(2, memberPwd); // �ι�° '?' �Ű������� �޾ƿ� 'memberPwd'�� ����
			ResultSet rs = pstmt.executeQuery(); //������ ������ ����� rs�� ����
			rs = pstmt.executeQuery(); //������ ������ ����� rs�� ����
			
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
		
		System.out.print("MemberServiceImpl findId() ����");
		
		String id;
		EvMemberVo mv = null;
		
		String sql = "select * from EVE_MEMBER where mname=? and mphn=?";	
		
		
		try {			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,phone);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				mv = new EvMemberVo();
				mv.setMemberName(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();										
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}				
		}
		id = mv.getMemberId();
		
		return id;
	}


}
