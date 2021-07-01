package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import vo.EvBoardAskVo;
import vo.EvReviewVo;

public class BoardServiceImpl {
	
	private PreparedStatement pstmt;
	private Connection conn;
	
	public BoardServiceImpl(){
		
		DBconn dbconn = new DBconn();
		this.conn =dbconn.getConnection();
		
	}

	/* 마이페이지에서 본인이 작성한 글 리스트 불러오기	*/
	public ArrayList selectmyboardlist(String midx) {
		
		ArrayList<EvBoardAskVo> alistboard = new ArrayList();
		
		String sql ="select B.bidx, B.midx, B.bcata, B.btitle, B.bwriteday, B.bcount, M.mname "
				   +"from "
				   +"EVE_BOARD B, EVE_MEMBER M "
				   +"where B.midx = M.midx and B.midx=? and bdelyn='N' order by bidx desc";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, midx);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				EvBoardAskVo bv = new EvBoardAskVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setBcata(rs.getString("bcata"));
				bv.setBtitle(rs.getString("btitle"));
				bv.setBwriteday(rs.getString("bwriteday"));
				bv.setBname(rs.getString("mname"));
				bv.setBcount(rs.getString("bcount"));

				alistboard.add(bv);
				
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
		
		return alistboard;
	}


/*마이페이지 게시글 상세보기*/
	public EvBoardAskVo boardlistselectone(int bidx) {
		
		System.out.println("boardlistselectone 게시글 상세보기 메소드");
		
		String sql = "select * "
					+"from EVE_BOARD B , EVE_MEMBER M "
					+"where B.midx = M.midx "
					+"and B.bidx=?";
		
		EvBoardAskVo bavo = new EvBoardAskVo();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bavo.setBidx(rs.getInt("bidx"));
				bavo.setBcata(rs.getString("bcata"));
				bavo.setBtitle(rs.getString("btitle"));
				bavo.setBwriteday(rs.getString("bwriteday"));
				bavo.setBname(rs.getString("mname"));
				bavo.setBcount(rs.getString("bcount"));
				bavo.setBcontents(rs.getString("bcontents"));
				bavo.setBfile(rs.getString("bfile"));
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
		
		return bavo;
	}

/*	마이페이지 게시글 수정하기.*/
	public EvBoardAskVo boardModify(int bidx) {
		
		String sql = "select * "
				+"from EVE_BOARD B , EVE_MEMBER M "
				+"where B.midx = M.midx "
				+"and B.bidx=?";

		EvBoardAskVo bavo = new EvBoardAskVo();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bavo.setBidx(rs.getInt("bidx"));
				bavo.setBcata(rs.getString("bcata"));
				bavo.setBtitle(rs.getString("btitle"));
				bavo.setBwriteday(rs.getString("bwriteday"));
				bavo.setBname(rs.getString("mname"));
				bavo.setBcount(rs.getString("bcount"));
				bavo.setBcontents(rs.getString("bcontents"));
				bavo.setBfile(rs.getString("bfile"));
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
		
		return bavo;
		
	}


/*	게시판 수정 액션	*/
	public int boardModifyAction(int bidx, String title, String content) {
		
		int value=0;
		
		String sql = "UPDATE EVE_BOARD SET btitle=?, bcontents=? where bidx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3,bidx);
			value = pstmt.executeUpdate();
			
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
		
		return value;
	}

/*	마이페이지 게시판 글 수	*/
	public int boardCount(int midx) {
		int count = 0;
		
		String sql = "select count(*) as cnt from EVE_BOARD where midx=? and bdelyn='N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("cnt");
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
		
		
		return count;
	}

	
/*	마이페이지 게시글 삭제하기		*/	
	public int myPageBoardDelet(int bidx) {
		
		System.out.println("myPageBoardDelet(int bidx) 입니다.");
		System.out.println(bidx);
		
		int value = 0;
		
		String sql = "UPDATE EVE_BOARD SET BDELYN='Y' where bidx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			value = pstmt.executeUpdate();
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

		System.out.println("turn되는 값 = "+value);
		return value;
	}


/*	게시글 Count	*/
	public int hitCount(int bidx) {
		
		int value=0; 
		
		String sql = "update EVE_BOARD set bcount=bcount+1 where bidx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return value;
	}
}
