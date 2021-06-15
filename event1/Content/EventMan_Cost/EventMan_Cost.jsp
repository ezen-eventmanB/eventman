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

/* 메인 푸터 끝*/
	
	/* 견적 신청 부분*/
		.joinroom{
		width:900px;
		height:800px;
		margin:0px auto;
		margin-top:50px;
		border:1px solid black;
	}
	
</style>
</head>
<body>

<div class="container">
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
		          			<a class="nav-link" href="Join.jsp">회원가입</a>
		       			</li>
		       			<li class="nav-item" id="liright2"> 
		          			<a class="nav-link" href="Login.jsp">로그인</a>
		       			</li>
		      		</ul>
		    	</div>
		  	</div>
		</nav>
</div>
	
	<div class="joinroom">
		<header class="" style="">행사 구성</header>
		   <div class="control">   
		      <input type="text" placeholder="행사 지역 입력" class="" >
		   </div>
		   
		   <div>
		      <select>
		         <option>참여대상</option>
		         <option value="all">전체</option>
		         <option value="children">어린이</option>
		         <option value="student">학생</option>
		         <option value="youth">청년</option>
		         <option value="female">여성</option>
		         <option value="worker">직장인</option>
		         <option value="disabled">장애인</option>
		         <option value="aged">노인</option>
		         <option value="corporation">기업·단체</option>
		         <option value="etc">기타</option>
		      </select>
		   </div>
		    
		   <div>
		      <select>
		         <option>방식</option>
		         <option value="offline">오프라인</option>
		         <option value="online">온라인</option>
		         <option value="both">온ㆍ오프라인</option>
		         <option value="etc">기타</option>
		      </select>
		   </div>
		   
		   <div>
		      <select>
		         <option>예산</option>
		         <option value="x">1,000만원 미만</option>
		         <option value="xs">1,000만원 이상 ~ 5,000만원 미만</option>
		         <option value="s">5,000만원 ~ 1억 미만</option>
		         <option value="sm">1억 이상 ~ 3억 미만</option>
		         <option value="m">3억 이상</option>
		         <option value="etc">기타</option>
		      </select>
		   </div>
		   
		   <div>
		      <select >
		         <option>참석인원</option>
		         <option value="less50">50명 미만</option>
		         <option value="less100">50명~100명 미만</option>
		         <option value="less300">100~300명 미만</option>
		         <option value="less500">300~500명 미만</option>
		         <option value="more500">500명 이상</option>
		         <option value="etc">기타</option>
		      </select>
		   </div> 
		   
		   <div>
		    <button type="button" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이전</font></font></button>
		    <input type="submit" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font>
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