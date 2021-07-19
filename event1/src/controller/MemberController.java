package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
      
      System.out.println("-----MemberController 실행-----");
      
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
      
      
/* 회원가입 페이지로 이동*/
      if(str2.equals("EventMan_Member_Join.do")) {
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Join.jsp");    
         rd.forward(request,response);

         
/*회원가입 Action 페이지 이동*/         
      }else if(str2.equals("EventMan_Member_JoinAction.do")) {
         
            System.out.println("EventMan_Member_JoinAction 실행");
         
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
            
            
/* 아이디 중복확인 Action*/            
      }else if(str2.equals("EventMan_Member_IdCheckAction.do")) {   
         
         System.out.println("EventMan_Member_IdCheckAction");
           
         //Dao 생성 후 메소드 호출하자
         MemberServiceImpl msdao = new MemberServiceImpl();
         
         String mid = request.getParameter("mid");
         
         System.out.println("-------넘어온 값--------");
         System.out.println("mid = "+mid);
         
         //전달온 값을 매개변수로 던져주자  
         String id = msdao.idCheck(mid);
         
         
         if(id=="") {
            response.getWriter().write("사용가능한 아이디 입니다.");
         }else {
            response.getWriter().write("사용 가능하지 않은 아이디 입니다.");
         }   
         
         
/* 로그인 페이지로 이동*/
      }else if(str2.equals("EventMan_Member_Login.do")) {
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Login.jsp");    
         rd.forward(request, response);      
         
         
/* 마이 페이지로 이동*/      
      }else if(str2.equals("EventMan_Mypage_Main.do")) {
         
         System.out.println("EventMan_Mypage_Main.do if문");
         
         System.out.println("midx"+request.getParameter("midx"));
         
         int midx = Integer.parseInt(request.getParameter("midx"));
         
         System.out.println("midx = "+midx);
         
         BoardServiceImpl boarddao = new BoardServiceImpl();
         int boardcount = boarddao.boardCount(midx);
         
         CostServiceImpl costdao = new CostServiceImpl();
         int costcount = costdao.costCount(midx);
         
         
         request.setAttribute("boardcount", boardcount);
         request.setAttribute("costcount2", costcount);

         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Main.jsp");    
         rd.forward(request, response);
   
         
/*아이디 찾기로 이동*/         
      }else if(str2.equals("EventMan_Member_Find_Id.do")) {
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp");    
         rd.forward(request, response);
        
         
/*비밀번호 찾기로 이동*/            
      }else if(str2.equals("EventMan_Member_Find_Pw.do")) {
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp");    
         rd.forward(request, response);   

         
/*회원 탈퇴로 이동*/         
      }else if(str2.equals("EventMan_Mypage_Dropout.do")) {
            //session과 연결
            HttpSession session=request.getSession();
            //midx 값을 get으로 받아옴
            int member_midx = (int)session.getAttribute("midx");
            
             //dao와 연결
            MemberServiceImpl mdao = new MemberServiceImpl();
            
            //vo에 담겨져 있는 midx 를 가져옴
             EvMemberVo mbvo = mdao.selectMember(member_midx);
                        
             request.setAttribute("mbvo", mbvo);
         
            RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Dropout.jsp");    
            rd.forward(request, response);
            
            
/*회원탈퇴 기능 */      
      }else if (str2.equals("EventMan_Mypage_Dropout_Action.do")) {
               
            //1. 넘겨받는다
            String midx = request.getParameter("midx");
            
            int midx2 = Integer.parseInt(midx);
            String mPwd2 = request.getParameter("mPwd");
               
            //2.처리한다
            MemberServiceImpl mdao = new MemberServiceImpl();
            int value = mdao.memberDelete(midx2, mPwd2);      
            System.out.println("value"+value);
            
            //3.이동한다
         
           if (value > 0) {
           response.sendRedirect(request.getContextPath()+"/EventMan_Member/EventMan_Member_LogoutAction.do");
           }else {
           response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Dropout.do"); }   
           
           
/* 회원정보 수정 화면 이동*/         
      }else if(str2.equals("EventMan_Mypage_Modify.do")) {
         
//         String midx = request.getParameter("midx");
//         int midx2 = Integer.parseInt(midx);
         
         //session과 연결
         HttpSession session=request.getSession();
         //midx 값을 get으로 받아옴
          int member_midx = (int)session.getAttribute("midx");
         
          //dao와 연결
         MemberServiceImpl mdao = new MemberServiceImpl();
         
         //vo에 담겨져 있는 midx 를 가져옴
          EvMemberVo mbvo = mdao.selectMember(member_midx);
                     
          request.setAttribute("mbvo", mbvo);
              
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Modify.jsp");    
         rd.forward(request, response);
         
         
/*회원정보 수정 Action 이동*/         
      }else if (str2.equals("EventMan_Mypage_Modify_Action.do")) {
         
         //1. 값을 넘겨받는다
         String midx = request.getParameter("midx");
         String mPwd = request.getParameter("mPwd");
         String mPhn = request.getParameter("mPhn");
         String mEmail = request.getParameter("mEmail");
         
         System.out.println(midx+mPwd+mPhn+mEmail);
         
         //수정 값
         MemberServiceImpl bd = new MemberServiceImpl();   // 객체생성
         int value = bd.memberModify(midx, mPwd, mPhn, mEmail);
         System.out.println("value:"+value);
         
         //수정이 제대로 된다면 이동
         if (value >0)      
            response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Main.do?midx="+midx);  
         //수정이 되지 않으면 이동                                                          //파라미터로 midx값을 같이 넘겨줘야한다.
         else {
            response.sendRedirect(request.getContextPath()+"/EventMan_Mypage/EventMan_Mypage_Modify.do");  
         }
         
         
/* 로그인 Action 페이지로 이동*/    
      }else if (str2.equals("EventMan_Member_LoginAction.do")) {
         String memberId  = request.getParameter("memberId");
         String memberPwd  = request.getParameter("memberPwd");
         System.out.println("memberId"+memberId);
         System.out.println("memberPwd"+memberPwd);
         
         //sql 받아오기
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
               
               out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.do'</script>");   
               
            }else if(usertype.equals("master")){
               HttpSession session = request.getSession();
               session.setAttribute("S_memberId", memberId);
               session.setAttribute("gidx", useridx);
               
               out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.do'</script>");
               
            }
            
         }else if(user.equals("")) {
            PrintWriter out = response.getWriter();            
            out.println("<script>$('#failModal').modal('show')</script>");            
            out.println("<script>alert('아이디와 비밀번호를 확인해주세요.')</script>");
            out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Member/EventMan_Member_Login.do'</script>");


         }
         
         
