<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
    <!-- Bootstrap에 필요한 CSS파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<title>게시판 상세보기</title>
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">
   <link rel="stylesheet" type="text/css" href="../css/footer.css">
   <link rel="stylesheet" type="text/css" href="../css/pagepath.css"> 
	
	
<style>
	
	/* 게시물 상세보기 CSS*/
	.leftmargin{
		margin-left: 4px;
		margin-right: 10px;
	}
	#boardcard{
		margin-top:50px;
		min-height:400px;
	}
	#listbtn{
		margin-top:10px;
	}
	.card-img{
		margin-top:20px;
		height:100px;
	}


</style>

</head>
<body>
<!-- 상단 네비 부분 -->
 <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light " id="topnav">
         <div class="container-fluid">
            <a class="navbar-brand" href="../EventMan_Main/EventMan_Main.jsp">
                 <img src="../rogo1.png" alt="" class="d-inline-block align-text-top" id="toprogoimg">
             </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
               </button>
             <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav" id="navbar-nav">
                    <li class="nav-item">
                         <a class="nav-link fw-bolder text-reset" href="../EventMan_Cost/EventMan_Cost.jsp">견적신청</a>
                    </li>
                    <li class="nav-item">
                         <a class="nav-link fw-bolder text-reset" href="../EventMan_review/EventMan_Review_Main.jsp">행사리뷰</a>
                    </li>
                      <li class="nav-item">
                         <a class="nav-link fw-bolder text-reset" href="../EventMan_Company/EventMan_Company_Main.jsp">회사소개</a>
                      </li>
                      <li class="nav-item">
                         <a class="nav-link fw-bolder text-reset" href="../EventMan_Board/EventMan_Board.jsp">게시판</a>
                      </li>
                   </ul>
                   <ul class="navbar-nav" id="Memberbox">   
                      <li class="nav-item" id="liright1">
                         <a class="nav-link fw-bold"href="../EventMan_Member/Member_Join.jsp">회원가입</p></a>
                      </li>
                      <li class="nav-item" id="liright2"> 
                         <a class="nav-link fw-bold" href="../EventMan_Member/Member_Login.jsp">로그인</a>
                      </li>
                  </ul>
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
	
	
<!-- 게시판 상단 이미지 -->
<div class="container">
	<div class="card bg-light text-white">
		 <img class="card-img" alt="...">
	</div>	
</div>	

	
<!-- 게시판 상세 내용 -->
<div class="container">
	<div class="card border-dark" id="boardcard">
		<div class="card-header "><span class="fs-2 fw-bold">글제목</span>
			<div class="container">
				<div class="row row-cols-auto">
					<div class="col"><span class="fw-bold">등록일</span><span class="leftmargin">2021-00-00</span></div>
					<div class="col"><span class="fw-bold">작성자</span><span class="leftmargin">이름</span></div>
					<div class="col"><span class="fw-bold">조회수</span><span class="leftmargin">1</span></div>
				</div>
			</div>
		</div>
		<div class="card-body text-dark">
			<h5 class="card-title text-center fs-3">title</h5>
			<p class="card-text text-center">content</p>
		</div>
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button type="button" class="btn btn-outline-secondary" id="listbtn" onclick="location.href='EventMan_Board.jsp'">목록</button>
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
</body>
</html>