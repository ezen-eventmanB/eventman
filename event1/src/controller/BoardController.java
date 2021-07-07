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
		
		System.out.println("-----BoardController ����-----");
		
		
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
			
		//�Խ��� �� �ۼ�
		}else if(str2.equals("EventMan_BoardWrite.do")){
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_BoardWrite.jsp"); 	
			rd.forward(request, response);
			
		}else if(str2.equals("EventMan_BoardwriteAction.do")) {
			
			System.out.println("EventMan_BoardwriteAction ����");
				
				//���ε� ���� ���		
				//���߿� �������� ����� ��η� �ø��� �ȴ�.
				String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\"; //��ȣ�Բ�
				//String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\"; //������ ���
				//���� ����
				String savedPath = "Advice_img";
				
				//����� �� ���
				String saveFullPath = uploadPath + savedPath;
				
				int sizeLimit = 1024*1024*15;
				String fileName = null;
				String originFileName = null;
					System.out.println("saveFullPath = "+saveFullPath);
				
				//MultipartRequest ��ü����
				MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 

				//�����ڿ� ����Name�Ӽ��� �̸��� ��´�
				Enumeration files = multi.getFileNames();
					System.out.println("files = "+files);
					
				//��� ���� ��ü�� Name���� ��´�.
				String file = (String)files.nextElement();
					System.out.println("file = "+file);
				
				//����Ǵ� �����̸�
				fileName = multi.getFilesystemName(file); 
					System.out.println("fileName = "+fileName);
			
				//�������� �̸�
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
					System.out.println("���� ����û�� ���� ����");
					request.setAttribute("midx", midx);
					response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Mypage_Main.do?midx="+midx);
				}else {
					System.out.println("���� ����û�� ���� ����");
					
					PrintWriter out = response.getWriter();   
					
					out.println("<script>alert('��� �ۼ� ����');</script>");
				}
				 
				
				
/*	����ϱ� �������� ����	*/			
		}else if(str2.equals("EventMan_Advicewrite.do")){
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_Advicewrite.jsp"); 	
			rd.forward(request, response);	
/*	����ϱ� �ۼ� �Ϸ��ϱ�	*/			
		}else if(str2.equals("EventMan_AdvicewriteAction.do")) {
			
		System.out.println("--if�� EventMan_AdvicewriteAction ����");
			
			//���ε� ���� ���		
			//���߿� �������� ����� ��η� �ø��� �ȴ�.
			String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\"; //��ȣ�Բ�
			//String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\"; //������ ���
			//���� ����
			String savedPath = "Advice_img";
			
			//����� �� ���
			String saveFullPath = uploadPath + savedPath;
			
			int sizeLimit = 1024*1024*15;
			String fileName = null;
			String originFileName = null;
				System.out.println("saveFullPath = "+saveFullPath);
			
			//MultipartRequest ��ü����
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 

			//�����ڿ� ����Name�Ӽ��� �̸��� ��´�
			Enumeration files = multi.getFileNames();
				System.out.println("files = "+files);
				
			//��� ���� ��ü�� Name���� ��´�.
			String file = (String)files.nextElement();
				System.out.println("file = "+file);
			
			//����Ǵ� �����̸�
			fileName = multi.getFilesystemName(file); 
				System.out.println("fileName = "+fileName);
		
			//�������� �̸�
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
				System.out.println("���� ����û�� ���� ����");
				request.setAttribute("midx", midx);
				response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Mypage_Main.do?midx="+midx);
			}else {
				System.out.println("���� ����û�� ���� ����");
				
				PrintWriter out = response.getWriter();   
				
				out.println("<script>alert('��� �ۼ� ����');</script>");
			}
			
			
