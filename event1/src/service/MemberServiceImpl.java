package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBconn;
import vo.EvMemberVo;

public class MemberServiceImpl {

   private PreparedStatement pstmt; // ì¿¼ë¦¬ë¬¸ ëŒ€ê¸° ë° ì„¤ì •
   private Connection conn; // ìë°”ì™€ ë°ì´í„° ë² ì´ìŠ¤ ì—°ê²°
   private ResultSet rs; // ê²°ê³¼ê°’ ë°›ì•„ì˜¤ê¸°

   /* daoë¥¼ í˜¸ì¶œí• ë•Œ ìƒì„±ìë¥¼ í†µí•´ì„œ DBconnì„ ê°ì²´ì™€ ì‹œí‚¤ê³  dbconnì•ˆì˜ getConnection()ì„ í˜¸ì¶œí•œë‹¤. */
   public MemberServiceImpl ()  {
      DBconn dbconn = new DBconn();
      this.conn = dbconn.getConnection();
   }

   /*
    * ë¡œê·¸ì¸ í´ë¦­ì‹œ ì²´í¬ Dao ë§¤ì†Œë“œ ì•„ì´ë”” ë¹„ë°€ë²ˆí˜¸ sqlì—ì„œ í™•ì¸ í•˜ëŠ” dao
    */

