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
	
	 String img = (String)request.getAttribute("imgname");
	 
	%>          
    
    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>EVENT MAN!</title>

	<!-- subnav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/subnav.css">
	
<script type="text/javascript">
	function companyModifyFn(){
		location.href= "<%=request.getContextPath()%>/EventMan_Master/EventMan_Company_Modify.do";
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
	회사소개
</div>


<!-- 회사소개 페이지 -->
<article>
	
	<!-- 회사 소개 이미지 -->
	<%if(gidx>0){ %>
		<div class="mt-5 mb-5 float-end">
			<button type="button" class="btn btn-outline-primary me-3" onclick="companyModifyFn()">이미지수정</button>
		</div>
	<%}; %>
	<div class="container">	
		<div class="bd-example">
			<img src="../filefolder/<%=img%>" alt="" class="bd-placeholder-img card-img-top stretched-link imgbox">
			<!-- <img src="회사소개 이미지 불러오는 메소드();" alt=""> -->
		</div>
	</div>



	<!-- 회사 지도 API-->
	<div class="container">	
		<div id="map" style="width:100%;height:350px;"></div>
		<div class="d-grid gap-2">
				<button type="button" class="btn btn-outline-secondary mt-5" onclick="panTo()">회사 위치 보기</button>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d13687712724db7a58c691808cbdaa56"></script>
	<script src="../js/kakaoView.js"></script>
	
</article>



<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>