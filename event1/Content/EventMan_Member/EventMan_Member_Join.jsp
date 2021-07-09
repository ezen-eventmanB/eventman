<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }

	
	%>        
    
    
<!doctype html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>EVENT MAN!</title>

   <!-- top nav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">
   <!-- footer CSS -->
   <link rel="stylesheet" type="text/css" href="../css/footer.css">
   <!-- subnav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/subnav.css">
<style>
   
<style>

/*중앙 행사리뷰 앨범 CSS*/
   .album{
      margin-bottom: 40px;
   }
   /*행사리뷰 앨범 페이징처리*/
   .pagination {
         justify-content: center;
   }


/* 메인 하단 게시판 노출*/
   .table{
      max-width: 1300px;   
      margin:10px auto;
      text-align:center;
   }
   table{
      max-width: 1300px;   
      margin:10px auto;
      text-align:center;
   }
   .joinroom{
      max-width:700px;   
      margin:10px auto;
   }
   .membertype{
      border:1px solid black;
   }
   #typeid{
      width:150px;
   }
   #underline1{
      text-align:center;
   }
   .input-group-text{
      width:30%;
   }
      </style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>   
<script language = "javascript">

         function check(){
            
            var fm = document.frm;      
      
         if (fm.mId.value =="")   {
            alert("아이디를 입력해주세요.");
            fm.mId.focus();
            return;
         }else if (fm.mPwd.value==""){
            alert("비밀번호를 입력해주세요.");
            fm.mPwd.focus();
            return;
         }else if (fm.mPwd2.value==""){
            alert("비밀번호를 확인해주세요.");
            fm.mPwd2.focus();
            return;
         }else if (fm.mPwd.value !=   fm.mPwd2.value){
             alert("비밀번호가 일치하지 않습니다.");
            fm.mPwd.value = "";
            fm.mPwd2.focus();
            return;
         }else if (fm.mName.value ==""){
             alert("이름을 입력해주세요.");
            fm.mName.focus();
            return;
         }else if (fm.mEmail.value ==""){
             alert("이메일 입력해주세요.");
            fm.mEmail.focus();
            return;
         }else if (fm.mPhn.value ==""){
             alert("핸드폰번호를 입력해주세요.");
            fm.mPhone.focus();
            return;
         }else{
      
            document.frm.action ="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_JoinAction.do";
            document.frm.method = "post";
            document.frm.submit(); 
            alert("완료."); 

         };
         
      };
         function idCheck(){
        		
        	  var userid = $("#mId").val();
              var alldata = { "mid": userid};
             
        	var userid = $("#mId").val();
        		
        	
	        	$.ajax({
					url:"<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_IdCheckAction.do",
					type:"post",
					data: alldata,
					success:function(data){
						$("#checkidspan").html(data);
						$("#modal").modal("show");
						//리셋 ajax 설정하기
						
						//if문 설정하기
						$("#mId").val("");
					}	
				});
         };
      
       </script>
</head>
<body>


<!-- 상단 네비 부분 -->
	<div class="container">
		<nav class="navbar navbar-expand-xxl navbar-light " id="topnav">
		
			<a class="navbar-brand" href="<%=request.getContextPath()%>/EventMan_Main/EventMan_Main.do">
		     	<img src="../rogo1.png" alt="" class="d-inline-block align-text-top" id="toprogoimg">
		    </a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      	<span class="navbar-toggler-icon"></span>
		   	</button>
		    <div class="collapse navbar-collapse w-50" id="navbarNav">
		    
	      		<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="navbar-nav">
	        		<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do">견적신청</a>
	        		</li>
	        		<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do">행사리뷰</a>
	        		</li>
	       			<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do">회사소개</a>
	       			</li>
	       			<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do">게시판</a>
	       			</li>
	       		</ul>
	       	
	
					<!--로그인 전 상단 화면  -->	
						<%
						if(member_id == null){
						%>
						
		       		<ul class="navbar-nav" id="Memberbox" >	
		       			<li class="nav-item">
		          			<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Join.do">회원가입</a>
		       			</li>
		       			<li class="nav-item"> 
		          			<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do">로그인</a>
		       			</li>																	
		      		</ul>
		      		
		      	<!--로그인 후 상단 화면  -->
						<%
				      	}else{
						%>	
			       	<ul class="navbar-nav" id="Memberbox" >	
			       		<li class="nav-item">
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do?midx=<%=midx%>">My page</a>
			       		</li>
			       		<li class="nav-item"> 
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Modify.do">계정 설정</a>
			       		</li>
			       		<li class="nav-item"> 
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
			       		</li>																			
			      	</ul>
				   		<%
				   		}
				    	%>
	    	</div>	
		</nav>
