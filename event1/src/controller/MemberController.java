package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardServiceImpl;
import service.CostServiceImpl;
import service.MemberServiceImpl;
import vo.EvMemberVo;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("-----MemberController ����-----");
		
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
		
		
/* ȸ������ �������� �̵�*/
		if(str2.equals("EventMan_Member_Join.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Join.jsp"); 	
			rd.forward(request, response);

/*ȸ������ Action ������ �̵�*/			
		}else if(str2.equals("EventMan_Member_JoinAction.do")) {
			
				System.out.println("EventMan_Member_JoinAction ����");
			
				String mId = request.getParameter("mId");
				String mPwd = request.getParameter("mPwd");
				String mName = request.getParameter("mName");
				String mEmail = request.getParameter("mEmail");
				String mPhone = request.getParameter("mPhn");
				String mType = request.getParameter("mType");
				
				int value = 0;
												
				MemberServiceImpl md = new MemberServiceImpl();
				value = md.memberInsert(mId, mPwd, mName, mEmail, mPhone, mType);
				
				if(value >=1) {
					PrintWriter out = response.getWriter();
					response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_Login.do");	
				}else {
					response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_Join.do");		
				}	
/* ���̵� �ߺ�Ȯ�� Action*/				
		}else if(str2.equals("EventMan_Member_IdCheckAction.do")) {	
			
			System.out.println("EventMan_Member_IdCheckAction");
			
			//Dao ���� �� �޼ҵ� ȣ������
			MemberServiceImpl msdao = new MemberServiceImpl();
			
			String mid = request.getParameter("mid");
			
			System.out.println("-------�Ѿ�� ��--------");
			System.out.println("mid = "+mid);
			
			//���޿� ���� �Ű������� ��������  
			String id = msdao.idCheck(mid);
			
			
			if(id=="") {
				response.getWriter().write("��밡���� ���̵� �Դϴ�.");
			}else {
				response.getWriter().write("��� �������� ���� ���̵� �Դϴ�.");
			}	
/* �α��� �������� �̵�*/
		}else if(str2.equals("EventMan_Member_Login.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Login.jsp"); 	
			rd.forward(request, response);	
			
			
/* ���� �������� �̵�*/		
		}else if(str2.equals("EventMan_Mypage_Main.do")) {
			
			System.out.println("EventMan_Mypage_Main.do if��");
			
			System.out.println("request.getAttribute(\"midx\")="+request.getAttribute("midx"));
			
			int midx = Integer.parseInt( request.getParameter("midx"));
			
			System.out.println("midx = "+midx);
			
			BoardServiceImpl boarddao = new BoardServiceImpl();
			int boardcount = boarddao.boardCount(midx);
			
			CostServiceImpl costdao = new CostServiceImpl();
			int costcount = costdao.costCount(midx);
			
			
			request.setAttribute("boardcount", boardcount);
			request.setAttribute("costcount", costcount);

			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Main.jsp"); 	
			rd.forward(request, response);
	
/*���̵� ã��� �̵�*/			
		}else if(str2.equals("EventMan_Member_Find_Id.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp"); 	
			rd.forward(request, response);
				
/*��й�ȣ ã��� �̵�*/				
		}else if(str2.equals("EventMan_Member_Find_Pw.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp"); 	
			rd.forward(request, response);	
/*ȸ�� Ż��� �̵�*/			
		}else if(str2.equals("EventMan_Mypage_Dropout.do")) {
				//session�� ����
				HttpSession session=request.getSession();
				//midx ���� get���� �޾ƿ�
				 int member_midx = (int)session.getAttribute("midx");
				
				 //dao�� ����
				MemberServiceImpl mdao = new MemberServiceImpl();
				
				//vo�� ����� �ִ� midx �� ������
			 	EvMemberVo mbvo = mdao.selectMember(member_midx);
								
			 	request.setAttribute("mbvo", mbvo);
			
			
				RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Dropout.jsp"); 	
				rd.forward(request, response);
/*ȸ��Ż�� ��� */		
		}else if (str2.equals("EventMan_Mypage_Dropout_Action.do")) {
					
				//1. �Ѱܹ޴´�
				String midx = request.getParameter("midx");
				
				int midx2 = Integer.parseInt(midx);
				String mPwd2 = request.getParameter("mPwd");
					
				//2.ó���Ѵ�
				MemberServiceImpl mdao = new MemberServiceImpl();
				int value = mdao.memberDelete(midx2, mPwd2);		
				System.out.println("value"+value);
				
				//3.�̵��Ѵ�
			
			  if (value > 0) {
			  response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_LogoutAction.do");
			  }else {
			  response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Dropout.do"); }	
/* ȸ������ ���� ȭ�� �̵�*/			
		}else if(str2.equals("EventMan_Mypage_Modify.do")) {
			
//			String midx = request.getParameter("midx");
//			int midx2 = Integer.parseInt(midx);
			
			//session�� ����
			HttpSession session=request.getSession();
			//midx ���� get���� �޾ƿ�
			 int member_midx = (int)session.getAttribute("midx");
			
			 //dao�� ����
			MemberServiceImpl mdao = new MemberServiceImpl();
			
			//vo�� ����� �ִ� midx �� ������
		 	EvMemberVo mbvo = mdao.selectMember(member_midx);
							
		 	request.setAttribute("mbvo", mbvo);
		 	 	
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Modify.jsp"); 	
			rd.forward(request, response);
/*ȸ������ ���� Action �̵�*/			
		}else if (str2.equals("EventMan_Mypage_Modify_Action.do")) {
			
			//1. ���� �Ѱܹ޴´�
			String midx = request.getParameter("midx");
			String mPwd = request.getParameter("mPwd");
			String mPhn = request.getParameter("mPhn");
			String mEmail = request.getParameter("mEmail");
			
			System.out.println(midx+mPwd+mPhn+mEmail);
			
			//���� ��
			MemberServiceImpl bd = new MemberServiceImpl();   // ��ü����
			int value = bd.memberModify(midx, mPwd, mPhn, mEmail);
			System.out.println("value:"+value);
			
			
			//������ ����� �ȴٸ� �̵�
			if (value >0)		
				
				response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Main.do");  
				
			//������ ���� ������ �̵�
			else {
				response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Modify.do");  
			}
			
/* �α��� Action �������� �̵�*/    
		}else if (str2.equals("EventMan_Member_LoginAction.do")) {
			String memberId  = request.getParameter("memberId");
			String memberPwd  = request.getParameter("memberPwd");
			System.out.println("memberId"+memberId);
			System.out.println("memberPwd"+memberPwd);
			
			//sql �޾ƿ���
			MemberServiceImpl md = new MemberServiceImpl();
			System.out.println("md"+md);
			
			String user = md.memberLoginCheck(memberId, memberPwd);	
			
			System.out.println("useruseruseruseruser : "+user);
			
			if(!user.equals("")) {
				
				String[] user1 = user.split("/");
				
				System.out.println("user1[0] = "+user1[0]);
				System.out.println("user1[1] = "+user1[1]);

				
				String usertype = user1[0];
				int useridx = Integer.parseInt(user1[1]);
				

				System.out.println("usertype = "+usertype);
				System.out.println("useridx = "+useridx);
				
				PrintWriter out = response.getWriter();
				
				if (usertype.equals("member")) { 
					HttpSession session = request.getSession();
					session.setAttribute("S_memberId", memberId);
					session.setAttribute("midx", useridx);
					
					out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp'</script>");	
					
				}else if(usertype.equals("master")){
					HttpSession session = request.getSession();
					session.setAttribute("S_memberId", memberId);
					session.setAttribute("gidx", useridx);
					
					out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp'</script>");
					
				}
				
			}else if(user.equals("")) {
				PrintWriter out = response.getWriter();				
				out.println("<script>$('#failModal').modal('show')</script>");				
				out.println("<script>alert('���̵�� ��й�ȣ�� Ȯ�����ּ���.')</script>");
				out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Member/EventMan_Member_Login.do'</script>");


			}
			
			
/*	�α׾ƿ� ����	*/
			
		}else if(str2.equals("EventMan_Member_LogoutAction.do")) {
				System.out.println("logout");
			
			
				HttpSession session = request.getSession();
				
				session.invalidate(); // ��缼������ ����
				PrintWriter out =response.getWriter();   
				
				out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.jsp';</script>");
      
				
/* IDã�� �������� �̵�*/
		}else if(str2.equals("EventMan_Member_Find_Id.do")) {		
			
			System.out.println("EventMan_Member_Find_Id.do if�� ����");	
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp"); 	
			rd.forward(request, response);
			
			
/* IDã�� Action ����*/
		}else if(str2.equals("EventMan_Member_Find_Id_Action.do")) {	
			
			System.out.println("EventMan_Member_Find_Id_Action.do if�� ����");	
			
			//Dao ���� �� �޼ҵ� ȣ������
			MemberServiceImpl msdao = new MemberServiceImpl();
			
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			System.out.println("-------�Ѿ�� ��--------");
			System.out.println("name = "+name);
			System.out.println("phone="+phone);
			
			//���޿� ���� �Ű������� ��������  
			String id = msdao.findId(name, phone);
			
			
			if(id=="") {
				response.getWriter().write("ȸ�������� ��ġ���� �ʽ��ϴ�.");
			}else {
				response.getWriter().write("ȸ������ ���̵�� "+id+" �Դϴ�.");
			}

/* �޴��� ���� Ȯ�� */
		}else if(str2.equals("EventMan_phonecheck.do")) {
				
			System.out.println("EventMan_phonecheck.do if�� ����");	
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_phonecheck.jsp"); 	
			rd.forward(request, response);
	

/* ����Ȯ�� ������ ��������*/						
		}else if(str2.equals("EventMan_phonecheck_Action.do")){
		
			
			System.out.println("EventMan_phonecheck_Action.do if��");
			
				
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

	
	
	/* (����) */
	
	
	
}
