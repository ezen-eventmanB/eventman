<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>EVENT MAN! 견적신청-2</title>

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

	.hQBClp {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    font-size: 1.2rem;
    font-weight: 700;
    padding: 0px 1rem;
    margin-top: auto;
    color: rgb(34, 140, 182);

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
	
	.jKoelK {
    display: block;
    outline: none;
    box-sizing: border-box;
    border: 0px;
    padding: 0.85rem;
    border-radius: 3px;
    transition: all 0.3s ease 0s;
    width: 40%;
    max-width: 40%;
    box-shadow: rgb(234 234 235) 0px 0px 4px;
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
      catatitle{
         width:100px;
         text-align:center;
      }
     #cataSelect{
         display: inline-block;
      }
	
	
	
</style>
</head>
<body>

<div class="container">
<!-- 상단 네비 부분 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light" id="topnav">
			<div class="container-fluid">
				<a class="navbar-brand" href="/event1/event.jsp">
		     		<img src="../rogo1.png" alt="" width="200" class="d-inline-block align-text-top">
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
		<div class="sc-qPIWj eXGQeW">행사 기본정보
		<div step="1" class="sc-pIUfD hQBClp">STEP
		<div step="2" class="sc-pIUfD hQBClp">1</div>
		<div step="3" class="sc-PIUfD lnpFnt">2</div>
		</div>
		</div>
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
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                         <label class="form-check-label" for="inlineCheckbox1">워크숍</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                         <label class="form-check-label" for="inlineCheckbox2">판촉행사</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">오픈행사</label></th>
                  </tr>
                  <tr>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option4">
                         <label class="form-check-label" for="inlineCheckbox4">체육대회</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5">
                         <label class="form-check-label" for="inlineCheckbox5">레크레이션</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option6">
                         <label class="form-check-label" for="inlineCheckbox6">기타</label></th>
                  </tr>
               </table>
            </div>
            <br>
            <div id="catatitle">기업</div>
         </div>
         
         
<!-- 공연 -->
		<div class="CostCata">
            <img src="../stage-lights.png" id="catagoryimg">
            <div id="cataSelect">
               <table>
                  <tr>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5">
                         <label class="form-check-label" for="inlineCheckbox5">댄스</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option6">
                         <label class="form-check-label" for="inlineCheckbox6">지역 공연</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option7">
                         <label class="form-check-label" for="inlineCheckbox7">클래식</label></th>
                  </tr>
                  <tr>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option8">
                         <label class="form-check-label" for="inlineCheckbox8">마술</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="option9">
                         <label class="form-check-label" for="inlineCheckbox9">기타</label></th>
                  </tr>
               </table>
            </div>
            <br>
            <div id="catatitle">공연</div>
         </div>
	
<!-- 대학 -->
		<div class="CostCata">
            <img src="../school.png" id="catagoryimg">
            <div id="cataSelect">
               <table>
                  <tr>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="option10">
                         <label class="form-check-label" for="inlineCheckbox10">대학 축제</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="option11">
                         <label class="form-check-label" for="inlineCheckbox11">체육 대회</label></th>
                  </tr>
                  <tr>
                  	 <th><input class="form-check-input" type="checkbox" id="inlineCheckbox12" value="option12">
                    	 <label class="form-check-label" for="inlineCheckbox12">섭외</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox13" value="option13">
                         <label class="form-check-label" for="inlineCheckbox13">콘서트</label></th>
                  </tr>
               </table>
            </div>
            <br>
            <div id="catatitle">대학</div>
         </div>
	
	
	
	
		
<!-- 기타 -->	
		<div class="CostCata">
            <img src="../confetti.png" id="catagoryimg">
            <div id="cataSelect">
               <table>
                  <tr>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox14" value="option14">
                         <label class="form-check-label" for="inlineCheckbox14">결혼식</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox15" value="option15">
                         <label class="form-check-label" for="inlineCheckbox15">칠순잔치</label></th>
                  </tr>
                  <tr>
                  	 <th><input class="form-check-input" type="checkbox" id="inlineCheckbox16" value="option16">
                    	 <label class="form-check-label" for="inlineCheckbox16">돌잔치</label></th>
                     <th><input class="form-check-input" type="checkbox" id="inlineCheckbox17" value="option17">
                         <label class="form-check-label" for="inlineCheckbox17">프로포즈</label></th>
                  </tr>
               </table>
            </div>
            <br>
            <div id="catatitle">기타</div>
         </div>
		
		
<!-- 행사 설명 -->	
	     <div class="sc-qPIWj eXGQeW">행사 설명</div>
                <div class="form-floating">
              <textarea class="form-control" id="floatingTextarea2" style="height: 400px"></textarea>
              <label for="floatingTextarea2">진행하고자 하는 행사에 대해 적어주세요.</label>
            </div>
         </div>
	
	
<!-- 참고자료  -->
	<div class="container">
	<div class="sc-qPIWj eXGQeW">참고 자료</div>
	<div class="form-group">
      <input class="form-control" type="file" id="formFile">
    <hr/>
    </div>


<!-- 다음단계  -->
	<div>
	<div class="d-grid gap-2">
		<input class="btn btn-primary" onclick="location.href='EventMan_Cost2.jsp'" type="submit" value="다음단계"></a>
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