<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }

	
	
	%>    
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
	
	
.eoGDzK {
    position: relative;
    box-sizing: border-box;
    z-index: 1;
    display: flex;
}
	
	
	
	
	
	
	
</style>
</head>
<body>

<!-- 상단 네비 부분 -->
	<div class="container">
		<nav class="navbar navbar-expand-xxl navbar-light " id="topnav">
		
			<a class="navbar-brand" href="<%=request.getContextPath()%>/EventMan_Main/EventMan_Main.do">
		     	<img src="../rogo1.png" alt="" class="d-inline-block align-text-top" id="toprogoimg">
		    </a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      	<span class="navbar-toggler-icon"></span>
		   	</button>
		    <div class="collapse navbar-collapse w-50" id="navbarNav">
		    
	      		<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="navbar-nav">
	        		<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do">견적신청</a>
	        		</li>
	        		<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do">행사리뷰</a>
	        		</li>
	       			<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do">회사소개</a>
	       			</li>
	       			<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do">게시판</a>
	       			</li>
	       		</ul>
	       	
	
					<!--로그인 전 상단 화면  -->	
						<%
						if(member_id == null){
						%>
						
		       		<ul class="navbar-nav" id="Memberbox" >	
		       			<li class="nav-item">
		          			<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Join.do">회원가입</a>
		       			</li>
		       			<li class="nav-item"> 
		          			<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do">로그인</a>
		       			</li>																	
		      		</ul>
		      		
		      	<!--로그인 후 상단 화면  -->
						<%
				      	}else{
						%>	
			       	<ul class="navbar-nav" id="Memberbox" >	
			       		<li class="nav-item">
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do?midx=<%=midx%>">My page</a>
			       		</li>
			       		<li class="nav-item"> 
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Modify.do">계정 설정</a>
			       		</li>
			       		<li class="nav-item"> 
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
			       		</li>																			
			      	</ul>
				   		<%
				   		}
				    	%>
	    	</div>	
		</nav>
</div>
	
	
	  <!-- 페이지 위치 안내 -->	
	 <div class="container"  id="containermargin">
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
		<div step="2" class="sc-pIUfD lnpFnt">1</div>
		<div step="3" class="sc-PIUfD hQBClp">2</div>
		</div>
		</div>
		<hr/>	
	</div>
	
	<!-- 행사 구성 -->
		<div class="container">
  	<div class="sc-qPIWj eXGQeW">행사 구성</div>
   	<input type="text" class="form-control" placeholder="행사 명을 입력해주세요" aria-label="cost name">
 	<br>
 	</div>
		
		
	<!-- 구성 카테고리 선택 -->
			<div class="sc-fzqAui eoGDzK" style="margin: 0.3rem;">
			<div class="container">
			<table>
		      	<select placeholder="참여대상" class="sc-fzokvW jKoelK">
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
		      	</table>
		  <br>
		  </div>
		  </div>
		  </div>
		  
		  <table>
		  	<div class="sc-fzqAui eoGDzK" style="margin: 0.3rem;">
		    <div class="container">
		    <select placeholder="방식" class="sc-fzokvW jKoelK">
		         <option>방식</option>
		         <option value="offline">오프라인</option>
		         <option value="online">온라인</option>
		         <option value="both">온ㆍ오프라인</option>
		         <option value="etc">기타</option>
		      </select>
		  </table>
		  <br>
		  </div>
		  </div>
		   
		 
		   <div class="container">
		  <table>
		      <select placeholder="예산" class="sc-fzokvW jKoelK">
		         <option>예산</option>
		         <option value="x">1,000만원 미만</option>
		         <option value="xs">1,000만원 이상 ~ 5,000만원 미만</option>
		         <option value="s">5,000만원 ~ 1억 미만</option>
		         <option value="sm">1억 이상 ~ 3억 미만</option>
		         <option value="m">3억 이상</option>
		         <option value="etc">기타</option>
		      </select>
		   </table>
		   <br>
		   </div>
		   
		   
		   
		   <div class="container">
		  <table>
		      <select placeholder="참여인원" class="sc-fzokvW jKoelK">
		         <option>참여인원</option>
		         <option value="less50">50명 미만</option>
		         <option value="less100">50명~100명 미만</option>
		         <option value="less300">100~300명 미만</option>
		         <option value="less500">300~500명 미만</option>
		         <option value="more500">500명 이상</option>
		         <option value="etc">기타</option>
		      </select>
		   </table>
		   <br>
		   </div> 

		   
		 <!-- 이전 , 제출 버튼 -->  
		 <div class="container" align="right">
			<button class="btn btn-primary" onclick="location.href='EventMan_Cost1.jsp'" type="button">이전</button>
			<input class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" type="button" value="제출">
		</div>
		
		<!--  모달 부분 -->
			<div class="modal"  id="exampleModal" tabindex="-1">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">견적 신청</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="취소"></button>
			      </div>
			      <div class="modal-body">
			        <p>작성하시겠습니까?</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary">제출 하기</button>
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








<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>