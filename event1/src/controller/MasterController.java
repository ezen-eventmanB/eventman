package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import service.BoardServiceImpl;
import service.CostServiceImpl;
import service.EventAskServiceImpl;
import service.MemberServiceImpl;
import service.MasterServiceImpl;
import service.ReviewServiceImpl;
import vo.EvMemberVo;
import vo.EvReviewVo;
import vo.EvBoardAskVo;
import vo.EvCostVo;

import org.imgscalr.Scalr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/MasterController")
public class MasterController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public MasterController() {
      super();

   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=utf-8");

      System.out.println("-----MasterController 실행-----");

      request.setCharacterEncoding("UTF-8");

      String uri = request.getRequestURI();
      System.out.println("uri" + uri);
      int pnamelength = request.getContextPath().length();
      System.out.println(pnamelength);
      String str = uri.substring(pnamelength);
      System.out.println("str = " + str);
      String[] str1 = str.split("/");
      String str2 = str1[2];

      System.out.println("str1 = " + str1[0]);
      System.out.println("str1 = " + str1[1]);
      System.out.println("str2 = " + str1[2]);

/* 회사 소개 */
      if (str2.equals("EventMan_Company_Main.do")) {

         System.out.println("-----EventMan_Company_Main.do 실행-----");
         
         BoardServiceImpl bdao = new BoardServiceImpl();
         String imgname = bdao.companyload();
         
         System.out.println("imgname"+imgname);
         request.setAttribute("imgname", imgname);
         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Company/EventMan_Company_Main.jsp");
         rd.forward(request, response);

/* master main 페이지로 이동 */
      } else if (str2.equals("EventMan_Master_Mainpage.do")) {

         System.out.println("-----EventMan_Master_Mainpage.do 실행-----");

         CostServiceImpl cdao = new CostServiceImpl();
         int value = cdao.allSelectCost();
         
         BoardServiceImpl bdao = new BoardServiceImpl();
         int value2 = bdao.allSelectBoard();
         

         request.setAttribute("value", value);
         request.setAttribute("value2", value2);
         
         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Master/EventMan_Master_Mainpage.jsp");
         rd.forward(request, response);

/* 행사 리뷰 작성 페이지로 이동 */
      } else if (str2.equals("EventMan_Review_Write.do")) {

         System.out.println("-----EventMan_Review_Write.do 실행-----");

         int gidx = Integer.parseInt(request.getParameter("gidx"));
         request.setAttribute("gidx", gidx);

         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Write.jsp");
         rd.forward(request, response);

/* 게시판 관리자 게시글 작성 페이지 이동 */
      } else if (str2.equals("EventMan_Master_Write.do")) {

         System.out.println("게시판 글 작성 페이지 이동");

         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Board/EventMan_Master_Write.jsp");
         rd.forward(request, response);
         
/* 관리자 회원 관리 페이지 이동 */
      } else if (str2.equals("EventMan_Master_Modify.do")) {

         MasterServiceImpl mdao = new MasterServiceImpl();

         ArrayList<EvMemberVo> alist = mdao.memberSelectAll();

         request.setAttribute("alist", alist);

         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Master/EventMan_Master_MemberList.jsp");
         rd.forward(request, response);

/* 행사 리뷰 작성 ACTION */
      } else if (str2.equals("EventMan_Review_Write_Action.do")) {

         System.out.println("-----EventMan_Review_Write_Action.do 실행-----");


			// 업로드 파일 경로
			// 나중에 웹서버로 공통된 경로로 올리게 된다.
			//String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\";
			String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\"; // 박종빈 경로

         // 저장 폴더
         String savedPath = "Advice_img";

         // 저장된 총 경로
         String saveFullPath = uploadPath + savedPath;

         int sizeLimit = 1024 * 1024 * 15;
         String fileName = null;
         String originFileName = null;
         System.out.println("saveFullPath = " + saveFullPath);

         // MultipartRequest 객체생성
         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8",
         new DefaultFileRenamePolicy());

         // 열거자에 파일Name속성의 이름을 담는다
         Enumeration files = multi.getFileNames();
         System.out.println("files = " + files);

         // 담긴 파일 객체의 Name값을 담는다.
         String file = (String) files.nextElement();
         System.out.println("file = " + file);

         // 저장되는 파일이름
         fileName = multi.getFilesystemName(file);
         System.out.println("fileName = " + fileName);

         // 원래파일 이름
         originFileName = multi.getOriginalFileName(file);

         System.out.println("originFileName = " + originFileName);

         String ThumbnailFileName = null;

         try {
            if (fileName != null)
               ThumbnailFileName = makeThumbnail(uploadPath, savedPath, fileName);
         } catch (Exception e) {
            e.printStackTrace();
         }

         String title = multi.getParameter("title");
         String target = multi.getParameter("target");
         String startdate = multi.getParameter("startdate");
         String enddate = multi.getParameter("enddate");
         String price = multi.getParameter("price");
         String staff = multi.getParameter("staff");
         String company = multi.getParameter("company");
         String content = multi.getParameter("content");
         String cata = multi.getParameter("cata");
         String loca = multi.getParameter("hloca");
         String people = multi.getParameter("people");
         int gidx = Integer.parseInt(multi.getParameter("gidx"));

