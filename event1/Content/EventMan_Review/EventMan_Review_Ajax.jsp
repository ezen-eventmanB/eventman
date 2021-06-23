<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "domain.*" %>
   
<%ArrayList<EvReviewVo> reviewList = (ArrayList<EvReviewVo>)request.getAttribute("reviewList"); %>    
<%-- <%PageMaker pm = (PageMaker)request.getAttribute("pm"); %> --%>

<!doctype html>
<html>
<title>EVENT MAN!</title>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
</style>

<script>
</script>

</head>
<body>

		


<!-- 메인 행사리뷰 부분 3x3출력 -->
<div class="album">
	<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			
				<% for(EvReviewVo erv : reviewList){ %>
				<div class="col">
					<div class="card shadow-sm">
						<a href="javascript:void(0);" onclick="detailFn('<%=erv.getHidx()%>')"><img class="bd-placeholder-img card-img-top stretched-link" width="100%" height="225" src="리뷰이미지.png"></img></a>
							<title><%=erv.gethName() %></title>
						
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
	



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>