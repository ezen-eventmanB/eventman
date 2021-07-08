package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import vo.EvMemberVo;

public class MemberServiceImpl {

	private PreparedStatement pstmt; // Äõ¸®¹® ´ë±â ¹× ¼³Á¤
	private Connection conn; // ÀÚ¹Ù¿Í µ¥ÀÌÅÍ º£ÀÌ½º ¿¬°á
	private ResultSet rs; // °á°ú°ª ¹Þ¾Æ¿À±â

<<<<<<< HEAD
   /* daoë¥¼ í˜¸ì¶œí• ë•Œ ìƒì„±ìžë¥¼ í†µí•´ì„œ DBconnì„ ê°ì²´ì™€ ì‹œí‚¤ê³  dbconnì•ˆì˜ getConnection()ì„ í˜¸ì¶œí•œë‹¤. */
   public MemberServiceImpl() {
      DBconn dbconn = new DBconn();
      this.conn = dbconn.getConnection();
   }
=======
	/* dao¸¦ È£ÃâÇÒ¶§ »ý¼ºÀÚ¸¦ ÅëÇØ¼­ DBconnÀ» °´Ã¼¿Í ½ÃÅ°°í dbconn¾ÈÀÇ getConnection()À» È£ÃâÇÑ´Ù. */
	public MemberServiceImpl() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

	/*
	 * ·Î±×ÀÎ Å¬¸¯½Ã Ã¼Å© Dao ¸Å¼Òµå ¾ÆÀÌµð ºñ¹Ð¹øÈ£ sql¿¡¼­ È®ÀÎ ÇÏ´Â dao
	 */

<<<<<<< HEAD
   
   
   /* íšŒì› ë¦¬ìŠ¤íŠ¸ ë¶ˆëŸ¬ì˜¤ê¸° */
   
   public ArrayList<EvMemberVo> memberSelectAll(){
		ArrayList<EvMemberVo> alist = new ArrayList<EvMemberVo>();
		
		String sql="select * from EVE_MEMBER where delyn='N' order by midx desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs  = pstmt.executeQuery();
			
			while(rs.next()) {
				EvMemberVo mv = new EvMemberVo();
				mv.setMidx(rs.getInt("midx"));
				mv.setmId(rs.getString("mId"));
				mv.setmName(rs.getString("mName"));
				mv.setmEmail(rs.getString("mEmail"));
				mv.setmPhn(rs.getString("mPhn"));
				mv.setmType(rs.getInt("mType"));
				mv.setWdate(rs.getString("mWdate"));
				mv.setmDelYn(rs.getString("DelYn"));
				
				alist.add(mv);				
			}			
		} catch (SQLException e) {			
			e.printStackTrace();
		}	
		
