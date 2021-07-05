package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dbconn.DBconn;
import vo.EvReviewVo;

public class ReviewServiceImpl {
	
	
	private PreparedStatement pstmt;
	private Connection conn;
	
	
	public ReviewServiceImpl(){														
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();					
	}
	

/*	���� ���� ������ ��ü ���� �Ѹ���	*/
	public ArrayList<EvReviewVo> reviewSelectAll(){
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' ORDER BY hidx DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EvReviewVo erv = new EvReviewVo();
				
				erv.setHidx(rs.getInt("hidx"));
				erv.setHimg(rs.getString("Himg"));
				erv.sethName(rs.getString("hname"));
				erv.setHdate(rs.getString("hdate"));
				erv.setHenddate(rs.getString("henddate"));
				erv.setHcata(rs.getString("hcata"));
				erv.setHprice(rs.getNString("hprice"));
				erv.setHpeople(rs.getString("hpeople"));

				reviewList.add(erv);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return reviewList;
		
	}

	
/*	�߰� �׺� �����縸 ����	*/
	public ArrayList<EvReviewVo> reviewSelectCompany() {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' and hcata like '���' ORDER BY hidx DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				EvReviewVo erv = new EvReviewVo();
				
				erv.setHidx(rs.getInt("hidx"));
				erv.setHimg(rs.getString("Himg"));
				erv.sethName(rs.getString("hname"));
				erv.setHdate(rs.getString("hdate"));
				erv.setHenddate(rs.getString("henddate"));
				erv.setHcata(rs.getString("hcata"));
				erv.setHprice(rs.getNString("hprice"));
				erv.setHpeople(rs.getString("hpeople"));

				reviewList.add(erv);
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return reviewList;
	}

	
/*	�߰� �׺� ���� Ŭ���� ajax	*/	
	public ArrayList<EvReviewVo> reviewSelectUniversity() {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' and hcata like '����' ORDER BY hidx DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				EvReviewVo erv = new EvReviewVo();
				
				erv.setHidx(rs.getInt("hidx"));
				erv.setHimg(rs.getString("Himg"));
				erv.sethName(rs.getString("hname"));
				erv.setHdate(rs.getString("hdate"));
				erv.setHenddate(rs.getString("henddate"));
				erv.setHcata(rs.getString("hcata"));
				erv.setHprice(rs.getNString("hprice"));
				erv.setHpeople(rs.getString("hpeople"));

				reviewList.add(erv);
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return reviewList;
	}
	
	
/*	�߰� �׺� ���� Ŭ���� ajax	*/	
	public ArrayList<EvReviewVo> reviewSelectStage() {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' and hcata like '����' ORDER BY hidx DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				EvReviewVo erv = new EvReviewVo();
				
				erv.setHidx(rs.getInt("hidx"));
				erv.setHimg(rs.getString("Himg"));
				erv.sethName(rs.getString("hname"));
				erv.setHdate(rs.getString("hdate"));
				erv.setHenddate(rs.getString("henddate"));
				erv.setHcata(rs.getString("hcata"));
				erv.setHprice(rs.getNString("hprice"));
				erv.setHpeople(rs.getString("hpeople"));

				reviewList.add(erv);
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return reviewList;
	}
	
	
/*	�߰� �׺� ��Ÿ Ŭ���� ajax	*/	
	public ArrayList<EvReviewVo> reviewSelectxEeption() {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' and hcata like '��Ÿ' ORDER BY hidx DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				EvReviewVo erv = new EvReviewVo();
				
				erv.setHidx(rs.getInt("hidx"));
				erv.setHimg(rs.getString("Himg"));
				erv.sethName(rs.getString("hname"));
				erv.setHdate(rs.getString("hdate"));
				erv.setHenddate(rs.getString("henddate"));
				erv.setHcata(rs.getString("hcata"));
				erv.setHprice(rs.getNString("hprice"));
				erv.setHpeople(rs.getString("hpeople"));

				reviewList.add(erv);
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return reviewList;
	}
	

/*	���� �󼼺���   */
	public EvReviewVo reviewSelectOne(int hidx){
		
		System.out.println("reviewSelectOne �޼ҵ� ȣ�� ����");
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' and hidx=?";

		EvReviewVo erv = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, hidx);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				erv = new EvReviewVo();
				
				erv.setHidx(rs.getInt("hidx"));
				erv.setHcata(rs.getString("hcata"));
				erv.sethName(rs.getString("hname"));
				erv.setHloca(rs.getString("hloca"));
				erv.setHdate(rs.getString("hdate"));
				erv.setHenddate(rs.getString("henddate"));
				erv.setHprice(rs.getString("hprice"));
				erv.setHpeople(rs.getString("hpeople"));
				erv.setHtarget(rs.getString("htarget"));
				erv.setHstaff(rs.getString("hstaff"));
				erv.setHcompany(rs.getString("hcompany"));
				erv.setHtext(rs.getString("htext"));
				
				
				System.out.println(erv.getHidx());
				System.out.println(erv.gethName());
				System.out.println(erv.getHcata());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return erv;
	}
	
	
	
	
	
}
