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
	
	/* dao를 호출할때 생성자를 통해서 DBconn을 객체와 시키고 dbconn안의 getConnection()을 호출한다.*/
	public MemberServiceImpl() {
			DBconn dbconn = new DBconn();	
		   this.conn = dbconn.getConnection();
	}
	
	/*
	 * 		로그인 클릭시 체크 Dao 매소드
	 * 		아이디 비밀번호 sql에서 확인 하는 dao
	 * 
	 * */
	public int memberLoginCheck(String memberId, String memberPwd){
		int midx=0;
	//	MemberServiceImpl msi = new MemberServiceImpl();
		
		String sql ="select midx from EVE_MEMBER where mId=? and mPwd=?";
		System.out.println("conn "+conn);
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
		
		System.out.println("MemberServiceImpl findId() 실행");
		
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
			
			/*ResultSet은 if문을 통해서 next가 존재하면 받겠다! 를 해줘야한다.*/
			if (rs.next()) {
				mv = new EvMemberVo();	
				mv.setmId(rs.getString("mid"));
				id = mv.getmId();
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