</div>
      
   <!-- 페이지 위치 안내 -->
   <div class="container"  id="containermargin">   
      <!-- 집 아이콘 -->
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
         <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
         <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
      </svg>
      
      <!-- 화살표 아이콘 -->
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
         <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
      </svg>
      
      <!-- 현제 페이지 이름 -->
      회원가입
      
   </div>
            <form name="frm"> 
                  <div class="joinroom">
                     <div id="underline1">
                        <p class="fs-5 text-black-50">회원가입</p>
                        <hr>
                     </div>
                     
                   <table style="text-align:left;width:700px;height:80px">
                     
                         <!--  css 입힌 회원가입  -->
                        <tr id="inputwidth">
                           <div class="input-group mb-3">
                              <span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
                              <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 name="mId" id="mId">
                              <button type="button" class="btn btn-outline-secondary" onclick="idCheck()">아이디 중복체크</button>
                           </div>
                        </tr>
                        <tr id="inputwidth">
                           <div class="input-group mb-3">
                              <span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
                              <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 name="mPwd">
                           </div>
                        </tr>
                        <tr id="inputwidth">
                           <div class="input-group mb-3">
                              <span class="input-group-text" id="inputGroup-sizing-default">비밀번호 확인</span>
                              <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 name="mPwd2">
                           </div>
                        </tr>
                        <tr id="inputwidth">
                           <div class="input-group mb-3">
                              <span class="input-group-text" id="inputGroup-sizing-default">이름</span>
                              <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 name="mName">
                           </div>
                        </tr>
                        <tr id="inputwidth">
                           <div class="input-group mb-3">
                              <span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
                              <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 name="mEmail">
                           </div>
                        </tr>
                        <tr id="inputwidth">
                           <div class="input-group mb-3">
                              <span class="input-group-text" id="inputGroup-sizing-default">연락처</span>
                              <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 name="mPhn">
                           </div>
                        </tr> 
                        
                        
                        <tr id="inputwidth">
                           <div class="input-group mb-3">
                              <span class="input-group-text" id="inputGroup-sizing-default">계정 종류</span>
                                 <select class="form-select" aria-label="Default select example" name="mType">
                                   <option selected disabled>회원 종류를 선택해주세요.</option>
                                   <option value="개인">개인</option>
                                   <option value="단체">단체</option>
                                   <option value="기업">기업</option>
                                 </select>
                           </div>
                        </tr> 
                           
                           <!-- <td><select name="mType" style="width:100px;height:25px">
                              <option value="개인">개인</option>
                              <option value="단체">단체</option>
                              <option value="기업">기업</option>
                              </select>
                           </td> -->
                                                
                        <div class="d-grid gap-2">
                        
                          <button class="btn btn-outline-secondary" type="button"  onclick="check();">회원가입</button>
                          <button class="btn btn-outline-secondary" type="reset">초기화</button>
                        </div>
                        
                     </table>
                  </div>
               </form>
               
               
               <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel"></h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
				      </div>
				      <div class="modal-body">
				         <span id="checkidspan"> </span>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
               
               
<!-- 메인 푸터 -->
<div class="footer">
</div>
   <div class="container">
       <div class="row justify-content-md-center">
         <div class="col-md-auto">
            <img src="../rogo1.png" alt="" width="200" class="d-inline-block align-text-center">
         </div>
         <div class="col-md-auto">
            <small class="text-muted">
               전화번호 063-222-2222<br>
               EVENTMAN | 전주시 덕진구 효자동 | 대표. 000<br>
               ACC. 계좌번호 (예금주 :홍길동) | 사업자 번호. 000-000-0000<br>
            </small>
         </div>
      </div>
   </div>







<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>