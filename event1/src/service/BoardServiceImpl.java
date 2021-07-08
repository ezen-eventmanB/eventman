package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import vo.EvBoardAskVo;
import vo.EvMemberVo;
import vo.EvReviewVo;

public class BoardServiceImpl {

	private PreparedStatement pstmt;
	private Connection conn;

	public BoardServiceImpl() {

		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();

	}

	/*
	 * 게시판 관리자 작성 글 리스트 출력 하기 public ArrayList selectMasterboardlist(String gidx) {
	 * 
	 * ArrayList<EvBoardAskVo> alistboard = new ArrayList();
	 * 
	 * String sql
	 * ="select B.bidx, B.midx, B.bcata, B.btitle, B.bwriteday, B.bcount, G.gname "
	 * +"from " +"EVE_BOARD B, EVE_MASTER G "
	 * +"where B.GIDX = G.GIDX and B.Gidx=1 and bdelyn='N' order by bidx desc"; try{
	 * pstmt = conn.prepareStatement(sql); pstmt.setString(1, gidx); ResultSet rs=
	 * pstmt.executeQuery();
	 * 
	 * while(rs.next()) {
	 * 
	 * EvBoardAskVo bv = new EvBoardAskVo(); bv.setGidx(rs.getInt("gidx"));
	 * bv.setBcata(rs.getString("bcata")); bv.setBtitle(rs.getString("btitle"));
	 * bv.setBwriteday(rs.getString("bwriteday"));
	 * bv.setBname(rs.getString("mname")); bv.setBcount(rs.getString("bcount"));
	 * 
	 * alistboard.add(bv); } } catch (SQLException e) { e.printStackTrace();
	 * }finally { try { pstmt.close(); conn.close(); } catch (SQLException e) { } }
	 * return alistboard; }
	 */

	/* 관리자가 작성한 게시판 게시글 리스트 불러오기 */
	public ArrayList<EvBoardAskVo> selectMasterboardlist() {
		
		ArrayList<EvBoardAskVo> alistboard = new ArrayList();
		String sql = "select * from EVE_BOARD where gidx='1' order by bidx";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				EvBoardAskVo ebvo = new EvBoardAskVo();
				ebvo.setBcata(rs.getString("Bcata"));
				ebvo.setBtitle(rs.getString("Btitle"));
				ebvo.setBwriteday(rs.getString("Bwriteday"));
				ebvo.setgName(rs.getString("setgName"));
				ebvo.setBmenu(rs.getString("Bmenu"));
				ebvo.setBcount(rs.getString("Bcount"));

				alistboard.add(ebvo);
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
         return alistboard;
      }

	/* 마이페이지에서 본인이 작성한 글 리스트 불러오기 */
	public ArrayList selectmyboardlist(String midx) {

		ArrayList<EvBoardAskVo> alistboard = new ArrayList();

		String sql = "select B.bidx, B.midx, B.bcata, B.btitle, B.bwriteday, B.bcount, M.mname " + "from "
				+ "EVE_BOARD B, EVE_MEMBER M " + "where B.midx = M.midx and B.midx=? and bdelyn='N' order by bidx desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, midx);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

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
		} finally {
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

	/* 마이페이지 게시글 상세보기 */
	public EvBoardAskVo boardlistselectone(int bidx) {

		System.out.println("boardlistselectone 게시글 상세보기 메소드");

		String sql = "select * " + "from EVE_BOARD B , EVE_MEMBER M " + "where B.midx = M.midx " + "and B.bidx=?";

		EvBoardAskVo bavo = new EvBoardAskVo();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
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
		} finally {
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

	/* 마이페이지 게시글 수정하기 페이지로 이동 . */
	public EvBoardAskVo boardModify(int bidx) {

		String sql = "select * " + "from EVE_BOARD B , EVE_MEMBER M " + "where B.midx = M.midx " + "and B.bidx=?";

		EvBoardAskVo bavo = new EvBoardAskVo();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
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
		} finally {
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

	/* 게시판 수정 액션 */
	public int boardModifyAction(int bidx, String title, String content, String file) {

		int value = 0;
		String sql = null;

		sql = "UPDATE EVE_BOARD SET btitle=?, bcontents=?, bfile=? where bidx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, file);
			pstmt.setInt(4, bidx);
			value = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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

	/* 마이페이지 게시판 글 수 */
	public int boardCount(int midx) {
		int count = 0;

		String sql = "select count(*) as cnt from EVE_BOARD where midx=? and bdelyn='N'";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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

	/* 마이페이지 게시글 삭제하기 */
	public int myPageBoardDelet(int bidx) {

		System.out.println("myPageBoardDelet(int bidx) 입니다.");
		System.out.println(bidx);

		int value = 0;

		String sql = "UPDATE EVE_BOARD SET BDELYN='Y' where bidx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		System.out.println("turn되는 값 = " + value);
		return value;
	}

	/* 게시글 Count */
	public int hitCount(int bidx) {

		int value = 0;

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
