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

import service.EventAskServiceImpl;
import service.MemberServiceImpl;
import service.MasterServiceImpl;
import service.ReviewServiceImpl;
import vo.EvMemberVo;
import vo.EvReviewVo;

import org.imgscalr.Scalr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/MasterController")
public class MasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MasterController() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("-----MasterController ����-----");
		
		
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
		
		
/*	ȸ�� �Ұ�	 */		
		if(str2.equals("EventMan_Company_Main.do")) {
			
			System.out.println("-----EventMan_Company_Main.do ����-----");
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Company/EventMan_Company_Main.jsp"); 	
			rd.forward(request, response);
			
			
/*	master main �������� �̵�	*/			
		}else if(str2.equals("EventMan_Master_Mainpage.do")) {
			
			System.out.println("-----EventMan_Master_Mainpage.do ����-----");
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Master/EventMan_Master_Mainpage.jsp"); 	
			rd.forward(request, response);
			
			
/*	��� ���� �ۼ� �������� �̵�	*/
		}else if(str2.equals("EventMan_Review_Write.do")) {
			
			System.out.println("-----EventMan_Review_Write.do ����-----");
			
			int gidx = Integer.parseInt( request.getParameter("gidx"));
			request.setAttribute("gidx", gidx);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Write.jsp");
			rd.forward(request, response);
			
			
/* �Խ��� ������ �Խñ� �ۼ� ������ �̵�*/			
		}else if(str2.equals("EventMan_Master_BoardWrite.do")) {
								
			System.out.println("�Խ��� �� �ۼ� ������ �̵�");
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Board/EventMan_Master_Write.jsp");
			rd.forward(request, response);	
			
/* ������ ȸ�� ���� ������ �̵�*/			
		}else if(str2.equals("EventMan_Master_Modify.do")) {
								
			System.out.println("ȸ�� ���� ������ �̵�");
			
			MasterServiceImpl mdao = new MasterServiceImpl();
			
			System.out.println("ȸ�� ���� ������ �̵�2");
			
			ArrayList<EvMemberVo> alist  =  mdao.memberSelectAll();
			
						
			request.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Master/EventMan_Master_Modify.jsp");
			rd.forward(request, response);				
			
/*	��� ���� �ۼ� ACTION*/			
		}else if(str2.equals("EventMan_Review_Write_Action.do")) {
			
			System.out.println("-----EventMan_Review_Write_Action.do ����-----");
			
			
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
			int gidx = Integer.parseInt( multi.getParameter("gidx"));
			
			
			MasterServiceImpl mdao = new MasterServiceImpl();
			
			int value = mdao.insertReview(title,target, startdate, enddate, price, staff, company, content, fileName, cata, loca, people, gidx);
			
			if(value == 1) {
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
				rd.forward(request, response);
			}else{
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
				rd.forward(request, response);
			}
			
/*	��� ���� ����	action	*/			
		}else if(str2.equals("EventMan_ReviewDelete.do")) {

			System.out.println("-----EventMan_ReviewDelete.do ����-----");
			
			int value=0;
			
			int hidx = Integer.parseInt(request.getParameter("hidx"));
			
			System.out.println("hidx : "+hidx);
			
			MasterServiceImpl mdao = new MasterServiceImpl();
			value = mdao.reviewDelete(hidx);

			System.out.println("�̵����ϸ�ȴ�.");
			
			if(value == 1) {
				
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('�ش���� �����Ǿ����ϴ�.'); </script>");
				
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
				rd.forward(request, response);
			}else{
				RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Main.do");
				rd.forward(request, response);
			}
			

/*	��縮�� ���� ȭ���̵�	*/			
		}else if(str2.equals("EventMan_ReviewModify.do")) {

			System.out.println("-----EventMan_ReviewModify.do ����-----");
			
			int hidx = Integer.parseInt( request.getParameter("hidx"));
			EvReviewVo erv = new EvReviewVo();
			ReviewServiceImpl rdao = new ReviewServiceImpl();
			erv = rdao.reviewSelectOne(hidx);
			
			request.setAttribute("erv", erv);
			request.setAttribute("hidx", hidx);
			RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Modify.jsp");
			rd.forward(request, response);
			
			
/*	��縮��� �����ϱ� action*/			
		}else if(str2.equals("EventMan_ReviewModifyAction.do")) {

			System.out.println("-----EventMan_ReviewModify.do ����-----");
			
			int value=0;
			
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
			value = mdao.modifyAction(hidx,file,cata,hloca,startdate,enddate,price,people,target,staff,company,title,content);
			
			System.out.println("��縮������ϱ� value : "+value);
			
			 response.sendRedirect(request.getContextPath()+"/EventMan_Review/EventMan_Review_Detail.do?hidx="+hidx);
				/*
				 * RequestDispatcher rd =
				 * request.getRequestDispatcher("/EventMan_Review/EventMan_Review_Detail.do");
				 * rd.forward(request, response);
				 */
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
