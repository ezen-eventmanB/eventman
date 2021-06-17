<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_review_detail</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<style>
	
	/**/
	.row{
	max-width: 1200px;
	}
	
	/*상세보기 이미지 박스*/
	#carouselExampleIndicators{
		heighr:370px;
		max-width:576px;
		max-height:370px;
	}

	
	/*카테고리 아이콘 박스*/
	.col{
		max-width:600px;
		max-height:370px;
	}
	.imgs{
		width:60px;
		height:60px;
	}
	.row>*{
		max-width:600px;

	}
	.td{
		width:200px;
		text-align:center;
	}
	.icon{
		width:60px;
	}
	#catatable{
		border-collapse: separate;
		border-spacing: 0 26px
	}
	#cbox{
		max-width:600px;
		border:1px solid lightgray;
	}
	<!-- 상세보기 내용 -->
	
	.bodyin{
		margin-top:200px;
	}
	
	.btn{
	}
	

</style>
</head>
<body>

<!-- 상단 제목 -->
	<p class="fs-1">상세페이지 제목으로 변경</p><br>
	<p class="fs-6">행사장소</p>

<!-- 이미지 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md">
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner" style="height:370px; max-width:576px;">
					<div class="carousel-item active">
						<img src="리뷰이미지.png" class="d-block w-100" alt="">
					</div>
					<div class="carousel-item">
						<img src="회사소개이미지.jpg" class="d-block w-100" alt="">
					</div>
					<div class="carousel-item">
						<img src="rogo1.png" class="d-block w-100" alt="">
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>	
		</div>	

<!-- 카테고리박스 -->				
	<div class="col-md" style="width:600px; height:370px;">	
		<div id="cbox">
			<table id="catatable">
				<tr class="tr1">
					<td class="td"><img class="icon" src="./icon/free-icon-calendar-with-squares-85000.png"></td>
					<td class="td"><img class="icon" src="./icon/free-icon-money-bills-72167.png"></td>
					<td class="td"><img class="icon" src="./icon/free-icon-people-711168.png"></td>
				</tr>
				<tr class="tr2">
					<td class="td">일정</td>
					<td class="td">예산</td>
					<td class="td">인원</td>
				</tr>
				<tr class="tr3">
					<td class="td"><img class="icon" src="./icon/free-icon-question-sign-on-person-head-42994.png"></td>
					<td class="td"><img class="icon" src="./icon/free-icon-business-cards-47976.png"></td>
					<td class="td"><img class="icon" src="./icon/free-icon-university-campus-68286.png"></td>
				</tr>
				<tr class="tr4">
					<td class="td">대상</td>
					<td class="td">역할</td>
					<td class="td">기관</td>
				</tr>
			</table>
		</div>
		<table>
			<tr>
				<td style="width:286px">
					<div class="d-grid gap-2">
						<button type="button" class="btn btn-outline-secondary">견적신청</button>
					</div>	
				</td>
				<td style="width:286px">
					<div class="d-grid gap-2">
						<button type="button" class="btn btn-outline-secondary" onclick="">상담하기</button>
					</div>
				</td>
			</tr>
		</table>
		
	</div>	
	
	<div class="bodyin">			
	<p class="fs-5">주요 프로그램?</p>
	</div>			
	<div class="title">
	<p class="fs-2">제목 , 행사명 (EX: 전북대학교 대동제)</p>
	</div>
	<div class="content">
		<p class="fs-5">2021년 코로나가 끝나 진행되는 전북대학교 대동제!
		각 단과대학 및 학과의 장기자랑과 역대 급 라인업의 연예인 무대!
		</p>	
	</div>
	
	
	
</div>
						
	
				
				
				

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>	

</body>
</html>