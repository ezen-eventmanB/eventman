package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardServiceImpl;
import service.CostServiceImpl;
import service.MemberServiceImpl;
import vo.EvMemberVo;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
<<<<<<< HEAD
   private static final long serialVersionUID = 1L;
private ServletRequest request;
=======
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("-----MemberController ½ÇÇà-----");
		
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();														
		System.out.println("uri"+uri);																			
		int pnamelength = request.getContextPath().length();	
		String str = uri.substring(pnamelength);															
		System.out.println("str = "+str);												
		String[]str1 = str.split("/"); 
		String str2 = str1[2];
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

		System.out.println("str1 = "+str1[1]);	
		System.out.println("str2 = "+str1[2]);	
		
		
/* È¸¿ø°¡ÀÔ ÆäÀÌÁö·Î ÀÌµ¿*/
		if(str2.equals("EventMan_Member_Join.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Join.jsp"); 	
			rd.forward(request, response);

<<<<<<< HEAD
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
=======
/*È¸¿ø°¡ÀÔ Action ÆäÀÌÁö ÀÌµ¿*/			
		}else if(str2.equals("EventMan_Member_JoinAction.do")) {
			
				System.out.println("EventMan_Member_JoinAction ½ÇÇà");
			
				String mId = request.getParameter("mId");
				String mPwd = request.getParameter("mPwd");
				String mName = request.getParameter("mName");
				String mEmail = request.getParameter("mEmail");
				String mPhone = request.getParameter("mPhn");
				String mType = request.getParameter("mType");
				
				int value = 0;
												
				MemberServiceImpl md = new MemberServiceImpl();
				value = md.memberInsert(mId, mPwd, mName, mEmail, mPhone, mType);
				
				if(value >=1) {
					PrintWriter out = response.getWriter();
					response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_Login.do");	
				}else {
					response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_Join.do");		
				}	
/* ¾ÆÀÌµğ Áßº¹È®ÀÎ Action*/				
		}else if(str2.equals("EventMan_Member_IdCheckAction.do")) {	
			
			System.out.println("EventMan_Member_IdCheckAction");
			
			//Dao »ı¼º ÈÄ ¸Ş¼Òµå È£ÃâÇÏÀÚ
			MemberServiceImpl msdao = new MemberServiceImpl();
			
			String mid = request.getParameter("mid");
			
			System.out.println("-------³Ñ¾î¿Â °ª--------");
			System.out.println("mid = "+mid);
			
			//Àü´Ş¿Â °ªÀ» ¸Å°³º¯¼ö·Î ´øÁ®ÁÖÀÚ  
			String id = msdao.idCheck(mid);
			
			
			if(id=="") {
				response.getWriter().write("»ç¿ë°¡´ÉÇÑ ¾ÆÀÌµğ ÀÔ´Ï´Ù.");
			}else {
				response.getWriter().write("»ç¿ë °¡´ÉÇÏÁö ¾ÊÀº ¾ÆÀÌµğ ÀÔ´Ï´Ù.");
			}	
/* ·Î±×ÀÎ ÆäÀÌÁö·Î ÀÌµ¿*/
		}else if(str2.equals("EventMan_Member_Login.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Login.jsp"); 	
			rd.forward(request, response);		
			
/* ¸¶ÀÌ ÆäÀÌÁö·Î ÀÌµ¿*/		
		}else if(str2.equals("EventMan_Mypage_Main.do")) {
			
			System.out.println("EventMan_Mypage_Main.do if¹®");

			int midx = Integer.parseInt(request.getParameter("midx"));
			
			System.out.println("midx = "+midx);
			
			BoardServiceImpl boarddao = new BoardServiceImpl();
			int boardcount = boarddao.boardCount(midx);
			
			CostServiceImpl costdao = new CostServiceImpl();
			int costcount = costdao.costCount(midx);
			
			
			request.setAttribute("boardcount", boardcount);
			request.setAttribute("costcount", costcount);

			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Main.jsp"); 	
			rd.forward(request, response);
	
/*¾ÆÀÌµğ Ã£±â·Î ÀÌµ¿*/			
		}else if(str2.equals("EventMan_Member_Find_Id.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp"); 	
			rd.forward(request, response);
				
/*ºñ¹Ğ¹øÈ£ Ã£±â·Î ÀÌµ¿*/				
		}else if(str2.equals("EventMan_Member_Find_Pw.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp"); 	
			rd.forward(request, response);	
/*È¸¿ø Å»Åğ·Î ÀÌµ¿*/			
		}else if(str2.equals("EventMan_Mypage_Dropout.do")) {
				//session°ú ¿¬°á
				HttpSession session=request.getSession();
				//midx °ªÀ» getÀ¸·Î ¹Ş¾Æ¿È
				 int member_midx = (int)session.getAttribute("midx");
				
				 //dao¿Í ¿¬°á
				MemberServiceImpl mdao = new MemberServiceImpl();
				
				//vo¿¡ ´ã°ÜÁ® ÀÖ´Â midx ¸¦ °¡Á®¿È
			 	EvMemberVo mbvo = mdao.selectMember(member_midx);
								
			 	request.setAttribute("mbvo", mbvo);
			
				RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Dropout.jsp"); 	
				rd.forward(request, response);
				
/*È¸¿øÅ»Åğ ±â´É */		
		}else if (str2.equals("EventMan_Mypage_Dropout_Action.do")) {
					
				//1. ³Ñ°Ü¹Ş´Â´Ù
				String midx = request.getParameter("midx");
				
				int midx2 = Integer.parseInt(midx);
				String mPwd2 = request.getParameter("mPwd");
					
				//2.Ã³¸®ÇÑ´Ù
				MemberServiceImpl mdao = new MemberServiceImpl();
				int value = mdao.memberDelete(midx2, mPwd2);		
				System.out.println("value"+value);
				
				//3.ÀÌµ¿ÇÑ´Ù
			
			  if (value > 0) {
			  response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_LogoutAction.do");
			  }else {
			  response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Dropout.do"); }	
/* È¸¿øÁ¤º¸ ¼öÁ¤ È­¸é ÀÌµ¿*/			
		}else if(str2.equals("EventMan_Mypage_Modify.do")) {
			
//			String midx = request.getParameter("midx");
//			int midx2 = Integer.parseInt(midx);
			
			//session°ú ¿¬°á
			HttpSession session=request.getSession();
			//midx °ªÀ» getÀ¸·Î ¹Ş¾Æ¿È
			 int member_midx = (int)session.getAttribute("midx");
			
			 //dao¿Í ¿¬°á
			MemberServiceImpl mdao = new MemberServiceImpl();
			
			//vo¿¡ ´ã°ÜÁ® ÀÖ´Â midx ¸¦ °¡Á®¿È
		 	EvMemberVo mbvo = mdao.selectMember(member_midx);
							
		 	request.setAttribute("mbvo", mbvo);
		 	 	
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Modify.jsp"); 	
			rd.forward(request, response);
/*È¸¿øÁ¤º¸ ¼öÁ¤ Action ÀÌµ¿*/			
		}else if (str2.equals("EventMan_Mypage_Modify_Action.do")) {
			
			//1. °ªÀ» ³Ñ°Ü¹Ş´Â´Ù
			String midx = request.getParameter("midx");
			String mPwd = request.getParameter("mPwd");
			String mPhn = request.getParameter("mPhn");
			String mEmail = request.getParameter("mEmail");
			
			System.out.println(midx+mPwd+mPhn+mEmail);
			
			//¼öÁ¤ °ª
			MemberServiceImpl bd = new MemberServiceImpl();   // °´Ã¼»ı¼º
			int value = bd.memberModify(midx, mPwd, mPhn, mEmail);
			System.out.println("value:"+value);
			
			//¼öÁ¤ÀÌ Á¦´ë·Î µÈ´Ù¸é ÀÌµ¿
			if (value >0)		
				response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Main.do");  
			//¼öÁ¤ÀÌ µÇÁö ¾ÊÀ¸¸é ÀÌµ¿
			else {
				response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Modify.do");  
			}
			
/* ·Î±×ÀÎ Action ÆäÀÌÁö·Î ÀÌµ¿*/    
		}else if (str2.equals("EventMan_Member_LoginAction.do")) {
			String memberId  = request.getParameter("memberId");
			String memberPwd  = request.getParameter("memberPwd");
			System.out.println("memberId"+memberId);
			System.out.println("memberPwd"+memberPwd);
			
			//sql ¹Ş¾Æ¿À±â
			MemberServiceImpl md = new MemberServiceImpl();
			System.out.println("md"+md);
			
			String user = md.memberLoginCheck(memberId, memberPwd);	
			
			System.out.println("useruseruseruseruser : "+user);
			
			if(!user.equals("")) {
				
				String[] user1 = user.split("/");
				
				System.out.println("user1[0] = "+user1[0]);
				System.out.println("user1[1] = "+user1[1]);

				
				String usertype = user1[0];
				int useridx = Integer.parseInt(user1[1]);
				

				System.out.println("usertype = "+usertype);
				System.out.println("useridx = "+useridx);
				
				PrintWriter out = response.getWriter();
				
				if (usertype.equals("member")) { 
					HttpSession session = request.getSession();
					session.setAttribute("S_memberId", memberId);
					session.setAttribute("midx", useridx);
					
					out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.do'</script>");	
					
				}else if(usertype.equals("master")){
					HttpSession session = request.getSession();
					session.setAttribute("S_memberId", memberId);
					session.setAttribute("gidx", useridx);
					
					out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.do'</script>");
					
				}
				
			}else if(user.equals("")) {
				PrintWriter out = response.getWriter();				
				out.println("<script>$('#failModal').modal('show')</script>");				
				out.println("<script>alert('¾ÆÀÌµğ¿Í ºñ¹Ğ¹øÈ£¸¦ È®ÀÎÇØÁÖ¼¼¿ä.')</script>");
				out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Member/EventMan_Member_Login.do'</script>");


			}
			
			
/*	·Î±×¾Æ¿ô ½ÇÇà	*/
			
		}else if(str2.equals("EventMan_Member_LogoutAction.do")) {
				System.out.println("logout");
			
			
				HttpSession session = request.getSession();
				
				session.invalidate(); // ¸ğµç¼¼¼ÇÁ¤º¸ »èÁ¦
				PrintWriter out =response.getWriter();   
				
				out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.do';</script>");
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git
      
				
/* IDÃ£±â ÆäÀÌÁö·Î ÀÌµ¿*/
		}else if(str2.equals("EventMan_Member_Find_Id.do")) {		
			
			System.out.println("EventMan_Member_Find_Id.do if¹® ½ÇÇà");	
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp"); 	
			rd.forward(request, response);
			
			
/* IDÃ£±â Action ½ÇÇà*/
		}else if(str2.equals("EventMan_Member_Find_Id_Action.do")) {	
			
			System.out.println("EventMan_Member_Find_Id_Action.do if¹® ½ÇÇà");	
			
			//Dao »ı¼º ÈÄ ¸Ş¼Òµå È£ÃâÇÏÀÚ
			MemberServiceImpl msdao = new MemberServiceImpl();
			
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			System.out.println("-------³Ñ¾î¿Â °ª--------");
			System.out.println("name = "+name);
			System.out.println("phone="+phone);
			
			//Àü´Ş¿Â °ªÀ» ¸Å°³º¯¼ö·Î ´øÁ®ÁÖÀÚ  
			String id = msdao.findId(name, phone);
			
			
			if(id=="") {
				response.getWriter().write("È¸¿øÁ¤º¸°¡ ÀÏÄ¡ÇÏÁö ¾Ê½À´Ï´Ù.");
			}else {
				response.getWriter().write("È¸¿ø´ÔÀÇ ¾ÆÀÌµğ´Â "+id+" ÀÔ´Ï´Ù.");
			}

/* ÈŞ´ëÆù º»ÀÎ È®ÀÎ */
		}else if(str2.equals("EventMan_phonecheck.do")) {
				
			System.out.println("EventMan_phonecheck.do if¹® ½ÇÇà");	
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_phonecheck.jsp"); 	
			rd.forward(request, response);
	

/* º»ÀÎÈ®ÀÎ µ¥ÀÌÅÍ °¡Á®¿À±â*/						
		}else if(str2.equals("EventMan_phonecheck_Action.do")){
		
			
			System.out.println("EventMan_phonecheck_Action.do if¹®");
			
				
/*	¸¶ÀÌÆäÀÌÁö ¸®½ºÆ® È­¸é	*/			
		}else if(str2.equals("EventMan_Mypage_Myboardlist.do")) {
	
		System.out.println("EventMan_Mypage_Myboardlist.do if¹®");
		
		String midx = request.getParameter("midx");
		
		System.out.println("midx= "+midx);
		
		BoardServiceImpl boarddao = new BoardServiceImpl();
		ArrayList alistboard = boarddao.selectmyboardlist(midx);
		
		
		request.setAttribute("alistboard", alistboard);
		
		
		RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
		rd.forward(request, response);
		
	
	
/*	¸¶ÀÌÆäÀÌÁö ¸®½ºÆ® »ó¼¼º¸±â	*/		
		}else if(str2.equals("EventMan_Mypage_MyboardlistDetail.do")) {
			
			System.out.println("EventMan_Mypage_MyboardlistDetail.do if¹®");
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
			rd.forward(request, response);			
		}
		

	}
		
		
	

