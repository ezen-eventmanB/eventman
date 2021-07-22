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
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import service.BoardServiceImpl;
import service.CostServiceImpl;
import service.MemberServiceImpl;
import vo.EvBoardAskVo;
import vo.EvCostVo;

@WebServlet("/CostController")
public class CostController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public CostController() {
      super();

   }  

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=utf-8");

      System.out.println("-----CostController 실행-----");  

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

      //견적신적 이동 부분
      if (str2.equals("EventMan_Cost.do")) {

         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Cost/EventMan_Cost.jsp");
         rd.forward(request, response);
      
      //견적 작성 보내주는 부분
      } else if (str2.equals("EventMan_Cost_Submit_Action.do")) {

         System.out.println("EventMan_Cost_Submit_Action 실행");
         
        String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\";
        //String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\";
         
         String savedPath = "Advice_img";
         
         String saveFullPath = uploadPath + savedPath;
         
         int sizeLimit = 1024 * 1024 * 15;
         
         String fileName = null;
         
         String originFileName = null;
         
         // MultipartRequest 객체생성
         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
         // 열거자에 파일Name속성의 이름을 담는다
         Enumeration files = multi.getFileNames();
         // 담긴 파일 객체의 Name값을 담는다.
         String file = (String)files.nextElement();
            System.out.println("file = "+file);
         //저장되는 파일이름
         fileName = multi.getFilesystemName(file); 
            System.out.println("fileName = "+fileName);
         //원래파일 이름
         originFileName = multi.getOriginalFileName(file);
            System.out.println("originFileName = "+originFileName);
         String ThumbnailFileName = null;
            try {
               if(fileName != null)
               ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
            } catch (Exception e) {
               e.printStackTrace();
            }
         String cName = multi.getParameter("cName"); // 견적 이름
         String cSdate = multi.getParameter("cSdate"); // 시작일
         String cEdate = multi.getParameter("cEdate"); // 종료일
         String cWday = multi.getParameter("cWday"); // 작성날 sysdate 로 받음
         
         String cText = multi.getParameter("cText"); // 내용
         String cFile2 = multi.getParameter("cFile"); // 견적 자료
         String cLoca = multi.getParameter("cLoca"); // 지역
         String cTarget = multi.getParameter("cTarget"); // 참여대상
         String cMethod = multi.getParameter("cMethod"); // 참여방식
         String cPrice = multi.getParameter("cPrice"); // 예산
         String cPeople = multi.getParameter("cPeople"); // 참여인원
         String midx = multi.getParameter("midx"); // midx 회원번호
         String[] cCata = multi.getParameterValues("cCata"); // 카테고리
         
         String totalCCata ="";
         for(int i=0; i<cCata.length;i++) {
            totalCCata = totalCCata +cCata[i];
         }
         System.out.println("totalCCata:"+totalCCata);

         HttpSession session = request.getSession();
         /*
          * String[] costbox = request.getParameterValues("costbox"); for(int i =0;
          * i<costbox.length; i++){ System.out.println(costbox[i]); }
          */
         System.out.println("test");

         CostServiceImpl costdao = new CostServiceImpl(); // 객체 생성
         int value = costdao.costInsert(cName, cSdate, cEdate, cWday, totalCCata, cText, fileName, cLoca, cTarget, cMethod,
               cPrice, cPeople, midx);

         if (value >= 1) {
            PrintWriter out = response.getWriter();
            response.sendRedirect(request.getContextPath() + "/EventMan_Mypage/EventMan_Mypage_Main.do?midx="+midx);
         } else {
            response.sendRedirect(request.getContextPath() + "/EventMan_Cost/EventMan_Cost.do");
            }
         
         
 /*   마이페이지 견적 리스트 화면   */         
         }else if(str2.equals("EventMan_Mypage_MyCostlist.do")) {

            System.out.println("EventMan_Mypage_MyCostlist.do if문");
            
            String midx = request.getParameter("midx");
            
            System.out.println("midx= "+midx);
            
            CostServiceImpl costdao = new CostServiceImpl();
            ArrayList alistcost = costdao.selectmycostlist(midx);
            
            request.setAttribute("alistcost", alistcost);
            
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyCostList.jsp");
            rd.forward(request, response);
         //완료 
         
         
         //마이페이지 견적 상세보기
         }else if(str2.equals("EventMan_Mypage_MyCostDetail.do")) {
            
            System.out.println("EventMan_Mypage_MyCostlistDetail.do if문");
            
            int cidx = Integer.parseInt(request.getParameter("cidx"));
            
            CostServiceImpl costdao = new CostServiceImpl();
            
            costdao.hitCount(cidx);
            
            EvCostVo covo = new EvCostVo();
            
            covo = costdao.costlistselectone(cidx);


            request.setAttribute("covo", covo);
            
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyCostDetail.jsp");
            rd.forward(request, response);         
            //완료
            
            
 /*  견적신청 수정 화면 이동 */
         }else if(str2.equals("EventMan_Mypage_MyCostModify.do")) {
            
            System.out.println("EventMan_Mypage_MyCostModify");
            
            int cidx = Integer.parseInt( request.getParameter("cidx"));
            
            CostServiceImpl costdao = new CostServiceImpl();
            EvCostVo covo = costdao.costlistselectone(cidx);
            
            request.setAttribute("covo", covo);
            
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyCostModify.jsp");
            rd.forward(request, response);
         
            
 /* 견적신청 삭제 액션 */
         }else if(str2.equals("EventMan_Mypage_MyCostDelete.do")) {
            
            int value=0;
            
            int cidx = Integer.parseInt(request.getParameter("cidx"));
            int midx = Integer.parseInt(request.getParameter("midx"));
            
            CostServiceImpl costdao = new CostServiceImpl();
            value = costdao.myPageCostDelete(cidx);
            
            System.out.println("value="+value);
            
            response.sendRedirect(request.getContextPath()+"/EventMan_Cost/EventMan_Mypage_MyCostlist.do?midx="+midx);
            
/*견적 수정 부분*/
         }else if(str2.equals("EventMan_Mypage_CostModify_Action.do")) {
            
            String cName = request.getParameter("cName"); // 견적 이름
            String cSdate = request.getParameter("cSdate"); // 시작일
            String cEdate = request.getParameter("cEdate"); // 종료일
            String cText = request.getParameter("cText"); // 내용
            String cFile2 = request.getParameter("cFile2"); // 견적 자료
            String cLoca = request.getParameter("cLoca"); // 지역
            String cTarget = request.getParameter("cTarget"); // 참여대상
            String cMethod = request.getParameter("cMethod"); // 참여방식
            String cPrice = request.getParameter("cPrice"); // 예산
            String cPeople = request.getParameter("cPeople"); // 참여인원

            int midx = Integer.parseInt(request.getParameter("midx"));
            int cidx = Integer.parseInt(request.getParameter("cidx"));
            
            String[] cCata = request.getParameterValues("cCata"); // 카테고리
            
            String totalCCata ="";
            for(int i=0; i<cCata.length;i++) {
               totalCCata = totalCCata +cCata[i];
            }
            
            System.out.println("totalCCata:"+totalCCata);
            CostServiceImpl costdao = new CostServiceImpl(); // 객체 생성
            int value = costdao.costModifyAction(cName, cSdate, cEdate ,totalCCata, cText, cFile2, cLoca, cTarget, cMethod,cPrice, cPeople, cidx);

            if(value >=0) {
               response.sendRedirect(request.getContextPath()+"/EventMan_Cost/EventMan_Mypage_MyCostlist.do?midx="+midx);

            } else {
               System.out.println("수정 실패!");
               }
            
            
            
/* 관리자가 견적 신청 삭제하기	*/            
         }else if(str2.equals("EventMan_Master_costdelete.do")) {
        	 
        	 System.out.println("마스터 견적신청 실행");
        	 
        	 int idx = Integer.parseInt(request.getParameter("idx"));
        	 
        	 CostServiceImpl cdao = new CostServiceImpl();
        	 int value = cdao.myPageCostDelete(idx);
        	 
        	 if(value > 0) {
        		 System.out.println("견적신청 삭제 성공");
            	 response.sendRedirect(request.getContextPath() + "/EventMan_Master/EventMan_Master_AllCostList.do");
        	 }else {
        		 System.out.println("삭제 실패");
        	 }
        	 
        	 
/*	관리자가 견적답변을 다는 기능	*/
         }else if(str2.equals("EventMan_Master_Reply.do")) {
        	 System.out.println("관리자가 답변 컨트롤러");
        	 
        	 int cidx = Integer.parseInt(request.getParameter("cidx"));
        	 String creply = request.getParameter("creply");

        	 System.out.println(cidx);
        	 System.out.println(creply);
        	 
        	 CostServiceImpl cdao = new CostServiceImpl();
        	 int value = cdao.masterreply(cidx, creply);
        	 
        	 if(value == 1) {
            	 response.sendRedirect(request.getContextPath() + "/EventMan_Board/EventMan_Mypage_CostDetail.do?cidx="+cidx);
        	 }else {
        		 System.out.println("@@답변등록실패했씁니다~");
        	 }
        	 
        	 
  /*	관리자가 견적 상세보기	*/      	 
         }else if(str2.equals("EventMan_Mypage_CostDetail.do")){
 			
 			System.out.println("견적상세보기");
 			
 			int cidx = Integer.parseInt(request.getParameter("cidx"));
             
             CostServiceImpl costdao = new CostServiceImpl();
             
             costdao.hitCount(cidx);
             
             EvCostVo covo = new EvCostVo();
             
             covo = costdao.costlistselectone(cidx);
             
             request.setAttribute("covo", covo);
             
 			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyCostDetail.jsp");
 			rd.forward(request, response);
 			
 			
 /*	관리자 상담완료 처리하기*/			
 		}else if(str2.equals("EventMan_replyFinsh.do")) {
 		
 			System.out.println("상담완료처리하기");
 			
 			int cidx = Integer.parseInt(request.getParameter("idx"));
 			
 			CostServiceImpl cdao = new CostServiceImpl();
 			
 			int value = cdao.finshreply(cidx);
 			
 			
			if(value > 0) {
				System.out.println("견적신청완료 처리 성공");
				response.sendRedirect(request.getContextPath() + "/EventMan_Master/EventMan_Master_AllCostList.do");
			}else {
				System.out.println("처리 실패");
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