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
import service.EventAskServiceImpl;
import vo.EvBoardAskVo;


@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
        
       }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=utf-8");
      
      System.out.println("-----BoardController ì‹¤í–‰-----");
      
      
      request.setCharacterEncoding("UTF-8");

      String uri = request.getRequestURI();                                          
      System.out.println("uri"+uri);                                                         
      int pnamelength = request.getContextPath().length();   
      String str = uri.substring(pnamelength);                                             
      System.out.println("str = "+str);                                    
      String[]str1 = str.split("/"); 
      String str2 = str1[2];

<<<<<<< HEAD
      System.out.println("str1 = "+str1[1]);   
      System.out.println("str2 = "+str1[2]);   
      System.out.println("");
      
=======
		System.out.println("str1 = "+str1[1]);	
		System.out.println("str2 = "+str1[2]);	
		System.out.println("");
		

		
		if(str2.equals("EventMan_Board.do")) {	
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

<<<<<<< HEAD
      
      if(str2.equals("EventMan_Board.do")) {   
=======
			 System.out.println("EventMan_Board.do¹®");
			 
			 String gidx = request.getParameter("gidx");
			 
			 BoardServiceImpl boarddao = new BoardServiceImpl();
			 
			 ArrayList alistboard = boarddao.selectMasterboardlist(gidx);
			 
			 request.setAttribute("alistboard", alistboard);
			 
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_Board.jsp");
			rd.forward(request, response);
			
			//°Ô½ÃÆÇ ±Û ÀÛ¼º
		}else if(str2.equals("EventMan_BoardWrite.do")){
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_BoardWrite.jsp"); 	
			rd.forward(request, response);
		}else if(str2.equals("EventMan_BoardwriteAction.do")) {
			
			System.out.println("EventMan_BoardwriteAction ½ÇÇà");
				
				//¾÷·Îµå ÆÄÀÏ °æ·Î		
				//³ªÁß¿¡ À¥¼­¹ö·Î °øÅëµÈ °æ·Î·Î ¿Ã¸®°Ô µÈ´Ù.
				String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\"; //ÇöÈ£´Ô²¨
				//String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\"; //¹ÚÁ¾ºó °æ·Î
				//ÀúÀå Æú´õ
				String savedPath = "Advice_img";
				
				//ÀúÀåµÈ ÃÑ °æ·Î
				String saveFullPath = uploadPath + savedPath;
				
				int sizeLimit = 1024*1024*15;
				String fileName = null;
				String originFileName = null;
					System.out.println("saveFullPath = "+saveFullPath);
				
				//MultipartRequest °´Ã¼»ı¼º
				MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 

				//¿­°ÅÀÚ¿¡ ÆÄÀÏName¼Ó¼ºÀÇ ÀÌ¸§À» ´ã´Â´Ù
				Enumeration files = multi.getFileNames();
					System.out.println("files = "+files);
					
				//´ã±ä ÆÄÀÏ °´Ã¼ÀÇ Name°ªÀ» ´ã´Â´Ù.
				String file = (String)files.nextElement();
					System.out.println("file = "+file);
				
				//ÀúÀåµÇ´Â ÆÄÀÏÀÌ¸§
				fileName = multi.getFilesystemName(file); 
					System.out.println("fileName = "+fileName);
			
				//¿ø·¡ÆÄÀÏ ÀÌ¸§
				originFileName = multi.getOriginalFileName(file);
				
					System.out.println("originFileName = "+originFileName);
				
				String ThumbnailFileName = null;
						
				try {
					if(fileName != null)
					ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}	
				
				String cata = multi.getParameter("cata");
				String title = multi.getParameter("title");
				String content = multi.getParameter("content");
				String midx = multi.getParameter("midx");
				String hidx = multi.getParameter("hidx");
				
				EventAskServiceImpl askdao = new EventAskServiceImpl();
				int value = askdao.insertAdvice(cata, title, content, fileName, midx, hidx);
				
						
				if(value > 0) {
					System.out.println("¼º°ø »ó´ã½ÅÃ»±Û Àü¼Û ¼º°ø");
					request.setAttribute("midx", midx);
					response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Mypage_Main.do?midx="+midx);
				}else {
					System.out.println("½ÇÆĞ »ó´ã½ÅÃ»±Û Àü¼Û ½ÇÆĞ");
					
					PrintWriter out = response.getWriter();   
					
					out.println("<script>alert('»ó´ã ÀÛ¼º ½ÇÆĞ');</script>");
				}
				 
				
				
/*	»ó´ãÇÏ±â ÆäÀÌÁö·Î ¿¬°á	*/			
		}else if(str2.equals("EventMan_Advicewrite.do")){
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_Advicewrite.jsp"); 	
			rd.forward(request, response);	
/*	»ó´ãÇÏ±â ÀÛ¼º ¿Ï·áÇÏ±â	*/			
		}else if(str2.equals("EventMan_AdvicewriteAction.do")) {
			
		System.out.println("--if¹® EventMan_AdvicewriteAction ½ÇÇà");
			
			//¾÷·Îµå ÆÄÀÏ °æ·Î		
			//³ªÁß¿¡ À¥¼­¹ö·Î °øÅëµÈ °æ·Î·Î ¿Ã¸®°Ô µÈ´Ù.
			String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\"; //ÇöÈ£´Ô²¨
			//String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\"; //¹ÚÁ¾ºó °æ·Î
			//ÀúÀå Æú´õ
			String savedPath = "Advice_img";
			
			//ÀúÀåµÈ ÃÑ °æ·Î
			String saveFullPath = uploadPath + savedPath;
			
			int sizeLimit = 1024*1024*15;
			String fileName = null;
			String originFileName = null;
				System.out.println("saveFullPath = "+saveFullPath);
			
			//MultipartRequest °´Ã¼»ı¼º
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

<<<<<<< HEAD
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_Board.jsp");    
         rd.forward(request, response);
=======
			//¿­°ÅÀÚ¿¡ ÆÄÀÏName¼Ó¼ºÀÇ ÀÌ¸§À» ´ã´Â´Ù
			Enumeration files = multi.getFileNames();
				System.out.println("files = "+files);
				
			//´ã±ä ÆÄÀÏ °´Ã¼ÀÇ Name°ªÀ» ´ã´Â´Ù.
			String file = (String)files.nextElement();
				System.out.println("file = "+file);
			
			//ÀúÀåµÇ´Â ÆÄÀÏÀÌ¸§
			fileName = multi.getFilesystemName(file); 
				System.out.println("fileName = "+fileName);
		
			//¿ø·¡ÆÄÀÏ ÀÌ¸§
			originFileName = multi.getOriginalFileName(file);
			
				System.out.println("originFileName = "+originFileName);
			
			String ThumbnailFileName = null;
					
			try {
				if(fileName != null)
				ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
			String cata = multi.getParameter("cata");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String midx = multi.getParameter("midx");
			String hidx = multi.getParameter("hidx");
			
			EventAskServiceImpl askdao = new EventAskServiceImpl();
			int value = askdao.insertAdvice(cata, title, content, fileName, midx, hidx);
			
					
			if(value > 0) {
				System.out.println("¼º°ø »ó´ã½ÅÃ»±Û Àü¼Û ¼º°ø");
				request.setAttribute("midx", midx);
				response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Mypage_Main.do?midx="+midx);
			}else {
				System.out.println("½ÇÆĞ »ó´ã½ÅÃ»±Û Àü¼Û ½ÇÆĞ");
				
				PrintWriter out = response.getWriter();   
				
				out.println("<script>alert('»ó´ã ÀÛ¼º ½ÇÆĞ');</script>");
			}
			
			
/*	¸¶ÀÌÆäÀÌÁö ¸®½ºÆ® È­¸é	*/			
		}else if(str2.equals("EventMan_Mypage_Myboardlist.do")) {
	
		System.out.println("EventMan_Mypage_Myboardlist.do if¹®");
		
		String midx = request.getParameter("midx");
		
		System.out.println("midx= "+midx);
		
		BoardServiceImpl boarddao = new BoardServiceImpl();
		ArrayList alistboard = boarddao.selectmyboardlist(midx);
		
		request.setAttribute("alistboard", alistboard);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
		rd.forward(request, response);
		
/*	¸¶ÀÌÆäÀÌÁö °Ô½Ã±Û »ó¼¼º¸±â	*/		
		}else if(str2.equals("EventMan_Mypage_MyboardlistDetail.do")) {
			
			System.out.println("EventMan_Mypage_MyboardlistDetail.do if¹®");
			
			int bidx = Integer.parseInt(request.getParameter("bidx"));
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

/*   ìƒë‹´í•˜ê¸° í˜ì´ì§€ë¡œ ì—°ê²°   */         
      }else if(str2.equals("EventMan_Advicewrite.do")){
         
//         int hidx = Integer.parseInt(request.getParameter("hidx"));
//         
//         System.out.println("hidxhidxhidxhidxhidxhidx   =   "+hidx);
//         
//         request.setAttribute("hidx", hidx);
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_Advicewrite.jsp");    
         rd.forward(request, response);
         
/*   ìƒë‹´í•˜ê¸° ì‘ì„± ì™„ë£Œí•˜ê¸°   */         
      }else if(str2.equals("EventMan_AdvicewriteAction.do")) {
         
      System.out.println("--ifë¬¸ EventMan_AdvicewriteAction ì‹¤í–‰");
         
         //ì—…ë¡œë“œ íŒŒì¼ ê²½ë¡œ      
         //ë‚˜ì¤‘ì— ì›¹ì„œë²„ë¡œ ê³µí†µëœ ê²½ë¡œë¡œ ì˜¬ë¦¬ê²Œ ëœë‹¤.
         String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\";
         
         //ì €ì¥ í´ë”
         String savedPath = "Advice_img";
         
         //ì €ì¥ëœ ì´ ê²½ë¡œ
         String saveFullPath = uploadPath + savedPath;
         
         int sizeLimit = 1024*1024*15;
         String fileName = null;
         String originFileName = null;
            System.out.println("saveFullPath = "+saveFullPath);
         
         //MultipartRequest ê°ì²´ìƒì„±
         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 

<<<<<<< HEAD
         //ì—´ê±°ìì— íŒŒì¼Nameì†ì„±ì˜ ì´ë¦„ì„ ë‹´ëŠ”ë‹¤
         Enumeration files = multi.getFileNames();
            System.out.println("files = "+files);
            
         //ë‹´ê¸´ íŒŒì¼ ê°ì²´ì˜ Nameê°’ì„ ë‹´ëŠ”ë‹¤.
         String file = (String)files.nextElement();
            System.out.println("file = "+file);
         
         //ì €ì¥ë˜ëŠ” íŒŒì¼ì´ë¦„
         fileName = multi.getFilesystemName(file); 
            System.out.println("fileName = "+fileName);
      
         //ì›ë˜íŒŒì¼ ì´ë¦„
         originFileName = multi.getOriginalFileName(file);
         
            System.out.println("originFileName = "+originFileName);
         
         String ThumbnailFileName = null;
               
         try {
            if(fileName != null)
            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
         } catch (Exception e) {
            e.printStackTrace();
         }   
         
         String cata = multi.getParameter("cata");
         String title = multi.getParameter("title");
         String content = multi.getParameter("content");
         String midx = multi.getParameter("midx");
         String hidx = multi.getParameter("hidx");
         
         EventAskServiceImpl askdao = new EventAskServiceImpl();
         int value = askdao.insertAdvice(cata, title, content, fileName, midx, hidx);
         
               
         if(value > 0) {
            System.out.println("ì„±ê³µ ìƒë‹´ì‹ ì²­ê¸€ ì „ì†¡ ì„±ê³µ");
            response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Mypage_Main.do");   
         }else {
            System.out.println("ì‹¤íŒ¨ ìƒë‹´ì‹ ì²­ê¸€ ì „ì†¡ ì‹¤íŒ¨");
            
            PrintWriter out = response.getWriter();   
            
            out.println("<script>alert('ìƒë“¬ê¸€ ì‘ì„± ì‹¤íŒ¨');</script>");
         }
         
         
/*   ë§ˆì´í˜ì´ì§€ ë¦¬ìŠ¤íŠ¸ í™”ë©´   */         
      }else if(str2.equals("EventMan_Mypage_Myboardlist.do")) {
   
      System.out.println("EventMan_Mypage_Myboardlist.do ifë¬¸");
      
      String midx = request.getParameter("midx");
      
      System.out.println("midx= "+midx);
      
      BoardServiceImpl boarddao = new BoardServiceImpl();
      ArrayList alistboard = boarddao.selectmyboardlist(midx);
      
      request.setAttribute("alistboard", alistboard);
      
      
      RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
      rd.forward(request, response);
      
   
   
/*   ë§ˆì´í˜ì´ì§€ ê²Œì‹œê¸€ ìƒì„¸ë³´ê¸°   */      
      }else if(str2.equals("EventMan_Mypage_MyboardlistDetail.do")) {
         
         System.out.println("EventMan_Mypage_MyboardlistDetail.do ifë¬¸");
         
         int bidx = Integer.parseInt(request.getParameter("bidx"));

         BoardServiceImpl boarddao = new BoardServiceImpl();
=======
			boarddao.hitCount(bidx);
			
			EvBoardAskVo bavo = new EvBoardAskVo();
			
			bavo = boarddao.boardlistselectone(bidx);
					
			request.setAttribute("bavo", bavo);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
			rd.forward(request, response);			
			
			
/* °Ô½Ã±Û ¼öÁ¤ÇÏ±â·Î ÀÌµ¿	*/			
		}else if(str2.equals("EventMan_Mypage_BoardModify.do")) {
			
			System.out.println("EventMan_Mypage_BoardModify.do if¹®");
			
			int bidx = Integer.parseInt( request.getParameter("bidx"));
			
			BoardServiceImpl boarddao = new BoardServiceImpl();
			EvBoardAskVo bavo = boarddao.boardModify(bidx);
			
			request.setAttribute("bavo", bavo);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyBoardModify.jsp");
			rd.forward(request, response);
			
			
/*	°Ô½Ã±Û ¼öÁ¤ÇÏ±â ¾×¼Ç	*/			
		}else if(str2.equals("EventMan_Mypage_BoardModify_Action.do")) {
			
			System.out.println("EventMan_Mypage_BoardModify_Action.do if¹®");
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			String file = request.getParameter("file");
			
			System.out.println("bidx="+bidx);
			System.out.println("title="+title);
			System.out.println("content="+content);
			
			BoardServiceImpl boarddao = new BoardServiceImpl();
			int value = boarddao.boardModifyAction(bidx, title, content, file);			
			
			System.out.println("value = "+value);
			
			if(value == 1) {
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

<<<<<<< HEAD
         boarddao.hitCount(bidx);
         
         EvBoardAskVo bavo = new EvBoardAskVo();
         
         bavo = boarddao.boardlistselectone(bidx);
               
         request.setAttribute("bavo", bavo);
         
         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
         rd.forward(request, response);         
         
         
/* ê²Œì‹œê¸€ ìˆ˜ì •í•˜ê¸°ë¡œ ì´ë™   */         
      }else if(str2.equals("EventMan_Mypage_BoardModify.do")) {
         
         System.out.println("EventMan_Mypage_BoardModify.do ifë¬¸");
         
         int bidx = Integer.parseInt( request.getParameter("bidx"));
         
         BoardServiceImpl boarddao = new BoardServiceImpl();
         EvBoardAskVo bavo = boarddao.boardModify(bidx);
         
         request.setAttribute("bavo", bavo);
         
         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_BoardModify.jsp");
         rd.forward(request, response);
         
         
/*   ê²Œì‹œê¸€ ìˆ˜ì •í•˜ê¸° ì™„ë£Œ   */         
      }else if(str2.equals("EventMan_Mypage_BoardModify_Action.do")) {
         
         System.out.println("EventMan_Mypage_BoardModify_Action.do ifë¬¸");
         
         String title = request.getParameter("title");
         String content = request.getParameter("content");
         int bidx = Integer.parseInt(request.getParameter("bidx"));
=======
				request.setAttribute("bidx", bidx);
				 
				EvBoardAskVo bavo = new EvBoardAskVo();
				
				BoardServiceImpl boarddao1 = new BoardServiceImpl();
				  
				bavo = boarddao1.boardlistselectone(bidx);
				  
				request.setAttribute("bavo", bavo);
				
				 System.out.println("value°¡ 1ÀÔ´Ï´Ù ÆäÀÌÁö ÀÌµ¿ÇÕ´Ï´Ù.");
				
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
				rd.forward(request, response);
				
			}else {
				System.out.println("°Ô½Ã±Û ¼öÁ¤ÈÄ »ó¼¼È­¸é ÆäÀÌÁöÀÌµ¿ ½ÇÆĞ");
			}
		
/*	°Ô½Ã±Û »èÁ¦ÇÏ±â	*/			
		}else if(str2.equals("EventMan_Mypage_MyboardDelet.do")) {
			
			System.out.println("EventMan_Mypage_MyboardDelet.do if¹®ÀÔ¤¤´Ù.");
			
			int value=0;
			
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			System.out.println("bidx = "+bidx);
			BoardServiceImpl boarddao = new BoardServiceImpl();
			
			value = boarddao.myPageBoardDelet(bidx);
			
			System.out.println("¸Ş¼Òµå Ã³¸®°á°ú "+value);
			
			
			if(value==1) {
				
				String midx = request.getParameter("midx");
				
				System.out.println("midx= "+midx);
				
				BoardServiceImpl boarddao1 = new BoardServiceImpl();
				ArrayList alistboard = boarddao1.selectmyboardlist(midx);
				
				System.out.println("¼º°øÀÔ´Ï´Ù.");
				request.setAttribute("alistboard", alistboard);
				
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
				rd.forward(request, response);
			}else {
				
				System.out.println("½ÇÆĞÀÔ´Ï´Ù.");
			}
		}	
		
		
	}
	
>>>>>>> branch 'master' of https://github.com/ezen-eventmanB/eventman.git

         System.out.println("bidx="+bidx);
         System.out.println("title="+title);
         System.out.println("content="+content);
         
         BoardServiceImpl boarddao = new BoardServiceImpl();
         int value = boarddao.boardModifyAction(bidx, title, content);         
         
         System.out.println("value = "+value);
         
         if(value == 1) {

            request.setAttribute("bidx", bidx);
             
            EvBoardAskVo bavo = new EvBoardAskVo();
            
            BoardServiceImpl boarddao1 = new BoardServiceImpl();
              
            bavo = boarddao1.boardlistselectone(bidx);
              
            request.setAttribute("bavo", bavo);
            
             System.out.println("valueê°€ 1ì…ë‹ˆë‹¤ í˜ì´ì§€ ì´ë™í•©ë‹ˆë‹¤.");
            
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
            rd.forward(request, response);
            
         }else {
            System.out.println("ê²Œì‹œê¸€ ìˆ˜ì •í›„ ìƒì„¸í™”ë©´ í˜ì´ì§€ì´ë™ ì‹¤íŒ¨");
         }
      
/*   ê²Œì‹œê¸€ ì‚­ì œí•˜ê¸°   */         
      }else if(str2.equals("EventMan_Mypage_MyboardDelet.do")) {
         
         System.out.println("EventMan_Mypage_MyboardDelet.do ifë¬¸ì…ã„´ë‹¤.");
         
         int value=0;
         
         int bidx = Integer.parseInt(request.getParameter("bidx"));
         System.out.println("bidx = "+bidx);
         BoardServiceImpl boarddao = new BoardServiceImpl();
         
         value = boarddao.myPageBoardDelet(bidx);
         
         System.out.println("ë©”ì†Œë“œ ì²˜ë¦¬ê²°ê³¼ "+value);
         
         
         if(value==1) {
            
            String midx = request.getParameter("midx");
            
            System.out.println("midx= "+midx);
            
            BoardServiceImpl boarddao1 = new BoardServiceImpl();
            ArrayList alistboard = boarddao1.selectmyboardlist(midx);
            
            System.out.println("ì„±ê³µì…ë‹ˆë‹¤.");
            request.setAttribute("alistboard", alistboard);
            
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
            rd.forward(request, response);
         }else {
            
            System.out.println("ì‹¤íŒ¨ì…ë‹ˆë‹¤.");
         }
      }
      
      
      
   }
   

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
      
      
   }
   
   
   private static String makeThumbnail(String uploadPath,String path,String fileName) throws Exception{
      
      //ì˜¬ë¦° ì†ŒìŠ¤íŒŒì¼ì„ ì½ì–´ë“œë¦°ë‹¤
      BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path+File.separator+fileName));
      //ì´ë¯¸ì§€ë¥¼ ë¦¬ì‚¬ì´ì§•í•œë‹¤(ë†’ì´ 100ì— ë§ì¶°ì„œ ì›ë³¸ì´ë¯¸ì§€ ë¹„ìœ¨ì„ ìœ ì§€í•œë‹¤)
      BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,100);
      //ì¸ë„¤ì¼ í’€ê²½ë¡œ
      String thumbnailPath = uploadPath + path + File.separator + "s-"+fileName;
      //íŒŒì¼ ê°ì²´ìƒì„±
      File newFile = new File(thumbnailPath);
      //í™•ì¥ì ì¶”ì¶œ
      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
      //ì¸ë„¤ì¼ ì´ë¯¸ì§€ ë§Œë“¤ê¸°(ë¦¬ì‚¬ì´ì§•í•œ ì´ë¯¸ì§€ë¥¼ í•´ë‹¹ ì´ë¯¸ì§€í˜•ì‹ìœ¼ë¡œ í•´ë‹¹ ìœ„ì¹˜ì— íŒŒì¼ ê°ì²´ìƒì„±í•œë‹¤)
      ImageIO.write(destImg, formatName.toUpperCase(), newFile);
      
      //ì¸ë„¤ì¼ íŒŒì¼ ì´ë¦„ ì¶”ì¶œ
      return thumbnailPath.substring((uploadPath+path).length()).replace(File.separatorChar, ' ');
   }

}