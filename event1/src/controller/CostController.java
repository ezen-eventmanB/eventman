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

      System.out.println("-----CostController ����-----");  

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

      //�������� �̵� �κ�
      if (str2.equals("EventMan_Cost.do")) {

         RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Cost/EventMan_Cost.jsp");
         rd.forward(request, response);
      
      //���� �ۼ� �����ִ� �κ�
      } else if (str2.equals("EventMan_Cost_Submit_Action.do")) {

         System.out.println("EventMan_Cost_Submit_Action ����");
         
         //String uploadPath = "C:\\Users\\759\\git\\eventman\\event1\\Content\\";
         String uploadPath = "C:\\Users\\745\\git\\eventman\\event1\\Content\\";
         
         String savedPath = "Advice_img";
         
         String saveFullPath = uploadPath + savedPath;
         
         int sizeLimit = 1024 * 1024 * 15;
         
         String fileName = null;
         
         String originFileName = null;
         
         // MultipartRequest ��ü����
         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
         // �����ڿ� ����Name�Ӽ��� �̸��� ��´�
         Enumeration files = multi.getFileNames();
         // ��� ���� ��ü�� Name���� ��´�.
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
         String cName = multi.getParameter("cName"); // ���� �̸�
         String cSdate = multi.getParameter("cSdate"); // ������
         String cEdate = multi.getParameter("cEdate"); // ������
         String cWday = multi.getParameter("cWday"); // �ۼ��� sysdate �� ����
         
         String cText = multi.getParameter("cText"); // ����
         String cFile2 = multi.getParameter("cFile"); // ���� �ڷ�
         String cLoca = multi.getParameter("cLoca"); // ����
         String cTarget = multi.getParameter("cTarget"); // �������
         String cMethod = multi.getParameter("cMethod"); // �������
         String cPrice = multi.getParameter("cPrice"); // ����
         String cPeople = multi.getParameter("cPeople"); // �����ο�
         String midx = multi.getParameter("midx"); // midx ȸ����ȣ
         String[] cCata = multi.getParameterValues("cCata"); // ī�װ�
         
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

         CostServiceImpl costdao = new CostServiceImpl(); // ��ü ����
         int value = costdao.costInsert(cName, cSdate, cEdate, cWday, totalCCata, cText, fileName, cLoca, cTarget, cMethod,
               cPrice, cPeople, midx);

         if (value >= 1) {
            PrintWriter out = response.getWriter();
            response.sendRedirect(request.getContextPath() + "/EventMan_Mypage/EventMan_Mypage_Main.do?midx="+midx);
         } else {
            response.sendRedirect(request.getContextPath() + "/EventMan_Cost/EventMan_Cost.do");
            }
         
         
         /*   ���������� ���� ����Ʈ ȭ��   */         
         }else if(str2.equals("EventMan_Mypage_MyCostlist.do")) {

            System.out.println("EventMan_Mypage_MyCostlist.do if��");
            
            String midx = request.getParameter("midx");
            
            System.out.println("midx= "+midx);
            
            CostServiceImpl costdao = new CostServiceImpl();
            ArrayList alistcost = costdao.selectmycostlist(midx);
            
            request.setAttribute("alistcost", alistcost);
            
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyCostList.jsp");
            rd.forward(request, response);
         //�Ϸ� 
         
         
         //���������� ���� �󼼺���
         }else if(str2.equals("EventMan_Mypage_MyCostDetail.do")) {
            
            System.out.println("EventMan_Mypage_MyCostlistDetail.do if��");
            
            int cidx = Integer.parseInt(request.getParameter("cidx"));
            
            CostServiceImpl costdao = new CostServiceImpl();
            
            EvCostVo covo = new EvCostVo();
            
            covo = costdao.costlistselectone(cidx);
            
            request.setAttribute("covo", covo);
            
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyCostDetail.jsp");
            rd.forward(request, response);         
            //�Ϸ�
            
         /*  ������û ���� ȭ�� �̵� */
         }else if(str2.equals("EventMan_Mypage_MyCostModify.do")) {
            
            System.out.println("EventMan_Mypage_MyCostModify");
            
            int cidx = Integer.parseInt( request.getParameter("cidx"));
            
            CostServiceImpl costdao = new CostServiceImpl();
            EvCostVo covo = costdao.costlistselectone(cidx);
            
            request.setAttribute("covo", covo);
            
            RequestDispatcher rd = request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyCostModify.jsp");
            rd.forward(request, response);
            
         /* ������û ���� �׼� */
         }else if(str2.equals("EventMan_Mypage_MyCostDelete.do")) {
            
            int value=0;
            
            int cidx = Integer.parseInt(request.getParameter("cidx"));
            int midx = Integer.parseInt(request.getParameter("midx"));
            
            CostServiceImpl costdao = new CostServiceImpl();
            value = costdao.myPageCostDelete(cidx);
            
            System.out.println("value="+value);
            
            response.sendRedirect(request.getContextPath()+"/EventMan_Cost/EventMan_Mypage_MyCostlist.do?midx="+midx);
            
         /*���� ���� �κ�*/
         }else if(str2.equals("EventMan_Mypage_CostModify_Action.do")) {
            
            String cName = request.getParameter("cName"); // ���� �̸�
            String cSdate = request.getParameter("cSdate"); // ������
            String cEdate = request.getParameter("cEdate"); // ������
            String cText = request.getParameter("cText"); // ����
            String cFile2 = request.getParameter("cFile2"); // ���� �ڷ�
            String cLoca = request.getParameter("cLoca"); // ����
            String cTarget = request.getParameter("cTarget"); // �������
            String cMethod = request.getParameter("cMethod"); // �������
            String cPrice = request.getParameter("cPrice"); // ����
            String cPeople = request.getParameter("cPeople"); // �����ο�

            int midx = Integer.parseInt(request.getParameter("midx"));
            int cidx = Integer.parseInt(request.getParameter("cidx"));
            
            String[] cCata = request.getParameterValues("cCata"); // ī�װ�
            
            String totalCCata ="";
            for(int i=0; i<cCata.length;i++) {
               totalCCata = totalCCata +cCata[i];
            }
            
            System.out.println("totalCCata:"+totalCCata);
            CostServiceImpl costdao = new CostServiceImpl(); // ��ü ����
            int value = costdao.costModifyAction(cName, cSdate, cEdate ,totalCCata, cText, cFile2, cLoca, cTarget, cMethod,cPrice, cPeople, cidx);

            if(value >=0) {
               response.sendRedirect(request.getContextPath()+"/EventMan_Cost/EventMan_Mypage_MyCostlist.do?midx="+midx);

            } else {
               System.out.println("���� ����!");
               }
         }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      doGet(request, response);
   }

   private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {

      // �ø� �ҽ������� �о�帰��
      BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path + File.separator + fileName));
      // �̹����� ������¡�Ѵ�(���� 100�� ���缭 �����̹��� ������ �����Ѵ�)
      BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
      // ����� Ǯ���
      String thumbnailPath = uploadPath + path + File.separator + "s-" + fileName;
      // ���� ��ü����
      File newFile = new File(thumbnailPath);
      // Ȯ���� ����
      String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
      // ����� �̹��� �����(������¡�� �̹����� �ش� �̹����������� �ش� ��ġ�� ���� ��ü�����Ѵ�)
      ImageIO.write(destImg, formatName.toUpperCase(), newFile);

      // ����� ���� �̸� ����
      return thumbnailPath.substring((uploadPath + path).length()).replace(File.separatorChar, ' ');
   }

}