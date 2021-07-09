package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PageMaker;
import domain.SearchCriteria;
import service.ReviewServiceImpl;
import vo.EvReviewVo;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("-----MemberController 실행-----");
		
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
		
		
/*	메인 페이지로 이동	*/
		if(str2.equals("EventMan_Main.do")) {
			
			System.out.println("EventMan_Main.do if 문 실행 ");
			
			String page = request.getParameter("page");
			
			int page2=0;  
			if(page == null) { 
			page = "1";					
			}													
			page2 = Integer.parseInt(page);
													
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page2);	
			
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();

			int cnt = reviewDao.boardTotalCount("");
			System.out.println("cnt "+ cnt);

			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);	

			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectAll(page2);
			ReviewServiceImpl reviewdao = new ReviewServiceImpl();
			
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pm", pm);			
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Main/EventMan_Main.jsp"); 	
			rd.forward(request, response);

	
		}
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
