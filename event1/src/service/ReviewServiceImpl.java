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

	
/*	�߰� �׺� �����縸 ����	*/
	public ArrayList<EvReviewVo> reviewSelectCompany(int page) {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql =  "select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hdelYn='N' and hcata like '���' ORDER BY hidx DESC) A "
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

	
/*	�߰� �׺� ���� Ŭ���� ajax	*/	
	public ArrayList<EvReviewVo> reviewSelectUniversity(int page) {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hdelYn='N' and hcata like '����' ORDER BY hidx DESC) A "
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
	
	
/*	�߰� �׺� ���� Ŭ���� ajax	*/	
	public ArrayList<EvReviewVo> reviewSelectStage(int page) {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hdelYn='N' and hcata like '����' or hcata like '����' ORDER BY hidx DESC) A "
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
	
	
/*	�߰� �׺� ��Ÿ Ŭ���� ajax	*/	
	public ArrayList<EvReviewVo> reviewSelectxEeption(int page) {
		
		ArrayList<EvReviewVo> reviewList = new ArrayList();
		
		String sql = "select B.* from "
				+ "(select rownum as rnum, A. * from "
				+ "(select * from EVE_REVIEW where hdelYn='N' and hcata like '��Ÿ' ORDER BY hidx DESC) A "
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


/*	SELECT �ڽ� ���ý�	*/
	public ArrayList<EvReviewVo> selecBoxCata(String val1, String val2, int page) {
		
		String value1 = val1;
		String value2 = val2;
		

		if(value1.equals("����")) {
			value1=" ";
		}
		if(value2.equals("�ο�")){
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


/* reivew �˻� ���*/
	public ArrayList<EvReviewVo> reviewSearch(String val1, String val2, String val3,int page) {
		
		
		String value1 = val1;
		String value2 = val2;
		String value3 = val3;

		if(value1.equals("����")) {
			value1=" ";
		}
		if(value2.equals("�ο�")){
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
	
/* ������ ��ü ī��Ʈ ���ϱ�*/		
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
