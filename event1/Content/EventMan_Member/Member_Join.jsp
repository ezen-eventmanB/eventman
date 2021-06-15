<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>EVENT MAN!</title>

<style>
/*top nav CSS*/
	#navbar-nav{
		width:800px;
		margin:1px auto;
		text-align: center;
		font-weight:bold;
		font-weight:900;
	}
	#navbar-nav li{
		margin:1px auto;
		text-align: center;
	}
	#liright1, #liright2{
		width:80px;
		text-align: right;
		margin-right:1px;
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
	/*위에서 살짝 떨어지는 밑줄 CSS 끝*/
/*top nav CSS 끝*/



/*중앙 행사리뷰 앨범 CSS*/
	.album{
		background-color:white !important;
		margin-bottom: 40px;
	}
	/*행사리뷰 앨범 페이징처리*/
	.pagination {
   		justify-content: center;
	}
	/*행사리뷰 앨범 페이징처리 끝*/
/*중앙 행사리뷰 앨범 CSS 끝*/	




/* 중앙 nav form CSS */
	#midnav .nav-item{
		font-weight: bold;
		font-weight: 900;
	}
/* 중앙 nav form CSS 끝*/
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
/* 메인 하단 게시판 노출 끝*/

/* 메인 푸터*/
	.footer{
		width:500px;
		padding-top:40px;
		margin:0px auto;	
	}
	.joinroom{
		width:600px;
		height:800px;
		margin:0px auto;
		margin-top:50px;
		border:1px solid black;
	}
	.jointitle{
		background-color:;
	}
/* 메인 푸터 끝*/
</style>
</head>
<body>

<!-- 상단 네비 부분 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light" id="topnav">
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
		          			<a class="nav-link" href="Board.jsp">게시판</a>
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
		<div class="joinroom">
		
			<span class="jointitle">회원가입</span>
			<hr>
				<!-- 회원 유행 -->
					<div class="join-member-menu">
						<button type="button" class="btn btn-secondary">회원 유형</button>
						<button type="button" class="btn btn-outline-success">기업</button>
						<button type="button" class="btn btn-outline-warning">단체</button>
						<button type="button" class="btn btn-outline-info">개인</button>
					</div>
					<br>
				<!--아이디 & 중복확인  -->
					<div class="input-group mb-3">
					  <input type="text" class="form-control" placeholder="ID" aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn-outline-secondary" type="button" id="button-addon2">중복확인</button>
					</div>
				<!--비밀번호  -->
					<div class="memberpwd">	
						<input type="text" class="form-control" placeholder="Password" aria-label="Recipient's username" aria-describedby="button-addon2">
					</div>
				<!--비밀번호 확인  -->
					<br>
					<div class="membercheckpwd">	
						<input type="text" class="form-control" placeholder="Password" aria-label="Recipient's username" aria-describedby="button-addon2">
					</div>
					<br>
				<!--이름  -->
					<div class="membername">	
						<input type="text" class="form-control" placeholder="Name" aria-label="Recipient's username" aria-describedby="button-addon2">
					</div>
				<!--연락처  -->
					<br>
					<div class="input-group mb-3">
					  <input type="text" class="form-control" placeholder="Phone Number" aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증번호 보내기</button>
					</div>
				<!--인증번호  -->
					<div class="phonecheck">	
						<input type="text" class="form-control" placeholder="인증번호" aria-label="Recipient's username" aria-describedby="button-addon2">
					</div>
				<!--이메일  -->
					<br>
					<div class="memberemail">	
						<input type="text" class="form-control" placeholder="E-mail" aria-label="Recipient's username" aria-describedby="button-addon2">
					</div>
					<br>
				<!--회원가입  -->
				<div class="d-grid gap-2">
				  <button class="btn btn-primary" type="button">회원가입</button>
				  
				</div>
		</div>


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








<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>