package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberServiceImpl;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public MemberController() {
        super();
    }


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
			
			/*로그아웃 실행*/
			
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

//로그인 시 컨트롤러 
		}else if (str.equals("/EventMan_Member/EventMan_MemberH_LoginAction.do")) {
			

/* 본인확인 데이터 가져오기*/						
		}else if(str2.equals("EventMan_phonecheck_Action.do")){
		
			
			System.out.println("EventMan_phonecheck_Action.do if문");
			
			
		}
		

	}
		
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
