<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

	<!-- top nav CSS -->
	<link rel="stylesheet" type="text/css"   href="../css/topnav.css">
	<!-- footer CSS -->
	<link rel="stylesheet" type="text/css"   href="../css/footer.css">

<!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous">

</script>

<style>



/* 로그인 화면 */
	#roginbox{
		max-width:500px;
		margin:0px auto;
		margin-top:100px;
		margin-bottom:200px;
		font-style: gray;
	}
	
	#inputwidth{
		width:400px;
	}
	
	#roginbtn{
		height:100px;
		margin-left:20px;
		position: relative;
		bottom: 5px;
	}
	
	table{
		width:500px;
	}
	.input-group{
		margin:5px;	
	}
	#underline1, #underline2{
		border-bottom: 1px solid lightgray;
		margin-bottom: 30px;
	}
	#underline1{
		margin-bottom:50px;	
	}
	tr{
		height:50px;
	}
	#EVENTMAN{
		text-align:center;
	}
	.input-group-text{
		width:50px;
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
		          			<a class="nav-link fw-bold"href="../EventMan_Member/EventMan_Member_Join.jsp">회원가입</p></a>
		       			</li>
		       			<li class="nav-item" id="liright2"> 
		          			<a class="nav-link fw-bold" href="../EventMan_Member/EventMan_Member_Login.jsp">로그인</a>
		       			</li>
		      		</ul>
		    	</div>
		  	</div>
		</nav>
	</div>
		
	<!-- 페이지 위치 안내 -->
	<div class="container"  id="containermargin">	
		<!-- 집 아이콘 -->
		<a href="../EventMan_Main/EventMan_Main.jsp">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
			<path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
		</svg>
		</a>
		
		<!-- 화살표 아이콘 -->
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		
		<!-- 현제 페이지 이름 -->
		로그인
	</div>	
		
		
		
		
		
<!-- 로그인화면 -->		
	<div class="container">
		
		<div id="roginbox">
			<div id="underline1">
				<p class="fs-5 text-black-50">login</p>
			</div>
			<div id="underline2">
				<p class="fs-1 text-muted" id="EVENTMAN">EVENT MAN</p>
			</div>
			<form>
				<table>
					<tr>
						<td id="inputwidth">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">ID</span>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1>
							</div>
						</td>
						<td rowspan='2'>
							<div class="d-grid gap-2">
								<button class="btn btn-outline-secondary btn-sm" type="button" id="roginbtn"   data-bs-toggle="modal" data-bs-target="#exampleModal" tabindex=3>로그인</button>
							</div>
						</td>
					</tr>
					<tr>
						<td id="inputwidth">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">PW</span>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=2>
							</div>
						</td>
					</tr>
				</table>
			
			
				
				
				<div class="d-grid gap-2">
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='EventMan_Member_Join.jsp'">회원가입</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='EventMan_Member_Find_Id.jsp'">아이디찾기</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='EventMan_Member_Find_Pw.jsp'">비밀번호찾기</button>
				</div>
			</form>
		</div>
	</div>
		



<!-- 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">로그인 실패!</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        로그인 확인문 결과 실패시 나옴
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
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






<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>