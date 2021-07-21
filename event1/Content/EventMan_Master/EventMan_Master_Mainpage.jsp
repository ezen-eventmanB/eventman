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
   
	<% int costcount = (int)request.getAttribute("value"); %>
	
	<% int boardcount = (int)request.getAttribute("value2"); %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap에 필요한 CSS파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<!-- 관리자 마이페이지 CSS -->
<link rel="stylesheet" type="text/css" href="../css/masterpage.css">
 <!-- topmenue CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">

<title>관리자페이지</title>
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
      
<br>
<br>
<!-- 관리자 페이지 화면 -->
<div class="container" id="masterpage">

   <div class="row">
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../cost.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize1" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_AllCostList.do'">견적신청<br><%=costcount %> 건</button>
         </div>
      </div>
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../counselling.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize1" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_AllBoardList.do'">상담신청<br><%=boardcount %> 건</button>
         </div>
      </div>
   </div>
   <div class="row">
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../review.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do'">행사리뷰</button>
         </div>
      </div>
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../company.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do'">회사소개</button>
         </div>
      </div>
   </div>
   <div class="row">
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../board.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do'">게시판</button>
         </div>
      </div>
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../member.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_Modify.do'">회원관리</button>
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

<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</body>
</html>