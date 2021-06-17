<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<script>
	function setImageFn(f){

		var file = f.files;
	
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
			alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
	
			f.outerHTML = f.outerHTML;
	
			document.getElementById('container').innerHTML = '';
	
		}
		else {
	
			var reader = new FileReader();
	
			reader.onload = function(rst){
				document.getElementById('container').innerHTML = '<img src="' + rst.target.result + '">';
			}
	
			reader.readAsDataURL(file[0]);
		}
	}	
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


/* 회사소개페이지 CSS*/
	article{
		margin-top:20px;
	}
	
/* 현재 페이지 위치*/	
	#containermargin{
	 	margin-bottom:30px;
	}
	
/*버튼위치*/
	.btnright{
		widht:400px;
		text-align: right;
	}
	

</style>



</head>
<body>

<!-- 상단 네비 부분 -->
		<nav class="navbar navbar-expand-lg navbar-light" id="topnav">
			<div class="container-fluid">
				<a class="navbar-brand" href="../EventMan_Main/EventMan_Main.jsp">
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
		


	
<article>
<!-- 회사 소개 수정 -->
	<div class="container">	
		<form>
			<div class="btnright">
				<button type="button" class="btn btn-outline-secondary">완료</button>
				<button type="button" class="btn btn-outline-secondary">뒤로</button>
			</div>
			<div class="mb-3">
				<label for="formFile" class="form-label">'gif, jpg, png' 파일만 선택해 주세요.</label>
				<input class="form-control" type="file" id="formFile" onchange="setImageFn(this)">
			</div>
		</form>
	</div>
	<div class="container" id="container">	
	</div>

	
	
	
	<!-- 회사 지도 API-->
	<div class="container">	
		<div id="map" style="width:100%;height:350px;"></div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d13687712724db7a58c691808cbdaa56"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(35.84025999489788, 127.13247645455057), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(35.84025999489788, 127.13247645455057); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
			
		</script>
	</div>




</article>









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