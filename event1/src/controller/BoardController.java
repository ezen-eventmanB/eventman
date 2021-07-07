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
		
		System.out.println("-----BoardController 실행-----");
		
		
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
		System.out.println("");
		

		
		if(str2.equals("EventMan_Board.do")) {	

			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_Board.jsp"); 	
			rd.forward(request, response);
			
		//게시판 글 작성
		}else if(str2.equals("EventMan_BoardWrite.do")){
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_BoardWrite.jsp"); 	
			rd.forward(request, response);
			
		}else if(str2.equals("EventMan_BoardwriteAction.do")) {
			
			System.out.println("EventMan_BoardwriteAction 실행");
				
				//업로드 파일 경로		
				//나중에 웹서버로 공통된 경로로 올리게 된다.
				String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\"; //현호님꺼
				//String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\"; //박종빈 경로
				//저장 폴더
				String savedPath = "Advice_img";
				
				//저장된 총 경로
				String saveFullPath = uploadPath + savedPath;
				
				int sizeLimit = 1024*1024*15;
				String fileName = null;
				String originFileName = null;
					System.out.println("saveFullPath = "+saveFullPath);
				
				//MultipartRequest 객체생성
				MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 

				//열거자에 파일Name속성의 이름을 담는다
				Enumeration files = multi.getFileNames();
					System.out.println("files = "+files);
					
				//담긴 파일 객체의 Name값을 담는다.
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
				
				String cata = multi.getParameter("cata");
				String title = multi.getParameter("title");
				String content = multi.getParameter("content");
				String midx = multi.getParameter("midx");
				String hidx = multi.getParameter("hidx");
				
				EventAskServiceImpl askdao = new EventAskServiceImpl();
				int value = askdao.insertAdvice(cata, title, content, fileName, midx, hidx);
				
						
				if(value > 0) {
					System.out.println("성공 상담신청글 전송 성공");
					request.setAttribute("midx", midx);
					response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Mypage_Main.do?midx="+midx);
				}else {
					System.out.println("실패 상담신청글 전송 실패");
					
					PrintWriter out = response.getWriter();   
					
					out.println("<script>alert('상담 작성 실패');</script>");
				}
				 
				
				
/*	상담하기 페이지로 연결	*/			
		}else if(str2.equals("EventMan_Advicewrite.do")){
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_Advicewrite.jsp"); 	
			rd.forward(request, response);	
/*	상담하기 작성 완료하기	*/			
		}else if(str2.equals("EventMan_AdvicewriteAction.do")) {
			
		System.out.println("--if문 EventMan_AdvicewriteAction 실행");
			
			//업로드 파일 경로		
			//나중에 웹서버로 공통된 경로로 올리게 된다.
			String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\"; //현호님꺼
			//String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\"; //박종빈 경로
			//저장 폴더
			String savedPath = "Advice_img";
			
			//저장된 총 경로
			String saveFullPath = uploadPath + savedPath;
			
			int sizeLimit = 1024*1024*15;
			String fileName = null;
			String originFileName = null;
				System.out.println("saveFullPath = "+saveFullPath);
			
			//MultipartRequest 객체생성
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 

			//열거자에 파일Name속성의 이름을 담는다
			Enumeration files = multi.getFileNames();
				System.out.println("files = "+files);
				
			//담긴 파일 객체의 Name값을 담는다.
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
			
			String cata = multi.getParameter("cata");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String midx = multi.getParameter("midx");
			String hidx = multi.getParameter("hidx");
			
			EventAskServiceImpl askdao = new EventAskServiceImpl();
			int value = askdao.insertAdvice(cata, title, content, fileName, midx, hidx);
			
					
			if(value > 0) {
				System.out.println("성공 상담신청글 전송 성공");
				request.setAttribute("midx", midx);
				response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Mypage_Main.do?midx="+midx);
			}else {
				System.out.println("실패 상담신청글 전송 실패");
				
				PrintWriter out = response.getWriter();   
				
				out.println("<script>alert('상담 작성 실패');</script>");
			}
			
			
/*	마이페이지 리스트 화면	*/			
		}else if(str2.equals("EventMan_Mypage_Myboardlist.do")) {
	
		System.out.println("EventMan_Mypage_Myboardlist.do if문");
		
		String midx = request.getParameter("midx");
		
		System.out.println("midx= "+midx);
		
		BoardServiceImpl boarddao = new BoardServiceImpl();
		ArrayList alistboard = boarddao.selectmyboardlist(midx);
		
		request.setAttribute("alistboard", alistboard);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
		rd.forward(request, response);
		
/*	마이페이지 게시글 상세보기	*/		
		}else if(str2.equals("EventMan_Mypage_MyboardlistDetail.do")) {
			
			System.out.println("EventMan_Mypage_MyboardlistDetail.do if문");
			
			int bidx = Integer.parseInt(request.getParameter("bidx"));

			BoardServiceImpl boarddao = new BoardServiceImpl();

			boarddao.hitCount(bidx);
			
			EvBoardAskVo bavo = new EvBoardAskVo();
			
			bavo = boarddao.boardlistselectone(bidx);
					
			request.setAttribute("bavo", bavo);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
			rd.forward(request, response);			
			
			
/* 게시글 수정하기로 이동	*/			
		}else if(str2.equals("EventMan_Mypage_BoardModify.do")) {
			
			System.out.println("EventMan_Mypage_BoardModify.do if문");
			
			int bidx = Integer.parseInt( request.getParameter("bidx"));
			
			BoardServiceImpl boarddao = new BoardServiceImpl();
			EvBoardAskVo bavo = boarddao.boardModify(bidx);
			
			request.setAttribute("bavo", bavo);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyBoardModify.jsp");
			rd.forward(request, response);
			
			
/*	게시글 수정하기 액션	*/			
		}else if(str2.equals("EventMan_Mypage_BoardModify_Action.do")) {
			
			System.out.println("EventMan_Mypage_BoardModify_Action.do if문");
			
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

				request.setAttribute("bidx", bidx);
				 
				EvBoardAskVo bavo = new EvBoardAskVo();
				
				BoardServiceImpl boarddao1 = new BoardServiceImpl();
				  
				bavo = boarddao1.boardlistselectone(bidx);
				  
				request.setAttribute("bavo", bavo);
				
				 System.out.println("value가 1입니다 페이지 이동합니다.");
				
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
				rd.forward(request, response);
				
			}else {
				System.out.println("게시글 수정후 상세화면 페이지이동 실패");
			}
		
