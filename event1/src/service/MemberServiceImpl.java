package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import vo.EvMemberVo;

public class MemberServiceImpl {

	private PreparedStatement pstmt; // 쿼리문 대기 및 설정
	private Connection conn; // 자바와 데이터 베이스 연결
	private ResultSet rs; // 결과값 받아오기

<<<<<<< HEAD
   /* dao瑜� �샇異쒗븷�븣 �깮�꽦�옄瑜� �넻�빐�꽌 DBconn�쓣 媛앹껜��� �떆�궎怨� dbconn�븞�쓽 getConnection()�쓣 �샇異쒗븳�떎. */
   public MemberServiceImpl() {
      DBconn dbconn = new DBconn();
      this.conn = dbconn.getConnection();
   }
=======
	/* dao를 호출할때 생성자를 통해서 DBconn을 객체와 시키고 dbconn안의 getConnection()을 호출한다. */
	public MemberServiceImpl() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

	/*
	 * 로그인 클릭시 체크 Dao 매소드 아이디 비밀번호 sql에서 확인 하는 dao
	 */

<<<<<<< HEAD
   
   
   /* �쉶�썝 由ъ뒪�듃 遺덈윭�삤湲� */
   
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
    * �쉶�썝媛��엯 �젙蹂� �꽆寃⑥＜湲� Dao
    */
   public int memberInsert(String mId, String mPwd, String mName, String mEmail, String mPhn, String mType) {
      int value = 0;
=======
	/*
	 * 회원가입 정보 넘겨주기 Dao
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
         
         //executeUpdate �궗�슜�븯湲� 
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
			
			//executeUpdate 사용하기 
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
	 * 로그인 확인 화면
	 */
	public String memberLoginCheck(String memberId, String memberPwd) {

		int midx = 0;
		int gidx = 0;
		
		String user="";
		
		String membersql = "select midx from EVE_MEMBER where mdelyn='N' and mId=? and mPwd=?";
		String mastersql = "select gidx from EVE_MASTER where gId=? and gPwd=?";
		
		try {
			pstmt = conn.prepareStatement(membersql); // sql 쿼리문 대기
			pstmt.setString(1, memberId); // 첫번째 '?' 매개변수로 받아온 'membeId'를 대입
			pstmt.setString(2, memberPwd); // 두번째 '?' 매개변수로 받아온 'memberPwd'를 대입
			ResultSet memberrs = pstmt.executeQuery(); // 쿼리를 실행한 결과를 rs에 저장
			
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
		
		System.out.println("로그인 한 사람은? "+user);
		
		return user;
	}
	/*
	 *아이디 중복 확인
	 */
	public String idCheck(String mid) {

		System.out.println("MemberServiceImpl idCheck() 실행");

		String id = "";

		ResultSet rs = null;
		String sql = "select * from EVE_MEMBER where mid=?";

		System.out.println("sql");
		System.out.println("conn" + conn);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();

			/* ResultSet은 if문을 통해서 next가 존재하면 받겠다! 를 해줘야한다. */
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
	 * 아이디 찾기 버튼 클릭시 메소드 (황현호)
	 */
	public String findId(String name, String phone) {

		System.out.println("MemberServiceImpl findId() 실행");

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

			/* ResultSet은 if문을 통해서 next가 존재하면 받겠다! 를 해줘야한다. */
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
    * 濡쒓렇�씤 �솗�씤 �솕硫�
    */
   public String memberLoginCheck(String memberId, String memberPwd) {

      int midx = 0;
      int gidx = 0;
      
      String user="";
      
      String membersql = "select midx from EVE_MEMBER where mdelyn='N' and mId=? and mPwd=?";
      String mastersql = "select gidx from EVE_MASTER where gId=? and gPwd=?";
      
      try {
         pstmt = conn.prepareStatement(membersql); // sql 荑쇰━臾� ���湲�
         pstmt.setString(1, memberId); // 泥ル쾲吏� '?' 留ㅺ컻蹂��닔濡� 諛쏆븘�삩 'membeId'瑜� ����엯
         pstmt.setString(2, memberPwd); // �몢踰덉㎏ '?' 留ㅺ컻蹂��닔濡� 諛쏆븘�삩 'memberPwd'瑜� ����엯
         ResultSet memberrs = pstmt.executeQuery(); // 荑쇰━瑜� �떎�뻾�븳 寃곌낵瑜� rs�뿉 ����옣
         
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
      
      System.out.println("濡쒓렇�씤 �븳 �궗�엺���? "+user);
      
      return user;
   }
   /*
    *�븘�씠�뵒 以묐났 �솗�씤
    */
   public String idCheck(String mid) {

      System.out.println("MemberServiceImpl idCheck() �떎�뻾");

      String id = "";

      ResultSet rs = null;
      String sql = "select * from EVE_MEMBER where mid=?";

      System.out.println("sql");
      System.out.println("conn" + conn);
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mid);
         rs = pstmt.executeQuery();

         /* ResultSet��� if臾몄쓣 �넻�빐�꽌 next媛� 議댁옱�븯硫� 諛쏄쿋�떎! 瑜� �빐以섏빞�븳�떎. */
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
    * �븘�씠�뵒 李얘린 踰꾪듉 �겢由��떆 硫붿냼�뱶 (�솴�쁽�샇)
    */
   public String findId(String name, String phone) {

      System.out.println("MemberServiceImpl findId() �떎�뻾");

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

         /* ResultSet��� if臾몄쓣 �넻�빐�꽌 next媛� 議댁옱�븯硫� 諛쏄쿋�떎! 瑜� �빐以섏빞�븳�떎. */
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
         
         //�떎�쓬 �뻾�씠 議댁옱�븯硫�
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
   
   //醫낅퉰 硫ㅻ쾭 �젙蹂� �닔�젙
   public int memberModify(String midx, String mPwd, String mPhn, String mEmail) {
      int value= 0;
               //鍮꾨��踰덊샇 , �뿰�씫泥� , �씠硫붿씪
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
   //醫낅퉰 硫ㅻ쾭 �쉶�썝 �깉�눜�븯湲�
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
			
			//다음 행이 존재하면
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
	
	//종빈 멤버 정보 수정
	public int memberModify(String midx, String mPwd, String mPhn, String mEmail) {
		int value= 0;
					//비밀번호 , 연락처 , 이메일
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
	//종빈 멤버 회원 탈퇴하기
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