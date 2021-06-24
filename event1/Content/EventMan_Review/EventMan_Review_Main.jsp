<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "domain.*" %>

 <%
	String member_id = (String)session.getAttribute("S_memberId");
	 int midx = 0;
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }
	 
	out.println("세션에 담긴 아이디는?");
	out.println(member_id);
	out.println(midx);
%>    

	<%
		ArrayList<EvReviewVo> reviewList = (ArrayList<EvReviewVo>)request.getAttribute("reviewList"); 
	%>  
<%-- <%PageMaker pm = (PageMaker)request.getAttribute("pm"); %> --%>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>EVENT MAN!</title>

    <!-- Bootstrap에 필요한 CSS파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    


	<!-- top nav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/topnav.css">
	<!-- footer CSS -->
	<link rel="stylesheet" type="text/css" href="../css/footer.css">
	<!-- subnav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/subnav.css">
	
<style>
	#imgbax{
		object-fit: cover;
	}
</style>

<script>

/*	카테고리 별로 보는 ajax	*/
	function selectAll(){
		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_selectAll.do",
			type:"post",
			datatype:"html",
			success:function(data){
				$("#load").html(data);
			}	
		});
	};
	
	function selectCompany(){
		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_selectCompany.do",
			type:"post",
			datatype:"html",
			success:function(data){
				$("#load").html(data);
			}	
		});
	}
	
	function selectUniversity(){
		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_selectUniversity.do",
			type:"post",
			datatype:"html",
			success:function(data){
				$("#load").html(data);
			}	
		});
	}
	
	function selectStage(){
		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_selectStage.do",
			type:"post",
			datatype:"html",
			success:function(data){
				$("#load").html(data);
			}	
		});
	}
	
	function selectxEeption(){
		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_selectxEeption.do",
			type:"post",
			datatype:"html",
			success:function(data){
				$("#load").html(data);
			}	
		});
	}
	
	

	
/*	 상세보기  ajax	*/
 	function detailFn(param1){
		
		var params ="?hidx="+param1;

		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_detail.do"+params,
			type:"get",			
			datatype:"html",
			success:function(data){
				$("#detailload").html(data);
			}
					
		});
	
	}
 
 
</script>

</head>
<body>

<div class="container ajax">



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
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do">My page</a>
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
	행사리뷰
</div>
		

<div id="detailload">

<!-- 중앙 네비 카테고리 검색창 -->
<div class="container">
	<nav style="max-width: 1300px; margin:0px auto; margin-top: 50px;" class="navbar navbar-expand-lg navbar-light rounded" aria-label="Eleventh navbar example">
		<div class="container-fluid">
			<button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbarsExample09" >
				<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="midnav">
					<li class="nav-item" >
						<a class="nav-link fw-bolder" type="button" onclick="selectAll()">전체</a>
					</li>
					<li class="nav-item" >
						<a class="nav-link fw-bolder" type="button" onclick="selectCompany()">기업</a>
					</li>
					<li class="nav-item" >
						<a class="nav-link fw-bolder" type="button" onclick="selectUniversity()">대학</a>
					</li>
					<li class="nav-item" >
						<a class="nav-link fw-bolder" type="button" onclick="selectStage()">공연/예술</a>
					</li>
					<li class="nav-item" >
						<a class="nav-link fw-bolder" type="button" onclick="selectxEeption()">기타</a>
					</li>
				</ul>
				<form>
			    	<!-- 컬럼들은 모바일과 데스크탑에서 항상 50% 너비가 됩니다 -->
			    	<div style="display:inline-block;">
						<select class="form-control" style="display:inline-block;">
							<option selected>예산</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
					<div style="display:inline-block;">
						<select class="form-control" style="display:inline-block;">
							<option selected>인원</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>	
					<div style="display:inline-block;">	
				        <input class="form-control" type="text" placeholder="Search" aria-label="Search" >
					</div>
				</form>
			</div>
		</div>
	</nav>
</div>


<!-- 메인 행사리뷰 부분 3x3출력 -->
<section id="load">
		<div class="album">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	 				<% for(EvReviewVo erv : reviewList){ %>
						<div class="col">
							<div class="card shadow-sm">
								<a href="javascript:void(0);" onclick="detailFn('<%=erv.getHidx()%>')">
									<img class="bd-placeholder-img card-img-top stretched-link" id="imgbax" width="100%" height="225" src="../filefolder/detailimg.jpg" title="<%=erv.gethName()%>"></img>
								</a>	
								<div class="card-body">
									<div class="justify-content-between align-items-center">
										<p class="card-text"><%=erv.gethName() %></p>
										<small class="text-muted"><%=erv.getstartdate() %>~<%=erv.getendenddate() %></small>

									</div>	
								</div>
							</div>
						</div>
					<%}; %>
				</div>
			</div> 
		</div>
</section>

</div>

<%-- <!-- 행사리뷰 페이징 처리 -->
<nav aria-label="Page navigation example">
	<ul class="pagination">
	
		<%if(pm.isPrev() == true) {%>
			<li class="page-item">
				<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=pm.getStartPage()-1 %>&searchType=<%=pm.getScri().getSearchType()%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		<%} %>
		<% for(int i = pm.getStartPage(); i<=pm.getEndPage(); i++) { %>
		<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=i %>&searchType=<%=pm.getScri().getSearchType()%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>"><%=i %></a></li>
		<% } %>

		<% if(pm.isNext() == true){ %>
			<li class="page-item">
				<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=pm.getStartPage()-1 %>&searchType=<%=pm.getScri().getSearchType()%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		<%} %>
	</ul>
</nav> --%>
	







<!-- 메인 푸터 -->
<div class="footer" >
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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>