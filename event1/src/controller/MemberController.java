package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardServiceImpl;
import service.MemberServiceImpl;
import vo.EvMemberVo;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
   private static final long serialVersionUID = 1L;


<<<<<<< HEAD
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
=======
/*회원가입 Action 페이지 이동*/			
		}else if(str2.equals("EventMan_Member_JoinAction.do")) {
			
				System.out.println("EventMan_Member_JoinAction 실행");
			
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
				/* 아이디 중복확인 Action*/				
		}else if(str2.equals("EventMan_Member_IdCheckAction.do")) {	
			
			System.out.println("EventMan_Member_IdCheckAction");
			
			//Dao 생성 후 메소드 호출하자
			MemberServiceImpl msdao = new MemberServiceImpl();
			
			String mid = request.getParameter("mid");
			
			System.out.println("-------넘어온 값--------");
			System.out.println("mid = "+mid);
			
			//전달온 값을 매개변수로 던져주자  
			String id = msdao.idCheck(mid);
			
			
			if(id=="") {
				response.getWriter().write("사용가능한 아이디 입니다.");
			}else {
				response.getWriter().write("사용 가능하지 않은 아이디 입니다.");
			}	
/* 로그인 페이지로 이동*/
		}else if(str2.equals("EventMan_Member_Login.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Login.jsp"); 	
			rd.forward(request, response);	

			
/* 마이 페이지로 이동*/		
		}else if(str2.equals("EventMan_Mypage_Main.do")) {
			
			System.out.println("EventMan_Mypage_Main.do if문");
			
			System.out.println("request.getParameter(\"midx\")="+request.getParameter("midx"));
			
			int midx = Integer.parseInt( request.getParameter("midx"));
			
			System.out.println("midx = "+midx);
			
			BoardServiceImpl boarddao = new BoardServiceImpl();
			
			int boardcount = boarddao.boardCount(midx);
			
			request.setAttribute("boardcount", boardcount);
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Main.jsp"); 	
			rd.forward(request, response);

			
/*아이디 찾기로 이동*/			
		}else if(str2.equals("EventMan_Member_Find_Id.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp"); 	
			rd.forward(request, response);
			
			
/*비밀번호 찾기로 이동*/				
		}else if(str2.equals("EventMan_Member_Find_Pw.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp"); 	
			rd.forward(request, response);	
/*회원 탈퇴로 이동*/			
		}else if(str2.equals("EventMan_Mypage_Dropout.do")) {
				//session과 연결
				HttpSession session=request.getSession();
				//midx 값을 get으로 받아옴
				 int member_midx = (int)session.getAttribute("midx");
				
				 //dao와 연결
				MemberServiceImpl mdao = new MemberServiceImpl();
				
				//vo에 담겨져 있는 midx 를 가져옴
			 	EvMemberVo mbvo = mdao.selectMember(member_midx);
								
			 	request.setAttribute("mbvo", mbvo);
			
			
				RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Dropout.jsp"); 	
				rd.forward(request, response);
		
		}else if (str2.equals("EventMan_Mypage_Dropout_Action.do")) {
					
				//1. 넘겨받는다
				String midx = request.getParameter("midx");
				
				int midx2 = Integer.parseInt(midx);
				String mPwd2 = request.getParameter("mPwd");
					
				//2.처리한다
				MemberServiceImpl mdao = new MemberServiceImpl();
				int value = mdao.memberDelete(midx2, mPwd2);		
				System.out.println("value"+value);
				
				//3.이동한다
			
			  if (value > 0) {
			  response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_LogoutAction.do");
			  }else {
			  response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Dropout.do"); }
			  	
					
/* 회원정보 수정 화면 이동*/			
		}else if(str2.equals("EventMan_Mypage_Modify.do")) {
			
//			String midx = request.getParameter("midx");
//			int midx2 = Integer.parseInt(midx);
			
			//session과 연결
			HttpSession session=request.getSession();
			//midx 값을 get으로 받아옴
			 int member_midx = (int)session.getAttribute("midx");
			
			 //dao와 연결
			MemberServiceImpl mdao = new MemberServiceImpl();
			
			//vo에 담겨져 있는 midx 를 가져옴
		 	EvMemberVo mbvo = mdao.selectMember(member_midx);
							
		 	request.setAttribute("mbvo", mbvo);
		 	 	
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Modify.jsp"); 	
			rd.forward(request, response);
			
			
/*회원정보 수정 Action 이동*/			
		}else if (str2.equals("EventMan_Mypage_Modify_Action.do")) {
			
			//1. 값을 넘겨받는다
			String midx = request.getParameter("midx");
			String mPwd = request.getParameter("mPwd");
			String mPhn = request.getParameter("mPhn");
			String mEmail = request.getParameter("mEmail");
			
			System.out.println(midx+mPwd+mPhn+mEmail);
			
			//수정 값
			MemberServiceImpl bd = new MemberServiceImpl();   // 객체생성
			int value = bd.memberModify(midx, mPwd, mPhn, mEmail);
			System.out.println("value:"+value);
			
			
			//수정이 제대로 된다면 이동
			if (value >0)		
				
				response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Main.do");  
				
			//수정이 되지 않으면 이동
			else {
				response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Modify.do");  
			}
			
/* 로그인 Action 페이지로 이동*/    
		}else if (str2.equals("EventMan_Member_LoginAction.do")) {
			String memberId  = request.getParameter("memberId");
			String memberPwd  = request.getParameter("memberPwd");
			System.out.println("memberId"+memberId);
			System.out.println("memberPwd"+memberPwd);
			
			//sql 받아오기
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
			
			
/*	로그아웃 실행	*/
			
		}else if(str2.equals("EventMan_Member_LogoutAction.do")) {
				System.out.println("logout");
			
			
				HttpSession session = request.getSession();
				
				session.invalidate(); // 모든세션정보 삭제
				PrintWriter out =response.getWriter();   
				
				out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp';</script>");
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git
      
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=utf-8");
      
      System.out.println("-----MemberController �떎�뻾-----");
      
      request.setCharacterEncoding("UTF-8");
      
      String uri = request.getRequestURI();                                          
      System.out.println("uri"+uri);                                                         
      int pnamelength = request.getContextPath().length();   
      String str = uri.substring(pnamelength);                                             
      System.out.println("str = "+str);                                    
      String[]str1 = str.split("/"); 
      String str2 = str1[2];

      System.out.println("str1 = "+str1[1]);   
      System.out.println("str2 = "+str1[2]);   
      
      
/* �쉶�썝媛��엯 �럹�씠吏�濡� �씠�룞*/
      if(str2.equals("EventMan_Member_Join.do")) {
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Join.jsp");    
         rd.forward(request, response);

/*�쉶�썝媛��엯 Action �럹�씠吏� �씠�룞*/         
      }else if(str2.equals("EventMan_Member_JoinAction.do")) {
    	  
    	  	MemberServiceImpl mdao = new MemberServiceImpl();
            String mId = request.getParameter("mId");
            String mPwd = request.getParameter("mPwd");
            String mName = request.getParameter("mName");
            String mEmail = request.getParameter("mEmail");
            String mPhone = request.getParameter("mPhn");
            String mType = request.getParameter("mType");
            
            int value = 0;
            
            
            	//dao �깮�꽑�븯�뒗 遺�遺�
            MemberServiceImpl md = new MemberServiceImpl();
            	//媛믪쓣 �엯�젰�떆耳쒖＜�뒗 遺�遺�
            value = md.memberInsert(mId, mPwd, mName, mEmail, mPhone, mType);
            
            	//媛믪씠 �젣���濡� �꽆�뼱媛�硫� 濡쒓렇�럹�씠吏�濡� �씠�룞
            if(value >=1) {
               response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_Login.do");
               
               //媛믪씠 �젣���濡� �꽆�뼱媛�吏� �븡�쑝硫� �쉶�썝媛��엯 �럹�씠吏�濡� �씠�룞
            }else {
               response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_Join.do");      
            }   
            
/* 濡쒓렇�씤 �럹�씠吏�濡� �씠�룞*/
      }else if(str2.equals("EventMan_Member_Login.do")) {
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Login.jsp");    

         rd.forward(request, response);   

         
/* 留덉씠 �럹�씠吏�濡� �씠�룞*/      
      }else if(str2.equals("EventMan_Mypage_Main.do")) {
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Main.jsp");    
         rd.forward(request, response);

         
/*�븘�씠�뵒 李얘린濡� �씠�룞*/         
      }else if(str2.equals("EventMan_Member_Find_Id.do")) {
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp");    
         rd.forward(request, response);
         
         
/*鍮꾨��踰덊샇 李얘린濡� �씠�룞*/            
      }else if(str2.equals("EventMan_Member_Find_Pw.do")) {
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp");    
         rd.forward(request, response);   
/*�쉶�썝 �깉�눜濡� �씠�룞*/         
      }else if(str2.equals("EventMan_Mypage_Dropout.do")) {
            //session怨� �뿰寃�
            HttpSession session=request.getSession();
            //midx 媛믪쓣 get�쑝濡� 諛쏆븘�샂
             int member_midx = (int)session.getAttribute("midx");
            
             //dao��� �뿰寃�
            MemberServiceImpl mdao = new MemberServiceImpl();
            
            //vo�뿉 �떞寃⑥졇 �엳�뒗 midx 瑜� 媛��졇�샂
             EvMemberVo mbvo = mdao.selectMember(member_midx);
                        
             request.setAttribute("mbvo", mbvo);
         
         
            RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Dropout.jsp");    
            rd.forward(request, response);
      
      }else if (str2.equals("EventMan_Mypage_Dropout_Action.do")) {
               
            //1. �꽆寃⑤컺�뒗�떎
            String midx = request.getParameter("midx");
            
            int midx2 = Integer.parseInt(midx);
            String mPwd2 = request.getParameter("mPwd");
               
            //2.泥섎━�븳�떎
            MemberServiceImpl mdao = new MemberServiceImpl();
            int value = mdao.memberDelete(midx2, mPwd2);      
            System.out.println("value"+value);
            
            //3.�씠�룞�븳�떎
         
           if (value > 0) {
           response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_LogoutAction.do");
           }else {
           response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Dropout.do"); }
              
               
/* �쉶�썝�젙蹂� �닔�젙 �솕硫� �씠�룞*/         
      }else if(str2.equals("EventMan_Mypage_Modify.do")) {
         
//         String midx = request.getParameter("midx");
//         int midx2 = Integer.parseInt(midx);
         
         //session怨� �뿰寃�
         HttpSession session=request.getSession();
         //midx 媛믪쓣 get�쑝濡� 諛쏆븘�샂
          int member_midx = (int)session.getAttribute("midx");
         
          //dao��� �뿰寃�
         MemberServiceImpl mdao = new MemberServiceImpl();
         
         //vo�뿉 �떞寃⑥졇 �엳�뒗 midx 瑜� 媛��졇�샂
          EvMemberVo mbvo = mdao.selectMember(member_midx);
                     
          request.setAttribute("mbvo", mbvo);
              
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Modify.jsp");    
         rd.forward(request, response);
         
         
/*�쉶�썝�젙蹂� �닔�젙 Action �씠�룞*/         
      }else if (str2.equals("EventMan_Mypage_Modify_Action.do")) {
         
         //1. 媛믪쓣 �꽆寃⑤컺�뒗�떎
         String midx = request.getParameter("midx");
         String mPwd = request.getParameter("mPwd");
         String mPhn = request.getParameter("mPhn");
         String mEmail = request.getParameter("mEmail");
         
         System.out.println(midx+mPwd+mPhn+mEmail);
         
         //�닔�젙 媛�
         MemberServiceImpl bd = new MemberServiceImpl();   // 媛앹껜�깮�꽦
         int value = bd.memberModify(midx, mPwd, mPhn, mEmail);
         System.out.println("value:"+value);
         
         
         //�닔�젙�씠 �젣���濡� �맂�떎硫� �씠�룞
         if (value >0)      
            
            response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Main.do");  
            
         //�닔�젙�씠 �릺吏� �븡�쑝硫� �씠�룞
         else {
            response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Modify.do");  
         }
         
/* 濡쒓렇�씤 Action �럹�씠吏�濡� �씠�룞*/    
      }else if (str2.equals("EventMan_Member_LoginAction.do")) {
         String memberId  = request.getParameter("memberId");
         String memberPwd  = request.getParameter("memberPwd");
         System.out.println("memberId"+memberId);
         System.out.println("memberPwd"+memberPwd);
         
         //sql 諛쏆븘�삤湲�
         MemberServiceImpl md = new MemberServiceImpl();
         System.out.println("md"+md);
         
         int midx = md.memberLoginCheck(memberId, memberPwd);   

         System.out.println(midx);
         

         PrintWriter out = response.getWriter();
         
         if (midx > 0) { 
            HttpSession session = request.getSession();
            session.setAttribute("S_memberId", memberId);
            session.setAttribute("midx", midx);
            
            out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp'</script>");   
         }else{
            out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Member/EventMan_Member_Login.do'</script>");
         }
         
         
/*   濡쒓렇�븘�썐 �떎�뻾   */
         
      }else if(str2.equals("EventMan_Member_LogoutAction.do")) {
            System.out.println("logout");
         
         
            HttpSession session = request.getSession();
            
            session.invalidate(); // 紐⑤뱺�꽭�뀡�젙蹂� �궘�젣
            PrintWriter out =response.getWriter();   
            
            out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp';</script>");
      
            
/* ID李얘린 �럹�씠吏�濡� �씠�룞*/
      }else if(str2.equals("EventMan_Member_Find_Id.do")) {      
         
         System.out.println("EventMan_Member_Find_Id.do if臾� �떎�뻾");   
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp");    
         rd.forward(request, response);
         
         
/* ID李얘린 Action �떎�뻾*/
      }else if(str2.equals("EventMan_Member_Find_Id_Action.do")) {   
         
         System.out.println("EventMan_Member_Find_Id_Action.do if臾� �떎�뻾");   
         
         //Dao �깮�꽦 �썑 硫붿냼�뱶 �샇異쒗븯�옄
         MemberServiceImpl msdao = new MemberServiceImpl();
         
         String name = request.getParameter("name");
         String phone = request.getParameter("phone");
         
         System.out.println("-------�꽆�뼱�삩 媛�--------");
         System.out.println("name = "+name);
         System.out.println("phone="+phone);
         
         //�쟾�떖�삩 媛믪쓣 留ㅺ컻蹂��닔濡� �뜕�졇二쇱옄  
         String id = msdao.findId(name, phone);
         
         
         if(id=="") {
            response.getWriter().write("�쉶�썝�젙蹂닿�� �씪移섑븯吏� �븡�뒿�땲�떎.");
         }else {
            response.getWriter().write("�쉶�썝�떂�쓽 �븘�씠�뵒�뒗 "+id+" �엯�땲�떎.");
         }

/* �쑕����룿 蹂몄씤 �솗�씤 */
      }else if(str2.equals("EventMan_phonecheck.do")) {
            
         System.out.println("EventMan_phonecheck.do if臾� �떎�뻾");   
         
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_phonecheck.jsp");    
         rd.forward(request, response);
   

/* 蹂몄씤�솗�씤 �뜲�씠�꽣 媛��졇�삤湲�*/                  
      }else if(str2.equals("EventMan_phonecheck_Action.do")){
      
         
         System.out.println("EventMan_phonecheck_Action.do if臾�");
         
            
/*   留덉씠�럹�씠吏� 由ъ뒪�듃 �솕硫�   */         
      }else if(str2.equals("EventMan_Mypage_Myboardlist.do")) {
   
      System.out.println("EventMan_Mypage_Myboardlist.do if臾�");
      
      String midx = request.getParameter("midx");
      
      System.out.println("midx= "+midx);
      
      BoardServiceImpl boarddao = new BoardServiceImpl();
      ArrayList alistboard = boarddao.selectmyboardlist(midx);
      
      request.setAttribute("alistboard", alistboard);
      
      
      RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
      rd.forward(request, response);
      
   
   
/*   留덉씠�럹�씠吏� 由ъ뒪�듃 �긽�꽭蹂닿린   */      
      }else if(str2.equals("EventMan_Mypage_MyboardlistDetail.do")) {
         
         System.out.println("EventMan_Mypage_MyboardlistDetail.do if臾�");
         
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
         rd.forward(request, response);         
      }
      

   }
      
      
   

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      doGet(request, response);
   }

   
   
   /* (�쑄吏�) */
   
   
   
}