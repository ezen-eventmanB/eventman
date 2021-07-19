<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 int gidx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }else if(session.getAttribute("gidx") !=null ){
		 gidx= (int)session.getAttribute("gidx");
	 }

	%>    
	
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap에 필요한 CSS파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>

<script>

function findId(){
	
	var fm = document.frm;
	
    var username = $("#name").val();
    var userphone = $("#phone").val();
    var useremail = $("#email").val();
    var alldata = { "name": username, "phone": userphone, "email": useremail};
    
    var namepattern = /^[가-힣\s]{2,20}$/;                        //한글만사용가능
    var emailpattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,4}$/; //이메일 적합
    var phonepattern = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
    
    
	if(username.trim() ==''){
    	$("#textbox").html("이름을 입력해주세요.");
		$("#modal1").modal("show");	
    	return;
	}else if(!namepattern.test(fm.name.value)){
		$("#textbox").html("이름을 정확하게 입력해주세요.");
		$("#modal1").modal("show");
		return;
		
	}else if(userphone.trim()==''){
    	$("#textbox").html("전화번호를 입력해주세요.");
		$("#modal1").modal("show");	
    	return;
	}else if(!phonepattern.test(fm.phone.value)){
		$("#textbox").html("전화번호를 정확하게 입력해주세요. ex)010-0000-0000");
		$("#modal1").modal("show");
		return;
		
	}else if(useremail.trim()==''){
    	$("#textbox").html("이메일을 입력해주세요.");
		$("#modal1").modal("show");	
    	return;
	}else if(!emailpattern.test(fm.email.value)){
		$("#textbox").html("이메일를 정확하게 입력해주세요. ex)email@email.com");
		$("#modal1").modal("show");
		return;
	}else{
		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Find_Id_Action.do",
			type:"post",
			data:alldata,
			success:function(data){
				var str = data.trim();
				$("#findidspan").html(str);
				$("#modal").modal("show");
			}	
		})

	};

};

function loginFn(){
	location.href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do";
};

</script>


<!-- footer CSS -->
<link rel="stylesheet" type="text/css"   href="../css/footer.css">
 <!-- topmenue CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">

<style>


   .label1{
      width:130px;
      justify-content: space-around;
      text-align: center;
   }

</style>



</head>
<body>


<!-- 상단 네비 부분 -->
<div class="container">
	<nav class="navbar navbar-expand-xxl navbar-light" id="topnav">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/EventMan_Main/EventMan_Main.do">
				<img src="../rogo1.png" alt="" class="d-inline-block align-text-top" id="toprogoimg">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>	

			<div class="collapse navbar-collapse w-50" id="navbarNav">
	
				<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="navbar-nav">
					<li class="nav-item px-5 mx-auto"><a class="nav-link fw-bolder text-dark fs-5" href="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do">견적신청</a>
					</li>
					<li class="nav-item px-5 mx-auto"><a class="nav-link fw-bolder text-dark fs-5" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do">행사리뷰</a>
					</li>
					<li class="nav-item px-5 mx-auto"><a 
						class="nav-link fw-bolder text-dark fs-5"
						href="<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do">회사소개</a>
					</li>
					<li class="nav-item px-5 mx-auto"><a
						class="nav-link fw-bolder text-dark  fs-5"
						href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do">게시판</a>
					</li>
				</ul>
	
	
				<!--로그인 전 상단 화면  -->
				<%
				if (midx == 0 && gidx == 0) {
				%>
	
				<ul class="navbar-nav" id="Memberbox">
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Join.do">회원가입</a>
					</li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do">로그인</a>
					</li>
				</ul>
	
				<!--맴버 로그인 후 상단 화면  -->
				<%
				} else if (midx > 0) {
				%>
				<ul class="navbar-nav" id="Memberbox">
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do?midx=<%=midx%>">My
							page</a></li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Modify.do">계정
							설정</a></li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
					</li>
				</ul>	
				
				<!-- 마스터 로그인 후 상단 화면 -->
				<%
				} else if (gidx > 0) {
				%>
				<ul class="navbar-nav" id="Memberbox">
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_Mainpage.do">Master
							page</a></li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
					</li>
				</ul>
				<%
				}
				%>
			</div>
		</div>
	</nav>
</div>
		
		
		
		
<!-- 아이디 찾기 화면 -->		
	<div class="container">
		
		<div class="mx-auto mt-5" style="max-width:500px;">
			<div id="underline1">
				<p class="fs-5 text-black-50 mt-5">아이디 찾기</p>
			</div>
			<div id="underline2">
				<p class="fs-1 text-muted" id="EVENTMAN">EVENT MAN</p>
			</div>
			<form name="frm">
				<div class="input-group mb-3">
					<span class="input-group-text w-25 text-center label1" id="inputGroup-sizing-default">이름</span>
					<input type="text" name="name" id="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1>
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text w-25 text-center label1" id="inputGroup-sizing-default">핸드폰번호</span>
					<input type="text" class="form-control" name="phone" id="phone" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 placeholder="ex)010-0000-0000">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text w-25 text-center label1" id="inputGroup-sizing-default">이메일</span>
					<input type="text" class="form-control" name="email" id="email" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 placeholder="ex)email@email.com">
				</div>
				
				<div class="d-grid gap-2">
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="findId()">확인</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Find_Pw.do'">비밀번호찾기</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do'">뒤로</button>
				</div>
			</form>
		</div>
	</div>
		


<!-- 성공 모달 -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
      </div>
      <div class="modal-body">
         <span id="findidspan"> </span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="loginFn()">확인</button>
      </div>
    </div>
  </div>
</div>


<!-- 이름 or 전화번호 입력 요구 모달 -->
<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
      </div>
      <div class="modal-body">
         <span id="textbox"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">로그인</button>
      </div>
    </div>
  </div>
</div>






<!-- 메인 푸터 -->
<div class="footer mt-5"></div>
<div class="container mt-5 mb-5">
	<div class="row justify-content-md-center mt-5">
		<div class="col-md-auto">
			<img src="../rogo1.png" alt="" width="200"
				class="d-inline-block align-text-center">
		</div>
		<div class="col-md-auto">
			<small class="text-muted"> 전화번호 063-222-2222<br>
				EVENTMAN | 전주시 덕진구 효자동 | 대표. 000<br> ACC. 계좌번호 (예금주 :홍길동) |
				사업자 번호. 000-000-0000<br>
			</small>
		</div>
	</div>
</div>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>