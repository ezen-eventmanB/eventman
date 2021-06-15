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
		

<!-- 중앙배너부분 -->
		<div>
      		<img src="rogo1.png" alt="" width="100%" class="d-inline-block align-text-top">
        </div>
        
	<nav style="max-width:1300px; margin:0px auto; margin-top: 30px;">
		<div class="input-group input-group-sm mb-3">
		
			 	<div class="input-group input-group-sm mb-3">
		 			 <span class="input-group-text" id="inputGroup-sizing-sm">검색</span>
		 			 <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
				</div>
		</div>
	</nav>
	

<!-- 중앙 네비 카테고리 검색창 -->
<nav style="max-width: 1300px; margin:0px auto; margin-top: 50px;" class="navbar navbar-expand-lg navbar-light bg-light rounded" aria-label="Eleventh navbar example">
<div class="container-fluid">
	  <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="navbar-collapse collapse" id="navbarsExample09" >
	    <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="midnav">
	    
	    					<!-- 클릭시 검은색 배경으로 변경 수정  -->
	      <li class="nav-item" >
	        <a class="nav-link" href="#">전체</a>
	      </li>
	      <li class="nav-item" >
	        <a class="nav-link" href="#">행사홍보</a>
	      </li>
	      <li class="nav-item" >
	        <a class="nav-link" href="#">행사콘텐츠</a>
	      </li>
	      <li class="nav-item" >
	        <a class="nav-link" href="#">공지사항</a>
	      </li>
	      <li class="nav-item" >
	        <a class="nav-link" href="#">기타</a>
	      </li>
	    </ul>
	    
	    <form>
	    	<!-- 컬럼들은 모바일과 데스크탑에서 항상 50% 너비가 됩니다 -->
	    	<div style="display:inline-block;">
				<span>등록일</span>
			</div>
			<div style="display:inline-block;">
				<span>과거</span><span>최신</span>
			</div>	
			<div style="display:inline-block;">	
		       	<button type="button" class="btn btn-outline-secondary">게시물 등록하기</button>
			</div>
			
	    </form>
	  </div>
</div>
</nav>
<table class="table">
  	<thead>
	    <th>카테고리</th>
	    <th colspan="2">제목</th>
	    <th></th>
	    <th>작성일</th>
	    <th>작성자</th>
	    <th>조회수</th>  
	  </thead>
  <tbody>
    <tr class="table-active">
      <td>행사</td>
      <td colspan="2"><a href="#">[행사홍보] 전북대학교 대동제 </a></td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>1</td>
    </tr>
    <tr>
      <td>공지</td>
      <td colspan="2">[공지] EVENTMAN 공지사항 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>46</td>
    </tr>
    <tr class="table-active">
      <td>입찰</td>
      <td colspan="2">[입찰] 나라장터 수의계약 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>4</td>
    </tr>
    <tr>
      <td>공지</td>
      <td colspan="2">[공지] EVENTMAN 공지사항 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>46</td>
    </tr>
    <tr class="table-active">
      <td>입찰</td>
      <td colspan="2">[입찰] 나라장터 수의계약 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>4</td>
    </tr>
     <tr>
      <td>공지</td>
      <td colspan="2">[공지] EVENTMAN 공지사항 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>46</td>
    </tr>
    <tr class="table-active">
      <td>입찰</td>
      <td colspan="2">[입찰] 나라장터 수의계약 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>4</td>
    </tr>
     <tr>
      <td>공지</td>
      <td colspan="2">[공지] EVENTMAN 공지사항 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>46</td>
    </tr>
    <tr class="table-active">
      <td>입찰</td>
      <td colspan="2">[입찰] 나라장터 수의계약 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>4</td>
    </tr>
     <tr>
      <td>공지</td>
      <td colspan="2">[공지] EVENTMAN 공지사항 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>46</td>
    </tr>
    <tr class="table-active">
      <td>입찰</td>
      <td colspan="2">[입찰] 나라장터 수의계약 </td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>4</td>
    </tr>
    
  </tbody>
</table>
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



<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>