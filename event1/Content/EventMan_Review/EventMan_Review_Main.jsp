<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "domain.*" %>

 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 int gidx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }else if(session.getAttribute("gidx") !=null ){
		 gidx= (int)session.getAttribute("gidx");
	 }

	%>    
	


	<%
	ArrayList<EvReviewVo> reviewList = (ArrayList<EvReviewVo>)request.getAttribute("reviewList"); 
	%>  
 	<%PageMaker pm = (PageMaker)request.getAttribute("pm"); %>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>EVENT MAN!</title>

    <!-- Bootstrap에 필요한 CSS파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>

	<!-- subnav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/subnav.css">
	<!-- Review CSS -->
	<link rel="stylesheet" type="text/css" href="../css/review.css">

<script>

/*	카테고리 별로 보는 ajax	*/
	/*전체*/
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
	/*기업*/
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
	/*대학*/
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
	/*공연*/
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
	/*기타*/
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
 
/*	관리자 행사 리뷰 작성하기	*/ 

 	function reviewWriteFn(){
 				
 		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Master/EventMan_Review_Write.do?gidx="+<%=gidx%>,
			type:"get",			
			datatype:"html",
			success:function(data){
				$("#detailload").html(data);
			}
					
		});
 	}
 	
 	
 	
/*	SELECT BOX 선택시 검색해서 보여주기	*/ 	
 	function selectCataFn(){
 		var val1 = "";
 		var val2 = "";
 		
 		val1 = $("#selectbox1").val();
 		val2 = $("#selectbox2").val();
 		
 		var allData = { "val1": val1, "val2": val2 };

		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_selectbox.do?&val1="+val1+"&val2="+val2,
			type:"get",
			datatype:"html",
			success:function(data){
				$("#load").html(data);
			}	
		});
 	}


/*	검색하기 	*/
	function searchReview(){
	
		var val1 = "";
		var val2 = "";
		var val3 = "";
		
		val1 = $("#selectbox1").val();
		val2 = $("#selectbox2").val();
		val3 = $("#serchbox").val();
		
		var allData = { "val1": val1, "val2": val2 };
		
		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_search.do?&val1="+val1+"&val2="+val2+"&val3="+val3,
			type:"get",
			datatype:"html",
			success:function(data){
				$("#load").html(data);
			}	
		});
	
	}
	
	
</script>

</head>
<body>

<div class="container ajax">

<!-- header include -->
<jsp:include page="/WEB-INF/header.jsp"/>
     


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


		
<!-- 중앙 네비 카테고리 검색창 -->

<div id="detailload">

<div class="container">
	<%if(gidx != 0 ){ %>
		<div class="text-end w-100">
			<button type="button" class="btn btn-outline-primary btn-lg mb-n5 mt-2" onclick="reviewWriteFn()">리뷰 작성하기</button>
		</div>
	<%}; %>
	<nav style="max-width: 1300px; margin:0px auto; margin-top: 50px;" class="navbar navbar-expand-lg navbar-light rounded" aria-label="Eleventh navbar example">
		<div class="container-fluid">
			<button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbarsExample09" >
				<ul class="navbar-nav me-auto mb-lg-0" id="midnav">
					<li class="nav-itemmb-5" >
						<a class="nav-link fw-bolder " type="button" onclick="selectAll()">전체</a>
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
					<div class="text-center align-middle">
				    	<div class="align-middle text-center vox" style="display:inline-block;">
							<select class="form-control form-select-sm selectbox" style="display:inline-block;" onchange="selectCataFn()" id="selectbox1">
								<option selected >예산</option>
								<option value="1,000만원 미만">1,000만원 미만</option>
								<option value="1,000만원 이상 ~ 5,000만원 미만">1,000만원 이상~5,000만원 미만</option>
								<option value="5,000만원 ~ 1억 미만"">5,000만원 ~ 1억 미만</option>
								<option value="1억 이상 ~ 3억 미만">1억 이상 ~ 3억 미만</option>
								<option value="3억 이상">3억 이상</option>
								<option value="예산">전체</option>
							</select>
						</div>
						<div class="align-middle text-center  vox" style="display:inline-block;">
							<select class="form-control form-select-sm selectbox" style="display:inline-block;" onchange="selectCataFn()" id="selectbox2">
								<option selected>인원</option>
								<option value="50명 미만">50명 미만</option>
								<option value="50명~100명 미만">50명~100명 미만</option>
								<option value="100~500명 미만">100~500명 미만</option>
								<option value="500~1000명 미만">500~1000명 미만</option>	
								<option value="1000명 이상">1000명 이상</option>
								<option value="인원">전체</option>	
							</select>
						</div>	
						<div style="display:inline-block;">	
					        <input class="form-control form-control-sm " id="serchbox"type="text" placeholder="Search" aria-label="Search" onkeypress="if( event.keyCode == 13 ){searchReview();}">
						</div>	
					</div>
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
								<img class="bd-placeholder-img card-img-top stretched-link imgbox" width="100%" height="225" src="../Advice_img/<%=erv.getHimg()%>"></img>
							</a>
							<title class="fw-bold"><%=erv.gethName() %></title>
							<div class="card-body">
								<div class="justify-content-between align-items-center">
									<p class="card-text hname"><%=erv.gethName() %></p>
									<small class="text-muted"><%=erv.getstartdate() %>~<%=erv.getendenddate() %></small>
								</div>	
							</div>
						</div>
					</div>
				
				<%}; %>
			</div>
		</div> 
	</div>


<!-- 행사리뷰 페이징 처리 -->
	<div class="container mt-5 text-center">
		<div class="row justify-content-md-center">
			<div class="col-md-auto">	
				<nav aria-label="Page navigation example">
					<ul class="pagination">
					<%if(pm.isPrev() == true) {%>
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=pm.getStartPage()-1 %>">
								<span aria-hidden="false">&laquo;</span>
							</a>
						</li>
					<%} %>
					<% for(int i = pm.getStartPage(); i<=pm.getEndPage(); i++) {%>
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=i %>"><%=i %></a>
						</li>
					<% } %>
				
					<% if(pm.isNext() == true){ %>
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=pm.getEndPage()+1 %>" >
								<span aria-hidden="false">&raquo;</span>
							</a>
						</li>
					<%} %>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	

</section>







<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>