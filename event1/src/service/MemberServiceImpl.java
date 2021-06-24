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
	
	/* dao�� ȣ���Ҷ� �����ڸ� ���ؼ� DBconn�� ��ü�� ��Ű�� dbconn���� getConnection()�� ȣ���Ѵ�.*/
	public MemberServiceImpl() {
			DBconn dbconn = new DBconn();	
		   this.conn = dbconn.getConnection();
	}
	
	/*
	 * 		�α��� Ŭ���� üũ Dao �żҵ�
	 * 		���̵� ��й�ȣ sql���� Ȯ�� �ϴ� dao
	 * */
	
	
	/*
	 * ȸ������ ���� �Ѱ��ֱ� Dao
	 * */
	public int memberInsert(String mId,String mPwd,String mName,String mEmail,String mPhone,String mType) {
		int value = 0;
		
		try {
		String sql = "insert into Api_member(MIDX,MID,MPWD,MNAME,MEMAIL,MPHONE,MTYPE,MDATE,MDELYN) values(midx_seq.nextval,?,?,?,?,?,?,sysdate,'N')";
	    pstmt = conn.prepareStatement(sql);
	  //  pstmt.setInt(1, 11);
	    
		pstmt.setString(1,mId);
		pstmt.setString(2,mPwd);
		pstmt.setString(3,mName);
		pstmt.setString(4,mEmail);
		pstmt.setString(5,mPhone);
		pstmt.setString(6,mType);
		pstmt.setString(7, "N");
		pstmt.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}		
		}				
		return value;
	}
	
	/*
	 * �α��� Ȯ�� ȭ��
	 * */
   public int memberLoginCheck(String memberId, String memberPwd){
	   
      int midx=0;
      
      String sql ="select midx from EVE_MEMBER where mId=? and mPwd=?";
      System.out.println("conn "+conn);
      try {
         pstmt =conn.prepareStatement(sql); //sql ������ ���
         pstmt.setString(1, memberId); //ù��° '?' �Ű������� �޾ƿ� 'membeId'�� ����
         pstmt.setString(2, memberPwd); // �ι�° '?' �Ű������� �޾ƿ� 'memberPwd'�� ����
         ResultSet rs = pstmt.executeQuery(); //������ ������ ����� rs�� ����
         
	         if (rs.next()) {
	            midx = rs.getInt("midx");
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
         
      return midx;
   }
	/*
	 * 
	 *  ���̵� ã�� ��ư Ŭ���� �޼ҵ� (Ȳ��ȣ) */
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
	
	/*
	 * 
	 * ������(ȸ������ ����)
	 * 
	 * */
	//ȸ�� ���� ����
	/*
	 * public int updateMember() {
	 * 
	 * String sql = "UPDATE boardMember SET member_pw = ?, member_name = ?,"; sql +=
	 * " member_age = ?, member_gender = ?, member_email = ? WHERE member_id = ?";
	 * int succ = 0; try {
	 * 
	 * pstmt = conn.prepareStatement(sql); ps.setString(1, dto.getMember_pw());
	 * ps.setString(2, dto.getMember_name()); ps.setInt(3, dto.getMember_age());
	 * ps.setString(4, dto.getMember_gender()); ps.setString(5,
	 * dto.getMember_email()); ps.setString(6, dto.getMember_id()); succ =
	 * ps.executeUpdate(); } catch (Exception e) { e.printStackTrace();
	 * System.out.println("updateMember() Exception!!!"); } finally { dbClose(); }
	 * return succ; } //updateMember()
	 */		
   

}