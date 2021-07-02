<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 int gidx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }else if(session.getAttribute("gidx") !=null ){
		 gidx= (int)session.getAttribute("gidx");
	 }
	out.println("세션에 담긴 아이디는?");
	out.println(member_id);

	out.println(midx); 
	
	%>    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	
<title>EVENT MAN!</title>
		<!-- top nav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/topnav.css">
	<!-- footer CSS -->
	<link rel="stylesheet" type="text/css" href="../css/footer.css">
	<!-- subnav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/subnav.css">
	<!-- 메인페이지 행사리뷰 CSS -->
	<link rel="stylesheet" type="text/css" href="../css/mainpagereview.css">
	<!-- 메인페이지 하단 게시판 CSS -->
	<link rel="stylesheet" type="text/css" href="../css/mainpageboard.css">
	
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
		
			<a class="navbar-brand" href="../EventMan_Main/EventMan_Main.jsp">
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
	
	
	
	
				
			<table border="1px solid black">
			
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>2</td>
						<td>2</td>
						<td>2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>2</td>
						<td>2</td>
						<td>2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>2</td>
						<td>2</td>
						<td>2</td>
					</tr>
			</table>


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