		return alist;
	}
   
   
   

   
   /*
    * íšŒì›ê°€ìž… ì •ë³´ ë„˜ê²¨ì£¼ê¸° Dao
    */
   public int memberInsert(String mId, String mPwd, String mName, String mEmail, String mPhn, String mType) {
      int value = 0;
=======
	/*
	 * È¸¿ø°¡ÀÔ Á¤º¸ ³Ñ°ÜÁÖ±â Dao
	 */
	public int memberInsert(String mId, String mPwd, String mName, String mEmail, String mPhn, String mType) {
		int value = 0;
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

<<<<<<< HEAD
      try {
         String sql = "insert into EVE_MEMBER(MIDX,MID,MPWD,MNAME,MEMAIL,MPHN,MTYPE,MDATE) values(midx_seq.nextval,?,?,?,?,?,?,sysdate)";
         
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
=======
		try {
			String sql = "insert into EVE_MEMBER(MIDX,MID,MPWD,MNAME,MEMAIL,MPHN,MTYPE,MDATE) values(midx_seq.nextval,?,?,?,?,?,?,sysdate)";
			
			pstmt = conn.prepareStatement(sql);

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
			pstmt.setString(1, memberId); // Ã¹¹øÂ° '?' ¸Å°³º¯¼ö·Î ¹Þ¾Æ¿Â 'membeId'¸¦ ´ëÀÔ
			pstmt.setString(2, memberPwd); // µÎ¹øÂ° '?' ¸Å°³º¯¼ö·Î ¹Þ¾Æ¿Â 'memberPwd'¸¦ ´ëÀÔ
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
	 *¾ÆÀÌµð Áßº¹ È®ÀÎ
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

			/* ResultSetÀº if¹®À» ÅëÇØ¼­ next°¡ Á¸ÀçÇÏ¸é ¹Þ°Ú´Ù! ¸¦ ÇØÁà¾ßÇÑ´Ù. */
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
	 * ¾ÆÀÌµð Ã£±â ¹öÆ° Å¬¸¯½Ã ¸Þ¼Òµå (È²ÇöÈ£)
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
			rs = pstmt.executeQuery();

			/* ResultSetÀº if¹®À» ÅëÇØ¼­ next°¡ Á¸ÀçÇÏ¸é ¹Þ°Ú´Ù! ¸¦ ÇØÁà¾ßÇÑ´Ù. */
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
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

<<<<<<< HEAD
   /*
    * ë¡œê·¸ì¸ í™•ì¸ í™”ë©´
    */
   public String memberLoginCheck(String memberId, String memberPwd) {

      int midx = 0;
      int gidx = 0;
      
      String user="";
      
      String membersql = "select midx from EVE_MEMBER where mdelyn='N' and mId=? and mPwd=?";
      String mastersql = "select gidx from EVE_MASTER where gId=? and gPwd=?";
      
      try {
         pstmt = conn.prepareStatement(membersql); // sql ì¿¼ë¦¬ë¬¸ ëŒ€ê¸°
         pstmt.setString(1, memberId); // ì²«ë²ˆì§¸ '?' ë§¤ê°œë³€ìˆ˜ë¡œ ë°›ì•„ì˜¨ 'membeId'ë¥¼ ëŒ€ìž…
         pstmt.setString(2, memberPwd); // ë‘ë²ˆì§¸ '?' ë§¤ê°œë³€ìˆ˜ë¡œ ë°›ì•„ì˜¨ 'memberPwd'ë¥¼ ëŒ€ìž…
         ResultSet memberrs = pstmt.executeQuery(); // ì¿¼ë¦¬ë¥¼ ì‹¤í–‰í•œ ê²°ê³¼ë¥¼ rsì— ì €ìž¥
         
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
      
      System.out.println("ë¡œê·¸ì¸ í•œ ì‚¬ëžŒì€? "+user);
      
      return user;
   }
   /*
    *ì•„ì´ë”” ì¤‘ë³µ í™•ì¸
    */
   public String idCheck(String mid) {

      System.out.println("MemberServiceImpl idCheck() ì‹¤í–‰");

      String id = "";

      ResultSet rs = null;
      String sql = "select * from EVE_MEMBER where mid=?";

      System.out.println("sql");
      System.out.println("conn" + conn);
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mid);
         rs = pstmt.executeQuery();

         /* ResultSetì€ ifë¬¸ì„ í†µí•´ì„œ nextê°€ ì¡´ìž¬í•˜ë©´ ë°›ê² ë‹¤! ë¥¼ í•´ì¤˜ì•¼í•œë‹¤. */
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

         /* ResultSetì€ ifë¬¸ì„ í†µí•´ì„œ nextê°€ ì¡´ìž¬í•˜ë©´ ë°›ê² ë‹¤! ë¥¼ í•´ì¤˜ì•¼í•œë‹¤. */
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
         
         //ë‹¤ìŒ í–‰ì´ ì¡´ìž¬í•˜ë©´
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
=======
	public EvMemberVo selectMember(int midx) {
		EvMemberVo mbvo = null;
		ResultSet rs = null;
		
		String sql="select * from Eve_member where midx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			
			//´ÙÀ½ ÇàÀÌ Á¸ÀçÇÏ¸é
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
	
	//Á¾ºó ¸â¹ö Á¤º¸ ¼öÁ¤
	public int memberModify(String midx, String mPwd, String mPhn, String mEmail) {
		int value= 0;
					//ºñ¹Ð¹øÈ£ , ¿¬¶ôÃ³ , ÀÌ¸ÞÀÏ
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
	//Á¾ºó ¸â¹ö È¸¿ø Å»ÅðÇÏ±â
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
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

}