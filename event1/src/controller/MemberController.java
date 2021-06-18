package controller;

import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.MemberServiceImpl;


@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberController() {
        super();
    
    }

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("-----MemberController ����-----");
		
		
		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();														
		System.out.println("uri"+uri);																			
		int pnamelength = request.getContextPath().length();		
		System.out.println(pnamelength);
		String str = uri.substring(pnamelength);															
		System.out.println("str = "+str);												
		String[]str1 = str.split("/");
		String str2 = str1[2];
		
		System.out.println("str2="+str2);
		
		
		
		if(str2.equals("EventMan_Member_Find_Id.do")) {											
			System.out.println("EventMan_Member_Find_Id.do if�� ����");		
			
			//Dao ���� �޼ҵ� ȣ������
			MemberServiceImpl msdao = new MemberServiceImpl();
			
			//�޼ҵ忡 �Ű������� ���� �� ���� ��������
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			System.out.println("-------�Ѿ�� ��--------");
			System.out.println("name = "+name);
			System.out.println("phone="+phone);
			
			//���޿� ���� �Ű������� ��������
			msdao.findId(name, phone);
			
			System.out.println("MemberServiceImpl.findId()����");
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp"); 	
			rd.forward(request, response);
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
