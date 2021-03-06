<%@page import="service.MemberServiceImpl"%>
<%@page import="vo.EvMemberVo" %>
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

<% EvMemberVo mvo3 = (EvMemberVo)request.getAttribute("mvo2");%>

    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<title>EVENT MAN!</title>

	 <!-- topmenue CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">
   
	<!-- subnav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/subnav.css">


<script>

	  function check(){
			   
		  $("#textbox").html("<%=mvo3.getmName()%> 님의 회원 정보를 수정합니다.");
		  $("#modal").modal("show");
		  
	 
	  
	  }; 
	  
	  function MasterAction() {
		document.frm.action = "<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_MemberModifyAction.do";
		document.frm.method = "post";
		document.frm.submit();
		 
	  
	  };
 </script>
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
	계정 수정하기
</div>
		
					


<!-- 회원정보 수정 테이블 -->		
			<div class="container mx-auto mt-5" style="max-width:500px;">
				<div id="roginbox">
					<div id="underline1">
						<p class="fs-5 text-black-50">Modify</p>
					</div>
		
				<div id="underline2">
					<p class="fs-1 text-muted" id="EVENTMAN">회 원 정 보</p>
				</div>
				<form name="frm">
						
				
					<div class="fs-5 fw-bold">계정 종류</div>
					<select class="form-select" aria-label="Default select example" name="mType" id="mType">
		               <option selected value="mType" disabled>회원 종류를 선택해주세요.</option>
		               <option value="개인" <%=mvo3.getmType().equals("개인") ? " selected" : "" %>>개인</option>
		               <option value="단체" <%=mvo3.getmType().equals("단체") ? " selected" : "" %>>단체</option>
		               <option value="기업" <%=mvo3.getmType().equals("기업") ? " selected" : "" %>>기업</option>
           			</select>

					<div class="fs-5 fw-bold">아이디</div>
					<input class="form-control mb-3" type="text" value="<%=mvo3.getmId() %>" aria-label="readonly input example" readonly>

					<div class="fs-5 fw-bold">비밀번호</div>
					<input class="form-control mb-3" type="password" aria-label="default input example" name="mPwd" value="<%=mvo3.getmPwd()%>" aria-label="readonly input example" readonly>

					<div class="fs-5 fw-bold">이름</div>
					<input class="form-control mb-3" type="text" value="<%=mvo3.getmName() %>" aria-label="readonly input example" readonly>

					<div class="fs-5 fw-bold">연락처</div>
					<input class="form-control mb-3" type="text" placeholder="ex)010-0000-0000" name="mPhn" aria-label="default input example" value="<%=mvo3.getmPhn()%>" aria-label="readonly input example" readonly>

					<div class="fs-5 fw-bold">이메일</div>
					<input class="form-control mb-3" type="text" placeholder="ex)mail@mail.com" name="mEmail"aria-label="default input example" value="<%=mvo3.getmEmail()%>" aria-label="readonly input example" readonly>
					
					
					
					<div class="fs-5 fw-bold">회원 상태</div>
					<select class="form-select" aria-label="Default select example" name="mDelYn" id="mDelYn">
		               <option selected value="mDelYn" disabled>회원 상태</option>
		               <option value="Y" <%=mvo3.getmDelYn().equals("Y") ? " selected" : "" %>>Y</option>
		               <option value="N" <%=mvo3.getmDelYn().equals("N") ? " selected" : "" %>>N</option>
           			</select>
					<p>
					<!-- 세션값을 받으려면 컨트롤러에서 받는게 아닌 받으려는 페이지에서 히든값으로 적어 놓을것 -->
					<input type="hidden" name="midx" value="<%=mvo3.getMidx()%>">
							
						<div class="row">
							<div class="col-md mb-2">
								<button type="button" class="btn btn-outline-secondary w-100" id="b1" onclick="location.href='<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_Modify.do'">돌아가기</button>
							</div>													
							<div class="col-md mb-2">
								<button type="button" class="btn btn-outline-success w-100" id="b1" onclick ="check()">수정완료</button>
							</div>
						</div>				
					</form>
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




<!-- 모달창 -->         
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel"></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
         </div>
         <div class="modal-body">
            <span id="textbox"> </span>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="MasterAction()">확인</button>
         </div>
      </div>
   </div>
</div>




<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>