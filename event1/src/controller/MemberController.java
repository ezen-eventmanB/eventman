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
		
		System.out.println("str2="+str2);
		
		
		
		if(str2.equals("EventMan_Member_Find_Id.do")) {		

			System.out.println("EventMan_Member_Find_Id.do if문 실행");	

			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp"); 	
			rd.forward(request, response);
			
		}else if(str2.equals("EventMan_Member_Find_Id_Action.do")) {	

			System.out.println("EventMan_Member_Find_Id_Action.do if문 실행");	
			
			//Dao 생성 메소드 호출하자
			MemberServiceImpl msdao = new MemberServiceImpl();
			
			//메소드에 매개변수로 전달 될 값을 가져오자
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			System.out.println("-------넘어온 값--------");
			System.out.println("name = "+name);
			System.out.println("phone="+phone);
			
			//전달온 값을 매개변수로 던져주자
			String id = msdao.findId(name, phone);
			System.out.println("MemberServiceImpl.findId()실행");
			System.out.println("회원의 ID는 "+id+" 입니다.");
			 
			PrintWriter out = response.getWriter();	
			
			if(id == "") {
				out.println("<script>alert('일치하는 회원정보가 없습니다.'); </script>");
			}else{
				out.println("<script>alert('아이디는  ****입니다.'); </script>");
			}
			
			
			//페이지 이동이 아닌 id를 알려주는 modal을 띄우고 dodal에서 확인시 로그인페이지로 다시 보내줄것이다.
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp"); 	
			rd.forward(request, response);
		}
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
