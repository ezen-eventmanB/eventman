<%@page import="jdk.internal.org.objectweb.asm.commons.ModuleTargetAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
      
<% EvReviewVo erv = (EvReviewVo)request.getAttribute("erv"); %>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_review_detail</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script>

 function AdviceFn(){
	 if(<%=session.getAttribute("midx")%> == null){
		 $("#findidspan").html("로그인후 이용해주세요.");
		 $("#modal").modal("show")
	 }else{
		 document.location.href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Advicewrite.do?hidx=<%=erv.getHidx()%>";
	 }
 };
</script>
<style>
	
	/**/
	.row{
	max-width: 1200px;
	}
	
	/*상세보기 이미지 박스*/
	#carouselExampleIndicators{
		heighr:370px;
		max-width:576px;
		min-width:576px;
		max-height:370px;
	}

	
	/*카테고리 아이콘 박스*/
	.col{
		max-width:600px;
		max-height:370px;
	}
	.imgs{
		width:60px;
		height:60px;
	}
	.row>*{
		max-width:600px;

	}
	.td{
		width:200px;
		text-align:center;
	}
	.icon{
		width:60px;
	}
	#catatable{
		border-collapse: separate;
		border-spacing: 0 26px
	}
	#cbox{
		max-width:600px;
		border:1px solid lightgray;
	}
	<!-- 상세보기 내용 -->
	
	.bodyin{
		margin-top:200px;
	}
	
	
	
	#imgbax{
		object-fit: cover;
		min-width: 576px;
	}
	
	#btntable{
		margin-top: 20px;
	}

	
</style>



</head>
<body>

<!-- 상단 제목 -->
<div class="mt-5">
	<p class="fs-1"><%=erv.gethName() %></p><br>
	<p class="fs-6"><%=erv.getHloca() %></p>
</div>


<!-- 이미지 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-lg">
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner" style="height:370px; max-width:576px;">
					<div class="carousel-item active">
						<img src="../filefolder/detailimg.jpg" class="d-block w-100" alt="">
					</div>
					<div class="carousel-item">
						<img src="../filefolder/detailimg.jpg" class="d-block w-100" alt="">
					</div>
					<div class="carousel-item">
						<img src="../filefolder/detailimg.jpg" class="d-block w-100" alt="">
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>	
		</div>	

<!-- 카테고리박스 -->				
		<div class="col-lg" style="width:600px; height:370px;">	
			<div id="cbox">
				<table id="catatable">
					<tr class="tr1">
						<td class="td"><img class="icon" src="../icon/free-icon-calendar-with-squares-85000.png"></td>
						<td class="td"><img class="icon" src="../icon/free-icon-money-bills-72167.png"></td>
						<td class="td"><img class="icon" src="../icon/free-icon-people-711168.png"></td>
					</tr>
					<tr class="tr2">
						<td class="td"><%=erv.getstartdate()%>~<%=erv.getendenddate() %></td>
						<td class="td"><%=erv.getHprice() %></td>
						<td class="td"><%=erv.getHpeople() %></td>
					</tr>
					<tr class="tr3">
						<td class="td"><img class="icon" src="../icon/free-icon-question-sign-on-person-head-42994.png"></td>
						<td class="td"><img class="icon" src="../icon/free-icon-business-cards-47976.png"></td>
						<td class="td"><img class="icon" src="../icon/free-icon-university-campus-68286.png"></td>
					</tr>
					<tr class="tr4">
						<td class="td"><%=erv.getHtarget() %></td>
						<td class="td"><%=erv.getHstaff() %></td>
						<td class="td"><%=erv.getHcompany() %></td>
					</tr>
				</table>
			</div>
			<table id="btntable">
				<tr>
					<td style="width:286px">
						<div class="d-grid gap-2">
							<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do'">견적신청</button>
						</div>	
					</td>
					<td style="width:286px">
						<div class="d-grid gap-2">
							<button type="button" class="btn btn-outline-secondary" onclick="AdviceFn()">상담하기</button>
						</div>
					</td>
				</tr>
			</table>
			
		</div>	
		
		<div class="mt-5 bodyin">			
			<p class="fs-5">주요 프로그램?</p>
		</div>			
		<div class="title">
			<p class="fs-2"><%=erv.gethName() %></p>
		</div>
		<div class="content">
			<p class="fs-5">
				<%=erv.getHtext() %>
			</p>	
		</div>
	</div>
</div>
						
	
<!-- 로그인 확인 모달 -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
      </div>
      <div class="modal-body">
         <span id="findidspan"> </span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do'">로그인페이지로 이동</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>			
				
				

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>	

</body>
</html>