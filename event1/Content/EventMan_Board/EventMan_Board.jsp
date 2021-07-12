<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>

 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 int gidx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }else if(session.getAttribute("gidx") !=null ){
		 gidx= (int)session.getAttribute("gidx");
	 }

	
	
	
	ArrayList<EvBoardAskVo> alistboard = (ArrayList<EvBoardAskVo>)request.getAttribute("alistboard");  
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
	
<script>

	function boardwWriteFn(){
			
 		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_Write.do?gidx="+<%=gidx%>,
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
		게시판
</div>


<!-- 중앙 네비 카테고리 검색창 -->
<nav style="max-width: 1300px; margin:0px auto; margin-top: 50px;" class="navbar navbar-expand-lg navbar-light bg-light rounded" aria-label="Eleventh navbar example">
	<div class="container-fluid">
	     <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
	       <span class="navbar-toggler-icon"></span>
	     </button>
	   
	     <div class="navbar-collapse collapse" id="navbarsExample09" >
	       <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="midnav">
	       
	                      <!-- 클릭시 검은색 배경으로 변경 수정  -->
	         <li class="nav-item" >
	           <a class="nav-link" href="#">전체</a>
	         </li>
	         <li class="nav-item" >
	           <a class="nav-link" href="#">행사홍보</a>
	         </li>
	         <li class="nav-item" >
	           <a class="nav-link" href="#">행사콘텐츠</a>
	         </li>
	         <li class="nav-item" >
	           <a class="nav-link" href="#">공지사항</a>
	         </li>
	         <li class="nav-item" >
	           <a class="nav-link" href="#">기타</a>
	         </li>
	       </ul>
	       
	       <form>
	        			<%
						if(gidx ==0){
						%>

	     			    <%
				   		}else if(gidx > 0){
				   		%>
			<div style="display:inline-block;">   
	                <a href="<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_BoardWrite.do">관리자 게시물 등록하기</a>
	         </div>
				   		<%
				   		}
				   		%>
	     </div>
	</div>
</nav>


<!-- 게시글 리스트 -->
   <div class="container">
  	 
      <table class="table table-hover">	   
         <thead>
            <th>카테고리</th>
            <th colspan="2">제목</th>
            <th></th>
            <th>작성일</th>
            <th>작성자</th>
            <th>조회수</th>  
         </thead>
         
	        <tbody>
				 	<% for(EvBoardAskVo evbo: alistboard){ %>
				 	<input type="hidden" name="gidx" value="<%=evbo.getGidx()%>"> 
		             <tr onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Board_Detail.do?bidx='+<%=evbo.getBidx()%>">
		               <td><%=evbo.getBcata()%></td>
		               <td colspan="2"><%=evbo.getBtitle()%></td>
		               <td></td>
		               <td><%=evbo.getBWrieday2()%></td>
		               <td><%=evbo.getgName()%></td>
		               <td><%=evbo.getBcount()%></td>
		            </tr>
	       		  <%}; %> 
	         </tbody> 
	         
				</table>
			</div>
   </div>



<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>



<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>