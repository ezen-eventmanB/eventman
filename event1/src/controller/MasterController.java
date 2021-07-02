package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MasterServiceImpl;


@WebServlet("/MasterController")
public class MasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MasterController() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("-----MasterController 실행-----");
		
		
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
		
		
/*	회사 소개	 */		
		if(str2.equals("EventMan_Company_Main.do")) {
			
			System.out.println("-----EventMan_Company_Main.do 실행-----");
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Company/EventMan_Company_Main.jsp"); 	
			rd.forward(request, response);
		
/*	master main 페이지로 이동	*/			
		}else if(str2.equals("EventMan_Master_Mainpage.do")) {
			
			System.out.println("-----EventMan_Master_Mainpage.do 실행-----");
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Master/EventMan_Master_Mainpage.jsp"); 	
			rd.forward(request, response);
			
/*	행사 리뷰 작성 페이지로 이동	*/
		}else if(str2.equals("EventMan_Review_Write.do")) {
			
			System.out.println("-----EventMan_Review_Write.do 실행-----");
			
			int gidx = Integer.parseInt( request.getParameter("gidx"));
			request.setAttribute("gidx", gidx);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Write.jsp");
			rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
