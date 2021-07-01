package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBconn;
import vo.EvMemberVo;

public class MemberServiceImpl {

	private PreparedStatement pstmt; // ������ ��� �� ����
	private Connection conn; // �ڹٿ� ������ ���̽� ����
	private ResultSet rs; // ����� �޾ƿ���

	/* dao�� ȣ���Ҷ� �����ڸ� ���ؼ� DBconn�� ��ü�� ��Ű�� dbconn���� getConnection()�� ȣ���Ѵ�. */
	public MemberServiceImpl() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}

	/*
	 * �α��� Ŭ���� üũ Dao �żҵ� ���̵� ��й�ȣ sql���� Ȯ�� �ϴ� dao
	 */

	/*
	 * ȸ������ ���� �Ѱ��ֱ� Dao
	 */
	public int memberInsert(String mId, String mPwd, String mName, String mEmail, String mPhn, String mType) {
		int value = 0;

		try {
			String sql = "insert into EVE_MEMBER(MIDX,MID,MPWD,MNAME,MEMAIL,MPHN,MTYPE,MDATE) values(midx_seq.nextval,?,?,?,?,?,?,sysdate)";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mId);
			pstmt.setString(2, mPwd);
			pstmt.setString(3, mName);
			pstmt.setString(4, mEmail);
			pstmt.setString(5, mPhn);
			pstmt.setString(6, mType);
			
			//executeUpdate ����ϱ� 
			value=pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	 */
	public String memberLoginCheck(String memberId, String memberPwd) {

		int midx = 0;
		int gidx = 0;
		
		String user="";
		
		String membersql = "select midx from EVE_MEMBER where mdelyn='N' and mId=? and mPwd=?";
		String mastersql = "select gidx from EVE_MASTER where gId=? and gPwd=?";
		
		try {
			pstmt = conn.prepareStatement(membersql); // sql ������ ���
			pstmt.setString(1, memberId); // ù��° '?' �Ű������� �޾ƿ� 'membeId'�� ����
			pstmt.setString(2, memberPwd); // �ι�° '?' �Ű������� �޾ƿ� 'memberPwd'�� ����
			ResultSet memberrs = pstmt.executeQuery(); // ������ ������ ����� rs�� ����
			
			if (memberrs.next()) {
				midx = memberrs.getInt("midx");
				
			}else{
				pstmt = conn.prepareStatement(mastersql);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				ResultSet masterrs = pstmt.executeQuery();
				
				if( masterrs.next()) {
					gidx = masterrs.getInt("gidx");
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(midx>0) {
			user="member/"+midx;
		}else if(gidx>0) {
			user="master/"+gidx;
		}
		
		System.out.println("�α��� �� �����? "+user);
		
		return user;
	}

	/*
	 * 
	 * ���̵� ã�� ��ư Ŭ���� �޼ҵ� (Ȳ��ȣ)
	 */
	public String findId(String name, String phone) {

		System.out.println("MemberServiceImpl findId() ����");

		String id = "";

		ResultSet rs = null;
		EvMemberVo mv = null;
		String sql = "select * from EVE_MEMBER where mname=? and mphn=?";

		System.out.println("sql");
		System.out.println("conn" + conn);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();

			/* ResultSet�� if���� ���ؼ� next�� �����ϸ� �ްڴ�! �� ������Ѵ�. */
			if (rs.next()) {
				mv = new EvMemberVo();
				mv.setmId(rs.getString("mid"));
				id = mv.getmId();
				System.out.println("*******rs.getString(mid)" + rs.getString("mid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return id;
	}

	public EvMemberVo selectMember(int midx) {
		EvMemberVo mbvo = null;
		ResultSet rs = null;
		
		String sql="select * from Eve_member where midx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			
			//���� ���� �����ϸ�
			if (rs.next()) {
				mbvo = new EvMemberVo();
				mbvo.setMidx(rs.getInt("midx"));
				mbvo.setmId(rs.getString("mid"));
				mbvo.setmPwd(rs.getString("mPwd"));
				mbvo.setmPhn(rs.getString("mPhn"));
				mbvo.setmName(rs.getString("mName"));
				mbvo.setmEmail(rs.getString("mEmail"));
				mbvo.setmType(rs.getInt("mtype"));
			}	
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				//conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}			
		}	
		System.out.println(mbvo.getmName());
		return mbvo;
	}
	
	//���� ��� ���� ����
	public int memberModify(String midx, String mPwd, String mPhn, String mEmail) {
		int value= 0;
					//��й�ȣ , ����ó , �̸���
		String sql ="update Eve_member set mPwd=?, mPhn=?, mEmail=? where midx=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mPwd);
			pstmt.setString(2, mPhn);
			pstmt.setString(3, mEmail);
			pstmt.setString(4, midx);
			value = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return value;
	}		
	//���� ��� ȸ�� Ż���ϱ�
	public int memberDelete(int midx, String mPwd) {
		int value=0;
		String sql="update Eve_member set mdelYn='Y' where midx= ? and mPwd= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			pstmt.setString(2, mPwd);
			value = pstmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		return value;
	}

}