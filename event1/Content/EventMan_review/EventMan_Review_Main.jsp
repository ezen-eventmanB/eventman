<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT MAN 행사리뷰</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<style>

/*top nav CSS*/
	#navbar-nav{
		width:800px;
		margin:1px auto;
		text-align: center;
		font-weight:900;
	}
	#navbar-nav li{
		margin:1px auto;
		text-align: center;
	}
	#liright1, #liright2{
		width:80px;
		text-align: right;
	}
	.navbar{
		background-color:white !important;
	}
	.nav li a{
		background-color:white;
	} 
	.nav .active a{
		background-color:white!important;
	}
	.nav-li:hover {
		color:black;	
	}
	
/*위에서 살짝 떨어지는 밑줄 CSS*/
	#topnav .nav-link{
		  position: relative;
		  padding-bottom: 10px;
	}
	#topnav .nav-link:before{
		  content: '';
		  position: absolute;
		  bottom: 2px;
		  left: 0; right: 0;
		  height: 2px;
		  background-color: #3f8ad4;
	}
	#topnav .nav-link:before{
		  opacity: 0;
		  -webkit-transform: translateY(-8px);
		  transform: translateY(-8px);
		  -webkit-transition: opacity 0s, -webkit-transform 0s cubic-bezier(0.175, 0.885, 0.32, 1.275);
		    transition: opacity 0s, -webkit-transform 0s cubic-bezier(0.175, 0.885, 0.32, 1.275);
		    transition: transform 0s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0s;
		    transition: transform 0s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0s, -webkit-transform 0s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	}
	#topnav .nav-link:hover:before{
		  opacity: 1;
		    -webkit-transform: translateY(0);
		    transform: translateY(0);
		  -webkit-transition: opacity 0.2s, -webkit-transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
		    transition: opacity 0.2s, -webkit-transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
		    transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0.2s;
		    transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275), opacity 0.2s, -webkit-transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	}

/*서브카테고리 CSS*/
	.nav-link{
		font-weight:900;
		margin-bottom:20px;
	}


/*중앙 행사리뷰 앨범 CSS*/
	.album{
		background-color:white !important;
		margin-bottom: 40px;
	}
	
/*행사리뷰 앨범 페이징처리*/
	.pagination {
   		justify-content: center;
	}



/* 메인 푸터*/
	.footer{
		width:500px;
		padding-top:40px;
		margin:0px auto;	
	}


/* 현재 페이지 위치*/	
	#containermargin{
	 	margin-bottom:30px;
	}

</style>



</head>
<body>











<!-- 상단 네비 부분 -->
		<nav class="navbar navbar-expand-lg navbar-light" id="topnav">
			<div class="container-fluid">
				<a class="navbar-brand" href="/event1/event.jsp">
		     		<img src="rogo1.png" alt="" width="200" class="d-inline-block align-text-top">
		    	</a>
		        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      		<span class="navbar-toggler-icon"></span>
		   		</button>
		    	<div class="collapse navbar-collapse" id="navbarNav">
		      		<ul class="navbar-nav" id="navbar-nav">
		        		<li class="nav-item">
		          			<a class="nav-link" href="#">견적신청</a>
		        		</li>
		        		<li class="nav-item">
		          			<a class="nav-link" href="#">행사리뷰</a>
		        		</li>
		       			<li class="nav-item">
		          			<a class="nav-link" href="#">회사소개</a>
		       			</li>
		       			<li class="nav-item">
		          			<a class="nav-link" href="#">게시판</a>
		       			</li>
		       		</ul>
		       		<ul class="navbar-nav">	
		       			<li class="nav-item" id="liright1">
		          			<a class="nav-link" href="#">회원가입</a>
		       			</li>
		       			<li class="nav-item" id="liright2">
		          			<a class="nav-link" href="#">로그인</a>
		       			</li>
		      		</ul>
		    	</div>
		  	</div>
		</nav>
		

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
		회사소개
	</div>
		






<!-- 중앙 네비 카테고리 검색창 -->
<nav style="max-width: 1300px; margin:0px auto; margin-top: 50px;" class="navbar navbar-expand-lg navbar-light rounded" aria-label="Eleventh navbar example">
<div class="container-fluid">
	  <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="navbar-collapse collapse" id="navbarsExample09" >
	    <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="midnav">
	      <li class="nav-item" >
	        <a class="nav-link" href="#">전체</a>
	      </li>
	      <li class="nav-item" >
	        <a class="nav-link" href="#">기업</a>
	      </li>
	      <li class="nav-item" >
	        <a class="nav-link" href="#">대학</a>
	      </li>
	      <li class="nav-item" >
	        <a class="nav-link" href="#">공연/예술</a>
	      </li>
	      <li class="nav-item" >
	        <a class="nav-link" href="#">기타</a>
	      </li>
	      
	    </ul>
	    
	    <form>
	    	<!-- 컬럼들은 모바일과 데스크탑에서 항상 50% 너비가 됩니다 -->
	    	<div style="display:inline-block;">
				<select class="form-control" style="display:inline-block;">
					<option selected>예산</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>
			<div style="display:inline-block;">
				<select class="form-control" style="display:inline-block;">
					<option selected>인원</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>	
			<div style="display:inline-block;">	
		        <input class="form-control" type="text" placeholder="Search" aria-label="Search" >
			</div>
			
	    </form>
	  </div>
</div>
</nav>


<!-- 메인 행사리뷰 부분 3x3출력 -->
<section>
	<div class="album">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			
				<div class="col">
					<div class="card shadow-sm">
						<a href="#"><img class="bd-placeholder-img card-img-top" width="100%" height="225" src="리뷰이미지.png"></a>
							<title>전주대학교 신입생 OT</title>
						</img>
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
	







<!-- 메인 푸터 -->
<footer class="footer">
	<div class="d-flex justify-content-between align-items-center">
		<div class="btn-group">
			<img src="rogo1.png" alt="" width="150" class="d-inline-block align-text-top">
		</div>
		<div>
			<div class="container">
				<span class="text-muted">
					<small>전화번호 063-222-2222</small>
				</span>
			</div>
			<div class="container">
				<span class="text-muted">
					<small>EVENTMAN | 전주시 덕진구 효자동 | 대표. 000</small>
				</span>
			</div>
			<div class="container">
				<span class="text-muted">
					<small>ACC. 계좌번호 (예금주 :홍길동) | 사업자 번호. 000-000-0000 </small>
				</span>
			</div>
		</div>
    </div>
</footer>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>