package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import vo.EvMemberVo;

public class MasterServiceImpl {

	private PreparedStatement pstmt;
	private Connection conn;
	
	public MasterServiceImpl(){
		
		DBconn dbconn = new DBconn();
		this.conn =dbconn.getConnection();
		
	};
	
	
/*	행사리뷰 작성하기 action		*/
	public int insertReview(String title, String target, String startdate, String enddate, String price, String staff, String company, String content, String file, String cata, String loca, String people, int gidx) {
		int value = 0;
		
		String sql = "INSERT INTO EVE_REVIEW(HIDX, HDATE, HENDDATE, HPRICE, HPEOPLE, HTARGET, HSTAFF, HCOMPANY, HNAME, HTEXT, HCATA, HIMG, GIDX, HLOCA)" 
				    +"VALUES(HIDX_SEQ.NEXTVAL,TO_DATE(?,'YY-MM-DD'),TO_DATE(?,'YY-MM-DD'),?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,startdate);
			pstmt.setString(2,enddate);
			pstmt.setString(3,price);
			pstmt.setString(4,people);
			pstmt.setString(5,target);
			pstmt.setString(6,staff);
			pstmt.setString(7,company);
			pstmt.setString(8,title);
			pstmt.setString(9,content);
			pstmt.setString(10,cata);
			pstmt.setString(11,file);
			pstmt.setInt(12,gidx);
			pstmt.setString(13,loca);
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
/*회원 정보 출력 하기*/	
	public ArrayList<EvMemberVo> memberSelectAll(){
		ArrayList<EvMemberVo> alist = new ArrayList<EvMemberVo>();
		
		String sql="select * from EVE_MEMBER order by midx";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs  = pstmt.executeQuery();
			while(rs.next()) {
				EvMemberVo mvo = new EvMemberVo();
				
				mvo.setMidx(rs.getInt("midx"));
				mvo.setmId(rs.getString("mId"));
				mvo.setmPhn(rs.getString("mPhn"));
				mvo.setmName(rs.getString("mName"));
				mvo.setmEmail(rs.getString("mEmail"));
				mvo.setmDate(rs.getString("mDate"));
				mvo.setmType(rs.getString("mtype"));
				mvo.setmDelYn(rs.getString("mDelYn"));
				
				//앞에가 vo 뒤에가 컬럼 입력 명
				
				alist.add(mvo);				
			}			
		} catch (SQLException e) {			
			e.printStackTrace();
		}	
		return alist;
	}
	
/*	행사리뷰 삭제하기	*/
	public int reviewDelete(int hidx) {
		
		
		int value=0;
		
		String sql = "update EVE_REVIEW set hdelyn='Y' where hidx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hidx);
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
		
		System.out.println("value : "+value);
		
		return value;
	}


/*	행사 리뷰 수정하기	*/	
	public int modifyAction(int hidx, String file, String cata, String hloca, 
							String startdate, String enddate, String price, String people, 
							String target, String staff, String company, String title, String content) {
		
		System.out.println("수정하기 엑션 메소드 입니다.");

		System.out.println("hidx : "+hidx);
		System.out.println("file : "+file);
		System.out.println("cata : "+cata);
		System.out.println("hloca : "+hloca);
		System.out.println("startdate : "+startdate);
		System.out.println("enddate : "+enddate);
		System.out.println("price : "+price);
		System.out.println("people : "+people);
		System.out.println("target : "+target);
		System.out.println("staff : "+staff);
		System.out.println("company : "+company);
		System.out.println("title : "+title);
		System.out.println("content : "+content);
		
		int value=0;
		
		String sql = "update EVE_REVIEW set hname=?, hdate=?, hcata=?, hprice=?, htarget=?, hloca=?, hpeople=?, htext=?, himg=?, henddate=?, hcompany=?, hstaff=? where hidx=?";

		try {
			System.out.println("try");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, startdate);
			pstmt.setString(3, cata);
			pstmt.setString(4, price);
			pstmt.setString(5, target);
			pstmt.setString(6, hloca);
			pstmt.setString(7, people);
			pstmt.setString(8, content);
			pstmt.setString(9, file);
			pstmt.setString(10, enddate);
			pstmt.setString(11, company);
			pstmt.setString(12, staff);
			pstmt.setInt(13, hidx);
			
			System.out.println("try");
			
			value = pstmt.executeUpdate();
			
			System.out.println("value는 ? "+value);
			
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
		
		System.out.println("value는 ? "+value);
		
		return value;
	}
	

}
