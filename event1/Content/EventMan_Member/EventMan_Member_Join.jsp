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
</html>