
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
      
<% EvReviewVo erv = (EvReviewVo)request.getAttribute("erv"); %>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_review_detail</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script>

/*	로그인 안되있을시에	*/
function AdviceFn(){
	if(<%=session.getAttribute("midx")%> == null){
		$("#findidspan").html("로그인후 이용해주세요.");
		$("#modal").modal("show");
	}else{
		document.location.href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Advicewrite.do?hidx=<%=erv.getHidx()%>";
	};
};

function deletemodalFn(){
	$("#textbox1").html("현재 리뷰를 삭제 하시겠습니까?");
	$("#modal1").modal("show");
};

function deleteFn(){
	document.location.href="<%=request.getContextPath()%>/EventMan_Master/EventMan_ReviewDelete.do?hidx=<%=erv.getHidx()%>";
};




/*	관리자 행사 리뷰 작성하기	*/ 

	function modifyFn(hidx){
				
		$.ajax({
		url:"<%=request.getContextPath()%>/EventMan_Master/EventMan_ReviewModify.do?hidx=<%=erv.getHidx()%>",
		type:"post",			
		datatype:"html",
		success:function(data){
			$("#detailload").html(data);
		}
				
	});
	}


</script>
<style>
		
	/*상세보기 이미지 박스*/
	#carouselExampleIndicators{
		max-width:576px;
		max-height:370px;
	}

	
	/*카테고리 아이콘 박스*/

	#catatable{
		border-collapse: separate;
	}

	
	<!-- 상세보기 내용 -->
	
	.imgbax{
		object-fit: cover;
		max-height:384px;
		
	}
	.icon{
		max-width:70px;
	}
	

	
</style>



</head>
<body>

<div class="shadow p-3 mb-5 bg-body rounded mt-5 mb-5" >
	<!-- 상단 제목 -->
	<div class="mt-5 ">
		<p class="fs-1 fw-bold"><%=erv.gethName() %></p><br>
		<p class="fs-6"><%=erv.getHloca() %></p>
	</div>
	
	
	<!-- 이미지 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg">
				<div id="carouselExampleIndicators" class="carousel slide " data-bs-ride="carousel">

						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						
						<div class="carousel-inner ">
						
							<div class="carousel-item active">
								<img src="../filefolder/detailimg.jpg" style="max-height:384px; object-fit: cover;" class="d-block w-100 " alt="">
							</div>
							<div class="carousel-item">
								<img src="../filefolder/review.png" style="max-height:384px; object-fit: cover;"  class="d-block w-100 " alt="">
							</div>
							<div class="carousel-item">
								<img src="../filefolder/detailimg.jpg" style="max-height:384px; object-fit: cover;" class="d-block w-100 " alt="">
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
			<div class="col-lg">	
				<div id="cbox">
						<div class="row row-cols-2 row-cols-sm-2 row-cols-md-3 text-center align-middle h-100">
						
							<div class="col-sm align-self-center">
								<div class="text-center align-middle ">
									<img class="icon w-100" src="../icon/free-icon-calendar-with-squares-85000.png">
									<div class="mt-2"><%=erv.getstartdate()%><br>~<br><%=erv.getendenddate() %></div>
								</div>
							</div>
							<div class="col-sm align-self-center">
								<div>
									<img class="icon w-100" src="../icon/free-icon-money-bills-72167.png">
									<div class="mt-2"><%=erv.getHprice() %></div>
								</div>
							</div>
							<div class="col-sm align-self-center">
								<div>
									<img class="icon w-100" src="../icon/free-icon-people-711168.png">
									<div class="mt-2"><%=erv.getHpeople() %></div>
								</div>
							</div>
	
							<div class="col-sm align-self-center">
								<img class="icon w-100" src="../icon/free-icon-question-sign-on-person-head-42994.png">
								<div class="mt-2"><%=erv.getHtarget() %></div>
							</div>
							<div class="col-sm align-self-center">
								<img class="icon w-100" src="../icon/free-icon-business-cards-47976.png">
								<div class="mt-2"><%=erv.getHstaff() %></div>
							</div>
							<div class="col-sm align-self-center">
								<img class="icon w-100" src="../icon/free-icon-university-campus-68286.png">
								<div class="mt-2"><%=erv.getHcompany() %></div>
							</div>
						</div>
				</div>
				<%if(gidx == 0){ %>
				<div class="row mt-2">
					<div class="col-md">
						<button type="button" class="btn btn-outline-secondary w-100" onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do'">견적신청</button>
					</div>	
					<div class="col-md">
						<button type="button" class="btn btn-outline-secondary w-100" onclick="AdviceFn()">상담하기</button>
					</div>
				</div>
				<%} %>
				<%if(gidx !=0 ){ %>
				<div class="row mt-2">
					<div class="col-md">
						<button type="button" class="btn btn-outline-secondary w-100" onclick="deletemodalFn()">삭제하기</button>
					</div>	
					<div class="col-md">
						<button type="button" class="btn btn-outline-secondary w-100" onclick="modifyFn()">수정하기</button>
					</div>
				</div>
				<%} %>
			</div>	
		</div>	
		<div class="row mt-5">
			<div class="mt-5">
				<div class="mt-5">			
				</div>			
				<div>
					<div class="fs-1 fw-bold mt-5 "><%=erv.gethName() %></div>
				</div>
				<div>
					<div class="fs-5 mt-5"><%=erv.getHtext() %></div>	
				</div>
			</div>
		</div>
	</div>
	<div class="text-end mt-5">
		<button type="button" class="btn btn-outline-secondary " onclick="location.href='<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do'">뒤로가기</button>
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
	
<!-- 삭제 확인 모달 -->
<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
			</div>
			<div class="modal-body">
				<span id="textbox1"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="closeModal()">취소</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="deleteFn()">확인</button>
			</div>
		</div>
	</div>
</div>
				

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>	

</body>
</html>