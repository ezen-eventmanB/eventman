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

/*중앙 행사리뷰 앨범 CSS*/
	.album{
		margin-bottom: 40px;
	}
	/*행사리뷰 앨범 페이징처리*/
	.pagination {
   		justify-content: center;
	}


/* 중앙 nav form CSS */
	#midnav .nav-item{
		font-weight: bold;
		font-weight: 900;
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
	.boardwritearea{
		max-width:65%;
		margin:0px auto;
		margin-top:100px;
		margin-bottom:200px;
		font-style: gray;
	}
	.writeheader{
		text-align:center;
		font-size:30px;
		margin-bottom: 40px;

	}
	.writetitle{
		width:100%;
		margin-bottom: 20px;
		height:40px;
		
	}
	.sectionheader{
		text-align:left;
		font-size:25px;
		margin-bottom: 20px;
	}
	.form-select{
		margin-bottom: 20px;
	}
	.form-label{
		
	}
	/* STEP , 1 CSS  */
   .hQBClp {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    font-size: 1.2rem;
    font-weight: 700;
    padding: 0px 1rem;
    margin-top: auto;
    color: rgb(34, 140, 182);
    float: right;
	}

	/* STEP 2 CSS */
	   .lnpFnt {
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    font-size: 1.2rem;
	    font-weight: 700;
	    padding: 0px 1rem;
	    margin-top: auto;
	    color: rgb(171, 171, 171);
	    float: right;
	}
	
	/* 부제목 글꼴 굵게 , 크기 변경 */
	   .eXGQeW {
	    position: relative;
	    box-sizing: border-box;
	    flex: 1 1 auto;
	    padding: 1rem 1rem 0px;
	    font-size: 1.2rem;
	    font-weight: 700;
	    color: rgb(47, 51, 56);
	}
	
		.box {
		  float: left;
		  width: 200px;
		  height: 100px;
		  margin: 1em;
		}
				
		#catagoryimg{
			width:100px;
		}
		.CostCata{
			width:550px;
			margin-left:65px;
			display: inline-block;
		}
		#catatitle{
			width:100px;
			text-align:center;
		}
		#cataSelect{
			display: inline-block;
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
		          			<a class="nav-link fw-bolder text-reset" href="../EventMan_Review/EventMan_Review_Main.jsp">행사리뷰</a>
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
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
			<path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
		</svg>
		
		<!-- 화살표 아이콘 -->
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		
		<!-- 현제 페이지 이름 -->
		견적 신청
	</div>
		
		

<!-- 행사 기본정보 -->
   <div class="container">
      <div class="sc-qPIWj eXGQeW ">행사 기본정보
      <div step="1" class="sc-PIUfD hQBClp">STEP 1 2</div>
      <hr/>   
   </div>
   
   
<!-- 행사 명 -->
     <div class="container">
     <div class="sc-qPIWj eXGQeW">행사 명</div>
      <input type="text" class="form-control" placeholder="행사 명을 입력해주세요" aria-label="cost name">
   <hr/>
    </div>

   
   
<!-- 행사 일정 -->   
   <div class="container">
        <div class="sc-qPIWj eXGQeW">행사 일정</div>
   <input type = "text" placeholder = "행사 시작일" readonly class="calendar"> <input type = "text" placeholder = "행사 종료일" readonly class="calendar">  
      <div class="icon">
      <span class="calendar">
      </span>
      <hr/>
   </div>


<!-- 행사 카테고리 선택 -->
	
		<div class="sc-qPIWj eXGQeW">행사 카테고리</div>
			<!-- 기업 행사 -->
			
			<div class="CostCata">
				<img src="../enterprise.png" id="catagoryimg">
				<div id="cataSelect">
					<table>
						<tr>
							<th>              <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
             								 <label class="form-check-label" for="inlineCheckbox1">워크숍</label>
							</th>
							<th>  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
             								 <label class="form-check-label" for="inlineCheckbox1">판촉행사</label></th>
							<th><input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
             								 <label class="form-check-label" for="inlineCheckbox1">오픈행사</label></th>
						</tr>
						<tr>
							<th><input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
             								 <label class="form-check-label" for="inlineCheckbox1">체육대회</label></th>
							<th><input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
             								 <label class="form-check-label" for="inlineCheckbox1">레크레이션</label></th>
							<th><input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
             								 <label class="form-check-label" for="inlineCheckbox1">기타</label></th>
						</tr>

					</table>
				</div>
				<br>
				<div id="catatitle">기업 </div>
			</div>
			
			
			
			
			
			
		
			<!-- 기업 행사 -->
			<div class="CostCata">
				<img src="../stage-lights.png" id="catagoryimg">
				<div id="theme-colors">공연</div>
			</div>
			
			<br/>
			
			<div class="CostCata">
				<img src="../school.png" id="catagoryimg">
				<div id="theme-colors">대학 </div>
			</div>
			
			<div class="CostCata">
				<img src="../confetti.png" id="catagoryimg">
				<div id="theme-colors">기타</div>
			</div>
      <hr/>

      
   <!--  행사 설명 -->   
         <div class="sc-qPIWj eXGQeW">행사 설명</div>
    				<div class="form-floating">
				  <textarea class="form-control" id="floatingTextarea2" style="height: 400px"></textarea>
				  <label for="floatingTextarea2">진행하고자 하는 행사에 대해 적어주세요.</label>
				</div>
        
  		 </div>
   
   
<!--  참고자료  -->
   <div class="form-group">
      <label for="formFile" class="form-label mt-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">참고 자료</font></font></label>
      <input class="form-control" type="file" id="formFile">
    <hr/>
    </div>


<!-- 이전 , 다음단계 가는길 -->
   <div align="right">
      <button class="btn btn-primary" type="submit">이전</button>
      <input class="btn btn-primary" type="submit" value="다음단계">
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