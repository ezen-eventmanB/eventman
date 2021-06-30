<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }
	out.println("세션에 담긴 아이디는?");
	out.println(member_id);
	out.println(midx); 
	
	
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
	<!-- 메인페이지 행사리뷰 CSS -->
	<link rel="stylesheet" type="text/css" href="../css/mainpagereview.css">
	<!-- 메인페이지 하단 게시판 CSS -->
	<link rel="stylesheet" type="text/css" href="../css/mainpageboard.css">
	
<style>

</style>
</head>
<body>


<!-- 상단 네비 부분 -->
	<div class="container">
		<nav class="navbar navbar-expand-xxl navbar-light " id="topnav">
		
			<a class="navbar-brand" href="../EventMan_Main/EventMan_Main.jsp">
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
		



<!-- 중앙배너부분 -->
<div class="bd-example ">
	<div id="carouselExampleCaptions" class="carousel slide " data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item">
				<!-- <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="800" height="400" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 두 번째 슬라이드" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#666"></rect><text x="50%" y="50%" fill="#444" dy=".3em">상담 신청</text></svg> -->
				<img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" src="../banner1.jpg" >
			</div>
			<div class="carousel-item active">
				<img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" src="../banner2.jpg" >

			</div>
			<div class="carousel-item">
				<img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" src="../banner3.jpg" >
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이전</font></font></span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">다음</font></font></span>
		</button>
  	


	</div>
			

	
	
<!-- 중앙 네비 카테고리 검색창 -->
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light rounded">
			<div class="container-fluid">
				<button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
	
				<div class="navbar-collapse collapse" id="navbarsExample09" >
					<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="midnav">
						<li class="nav-item" >
							<a class="nav-link fw-bolder " href="#">전체</a>
						</li>
						<li class="nav-item" >
							<a class="nav-link fw-bolder" href="#">기업</a>
						</li>
						<li class="nav-item" >
							<a class="nav-link fw-bolder" href="#">대학</a>
						</li>
						<li class="nav-item" >
							<a class="nav-link fw-bolder" href="#">공연</a>
						</li>
						<li class="nav-item" >
							<a class="nav-link fw-bolder" href="#">기타</a>
						</li>
					</ul>
				</div>
				
			    <form>
			    	<!-- 컬럼들은 모바일과 데스크탑에서 항상 50% 너비가 됩니다 -->
			    	<div class="inline">
						<select class="form-select form-select-sm">
							<option selected>검색타입1</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
					<div class="inline">
						<select class="form-select form-select-sm">
							<option selected>검색타입2</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>	
					<div class="inline">	
				        <input class="form-control form-control-sm" type="text" placeholder="Search" aria-label="Search" >
					</div>
			    </form>
			</div>
		</nav>
	</div>
	
	
<!-- 메인 행사리뷰 부분 3x3출력 -->
	<section>
		<div class="album">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 축소판" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title>
								<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</svg>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text">전주대학교 신입생 OT 섭외 무대</p>
									<small class="text-muted">행사시작일~행사종료일</small>
								</div>	
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 축소판" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title>
								<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</svg>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text">전주대학교 신입생 OT 섭외 무대</p>
									<small class="text-muted">행사시작일~행사종료일</small>
								</div>	
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 축소판" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title>
								<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</svg>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text">전주대학교 신입생 OT 섭외 무대</p>
									<small class="text-muted">행사시작일~행사종료일</small>
								</div>	
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 축소판" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title>
								<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</svg>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text">전주대학교 신입생 OT 섭외 무대</p>
									<small class="text-muted">행사시작일~행사종료일</small>
								</div>	
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 축소판" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title>
								<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</svg>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text">전주대학교 신입생 OT 섭외 무대</p>
									<small class="text-muted">행사시작일~행사종료일</small>
								</div>	
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 축소판" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title>
								<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</svg>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text">전주대학교 신입생 OT 섭외 무대</p>
									<small class="text-muted">행사시작일~행사종료일</small>
								</div>	
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 축소판" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title>
								<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</svg>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text">전주대학교 신입생 OT 섭외 무대</p>
									<small class="text-muted">행사시작일~행사종료일</small>
								</div>	
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 축소판" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title>
								<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</svg>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text">전주대학교 신입생 OT 섭외 무대</p>
									<small class="text-muted">행사시작일~행사종료일</small>
								</div>	
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시 자 : 축소판" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title>
								<rect width="100%" height="100%" fill="#55595c"></rect>
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
							</svg>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text">전주대학교 신입생 OT 섭외 무대</p>
									<small class="text-muted">행사시작일~행사종료일</small>
								</div>	
							</div>
						</div>
					</div>
				</div>    
			</div>
		</div> 
	</section>
	
	<!-- 행사리뷰 페이징 처리 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>
	</nav>
		
	<!-- 메인 공지사항 4개 출력 -->
	<div class="container bg-light">
	공지사항이미지입니다.
	</div>
	<table class="table table-hover">
	      <thead>
			  <tr>
			    <th scope="col">제목</th>
			    <th scope="col">카테고리</th>
			    <th scope="col">작성일</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			    <td>견적 신청 공지사항</td>
			    <td>공지사항</td>
			    <td>2021-05-20</td>
			  </tr>
			    <tr>
			    <td>견적 신청 공지사항</td>
			    <td>공지사항</td>
			    <td>2021-05-20</td>
			  </tr>  
			  <tr>
			    <td>견적 신청 공지사항</td>
			    <td>공지사항</td>
			    <td>2021-05-20</td>
			  </tr>  
			  <tr>
			    <td>견적 신청 공지사항</td>
			    <td>공지사항</td>
			    <td>2021-05-20</td>
			  </tr>
		  </tbody>
	</table>
	
	
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



</div>




<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>