   /*
    * íšŒì›ê°€ì… ì •ë³´ ë„˜ê²¨ì£¼ê¸° Dao
    */
   public int memberInsert(String mId, String mPwd, String mName, String mEmail, String mPhn, String mType) {
      int value = 0;

      try {
         String sql = "insert into EVE_MEMBER(MIDX,MID,MPWD,MNAME,MEMAIL,MPHN,MTYPE,MDATE) values(midx_seq.nextval,?,?,?,?,?,?,sysdate)";
         
         //sql ëª…ë ¹ëŒ€ê¸° ìƒíƒœ ì—°ê²° 
         pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, mId);
         pstmt.setString(2, mPwd);
         pstmt.setString(3, mName);
         pstmt.setString(4, mEmail);
         pstmt.setString(5, mPhn);
         pstmt.setString(6, mType);
         
         //executeUpdate ì‚¬ìš©í•˜ê¸° 
         value=pstmt.executeUpdate();
         
         
      } catch (Exception e) {
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
   
   public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
	   if (rs != null) {
		   try {
			   rs.close();
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }
	   }
	   
	   if (pstmt != null) {
		   try {
			   pstmt.close();
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }
	   }
	   if(conn != null) {
		   try {
			   conn.close();
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }
	   }
   }
   
   
   /* ì•„ì´ë”” ì²´í¬  */ 
	public boolean confirmId(String lid) {
		boolean result = false;
		try {
			conn = DBconn.getConnection();
			String sql = "SELECT LID FROM LOGIN WHERE LID = ?";
			pstmt = conn.prepareStatement(sql);
<<<<<<< HEAD
			pstmt.setString(1, lid);
=======

			pstmt.setString(1, mId);
			pstmt.setString(2, mPwd);
			pstmt.setString(3, mName);
			pstmt.setString(4, mEmail);
			pstmt.setString(5, mPhn);
			pstmt.setString(6, mType);
			
			//executeUpdate »ç¿ëÇÏ±â 
			value=pstmt.executeUpdate();
			
			
		} catch (Exception e) {
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

	/*
	 * ·Î±×ÀÎ È®ÀÎ È­¸é
	 */
	public String memberLoginCheck(String memberId, String memberPwd) {

		int midx = 0;
		int gidx = 0;
		
		String user="";
		
		String membersql = "select midx from EVE_MEMBER where mdelyn='N' and mId=? and mPwd=?";
		String mastersql = "select gidx from EVE_MASTER where gId=? and gPwd=?";
		
		try {
			pstmt = conn.prepareStatement(membersql); // sql Äõ¸®¹® ´ë±â
			pstmt.setString(1, memberId); // Ã¹¹øÂ° '?' ¸Å°³º¯¼ö·Î ¹Ş¾Æ¿Â 'membeId'¸¦ ´ëÀÔ
			pstmt.setString(2, memberPwd); // µÎ¹øÂ° '?' ¸Å°³º¯¼ö·Î ¹Ş¾Æ¿Â 'memberPwd'¸¦ ´ëÀÔ
			ResultSet memberrs = pstmt.executeQuery(); // Äõ¸®¸¦ ½ÇÇàÇÑ °á°ú¸¦ rs¿¡ ÀúÀå
			
			if (memberrs.next()) {
				midx = memberrs.getInt("midx");
				
			}else{
				pstmt = conn.prepareStatement(mastersql);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				ResultSet masterrs = pstmt.executeQuery();
				
				if( masterrs.next()) {
					gidx = masterrs.getInt("gidx");
				}
				
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
		
		if(midx>0) {
			user="member/"+midx;
		}else if(gidx>0) {
			user="master/"+gidx;
		}
		
		System.out.println("·Î±×ÀÎ ÇÑ »ç¶÷Àº? "+user);
		
		return user;
	}
	/*
	 *¾ÆÀÌµğ Áßº¹ È®ÀÎ
	 */
	public String idCheck(String mid) {

		System.out.println("MemberServiceImpl idCheck() ½ÇÇà");

		String id = "";

		ResultSet rs = null;
		String sql = "select * from EVE_MEMBER where mid=?";

		System.out.println("sql");
		System.out.println("conn" + conn);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();

			/* ResultSetÀº if¹®À» ÅëÇØ¼­ next°¡ Á¸ÀçÇÏ¸é ¹Ş°Ú´Ù! ¸¦ ÇØÁà¾ßÇÑ´Ù. */
			if (rs.next()) {

				id = rs.getString("mid");
				System.out.println("*******rs.getString(mid)" + rs.getString("mid"));
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
		return id;
	} 
	
	/*
	 * 
	 * ¾ÆÀÌµğ Ã£±â ¹öÆ° Å¬¸¯½Ã ¸Ş¼Òµå (È²ÇöÈ£)
	 */
	public String findId(String name, String phone) {

		System.out.println("MemberServiceImpl findId() ½ÇÇà");

		String id = "";

		ResultSet rs = null;
		EvMemberVo mv = null;
		String sql = "select * from EVE_MEMBER where mname=? and mphn=?";

		System.out.println("sql");
		System.out.println("conn" + conn);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, null); 
		}
		return result;
	}

   /*
    * ë¡œê·¸ì¸ í™•ì¸ í™”ë©´
    */
   public int memberLoginCheck(String memberId, String memberPwd) {

      int midx = 0;

      String sql = "select midx from EVE_MEMBER where mdelyn='N' and mId=? and mPwd=?";
      System.out.println("conn " + conn);
      try {
         pstmt = conn.prepareStatement(sql); // sql ì¿¼ë¦¬ë¬¸ ëŒ€ê¸°
         pstmt.setString(1, memberId); // ì²«ë²ˆì§¸ '?' ë§¤ê°œë³€ìˆ˜ë¡œ ë°›ì•„ì˜¨ 'membeId'ë¥¼ ëŒ€ì…
         pstmt.setString(2, memberPwd); // ë‘ë²ˆì§¸ '?' ë§¤ê°œë³€ìˆ˜ë¡œ ë°›ì•„ì˜¨ 'memberPwd'ë¥¼ ëŒ€ì…
         ResultSet rs = pstmt.executeQuery(); // ì¿¼ë¦¬ë¥¼ ì‹¤í–‰í•œ ê²°ê³¼ë¥¼ rsì— ì €ì¥

         if (rs.next()) {
            midx = rs.getInt("midx");
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

      return midx;
   }

   /*
    * 
    * ì•„ì´ë”” ì°¾ê¸° ë²„íŠ¼ í´ë¦­ì‹œ ë©”ì†Œë“œ (í™©í˜„í˜¸)
    */
   public String findId(String name, String phone) {

      System.out.println("MemberServiceImpl findId() ì‹¤í–‰");

      String id = "";

      ResultSet rs = null;
      EvMemberVo mv = null;
      String sql = "select * from EVE_MEMBER where mname=? and mphn=?";

      System.out.println("sql");
      System.out.println("conn" + conn);
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, name);
         pstmt.setString(2, phone);
         rs = pstmt.executeQuery();

         /* ResultSetì€ ifë¬¸ì„ í†µí•´ì„œ nextê°€ ì¡´ì¬í•˜ë©´ ë°›ê² ë‹¤! ë¥¼ í•´ì¤˜ì•¼í•œë‹¤. */
         if (rs.next()) {
            mv = new EvMemberVo();
            mv.setmId(rs.getString("mid"));
            id = mv.getmId();
            System.out.println("*******rs.getString(mid)" + rs.getString("mid"));
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

      return id;
   }

   public EvMemberVo selectMember(int midx) {
      EvMemberVo mbvo = null;
      ResultSet rs = null;
      
      String sql="select * from Eve_member where midx=?";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, midx);
         rs = pstmt.executeQuery();
         
         //ë‹¤ìŒ í–‰ì´ ì¡´ì¬í•˜ë©´
         if (rs.next()) {
            mbvo = new EvMemberVo();
            mbvo.setMidx(rs.getInt("midx"));
            mbvo.setmId(rs.getString("mid"));
            mbvo.setmPwd(rs.getString("mPwd"));
            mbvo.setmPhn(rs.getString("mPhn"));
            mbvo.setmName(rs.getString("mName"));
            mbvo.setmEmail(rs.getString("mEmail"));
            mbvo.setmType(rs.getInt("mtype"));
         }   
         
      } catch (SQLException e) {         
         e.printStackTrace();
      }finally {
         try {
            rs.close();
            pstmt.close();
            //conn.close();
         } catch (SQLException e) {            
            e.printStackTrace();
         }         
      }   
      System.out.println(mbvo.getmName());
      return mbvo;
   }
   
   //ì¢…ë¹ˆ ë©¤ë²„ ì •ë³´ ìˆ˜ì •
   public int memberModify(String midx, String mPwd, String mPhn, String mEmail) {
      int value= 0;
               //ë¹„ë°€ë²ˆí˜¸ , ì—°ë½ì²˜ , ì´ë©”ì¼
      String sql ="update Eve_member set mPwd=?, mPhn=?, mEmail=? where midx=? ";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mPwd);
         pstmt.setString(2, mPhn);
         pstmt.setString(3, mEmail);
         pstmt.setString(4, midx);
         value = pstmt.executeUpdate();         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return value;
   }      
   //ì¢…ë¹ˆ ë©¤ë²„ íšŒì› íƒˆí‡´í•˜ê¸°
   public int memberDelete(int midx, String mPwd) {
      int value=0;
      String sql="update Eve_member set mdelYn='Y' where midx= ? and mPwd= ?";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, midx);
         pstmt.setString(2, mPwd);
         value = pstmt.executeUpdate();         
         
      } catch (SQLException e) {         
         e.printStackTrace();
      }
      
      return value;
   }

}