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
		System.out.println(pnamelength);
		String str = uri.substring(pnamelength);															
		System.out.println("str = "+str);												
		String[]str1 = str.split("/"); 
		String str2 = str1[2];

		System.out.println("str1 = "+str1[0]);
		System.out.println("str1 = "+str1[1]);	
		System.out.println("str2 = "+str1[2]);	
		
		

		
		if(str2.equals("EventMan_Board.do")) {	

			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_Board.jsp"); 	
			rd.forward(request, response);

/*	����ϱ� �������� ����	*/			
		}else if(str2.equals("EventMan_Advicewrite.do")){
			
//			int hidx = Integer.parseInt(request.getParameter("hidx"));
//			
//			System.out.println("hidxhidxhidxhidxhidxhidx   =   "+hidx);
//			
//			request.setAttribute("hidx", hidx);
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Board/EventMan_Advicewrite.jsp"); 	
			rd.forward(request, response);
			
/*	����ϱ� �ۼ� �Ϸ��ϱ�	*/			
		}else if(str2.equals("EventMan_AdvicewriteAction.do")) {
			
		System.out.println("--if�� EventMan_AdvicewriteAction ����");
			
			//���ε� ���� ���		
			//���߿� �������� ����� ��η� �ø��� �ȴ�.
			String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\";
			
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

			
			System.out.println("cata = "+cata);
			System.out.println("title = "+title);
			System.out.println("content = "+content);
			System.out.println("file = "+file);
			System.out.println("midx = "+midx);
			System.out.println("hidx = "+hidx);			
			
			EventAskServiceImpl askdao = new EventAskServiceImpl();
			int value = askdao.insertAdvice(cata, title, content, file, midx, hidx);
			
			

					
			if(value > 0) {
				System.out.println("���� ����û�� ���� ����");
				response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Mypage_Main.do");	
			}else {
				System.out.println("���� ����û�� ���� ����");
				
				PrintWriter out = response.getWriter();   
				
				out.println("<script>alert('���� �ۼ� ����');</script>");
			}
			
			
/*	���������� ����Ʈ ȭ��	*/			
		}else if(str2.equals("EventMan_Mypage_Myboardlist.do")) {

		System.out.println("EventMan_Mypage_Myboardlist.do if��");
		
		String midx = request.getParameter("midx");
		
		System.out.println("midx= "+midx);
		
		BoardServiceImpl boarddao = new BoardServiceImpl();
		ArrayList alistboard = boarddao.selectmyboardlist(midx);
		
		request.setAttribute("alistboard", alistboard);
		
		RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
		rd.forward(request, response);

		
/*	���������� ����Ʈ �󼼺���	*/		
		}else if(str2.equals("EventMan_Mypage_MyboardlistDetail.do")) {
			
			System.out.println("EventMan_Mypage_MyboardlistDetail.do if��");
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
			rd.forward(request, response);			
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