/*	게시글 삭제하기	*/			
		}else if(str2.equals("EventMan_Mypage_MyboardDelet.do")) {
			
			System.out.println("EventMan_Mypage_MyboardDelet.do if문입ㄴ다.");
			
			int value=0;
			
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			System.out.println("bidx = "+bidx);
			BoardServiceImpl boarddao = new BoardServiceImpl();
			
			value = boarddao.myPageBoardDelet(bidx);
			
			System.out.println("메소드 처리결과 "+value);
			
			
			if(value==1) {
				
				String midx = request.getParameter("midx");
				
				System.out.println("midx= "+midx);
				
				BoardServiceImpl boarddao1 = new BoardServiceImpl();
				ArrayList alistboard = boarddao1.selectmyboardlist(midx);
				
				System.out.println("성공입니다.");
				request.setAttribute("alistboard", alistboard);
				
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
				rd.forward(request, response);
			}else {
				
				System.out.println("실패입니다.");
			}
		}	
		
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}
	
	
	private static String makeThumbnail(String uploadPath,String path,String fileName) throws Exception{
		
		//올린 소스파일을 읽어드린다
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path+File.separator+fileName));
		//이미지를 리사이징한다(높이 100에 맞춰서 원본이미지 비율을 유지한다)
		BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,100);
		//썸네일 풀경로
		String thumbnailPath = uploadPath + path + File.separator + "s-"+fileName;
		//파일 객체생성
		File newFile = new File(thumbnailPath);
		//확장자 추출
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		//썸네일 이미지 만들기(리사이징한 이미지를 해당 이미지형식으로 해당 위치에 파일 객체생성한다)
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		//썸네일 파일 이름 추출
		return thumbnailPath.substring((uploadPath+path).length()).replace(File.separatorChar, ' ');
	}

}
