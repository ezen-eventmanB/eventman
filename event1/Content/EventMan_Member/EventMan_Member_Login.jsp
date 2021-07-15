<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
   String member_id = (String)session.getAttribute("S_memberId");
 
    int midx = 0;
    
    if (session.getAttribute("midx") != null) {
       midx = (int)session.getAttribute("midx");
    }

   
   
   %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous">
</script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script>
  
var frm = document.frm;

function check(){         
 

   if(document.frm.memberId.value =="")   {
      $("#modaltext").html("아이디를 입력해주세요");
      $("#exampleModal").modal("show");   
      document.getlementById('memberId').focus();
      
   }else if(document.frm.memberPwd.value==""){
      $("#modaltext").html("비밀번호를 입력해주세요");
      $("#exampleModal").modal("show");   
      document.getlementById('memberPwd').focus();
      
   }else{             
      document.frm.action ="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LoginAction.do";
      document.frm.method = "post";
      document.frm.submit();    
      return;
    }
 }

   
</script>



</head>
<body>

<!-- header include -->
<jsp:include page="/WEB-INF/header.jsp"/>
     
   
   
<!-- 페이지 위치 안내 -->
   <div class="container"  id="containermargin">   
      <!-- 집 아이콘 -->
      <a href="<%=request.getContextPath()%>/EventMan_Main/EventMan_Main.do">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
         <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
         <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
      </svg>
      </a>
      
      <!-- 화살표 아이콘 -->
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
         <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
      </svg>
      
      <!-- 현제 페이지 이름 -->
      로그인
   </div>   
      
      
      
      
      
<!-- 로그인화면 -->      

   <div class="container">
      <div style="max-width:500px;" class="mx-auto">
         <div class="mt-5">
            <p class="fs-5 text-black-50">login</p>
         </div>

      <div id="underline2">
         <p class="fs-1 text-muted" id="EVENTMAN">EVENT MAN</p>
      </div>
      <form name="frm">
      
         <div class="row">
            <div class="col-md-8 pe-0" style="width:75%">
               <div class="input-group mb-4 w-auto">
                  <span class="input-group-text" id="inputGroup-sizing-default">ID</span>
                  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 name="memberId">
               </div>
               <div class="input-group mb-3 w-auto">
                  <span class="input-group-text" id="inputGroup-sizing-default">PW</span>
                  <input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=2 name="memberPwd">
               </div>
            </div>
            <div class="col">
               <div class="d-grid gap-2 mb-3">
                  <button class="btn btn-outline-primary btn-sm" type="button" id="loginbtn" style="height: 100px;width:100%;min-width: 60px; " onclick="check()">로그인</button>
               </div>
            </div>
         </div>
            
            

         <div class="d-grid gap-2 mt-3">                                       
            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Join.do'">회원가입</button>
            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Find_Id.do'">아이디찾기</button>
            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Find_Pw.do'">비밀번호찾기</button>
            </div>
         </form>
      </div>
   </div>

      



<!-- 아이디 비밀번호 입력 안 했을시 띄우는 모달 -->

   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">로그인 실패</h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
              <span id="modaltext"></span>
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
         </div>
       </div>
     </div>
   </div>


<!-- 아이디 및 비밀번호 틀렸을때  -->
   <div class="modal fade" id="failModal" tabindex="-2" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">로그인  실패</h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
              아이디 및 패스워드를 확인 해주세요.
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
         </div>
       </div>
     </div>
   </div>
   
   
   
   
   




<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>






<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>