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


import service.MemberServiceImpl;
import vo.EvMemberVo;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("-----MemberController 실행-----");
		
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();														
		System.out.println("uri"+uri);																			
		int pnamelength = request.getContextPath().length();	
		System.out.println(pnamelength);
		String str = uri.substring(pnamelength);															
		System.out.println("str = "+str);												
		String[]str1 = str.split("/"); 
		String str2 = str1[2];

		System.out.println("str0 = "+str1[0]);
		System.out.println("str1 = "+str1[1]);	
		System.out.println("str2 = "+str1[2]);	
		
		
/* 회원가입 페이지로 이동*/
		if(str2.equals("EventMan_Member_Join.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Join.jsp"); 	
			rd.forward(request, response);
			
			
/* 로그인 페이지로 이동*/
		}else if(str2.equals("EventMan_Member_Login.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Login.jsp"); 	

			rd.forward(request, response);	

			
/* 마이 페이지로 이동*/		
		}else if(str2.equals("EventMan_Mypage_Main.do")) {
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
			
			
		//회원 정보 삭제
//			}else if (str.equals("/board/boardDelete.do")) {
//				
//				String midx = request.getParameter("midx");
//				int midx2 = Integer.parseInt(midx);
//				
//				//dao 생성
//				MemberServiceImpl mdao = new MemberServiceImpl();
//				
//			 	EvMemberVo mbvo = mdao.selectMember(midx2);				
//				
//				request.setAttribute("mbvo", mbvo);			
//				
//				RequestDispatcher rd = request.getRequestDispatcher("/boardDelete.jsp");
//				rd.forward(request, response);
//		
//				
//				//회원 정보 삭제 action
//			}else if (str.equals("/board/boardDeleteAction.do")) {
//				
//				//1. 넘겨받는다
//				String midx = request.getParameter("midx");
//				int midx2 = Integer.parseInt(midx);
//				String password = request.getParameter("password");
//				
//				//2.처리한다
//				MemberServiceImpl mdao = new MemberServiceImpl();
//				int value = mdao.deleteMember(midx, password);			
//				
//			 	EvMemberVo mbvo = mdao.selectMember(midx2);
//				
//				//3.이동한다
//				if (value > 0) {  
//				response.sendRedirect(request.getContextPath()+"/board/boardList.do");	
//				}else {
//				response.sendRedirect(request.getContextPath()+"/board/boardDelete.do?bidx="+midx);					
//				}
//				}
		
				/*회원가입 Action 페이지 이동*/			

		}else if(str2.equals("EventMan_Mapge_ModifyAction.do")) {
					

/*회원가입 Action 페이지 이동*/			
		}else if(str.equals("/memberWriteAction.do")) {
				
				String mId = request.getParameter("mId");
				String mPwd = request.getParameter("mPwd");
				String mName = request.getParameter("mName");
				String mEmail = request.getParameter("mEmail");
				String mPhone = request.getParameter("mPhone");
				String mType = request.getParameter("mType");
				
				String ip = InetAddress.getLocalHost().getHostAddress();

				MemberServiceImpl md = new MemberServiceImpl();
				md.memberInsert(mId, mPwd, mName, mEmail, mPhone, mType);
						
				response.sendRedirect(request.getContextPath()+"/memberInsert.do");
			
				
/* 로그인 Action 페이지로 이동*/    
		}else if (str2.equals("EventMan_Member_LoginAction.do")) {
			String memberId  = request.getParameter("memberId");
			String memberPwd  = request.getParameter("memberPwd");
			System.out.println("memberId"+memberId);
			System.out.println("memberPwd"+memberPwd);
			
			//sql 받아오기
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
			
			
/*	로그아웃 실행	*/
			
		}else if(str2.equals("EventMan_Member_LogoutAction.do")) {
				
				HttpSession session = request.getSession();
				
				session.invalidate(); // 모든세션정보 삭제
				PrintWriter out =response.getWriter();   
				
				out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp';</script>");
      
				
/* ID찾기 페이지로 이동*/
		}else if(str2.equals("EventMan_Member_Find_Id.do")) {		
			
			System.out.println("EventMan_Member_Find_Id.do if문 실행");	
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp"); 	
			rd.forward(request, response);
			
			
/* ID찾기 Action 실행*/
		}else if(str2.equals("EventMan_Member_Find_Id_Action.do")) {	
			
			System.out.println("EventMan_Member_Find_Id_Action.do if문 실행");	
			
			//Dao 생성 후 메소드 호출하자
			MemberServiceImpl msdao = new MemberServiceImpl();
			
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			System.out.println("-------넘어온 값--------");
			System.out.println("name = "+name);
			System.out.println("phone="+phone);
			
			//전달온 값을 매개변수로 던져주자  
			String id = msdao.findId(name, phone);
			
			
			if(id=="") {
				response.getWriter().write("회원정보가 일치하지 않습니다.");
			}else {
				response.getWriter().write("회원님의 아이디는 "+id+" 입니다.");
			}

/* 휴대폰 본인 확인 */
		}else if(str2.equals("EventMan_phonecheck.do")) {
				
			System.out.println("EventMan_phonecheck.do if문 실행");	
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_phonecheck.jsp"); 	
			rd.forward(request, response);
	

/* 본인확인 데이터 가져오기*/						
		}else if(str2.equals("EventMan_phonecheck_Action.do")){
		
			
			System.out.println("EventMan_phonecheck_Action.do if문");
			
			
		}
		

	}
		
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

	
	
	/* (윤진) */
	
	
	
}
