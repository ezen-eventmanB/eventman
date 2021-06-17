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
   
		
	<div class="form-check">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">
		    Default checkbox
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
		  <label class="form-check-label" for="flexCheckChecked">
		    Checked checkbox
		  </label>
		</div>




<!-- 행사 카테고리 선택 -->
   <div class="sc-fzqBkg fCkJVF">
      <div class="container">
          <div class="sc-qPIWj eXGQeW">행사 카테고리</div>   
         <div class= "sc-pcxhi hZRQrC">기업</div>
            <img src="g1.png">
         <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
              <label class="form-check-label" for="inlineCheckbox1">워크숍</label>
         </div>
         
         <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
              <label class="form-check-label" for="inlineCheckbox2">판촉행사</label>
         </div>
         <br>
         &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<div class="form-check form-check-inline">
                 <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                 <label class="form-check-label" for="inlineCheckbox3">레크리에이션</label>
            </div>
            <div class="form-check form-check-inline">
                 <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option4">
                 <label class="form-check-label" for="inlineCheckbox4">체육대회</label>
            </div>
      </div>
   
   
   
   
      <div>공연</div>
      <img src="g2.png">
         <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5">
        <label class="form-check-label" for="inlineCheckbox5">댄스</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option6">
        <label class="form-check-label" for="inlineCheckbox6">지역 공연</label>
      </div>
      <br>
      &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option7">
        <label class="form-check-label" for="inlineCheckbox7">클래식</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option8">
        <label class="form-check-label" for="inlineCheckbox8">마술</label>
      </div>
      
      <div>대학</div>
      <img src="g3.png" alt="">
         <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="option9">
        <label class="form-check-label" for="inlineCheckbox9">대학축제</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="option10">
        <label class="form-check-label" for="inlineCheckbox10">체육대회</label>
      </div>
      <br>
      &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="option11">
        <label class="form-check-label" for="inlineCheckbox11">섭외</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox12" value="option12">
        <label class="form-check-label" for="inlineCheckbox12">콘서트</label>
      </div>
      
      <div>기타</div>
      <img src="g4.png" alt="">
         <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox13" value="option13">
        <label class="form-check-label" for="inlineCheckbox13">결혼식</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox14" value="option14">
        <label class="form-check-label" for="inlineCheckbox14">칠순잔치</label>
      </div>
      <br>
      &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox15" value="option15">
        <label class="form-check-label" for="inlineCheckbox15">돌잔치</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="inlineCheckbox16" value="option16">
        <label class="form-check-label" for="inlineCheckbox16">프로포즈</label>
      </div>
      <hr/>
   <!--  행사 설명 -->   
      <header class="" style="">행사 설명
      <div class="form-floating">
       <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
        <label for="floatingTextarea2"></label>
        </header>
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