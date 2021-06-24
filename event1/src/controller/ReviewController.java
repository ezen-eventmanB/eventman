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


@WebServlet("/ReviewController")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReviewController() {
        super();
   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("-----ReviewController ����-----");
		
		
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

		
/*	��縮�� ���� ������ �ѷ��ִ� �κ�	*/
		
		if(str2.equals("EventMan_Review_Main.do")) {
			
			System.out.println("--if�� =>EventMan_Review_Main.do ����");
			
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectAll();

			request.setAttribute("reviewList", reviewList);
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.jsp"); 	
			rd.forward(request, response);
	
			
/*	�߰� �׺񿡼� ��ü Ŭ���� Ajax	*/			
		}else if(str2.equals("EventMan_Review_selectAll.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectAll.do ����");
			
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectAll();
			
			request.setAttribute("reviewList", reviewList);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
			
/*	�߰� �׺� ��� Ŭ���� ajax	*/			
		}else if(str2.equals("EventMan_Review_selectCompany.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectCompany.do ����");
			
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectCompany();
			
			request.setAttribute("reviewList", reviewList);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
			
/*	�߰� �׺� ���� Ŭ���� ajax	*/			
		}else if(str2.equals("EventMan_Review_selectUniversity.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectUniversity.do ����");
			
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectUniversity();
			
			request.setAttribute("reviewList", reviewList);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
			
/*	�߰� �׺� ���� Ŭ���� ajax	*/			
		}else if(str2.equals("EventMan_Review_selectStage.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectStage.do ����");
			
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectStage();
			
			request.setAttribute("reviewList", reviewList);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
			
/*	�߰� �׺� ��Ÿ Ŭ���� ajax	*/			
		}else if(str2.equals("EventMan_Review_selectxEeption.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectxEeption.do ����");
			
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectxEeption();
			
			request.setAttribute("reviewList", reviewList);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
			
/*	���� �󼼺��� ajax*/			
		}else if(str2.equals("EventMan_Review_detail.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_detail.do ����");
			
			int hidx = Integer.parseInt(request.getParameter("hidx"));
			
			System.out.println("�ĸ����� hidx = "+hidx);
			
			ReviewServiceImpl rsimpl = new ReviewServiceImpl();
			EvReviewVo erv = rsimpl.reviewSelectOne(hidx);
			
			request.setAttribute("erv", erv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Detail.jsp?hidx=hidx"); 	
			rd.forward(request, response);
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
