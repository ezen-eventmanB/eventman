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
	

/*	리뷰 메인 페이지 전체 엘범 뿌리기	*/
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

	
/*	중간 네비 기업행사만 보기	*/
	public ArrayList<EvReviewVo> reviewSelectCompany() {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' and hcata like '기업' ORDER BY hidx DESC";
		
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

	
/*	중간 네비 대학 클릭시 ajax	*/	
	public ArrayList<EvReviewVo> reviewSelectUniversity() {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' and hcata like '대학' ORDER BY hidx DESC";
		
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
	
	
/*	중간 네비 공연 클릭시 ajax	*/	
	public ArrayList<EvReviewVo> reviewSelectStage() {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' and hcata like '공연' ORDER BY hidx DESC";
		
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
	
	
/*	중간 네비 기타 클릭시 ajax	*/	
	public ArrayList<EvReviewVo> reviewSelectxEeption() {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' and hcata like '기타' ORDER BY hidx DESC";
		
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
	

/*	리뷰 상세보기   */
	public EvReviewVo reviewSelectOne(int hidx){
		
		System.out.println("reviewSelectOne 메소드 호출 성공");
		
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
