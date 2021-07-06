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
			
String page = request.getParameter("page");
			
int page2=0;  
if(page == null) { 
	page = "1";					
}													
page2 = Integer.parseInt(page);
													
SearchCriteria scri = new SearchCriteria();
scri.setPage(page2);	
			
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();

int cnt = reviewDao.boardTotalCount();
System.out.println("cnt "+ cnt);

PageMaker pm = new PageMaker();
pm.setScri(scri);
pm.setTotalCount(cnt);	

			//<EvReviewVo> reviewList = reviewDao.reviewSelectAll();
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectAll(page2);
			ReviewServiceImpl reviewdao = new ReviewServiceImpl();
			
			request.setAttribute("reviewList", reviewList);
request.setAttribute("pm", pm);			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.jsp"); 	
			rd.forward(request, response);
	
			
/*	�߰� �׺񿡼� ��ü Ŭ���� Ajax	*/			
		}else if(str2.equals("EventMan_Review_selectAll.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectAll.do ����");
			
String page = request.getParameter("page");

int page2=0;  
if(page == null) { 
	page = "1";					
}													
page2 = Integer.parseInt(page);
													
SearchCriteria scri = new SearchCriteria();
scri.setPage(page2);	
			
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();

int cnt = reviewDao.boardTotalCount();
System.out.println("cnt "+ cnt);

PageMaker pm = new PageMaker();
pm.setScri(scri);
pm.setTotalCount(cnt);	

			//<EvReviewVo> reviewList = reviewDao.reviewSelectAll();
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectAll(page2);
			ReviewServiceImpl reviewdao = new ReviewServiceImpl();
			
			request.setAttribute("reviewList", reviewList);
request.setAttribute("pm", pm);	
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
			
/*	�߰� �׺� ��� Ŭ���� ajax	*/			
		}else if(str2.equals("EventMan_Review_selectCompany.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectCompany.do ����");
			
			String page = request.getParameter("page");

			int page2=0;  
			if(page == null) { 
				page = "1";					
			}													
			page2 = Integer.parseInt(page);
																
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page2);	
						
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();

			int cnt = reviewDao.boardTotalCount();
			System.out.println("cnt "+ cnt);

			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);	
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectCompany(page2);
			
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pm", pm);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
			
/*	�߰� �׺� ���� Ŭ���� ajax	*/			
		}else if(str2.equals("EventMan_Review_selectUniversity.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectUniversity.do ����");
			

			String page = request.getParameter("page");

			int page2=0;  
			if(page == null) { 
				page = "1";					
			}													
			page2 = Integer.parseInt(page);
																
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page2);	
						
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();

			int cnt = reviewDao.boardTotalCount();
			System.out.println("cnt "+ cnt);

			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);	
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectUniversity(page2);
			
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pm", pm);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
			
/*	�߰� �׺� ���� Ŭ���� ajax	*/			
		}else if(str2.equals("EventMan_Review_selectStage.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectStage.do ����");
			
			String page = request.getParameter("page");

			int page2=0;  
			if(page == null) { 
				page = "1";					
			}													
			page2 = Integer.parseInt(page);
																
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page2);	
						
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();

			int cnt = reviewDao.boardTotalCount();
			System.out.println("cnt "+ cnt);

			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);	
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectStage(page2);
			
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pm", pm);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
			
/*	�߰� �׺� ��Ÿ Ŭ���� ajax	*/			
		}else if(str2.equals("EventMan_Review_selectxEeption.do")) {
			
			System.out.println("--if�� => ajax EventMan_Review_selectxEeption.do ����");
			
			String page = request.getParameter("page");

			int page2=0;  
			if(page == null) { 
				page = "1";					
			}													
			page2 = Integer.parseInt(page);
																
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page2);	
						
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();

			int cnt = reviewDao.boardTotalCount();
			System.out.println("cnt "+ cnt);

			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);	
			
			ArrayList<EvReviewVo> reviewList = reviewDao.reviewSelectxEeption(page2);
			
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pm", pm);
			
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
		
			
/*	SELECT BOX ���ý�*/
		}else if(str2.equals("EventMan_Review_selectbox.do")) {

			System.out.println("--if�� => ajax EventMan_Review_selectbox.do ����");
			
			String val1 = request.getParameter("val1");
			String val2 = request.getParameter("val2");
			
			
			String page = request.getParameter("page");

			int page2=0;  
			if(page == null) { 
				page = "1";					
			}													
			page2 = Integer.parseInt(page);
																
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page2);	
						
			ReviewServiceImpl reviewDao = new ReviewServiceImpl();
			
			int cnt = reviewDao.boardTotalCount();
			System.out.println("cnt "+ cnt);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);	
			
			ArrayList<EvReviewVo> reviewList = reviewDao.selecBoxCata(val1,val2,page2);
			
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pm", pm);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
					
/* SEACH BOX �˻�*/				
		}else if(str2.equals("EventMan_Review_search.do")) {

			System.out.println("--if�� => ajax EventMan_Review_search.do ����");
			
			String val1 = request.getParameter("val1");
			String val2 = request.getParameter("val2");
			String val3 = request.getParameter("val3");
			
			String page = request.getParameter("page");

int page2=0;  
if(page == null) { 
	page = "1";					
}													
page2 = Integer.parseInt(page);
													
SearchCriteria scri = new SearchCriteria();
scri.setPage(page2);	
			
ReviewServiceImpl reviewDao = new ReviewServiceImpl();

int cnt = reviewDao.boardTotalCount();
System.out.println("cnt "+ cnt);

PageMaker pm = new PageMaker();
pm.setScri(scri);
pm.setTotalCount(cnt);	

ArrayList<EvReviewVo> reviewList = reviewDao.reviewSearch(val1,val2,val3,page2);

request.setAttribute("reviewList", reviewList);
request.setAttribute("pm", pm);
			

			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Ajax.jsp"); 	
			rd.forward(request, response);
			
		}
		
	
	}
		
		


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