/*	���������� ����Ʈ ȭ��	*/			
		}else if(str2.equals("EventMan_Mypage_Myboardlist.do")) {
	
		System.out.println("EventMan_Mypage_Myboardlist.do if��");
		
		String midx = request.getParameter("midx");
		
		System.out.println("midx= "+midx);
		
		BoardServiceImpl boarddao = new BoardServiceImpl();
		ArrayList alistboard = boarddao.selectmyboardlist(midx);
		
		request.setAttribute("alistboard", alistboard);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
		rd.forward(request, response);
		
/*	���������� �Խñ� �󼼺���	*/		
		}else if(str2.equals("EventMan_Mypage_MyboardlistDetail.do")) {
			
			System.out.println("EventMan_Mypage_MyboardlistDetail.do if��");
			
			int bidx = Integer.parseInt(request.getParameter("bidx"));

			BoardServiceImpl boarddao = new BoardServiceImpl();

			boarddao.hitCount(bidx);
			
			EvBoardAskVo bavo = new EvBoardAskVo();
			
			bavo = boarddao.boardlistselectone(bidx);
					
			request.setAttribute("bavo", bavo);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
			rd.forward(request, response);			
			
			
/* �Խñ� �����ϱ�� �̵�	*/			
		}else if(str2.equals("EventMan_Mypage_BoardModify.do")) {
			
			System.out.println("EventMan_Mypage_BoardModify.do if��");
			
			int bidx = Integer.parseInt( request.getParameter("bidx"));
			
			BoardServiceImpl boarddao = new BoardServiceImpl();
			EvBoardAskVo bavo = boarddao.boardModify(bidx);
			
			request.setAttribute("bavo", bavo);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyBoardModify.jsp");
			rd.forward(request, response);
			
			
/*	�Խñ� �����ϱ� �׼�	*/			
		}else if(str2.equals("EventMan_Mypage_BoardModify_Action.do")) {
			
			System.out.println("EventMan_Mypage_BoardModify_Action.do if��");
			
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
				
				 System.out.println("value�� 1�Դϴ� ������ �̵��մϴ�.");
				
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
				rd.forward(request, response);
				
			}else {
				System.out.println("�Խñ� ������ ��ȭ�� �������̵� ����");
			}
		
/*	�Խñ� �����ϱ�	*/			
		}else if(str2.equals("EventMan_Mypage_MyboardDelet.do")) {
			
			System.out.println("EventMan_Mypage_MyboardDelet.do if���Ԥ���.");
			
			int value=0;
			
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			System.out.println("bidx = "+bidx);
			BoardServiceImpl boarddao = new BoardServiceImpl();
			
			value = boarddao.myPageBoardDelet(bidx);
			
			System.out.println("�޼ҵ� ó����� "+value);
			
			
			if(value==1) {
				
				String midx = request.getParameter("midx");
				
				System.out.println("midx= "+midx);
				
				BoardServiceImpl boarddao1 = new BoardServiceImpl();
				ArrayList alistboard = boarddao1.selectmyboardlist(midx);
				
				System.out.println("�����Դϴ�.");
				request.setAttribute("alistboard", alistboard);
				
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
				rd.forward(request, response);
			}else {
				
				System.out.println("�����Դϴ�.");
			}
		}	
		
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}
	
	
	private static String makeThumbnail(String uploadPath,String path,String fileName) throws Exception{
		
		//�ø� �ҽ������� �о�帰��
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path+File.separator+fileName));
		//�̹����� ������¡�Ѵ�(���� 100�� ���缭 �����̹��� ������ �����Ѵ�)
		BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,100);
		//����� Ǯ���
		String thumbnailPath = uploadPath + path + File.separator + "s-"+fileName;
		//���� ��ü����
		File newFile = new File(thumbnailPath);
		//Ȯ���� ����
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		//����� �̹��� �����(������¡�� �̹����� �ش� �̹����������� �ش� ��ġ�� ���� ��ü�����Ѵ�)
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		//����� ���� �̸� ����
		return thumbnailPath.substring((uploadPath+path).length()).replace(File.separatorChar, ' ');
	}

}
