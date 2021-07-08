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
																
		String uri = request.getRequestURI();					
		int pathlength = request.getContextPath().length();		
		String str = uri.substring(pathlength);					
		String[] gubun = str.split("/");
		String str2 = gubun[1];

		System.out.println("");
		System.out.println("-----Front Controller-----");
		System.out.println("uri : "+uri);
		System.out.println("getContextPath() : "+request.getContextPath());
		System.out.println("str : "+str);
		System.out.println("str2 = "+str2);
		System.out.println("");

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		

		if(str2.equals("EventMan_Member")) {														
			MemberController mc = new MemberController();
			mc.doGet(request, response);
			
			//견적 신청 화면 이동
		}else if(str2.equals("EventMan_Cost")) {
			CostController cc = new CostController();
			cc.doGet(request, response);
			
			//리뷰 페이지 이동 
		}else if(str2.equals("EventMan_Review")) {
			ReviewController rc = new ReviewController();
			rc.doGet(request, response);
			
			//회사소개 페이지 이동
		}else if(str2.equals("EventMan_Company")) {
			MasterController ccc = new MasterController();
			ccc.doGet(request, response);
			
			//게시판 페이지 이동
		}else if(str2.equals("EventMan_Board")) {
			BoardController bc = new BoardController();
			bc.doGet(request, response);
			
			//마이페이지
		}else if(str2.equals("EventMan_Mypage")) {
			MemberController mmc = new MemberController();
			mmc.doGet(request, response);
			
			//마스터 페이지
		}else if(str2.equals("EventMan_Master")) {
			MasterController mc = new MasterController();
			mc.doGet(request, response);
			
			//메인 페이지
		}else if(str2.equals("EventMan_Main")) {
			MainController mc = new MainController();
			mc.doGet(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
