package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MasterServiceImpl;
import service.ReviewServiceImpl;
import vo.EvReviewVo;


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
			
			
/*	행사 리뷰 작성 ACTION*/			
		}else if(str2.equals("EventMan_Review_Write_Action.do")) {
			
			System.out.println("-----EventMan_Review_Write_Action.do 실행-----");
			
			String title = request.getParameter("title");
			String target = request.getParameter("target");
			String startdate = request.getParameter("startdate");
			String enddate = request.getParameter("enddate");
			String price = request.getParameter("price");
			String staff = request.getParameter("staff");
			String company = request.getParameter("company");
			String content = request.getParameter("company");
			String file = request.getParameter("uploadFile");
			String cata = request.getParameter("cata");
			String loca = request.getParameter("hloca");
			String people = request.getParameter("people");
			int gidx = Integer.parseInt( request.getParameter("gidx"));
			
			MasterServiceImpl mdao = new MasterServiceImpl();
			
			int value = mdao.insertReview(title,target, startdate, enddate, price, staff, company, content, file, cata, loca, people, gidx);
			
			if(value == 1) {
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
				rd.forward(request, response);
			}else{
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
				rd.forward(request, response);
			}
			
/*	행사 리뷰 삭제	action	*/			
		}else if(str2.equals("EventMan_ReviewDelete.do")) {

			System.out.println("-----EventMan_ReviewDelete.do 실행-----");
			
			int value=0;
			
			int hidx = Integer.parseInt(request.getParameter("hidx"));
			
			System.out.println("hidx : "+hidx);
			
			MasterServiceImpl mdao = new MasterServiceImpl();
			value = mdao.reviewDelete(hidx);

			System.out.println("이동만하면된다.");
			
			if(value == 1) {
				
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당글이 삭제되었습니다.'); </script>");
				
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
				rd.forward(request, response);
			}else{
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
				rd.forward(request, response);
			}
			

/*	행사리뷰 수정 화면이동	*/			
		}else if(str2.equals("EventMan_ReviewModify.do")) {

			System.out.println("-----EventMan_ReviewModify.do 실행-----");
			
			int hidx = Integer.parseInt( request.getParameter("hidx"));
			EvReviewVo erv = new EvReviewVo();
			ReviewServiceImpl rdao = new ReviewServiceImpl();
			erv = rdao.reviewSelectOne(hidx);
			
			request.setAttribute("erv", erv);
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Modify.jsp");
			rd.forward(request, response);
			
			
/*	행사리뷰글 수정하기 action*/			
		}else if(str2.equals("EventMan_ReviewModifyAction.do")) {

			
			
			
			
			System.out.println("-----EventMan_ReviewModify.do 실행-----");
			
			
			
		}

		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