<<<<<<< HEAD
/*íšŒì›ê°€ì… Action í˜ì´ì§€ ì´ë™*/         
      }else if(str2.equals("EventMan_Member_JoinAction.do")) {
         
            System.out.println("EventMan_Member_JoinAction ì‹¤í–‰");
         
            String mId = request.getParameter("mId");
            String mPwd = request.getParameter("mPwd");
            String mName = request.getParameter("mName");
            String mEmail = request.getParameter("mEmail");
            String mPhone = request.getParameter("mPhn");
            String mType = request.getParameter("mType");
            
            int value = 0;
                                    
            MemberServiceImpl md = new MemberServiceImpl();
            value = md.memberInsert(mId, mPwd, mName, mEmail, mPhone, mType);
            
            if(value >=1) {
               PrintWriter out = response.getWriter();
               response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_Login.do");   
            }else {
               response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_Join.do");      
            }   
/* ì•„ì´ë”” ì¤‘ë³µí™•ì¸ Action*/            
      }else if(str2.equals("EventMan_Member_IdCheckAction.do")) {   
         
         System.out.println("EventMan_Member_IdCheckAction");
         
         //Dao ìƒì„± í›„ ë©”ì†Œë“œ í˜¸ì¶œí•˜ì
         MemberServiceImpl msdao = new MemberServiceImpl();
         
         String mid = request.getParameter("mid");
         
         System.out.println("-------ë„˜ì–´ì˜¨ ê°’--------");
         System.out.println("mid = "+mid);
         
         //ì „ë‹¬ì˜¨ ê°’ì„ ë§¤ê°œë³€ìˆ˜ë¡œ ë˜ì ¸ì£¼ì  
         String id = msdao.idCheck(mid);
         
         
         if(id=="") {
            response.getWriter().write("ì‚¬ìš©ê°€ëŠ¥í•œ ì•„ì´ë”” ì…ë‹ˆë‹¤.");
         }else {
            response.getWriter().write("ì‚¬ìš© ê°€ëŠ¥í•˜ì§€ ì•Šì€ ì•„ì´ë”” ì…ë‹ˆë‹¤.");
         }   
/* ë¡œê·¸ì¸ í˜ì´ì§€ë¡œ ì´ë™*/
      }else if(str2.equals("EventMan_Member_Login.do")) {
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Login.jsp");    
         rd.forward(request, response);   
=======
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

<<<<<<< HEAD
         
/* ë§ˆì´ í˜ì´ì§€ë¡œ ì´ë™*/      
      }else if(str2.equals("EventMan_Mypage_Main.do")) {
         
         System.out.println("EventMan_Mypage_Main.do ifë¬¸");
         
         System.out.println("request.getParameter(\"midx\")="+request.getParameter("midx"));
         
         int midx = Integer.parseInt( request.getParameter("midx"));
         
         System.out.println("midx = "+midx);
         
         BoardServiceImpl boarddao = new BoardServiceImpl();
         
         int boardcount = boarddao.boardCount(midx);
         
         request.setAttribute("boardcount", boardcount);
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Main.jsp");    
         rd.forward(request, response);

         
/*ì•„ì´ë”” ì°¾ê¸°ë¡œ ì´ë™*/         
      }else if(str2.equals("EventMan_Member_Find_Id.do")) {
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp");    
         rd.forward(request, response);
         
         
/*ë¹„ë°€ë²ˆí˜¸ ì°¾ê¸°ë¡œ ì´ë™*/            
      }else if(str2.equals("EventMan_Member_Find_Pw.do")) {
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp");    
         rd.forward(request, response);   
/*íšŒì› íƒˆí‡´ë¡œ ì´ë™*/         
      }else if(str2.equals("EventMan_Mypage_Dropout.do")) {
            //sessionê³¼ ì—°ê²°
            HttpSession session=request.getSession();
            //midx ê°’ì„ getìœ¼ë¡œ ë°›ì•„ì˜´
             int member_midx = (int)session.getAttribute("midx");
            
             //daoì™€ ì—°ê²°
            MemberServiceImpl mdao = new MemberServiceImpl();
            
            //voì— ë‹´ê²¨ì ¸ ìˆëŠ” midx ë¥¼ ê°€ì ¸ì˜´
             EvMemberVo mbvo = mdao.selectMember(member_midx);
                        
             request.setAttribute("mbvo", mbvo);
         
         
            RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Dropout.jsp");    
            rd.forward(request, response);
      
      }else if (str2.equals("EventMan_Mypage_Dropout_Action.do")) {
               
            //1. ë„˜ê²¨ë°›ëŠ”ë‹¤
            String midx = request.getParameter("midx");
            
            int midx2 = Integer.parseInt(midx);
            String mPwd2 = request.getParameter("mPwd");
               
            //2.ì²˜ë¦¬í•œë‹¤
            MemberServiceImpl mdao = new MemberServiceImpl();
            int value = mdao.memberDelete(midx2, mPwd2);      
            System.out.println("value"+value);
            
            //3.ì´ë™í•œë‹¤
         
           if (value > 0) {
           response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_LogoutAction.do");
           }else {
           response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Dropout.do"); }
              
               
/* íšŒì›ì •ë³´ ìˆ˜ì • í™”ë©´ ì´ë™*/         
      }else if(str2.equals("EventMan_Mypage_Modify.do")) {
         
//         String midx = request.getParameter("midx");
//         int midx2 = Integer.parseInt(midx);
         
         //sessionê³¼ ì—°ê²°
         HttpSession session=request.getSession();
         //midx ê°’ì„ getìœ¼ë¡œ ë°›ì•„ì˜´
          int member_midx = (int)session.getAttribute("midx");
         
          //daoì™€ ì—°ê²°
         MemberServiceImpl mdao = new MemberServiceImpl();
         
         //voì— ë‹´ê²¨ì ¸ ìˆëŠ” midx ë¥¼ ê°€ì ¸ì˜´
          EvMemberVo mbvo = mdao.selectMember(member_midx);
                     
          request.setAttribute("mbvo", mbvo);
              
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Modify.jsp");    
         rd.forward(request, response);
         
         
/*íšŒì›ì •ë³´ ìˆ˜ì • Action ì´ë™*/         
      }else if (str2.equals("EventMan_Mypage_Modify_Action.do")) {
         
         //1. ê°’ì„ ë„˜ê²¨ë°›ëŠ”ë‹¤
         String midx = request.getParameter("midx");
         String mPwd = request.getParameter("mPwd");
         String mPhn = request.getParameter("mPhn");
         String mEmail = request.getParameter("mEmail");
         
         System.out.println(midx+mPwd+mPhn+mEmail);
         
         //ìˆ˜ì • ê°’
         MemberServiceImpl bd = new MemberServiceImpl();   // ê°ì²´ìƒì„±
         int value = bd.memberModify(midx, mPwd, mPhn, mEmail);
         System.out.println("value:"+value);
         
         
         //ìˆ˜ì •ì´ ì œëŒ€ë¡œ ëœë‹¤ë©´ ì´ë™
         if (value >0)      
            
            response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Main.do");  
            
         //ìˆ˜ì •ì´ ë˜ì§€ ì•Šìœ¼ë©´ ì´ë™
         else {
            response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Modify.do");  
         }
         
/* ë¡œê·¸ì¸ Action í˜ì´ì§€ë¡œ ì´ë™*/    
      }else if (str2.equals("EventMan_Member_LoginAction.do")) {
         String memberId  = request.getParameter("memberId");
         String memberPwd  = request.getParameter("memberPwd");
         System.out.println("memberId"+memberId);
         System.out.println("memberPwd"+memberPwd);
         
         //sql ë°›ì•„ì˜¤ê¸°
         MemberServiceImpl md = new MemberServiceImpl();
         System.out.println("md"+md);
         
         String user = md.memberLoginCheck(memberId, memberPwd);   

         String[] user1 = user.split("/");
         
         System.out.println("user1[0] = "+user1[0]);
         System.out.println("user1[1] = "+user1[1]);
         
         String usertype = user1[0];
         int useridx = Integer.parseInt(user1[1]);
         

         System.out.println("usertype = "+usertype);
         System.out.println("useridx = "+useridx);
         
         PrintWriter out = response.getWriter();
         
         if (usertype.equals("member")) { 
            HttpSession session = request.getSession();
            session.setAttribute("S_memberId", memberId);
            session.setAttribute("midx", useridx);
            
            out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp'</script>");   
            
         }else if(usertype.equals("master")){
            HttpSession session = request.getSession();
            session.setAttribute("S_memberId", memberId);
            session.setAttribute("gidx", useridx);
            
            out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp'</script>");
            
         }else {

            out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Member/EventMan_Member_Login.do'</script>");
         }
         
         
/*   ë¡œê·¸ì•„ì›ƒ ì‹¤í–‰   */
         
      }else if(str2.equals("EventMan_Member_LogoutAction.do")) {
            System.out.println("logout");
         
         
            HttpSession session = request.getSession();
            
            session.invalidate(); // ëª¨ë“ ì„¸ì…˜ì •ë³´ ì‚­ì œ
            PrintWriter out =response.getWriter();   
            
            out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp';</script>");
      
            
/* IDì°¾ê¸° í˜ì´ì§€ë¡œ ì´ë™*/
      }else if(str2.equals("EventMan_Member_Find_Id.do")) {      
         
         System.out.println("EventMan_Member_Find_Id.do ifë¬¸ ì‹¤í–‰");   
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp");    
         rd.forward(request, response);
         
         
/* IDì°¾ê¸° Action ì‹¤í–‰*/
      }else if(str2.equals("EventMan_Member_Find_Id_Action.do")) {   
         
         System.out.println("EventMan_Member_Find_Id_Action.do ifë¬¸ ì‹¤í–‰");   
         
         //Dao ìƒì„± í›„ ë©”ì†Œë“œ í˜¸ì¶œí•˜ì
         MemberServiceImpl msdao = new MemberServiceImpl();
         
         String name = request.getParameter("name");
         String phone = request.getParameter("phone");
         
         System.out.println("-------ë„˜ì–´ì˜¨ ê°’--------");
         System.out.println("name = "+name);
         System.out.println("phone="+phone);
         
         //ì „ë‹¬ì˜¨ ê°’ì„ ë§¤ê°œë³€ìˆ˜ë¡œ ë˜ì ¸ì£¼ì  
         String id = msdao.findId(name, phone);
         
         
         if(id=="") {
            response.getWriter().write("íšŒì›ì •ë³´ê°€ ì¼ì¹˜í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤.");
         }else {
            response.getWriter().write("íšŒì›ë‹˜ì˜ ì•„ì´ë””ëŠ” "+id+" ì…ë‹ˆë‹¤.");
         }

/* íœ´ëŒ€í° ë³¸ì¸ í™•ì¸ */
      }else if(str2.equals("EventMan_phonecheck.do")) {
            
         System.out.println("EventMan_phonecheck.do ifë¬¸ ì‹¤í–‰");   
         
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_phonecheck.jsp");    
         rd.forward(request, response);
   

/* ë³¸ì¸í™•ì¸ ë°ì´í„° ê°€ì ¸ì˜¤ê¸°*/                  
      }else if(str2.equals("EventMan_phonecheck_Action.do")){
      
         
         System.out.println("EventMan_phonecheck_Action.do ifë¬¸");
         
            
/*   ë§ˆì´í˜ì´ì§€ ë¦¬ìŠ¤íŠ¸ í™”ë©´   */         
      }else if(str2.equals("EventMan_Mypage_Myboardlist.do")) {
   
      System.out.println("EventMan_Mypage_Myboardlist.do ifë¬¸");
      
      String midx = request.getParameter("midx");
      
      System.out.println("midx= "+midx);
      
      BoardServiceImpl boarddao = new BoardServiceImpl();
      ArrayList alistboard = boarddao.selectmyboardlist(midx);
      
      request.setAttribute("alistboard", alistboard);
      
      
      RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
      rd.forward(request, response);
      
   
   
/*   ë§ˆì´í˜ì´ì§€ ë¦¬ìŠ¤íŠ¸ ìƒì„¸ë³´ê¸°   */      
      }else if(str2.equals("EventMan_Mypage_MyboardlistDetail.do")) {
         
         System.out.println("EventMan_Mypage_MyboardlistDetail.do ifë¬¸");
         
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
         rd.forward(request, response);         
      
/* íšŒì› ë¦¬ìŠ¤íŠ¸ */     
   	  }else if(str2.equals("EventMan_Master_EventMan_Master_Member.do")) {
   		
    	  MemberServiceImpl md = new MemberServiceImpl();
	   
    	  ArrayList<EvMemberVo> alist = md.memberSelectAll();
	   
    	  request.setAttribute("alist", alist);
	   
          RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Master/EventMan_Master_Member.jsp");
          rd.forward(request, response);
         
   }
   	   
}   
      
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   doGet(request, response);
   }
   
}
=======
	
	
	/* (À±Áø) */
	
	
	
}
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git
