<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script>

</script>


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

/* 메인 푸터*/
	.footer{
		width:500px;
		padding-top:40px;
		margin:0px auto;	
	}



/* 로구인 화면 */
	#roginbox{
		max-width:500px;
		margin:0px auto;
		margin-top:100px;
		margin-button:200px;
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
	#underline{
		border-bottom: 1px solid lightgray;
		margin-bottom: 30px;
	}
	tr{
		height:50px;
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
		
		
		
		
		
		
<!-- 로그인화면 -->		

	

		
		
<div class="container">
	<div id="roginbox">
		<div id="underline">
			<p class="fs-4">rogin</p>
		</div>
		<form>
			<table>
				<tr>
					<td id="inputwidth">
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">ID</span>
							<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						</div>
					</td>
					<td rowspan='2'>
						<div class="d-grid gap-2">
							<button class="btn btn-outline-secondary btn-sm" type="button" id="roginbtn"   data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">PW</span>
							<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						</div>
					</td>
				</tr>
			</table>
		
		
			
			
			<div class="d-grid gap-2">
				<button type="button" class="btn btn-outline-secondary btn-sm">회원가입</button>
				<button type="button" class="btn btn-outline-secondary btn-sm">ID찾기</button>
				<button type="button" class="btn btn-outline-secondary btn-sm">PW찾기</button>
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