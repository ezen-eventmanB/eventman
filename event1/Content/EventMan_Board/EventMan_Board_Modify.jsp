<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>    
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "domain.*" %>

 <%
	String member_id = (String)session.getAttribute("S_memberId");
	 
	int midx = 0;
	int gidx = 0;
	 
	if (session.getAttribute("midx") != null) {
		midx = (int)session.getAttribute("midx");
	}else if(session.getAttribute("gidx") !=null ){
		gidx= (int)session.getAttribute("gidx");
	}
	
	EvBoardAskVo bavo = (EvBoardAskVo)request.getAttribute("bavo");
   %>    
    
    
<!doctype html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
   <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>

   <!-- subnav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/subnav.css">
   <!-- mypage CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mypage.css">
 <!-- topmenue CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">
<title>EVENT MAN!</title>

		<script>
			//수정 완료 버튼
			function modifyFn(){
			
			var frm = document.form;
			
			document.frm.action="<%=request.getContextPath()%>/EventMan_Board/EventMan_Board_Modify_Action.do";
			document.frm.method="post";
			document.frm.submit();
			
			};		
			//삭제하기 버튼
			function ModalBoardDeletFn(){
				$("#textbox").html("&#34;<%=bavo.getBname()%>&#34; 글을 삭제합니다.");
				$("#modal").modal("show");
			
			};
			
			function BoardDeletFn() {
				location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Board_BoardDelete.do?bidx=<%=bavo.getBidx()%>&gidx=<%=gidx%>'
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
      게시판
   </div>
      

<div class="container">
 <div class="shadow p-3 mt-2 mb-2 bg-body rounded">
	<form name="frm">
		<input type="hidden" name="bidx" value="<%=bavo.getBidx()%>">
			<div class="mypageajax">
				<!-- 상세보기-->
				<div class="container" id="myboardbox">
						<div class="fs-5 fw-bold">카테고리</div>
						<div>
							<select class="form-select mb-2" aria-label="Default select example" name="cata" id="cata">
								<option selected>카테고리</option>
								<option value="행사홍보" <%=bavo.getBcata().equals("행사홍보") ? "selected" : ""%>>행사 홍보</option>
								<option value="공지사항" <%=bavo.getBcata().equals("공지사항") ? "selected" : ""%>>공지사항</option>
								<option value="뉴스레터" <%=bavo.getBcata().equals("뉴스레터") ? "selected" : ""%>>뉴스레터</option>
								<option value="기타" <%=bavo.getBcata().equals("기타") ? "selected" : ""%>>기타</option>
							</select>
						</div>
						<div class="fs-5 fw-bold">제목</div>
						<div class="fs-1 fw-bold mb-3"><input class="form-control form-control-lg fs-1 fw-bold mb-3" type="text" name="Btitle" value="<%=bavo.getBtitle() %>" aria-label=".form-control-lg example"></div>
						<div class="mb-5 pb-2 border-bottom border-3 ">
							<span class="fw-bold me-2">등록일</span>
							<span class="me-3"><%=bavo.getBwriteday()%></span>
							<span class="fw-bold me-2">작성자</span>
							<span class=" me-3"><%=bavo.getgName() %></span>
							<span class="fw-bold me-2">조회수</span>
							<span class=" me-3"><%=bavo.getBcount()%></span>
						</div>
					<div>
					
			                <div class="form-floating">
			              <textarea class="form-control" id="floatingTextarea2" style="height: 400px" name="Bcontents"><%=bavo.getBcontents() %></textarea>
			              <label for="floatingTextarea2">게시판 내용을 작성해주세요.</label>
			            </div>
			               <hr/>
			         </div>
						
						
						<div class="text-center">
							<%if(bavo.getBfile() != null){%>
								<img class="mt-3" style="max-width:90%; margin:5px auto;" name="Bfile" src="../Advice_img/<%=bavo.getBfile() %>">
							<%}; %> 
						</div>
					</div>
					<div class="text-end mt-5">
					
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do?midx=<%=midx%>'">목록</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="modifyFn()">수정 완료</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="ModalBoardDeletFn()">삭제</button>

			
					</div>
				</div>
			</form>
		</div>
</div>	
	
	<!--   모달   -->
	<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="BoardDeletFn()">확인</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</body>
</html>