         MasterServiceImpl mdao = new MasterServiceImpl();

         int value = mdao.insertReview(title, target, startdate, enddate, price, staff, company, content, fileName,
               cata, loca, people, gidx);

         if (value == 1) {
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
            rd.forward(request, response);
         } else {
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
            rd.forward(request, response);
         }

/* 행사 리뷰 삭제 action */
      } else if (str2.equals("EventMan_ReviewDelete.do")) {

         System.out.println("-----EventMan_ReviewDelete.do 실행-----");

         int value = 0;

         int hidx = Integer.parseInt(request.getParameter("hidx"));

         System.out.println("hidx : " + hidx);

         MasterServiceImpl mdao = new MasterServiceImpl();
         value = mdao.reviewDelete(hidx);

         System.out.println("이동만하면된다.");

         if (value == 1) {

            response.setContentType("text/html; charset=euc-kr");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('해당글이 삭제되었습니다.'); </script>");

            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
            rd.forward(request, response);
         } else {
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
            rd.forward(request, response);
         }

/* 행사리뷰 수정 화면이동 */
      } else if (str2.equals("EventMan_ReviewModify.do")) {

         System.out.println("-----EventMan_ReviewModify.do 실행-----");

         int hidx = Integer.parseInt(request.getParameter("hidx"));
         EvReviewVo erv = new EvReviewVo();
         ReviewServiceImpl rdao = new ReviewServiceImpl();
         erv = rdao.reviewSelectOne(hidx);

         request.setAttribute("erv", erv);
         request.setAttribute("hidx", hidx);
         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Modify.jsp");
         rd.forward(request, response);

/* 행사리뷰글 수정하기 action */
      } else if (str2.equals("EventMan_ReviewModifyAction.do")) {

         System.out.println("-----EventMan_ReviewModify.do 실행-----");

         int value = 0;

         int hidx = Integer.parseInt(request.getParameter("hidx"));
         String file = request.getParameter("uploadFile");
         String cata = request.getParameter("cata");
         String hloca = request.getParameter("hloca");
         String startdate = request.getParameter("startdate");
         String enddate = request.getParameter("enddate");
         String price = request.getParameter("price");
         String people = request.getParameter("people");
         String target = request.getParameter("target");
         String staff = request.getParameter("staff");
         String company = request.getParameter("company");
         String title = request.getParameter("title");
         String content = request.getParameter("content");

         MasterServiceImpl mdao = new MasterServiceImpl();
         value = mdao.modifyAction(hidx, file, cata, hloca, startdate, enddate, price, people, target, staff,
               company, title, content);

         System.out.println("행사리뷰수정하기 value : " + value);

         response.sendRedirect(request.getContextPath() + "/EventMan_Review/EventMan_Review_Main.do");



/* 견적신청함 리스트 페이지 연결 */
      } else if (str2.equals("EventMan_Master_AllCostList.do")) {

         System.out.println("견적신청함페이지 연결");
         
         MasterServiceImpl mdao = new MasterServiceImpl();
         ArrayList<EvCostVo> descalist = mdao.alldescCostList();

         request.setAttribute("descalist", descalist);

         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Master/EventMan_Master_AllCostList.jsp");
         rd.forward(request, response);

         
/*상담 신청함 페이지*/ 
      } else if (str2.equals("EventMan_Master_AllBoardList.do")) {

         System.out.println("상담페이지 신청 리스트 뿌려주기");

         MasterServiceImpl mdao = new MasterServiceImpl();
         ArrayList<EvBoardAskVo> boardlist = mdao.allboardList();

         request.setAttribute("boardlist", boardlist);

         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Master/EventMan_Master_AllBoardList.jsp");
         rd.forward(request, response);
   
      /*견적신청함 ajax 황현호*/
      }else if(str2.equals("EventMan_Master_ajax_costlist.do")) {
         
         System.out.println("견적신청 에이젝스 실행");

         String order = request.getParameter("order");
         String searchtype = request.getParameter("searchtype");
         String text = request.getParameter("text");
         String check = request.getParameter("check");

         System.out.println("order : "+order);
         System.out.println("serachtype : "+searchtype);
         System.out.println("text : "+text);
         
         MasterServiceImpl mdao = new MasterServiceImpl();
         ArrayList<EvCostVo> alist = mdao.ajaxcostlist(order, searchtype, text,check);
               
         request.setAttribute("alist", alist);
         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Master/EventMan_Master_AllCostList_Ajax.jsp");
         rd.forward(request, response);
         
         
      /*상담신청함 ajax 박종빈*/
      }else if(str2.equals("EventMan_Master_ajax_boardlist.do")) {
         
         System.out.println("상담 신청 ajax 실행");

         String order = request.getParameter("order");
         String searchtype = request.getParameter("searchtype");
         String text = request.getParameter("text");
         String check = request.getParameter("check");

         System.out.println("order : "+order);
         System.out.println("serachtype : "+searchtype);
         System.out.println("text : "+text);
         
         MasterServiceImpl mdao = new MasterServiceImpl();
         ArrayList<EvBoardAskVo> alist = mdao.ajaxboardlist(order, searchtype, text,check);
               
         
         System.out.println("test");
         
         
         request.setAttribute("alist", alist);
         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Master/EventMan_Master_AllBoardList_Ajax.jsp");
         rd.forward(request, response);         
         
/* 회사 소개 변경하기 페이지 이동 */
      } else if (str2.equals("EventMan_Company_Modify.do")) {

         System.out.println("EventMan_Company_Modify.do if문");

         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Company/EventMan_Company_Modify.jsp");
         rd.forward(request, response);
         
         
/* 회사 소개 이미지 변경하기 액션*/
      }else if(str2.equals("EventMan_CompanyModifyAction.do")) {
         
         System.out.println("회사 소개 이미지 변경하자~");
         
         //String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\";
         String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\"; // 박종빈 경로

         String savedPath = "filefolder";
         
         String saveFullPath = uploadPath + savedPath;
         
         String fileName = null;
         String originFileName = null;
         int sizeLimit = 1024 * 1024 * 15;
         
         // MultipartRequest 객체생성
         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8",
         new DefaultFileRenamePolicy());

         // 열거자에 파일Name속성의 이름을 담는다
         Enumeration files = multi.getFileNames();
         System.out.println("files = " + files);

         // 담긴 파일 객체의 Name값을 담는다.
         String file = (String) files.nextElement();
         System.out.println("file = " + file);

         // 저장되는 파일이름
         fileName = multi.getFilesystemName(file);
         System.out.println("fileName = " + fileName);

         // 원래파일 이름
         originFileName = multi.getOriginalFileName(file);

         System.out.println("originFileName = " + originFileName);

         
         MasterServiceImpl mdao = new MasterServiceImpl();
         int value = mdao.companyimgchang(fileName);
         
         if(value > 0 ) {
            System.out.println("회사 이미지 변경 성공");
            response.sendRedirect(request.getContextPath() + "/EventMan_Main/EventMan_Main.do");
         }else {
            System.out.println("회사 이미지 변경 실패");
         }
         
         
         
         
         
         