/*   로그아웃 실행   */
      }else if(str2.equals("EventMan_Member_LogoutAction.do")) {
            System.out.println("logout");
         
         
            HttpSession session = request.getSession();
            
            session.invalidate(); // 모든세션정보 삭제
            PrintWriter out =response.getWriter();   
            
            out.println("<script>document.location.href='"+request.getContextPath()+"/EventMan_Main/EventMan_Main.do';</script>");
      
            
/* ID찾기 페이지로 이동*/
      }else if(str2.equals("EventMan_Member_Find_Id.do")) {      
         
         System.out.println("EventMan_Member_Find_Id.do if문 실행");   
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Id.jsp");    
         rd.forward(request, response);
         
         
/* ID찾기 Action 실행*/
      }else if(str2.equals("EventMan_Member_Find_Id_Action.do")) {   
         
         System.out.println("EventMan_Member_Find_Id_Action.do if문 실행");   
         
         //Dao 생성 후 메소드 호출하자
         MemberServiceImpl msdao = new MemberServiceImpl();
         
         String name = request.getParameter("name");
         String phone = request.getParameter("phone");
         String email = request.getParameter("email");
         
         System.out.println("-------넘어온 값--------");
         System.out.println("name = "+name);
         System.out.println("phone="+phone);
         System.out.println("email = "+email);
         
         //전달온 값을 매개변수로 던져주자  
         String id = msdao.findId(name, phone, email);
			
		
		String id2 = id;

		
		if(id != null) { 
			id2 = id.substring(2); 
		};
		
         if(id=="") {
            response.getWriter().write("회원정보가 일치하지 않습니다.");
         }else {
            response.getWriter().write("회원님의 아이디는 "+id+" 입니다.");
         }

         
/* 휴대폰 본인 확인 */
      }else if(str2.equals("EventMan_phonecheck.do")) {
            
         System.out.println("EventMan_phonecheck.do if문 실행");   
         
         String name = request.getParameter("name");
         String phone = request.getParameter("phone");

         System.out.println(name);
         System.out.println(phone);
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_phonecheck.jsp");    
         rd.forward(request, response);
   

/* 본인확인 데이터 가져오기*/                  
      }else if(str2.equals("EventMan_phonecheck_Action.do")){
    
         System.out.println("EventMan_phonecheck_Action.do if문");
         
            
/*   마이페이지 리스트 화면   */         
      }else if(str2.equals("EventMan_Mypage_Myboardlist.do")) {
   
      System.out.println("EventMan_Mypage_Myboardlist.do if문");
      
      String midx = request.getParameter("midx");
      
      System.out.println("midx= "+midx);
      
      BoardServiceImpl boarddao = new BoardServiceImpl();
      ArrayList alistboard = boarddao.selectmyboardlist(midx);
      
      
      request.setAttribute("alistboard", alistboard);
      
      
      RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_Myboardlist.jsp");
      rd.forward(request, response);
      
   
   
/*   마이페이지 리스트 상세보기   */      
      }else if(str2.equals("EventMan_Mypage_MyboardlistDetail.do")) {
         
         System.out.println("EventMan_Mypage_MyboardlistDetail.do if문");
         
         
         RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Mypage/EventMan_Mypage_MyboardDetail.jsp");
         rd.forward(request, response);
         
         
/*	비밀번호 찾기 ACTION	*/
      }else if(str2.equals("EventMan_Member_Find_Pw_Action.do")) {

          System.out.println("if문 비밀번호 찾기");
    	  
    	  String id = request.getParameter("id");
    	  String email = request.getParameter("email");

    	  System.out.println("id : "+id);
    	  System.out.println("email : "+email);
    	  
    	   //먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
    	  
    	  EvMemberVo mvo  = new MemberServiceImpl().findpw(id,email);
    	  
          if(mvo==null || !mvo.getmEmail().equals(email))
          {
              request.setAttribute("msg", "아이디나 이메일 정보가 맞지 않습니다");
              
              RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp ");    
              rd.forward(request, response);
              
              return;
          }else {
          
                  //mail server 설정
                  String host = "smtp.naver.com";
                  String user = "maen2@naver.com"; //자신의 네이버 계정
                  String password = "hwang9295A!";//자신의 네이버 패스워드
                  
                  //메일 받을 주소
                  String to_email = mvo.getmEmail();
                  
                  //SMTP 서버 정보를 설정한다.
                  Properties props = new Properties();
                  props.put("mail.smtp.host", host);
                  props.put("mail.smtp.port", 465);
                  props.put("mail.smtp.auth", "true");
                  props.put("mail.smtp.ssl.enable", "true");
                  
                  //인증 번호 생성기
                  StringBuffer temp =new StringBuffer();
                  Random rnd = new Random();
                  for(int i=0;i<10;i++){
                      int rIndex = rnd.nextInt(3);
                      switch (rIndex) {
                      case 0:
                          // a-z
                          temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                          break;
                      case 1:
                          // A-Z
                          temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                          break;
                      case 2:
                          // 0-9
                          temp.append((rnd.nextInt(10)));
                          break;
                      }
                  }
                  String AuthenticationKey = temp.toString();
                  System.out.println("AuthenticationKey : "+AuthenticationKey);
                  
                  
                  
                  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                      protected PasswordAuthentication getPasswordAuthentication() {
                          return new PasswordAuthentication(user,password);
                      }
                  });
                  
                  
                  //email 전송
	                try {
                	  System.out.println("try입니다.");
                	  
                	  ////////////////////////////////////
                	  System.out.println("↓exception");
                	  MimeMessage msg = new MimeMessage(session);
                    
                      msg.setFrom(new InternetAddress(user, "EVENTMAN"));
                      msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
                      
                      //메일 제목
                      msg.setSubject("안녕하세요 EVENTMAN 인증 메일입니다.");
                      //메일 내용
                      msg.setText("인증 번호는 :"+temp);
                      
                      Transport.send(msg);
                      System.out.println("이메일 전송");
                      
                  }catch (Exception e) {
                	  System.out.println("catch입니다.");
                      e.printStackTrace();// TODO: handle exception
                  }
                  HttpSession saveKey = request.getSession();
                  saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
                  
                  //패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
                  
                  request.setAttribute("id", id);                  
                  RequestDispatcher rd =request.getRequestDispatcher("/EventMan_Member/EventMan_Member_Find_Pw.jsp ");    
                  rd.forward(request, response);
          }
      }

    	  
    	  
    	  
}
      

      
   

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      doGet(request, response);
   }

   
   
   /* (윤진) */
   
   
   
}