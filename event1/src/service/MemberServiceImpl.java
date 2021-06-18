package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import dbconn.DBconn;
import vo.EvMemberVo;

public class MemberServiceImpl {
	
	private PreparedStatement pstmt; //쿼리문 대기 및  설정
	private Connection conn; //자바와 데이터 베이스 연결
	private ResultSet rs; //결과값 받아오기
	
	/*
	 * 		로그인 클릭시 체크 Dao 매소드
	 * 	
	 * */
	public int memberLoginCheck(String memberId, String memberPwd){
		int midx=0;
		MemberServiceImpl msi = new MemberServiceImpl();
		
		String sql ="select midx"
				+ " from EVE_MEMBER where memberId=? and memberPwd=?";
		
		try {
			pstmt =conn.prepareStatement(sql); //sql 쿼리문 대기
			pstmt.setString(1, memberId); //첫번째 '?' 매개변수로 받아온 'membeId'를 대입
			pstmt.setString(2, memberPwd); // 두번째 '?' 매개변수로 받아온 'memberPwd'를 대입
			ResultSet rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			
			if (rs.next()) {
				midx = rs.getInt("midx");
			}			
				
			} catch (SQLException e) {			
				e.printStackTrace();
			}		
		
		return midx;
	}

	
	/* 아이디 찾기 버튼 클릭시 메소드 (황현호) */
	public String findId(String name, String phone) {
		
		System.out.print("MemberServiceImpl findId() 실행");
		
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
