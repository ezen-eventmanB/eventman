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
				ebvo.setgName(rs.getString("gName"));
				ebvo.setBmenu(rs.getString("Bmenu"));
				ebvo.setBcount(rs.getString("Bcount"));
				ebvo.setBidx(rs.getInt("bidx"));

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
	
		/*게시글 공지사항  상세보기*/
		public EvBoardAskVo allboardlistselectone(int bidx) {
			
			System.out.println("allboardlistselectone 게시글 상세보기");
			String sql = "select * from EVE_BOARD where GIDX='1' and bidx=?";
			EvBoardAskVo bavo = new EvBoardAskVo();
			
			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, bidx);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					bavo.setBidx(rs.getInt("bidx"));
					bavo.setBcata(rs.getString("bcata"));	
					bavo.setBtitle(rs.getString("btitle"));
					bavo.setBwriteday(rs.getString("bwriteday"));
					bavo.setgName(rs.getString("gName"));
					bavo.setBcount(rs.getString("bcount"));
					bavo.setBcontents(rs.getString("bcontents"));	
					bavo.setBfile(rs.getString("bfile"));
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
			
			return bavo;
		}
		
		/* 공지사항 게시글 수정하기 페이지로 이동 . */
		public EvBoardAskVo MainboardModify(int bidx) {

			String sql = "select * from EVE_BOARD where bidx=?";
			EvBoardAskVo bavo = new EvBoardAskVo();

			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, bidx);
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					bavo.setBidx(rs.getInt("bidx"));
					bavo.setBcata(rs.getString("bcata"));
					bavo.setBtitle(rs.getString("btitle"));
					bavo.setBwriteday(rs.getString("bwriteday"));
					bavo.setgName(rs.getString("gName"));
					bavo.setBcount(rs.getString("bcount"));
					bavo.setBcontents(rs.getString("bcontents"));
					bavo.setBfile(rs.getString("bfile"));
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

			return bavo;

		}

		/* 게시판 메인수정 액션 */
		public int boardMainModifyAction(String Bcata, String Btitle, String Bcontents, String Bfile, int bidx) {

			int value = 0;
			String sql = null;

			sql = "UPDATE EVE_BOARD SET BCATA=? ,BTITLE=?, BCONTENTS=?, BFILE=? WHERE bidx=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, Bcata);
				pstmt.setString(2, Btitle);
				pstmt.setString(3, Bcontents);
				pstmt.setString(4, Bfile);
				pstmt.setInt(5, bidx);
				value = pstmt.executeUpdate();

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
			return value;
		}
		
			/*   게시판 공지사항 삭제하기      */   
			public int BoardDelete(int bidx) {
	    	  
	  		int value = 0;
	  		
	  		String sql = "UPDATE EVE_BOARD SET BDELYN='Y' where bidx=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, bidx);
				value = pstmt.executeUpdate();
				
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
			return value;
		}
  
		
		/*	관리자 게시판 글 작성하기	*/	
		public int masterinsertAdvice(String cata, String title, String content, String fileName , String gidx) {

			System.out.println("cara"+cata);
			System.out.println("title"+title);
			System.out.println("content"+content);
			System.out.println("file"+fileName);
			System.out.println("gidx"+gidx);

			int value=0;
			
		    String sql= "insert into EVE_BOARD (BIDX, BCATA, BMENU, BTITLE, BCONTENTS, BWRITEDAY, BCOUNT, BFILE, GIDX, ORIGINBIDX, DEPTH, LLEVEL)"
		               +"values(EVENTASK_SEQ.NEXTVAL , ? , '게시판' , ? , ? , TO_CHAR(SYSDATE,'YYYY-MM-DD') , 0 , ? , ? , 0 , 0 , 0)";			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cata);
				pstmt.setString(2, title);
				pstmt.setString(3, content);
				pstmt.setString(4, fileName);
				pstmt.setString(5, gidx);

				
				value=pstmt.executeUpdate();
				
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
			
			
			return value; 
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

	/* 마이페이지 게시글 수정하기 페이지로 이동 . */
	public EvBoardAskVo boardModify(int bidx) {

		String sql = "select * " + "from EVE_BOARD B , EVE_MASTER M " + "where B.midx = M.midx " + "and B.bidx=?";

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
	
	
    /*마이페이지 갈때 견적신청 모든 부분 카운트*/
	public int allSelectBoard() {
	
		int allBoardcount=0;
		
		String sql = "select count(*) as cnt from EVE_BOARD where bdelyn='N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				allBoardcount = (rs.getInt("cnt"));
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

		return allBoardcount;
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

	public String companyload() {
		
		String img = "";
		
		String sql = "select pimg from EVE_COMPANY where gidx=1";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				img = rs.getString("pimg");
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
		
		return img;
	}
}
