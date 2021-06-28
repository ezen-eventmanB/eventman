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
	

/* 마이페이지에서 본인이 작성한 글 불러오기	*/
	public ArrayList selectmyboardlist(String midx) {
		
		ArrayList<EvBoardAskVo> alistboard = new ArrayList();
		
		String sql ="select B.bidx, B.midx, B.bcata, B.btitle, B.bwriteday, B.bcount, M.mname "
				   +"from " 
			       +"EVE_BOARD B, EVE_MEMBER M "
				   +"where B.midx = M.midx and B.midx=? order by bidx desc";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, midx);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				EvBoardAskVo bv = new EvBoardAskVo();
				
				bv.setBcata(rs.getString("bcata"));
				bv.setBtitle(rs.getString("btitle"));
				bv.setBwriteday(rs.getString("bwriteday"));
				bv.setBname(rs.getString("mname"));
				bv.setBcount(rs.getString("bcount"));

				alistboard.add(bv);

				System.out.println("bcata = "+bv.getBcata());
				System.out.println("btitle = "+bv.getBtitle());
				System.out.println("bwriteday = "+bv.getBwriteday());
				System.out.println("mname = "+bv.getBname());
				System.out.println("bcount = "+bv.getBcount());
				
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

}
