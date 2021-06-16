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

	<!-- top nav CSS -->
	<link rel="stylesheet" type="text/css"   href="../css/topnav.css">
	<!-- footer CSS -->
	<link rel="stylesheet" type="text/css"   href="../css/footer.css">

<style>

fdfdfdf

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
			<img src="../rogo1.png" alt="" width="150" class="d-inline-block align-text-top">
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