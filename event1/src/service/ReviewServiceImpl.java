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
	

/*	리뷰 메인 페이지 엘범 뿌리기	*/
	public ArrayList<EvReviewVo> reviewSelectAll(){
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select * from EVE_REVIEW where hdelYn='N' ORDER BY hidx DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, searchType);
			//pstmt.setString(2, "%"+keyword+"%");
			//pstmt.setInt(3, page*15);
			//pstmt.setInt(4, 1+(page-1)*15);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EvReviewVo erv = new EvReviewVo();
				
				erv.setHimg(rs.getString("Himg"));
				erv.sethName(rs.getString("hname"));
				erv.setHdate(rs.getString("hdate"));
				erv.setHenddate(rs.getString("henddate"));
				erv.setHcata(rs.getString("hcata"));
				erv.setHprice(rs.getNString("hprice"));
				erv.setHpeople(rs.getString("hpeople"));

				reviewList.add(erv);
				

				System.out.println("DAO erv = "+erv.getHimg());
				System.out.println("DAO erv = "+erv.gethName());
				System.out.println("DAO erv = "+erv.getHdate());
				System.out.println("DAO erv = "+erv.getHenddate());
				System.out.println("DAO erv = "+erv.getHcata());
				System.out.println("DAO erv = "+erv.getHprice());
				System.out.println("DAO erv = "+erv.getHpeople());
				
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
	

	
	
	
	
/*	페이징 처리를 위한 카운트	*/
/*
 * public int reviewTotalCount(String keyword , String cataPriceType , String
 * cataPeopleType) { int cnt=0;
 * 
 * ResultSet rs = null;
 * 
 * String
 * sql="select count(*) as cnt from EVE_REVIEW where hdelYN='N' and hprice like ? and hpeople like ?  and htext like ?"
 * ;
 * 
 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, cataPriceType);
 * pstmt.setString(2, cataPeopleType); pstmt.setString(3, keyword); rs =
 * pstmt.executeQuery();
 * 
 * if(rs.next()) { cnt = rs.getInt(cnt); } } catch (SQLException e) { // TODO
 * Auto-generated catch block e.printStackTrace();
 * 
 * }
 * 
 * 
 * return cnt; }
 */
	
	
	
	
	
	
}