/* (진) 회원 정보 수정 화면 이동*/			
		 }else if(str2.equals("EventMan_Master_MemberModify.do")) {
		 					
			 		System.out.println("테스트");
			 
					int midx = Integer.parseInt(request.getParameter("midx"));
			 		
		 			System.out.println("midx 테스트"+midx);
		 			
		 			MasterServiceImpl mdao = new MasterServiceImpl(); // 생성
		 			
		 			EvMemberVo mvo1 = mdao.selectmember(midx);
		 			
		 			
		 			request.setAttribute("mvo2", mvo1);
		 			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Master/EventMan_Master_MemberDetail.jsp"); 	
		 			rd.forward(request, response);
		 
		 			
		 			
		 			
		 			
/* (진) 회원 정보 수정 Action */
		 } else if (str2.equals("EventMan_Master_MemberModifyAction.do")) {
			 
			 System.out.println("Action 테스트입니다.");
			 
			 //1. 값을 넘겨받는다
			 int midx = Integer.parseInt(request.getParameter("midx"));
	         String mType = request.getParameter("mType");
	         String mDelYn = request.getParameter("mDelYn");
	         
	         System.out.println(midx+mType+mDelYn);
	         
	         //수정 값
	         MasterServiceImpl mdao = new MasterServiceImpl();   // 객체생성
	         int value = mdao.MasterModify(midx, mType, mDelYn);
	         System.out.println("value:"+value);
	         
	         //수정이 제대로 된다면 이동
	         if (value >0)      
	            response.sendRedirect(request.getContextPath()+"/EventMan_Master/EventMan_Master_Modify.do");  
	         //수정이 되지 않으면 이동                                                          //파라미터로 midx값을 같이 넘겨줘야한다.
	         else {
	            response.sendRedirect(request.getContextPath()+"/EventMan_Master/EventMan_Master_Modify.do");  
	         }
		 			
		 			
		 }
	
	}      





   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doGet(request, response);

   }

   private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {

      // 올린 소스파일을 읽어드린다
      BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path + File.separator + fileName));
      // 이미지를 리사이징한다(높이 100에 맞춰서 원본이미지 비율을 유지한다)
      BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
      // 썸네일 풀경로
      String thumbnailPath = uploadPath + path + File.separator + "s-" + fileName;
      // 파일 객체생성
      File newFile = new File(thumbnailPath);
      // 확장자 추출
      String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
      // 썸네일 이미지 만들기(리사이징한 이미지를 해당 이미지형식으로 해당 위치에 파일 객체생성한다)
      ImageIO.write(destImg, formatName.toUpperCase(), newFile);

      // 썸네일 파일 이름 추출
      return thumbnailPath.substring((uploadPath + path).length()).replace(File.separatorChar, ' ');
   }
}