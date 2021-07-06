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
	public ArrayList<EvReviewVo> reviewSelectAll(int page){
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql =  "select B.* from "
					+ "(select rownum as rnum, A. * from "
					+ "(select * from EVE_REVIEW where hdelYn='N' ORDER BY hidx DESC) A "
					+ "where rownum <= ?) B "
					+ "where B.rnum >= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page*9);
			pstmt.setInt(2, 1+(page-1)*9);
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
	public ArrayList<EvReviewVo> reviewSelectCompany(int page) {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql =  "select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hdelYn='N' and hcata like '기업' ORDER BY hidx DESC) A "
				+ "where rownum <= ?) B "
				+ "where B.rnum >= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page*9);
			pstmt.setInt(2, 1+(page-1)*9);
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
	public ArrayList<EvReviewVo> reviewSelectUniversity(int page) {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hdelYn='N' and hcata like '대학' ORDER BY hidx DESC) A "
				+ "where rownum <= ?) B "
				+ "where B.rnum >= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page*9);
			pstmt.setInt(2, 1+(page-1)*9);
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
	public ArrayList<EvReviewVo> reviewSelectStage(int page) {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hdelYn='N' and hcata like '공연' or hcata like '예술' ORDER BY hidx DESC) A "
				+ "where rownum <= ?) B "
				+ "where B.rnum >= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page*9);
			pstmt.setInt(2, 1+(page-1)*9);
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
	public ArrayList<EvReviewVo> reviewSelectxEeption(int page) {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hdelYn='N' and hcata like '기타' ORDER BY hidx DESC) A "
				+ "where rownum <= ?) B "
				+ "where B.rnum >= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page*9);
			pstmt.setInt(2, 1+(page-1)*9);
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
				erv.setHimg(rs.getString("himg"));
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


/*	SELECT 박스 선택시	*/
	public ArrayList<EvReviewVo> selecBoxCata(String val1, String val2, int page) {
		
		String value1 = val1;
		String value2 = val2;
		

		if(value1.equals("예산")) {
			value1=" ";
		}
		if(value2.equals("인원")){
			value2=" ";
		}
		
		ArrayList<EvReviewVo> alist = new ArrayList();
		
		String sql = "select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hprice like ? and HPEOPLE like ?) A "
				+ "where rownum <= ?) B "
				+ "where B.rnum >= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+value1+"%");
			pstmt.setString(2, "%"+value2+"%");
			pstmt.setInt(3, page*9);
			pstmt.setInt(4, 1+(page-1)*9);
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

				alist.add(erv);
			}
			
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
	
		
		return alist;
	}


/* reivew 검색 기능*/
	public ArrayList<EvReviewVo> reviewSearch(String val1, String val2, String val3,int page) {
		
		
		String value1 = val1;
		String value2 = val2;
		String value3 = val3;

		if(value1.equals("예산")) {
			value1=" ";
		}
		if(value2.equals("인원")){
			value2=" ";
		}

		System.out.println("value1 : "+value1);
		System.out.println("value2 : "+value2);
		System.out.println("value3 : "+value3);
		
		ArrayList<EvReviewVo> alist = new ArrayList();
		
		String sql ="select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hprice like ? and HPEOPLE like ? and HNAME like ? or HTEXT like ?) A "
				+ "where rownum <= ?) B "
				+ "where B.rnum >= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+value1+"%");
			pstmt.setString(2, "%"+value2+"%");
			pstmt.setString(3, "%"+value3+"%");
			pstmt.setString(4, "%"+value3+"%");
			pstmt.setInt(5, page*9);
			pstmt.setInt(6, 1+(page-1)*9);
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

				alist.add(erv);
			}
			
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
	
		return alist;
	}
	
/* 리뷰의 전체 카운트 구하기*/		
	public int boardTotalCount() {
		int cnt=0;
		
		String sql = "select count(*) as cnt from EVE_REVIEW where hdelyn='N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt; 
	}
	
	
	
}
