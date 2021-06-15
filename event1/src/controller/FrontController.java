package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
																
																//http://localhost:8080/event1/event.jsp
		String uri = request.getRequestURI();					//프로젝트 + 파일경로  ex)/event1/event.jsp
		int pathlength = request.getContextPath().length();		//프로젝트path 	  ex)/event1   6
		String str = uri.substring(pathlength);					// ex) / event1   /event.jsp
		
		String[] gubun = str.split("/");
		String str2 = gubun[1];
		
		
		String str3 = request.getContextPath();
		String[] gubun2 = str3.split("/");
		String str4 = gubun2[1];
		
		System.out.println("str4 = "+str4);
		System.out.println("str2 = "+str2);
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
