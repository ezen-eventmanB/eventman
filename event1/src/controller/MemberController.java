package controller;

import java.io.IOException;
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

		System.out.println("str1 = "+str1[0]);
		System.out.println("str1 = "+str1[1]);	
		System.out.println("str2 = "+str1[2]);	
		if(str2.equals("EventMan_Member_Join.do")) {
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Join.jsp"); 	
			rd.forward(request, response);
		
		}else if(str2.equals("EventMan_Member_Login.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Login.jsp"); 	
			rd.forward(request, response);
			
		}else if(str2.equals("EventMan_Member_Find_Id.do")) {											
			System.out.println("EventMan_Member_Find_Id.do if문 실행");		
			
			MemberServiceImpl msdao = new MemberServiceImpl();
			
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			System.out.println("-------넘어온 값--------");
			System.out.println("name = "+name);
			System.out.println("phone="+phone);
			
			//전달온 값을 매개변수로 던져주자
			msdao.findId(name, phone);
			
			System.out.println("MemberServiceImpl.findId()실행");
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp"); 	
			rd.forward(request, response);
			
			
			//로그인 시 컨트롤러
		}else if (str.equals("/EventMan_Member/EventMan_Member_LoginAction.do")) {
			
			String memberId  = request.getParameter("memberId");
			String memberPwd  = request.getParameter("memberPwd");
			System.out.println("memberId"+memberId);
			System.out.println("memberPwd"+memberPwd);
		
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
