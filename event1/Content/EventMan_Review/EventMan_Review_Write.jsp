
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	out.println("세션에 담긴 아이디는?");
	out.println(member_id);

	out.println("midx="+midx); 
	out.println("gidx="+gidx); 
	   
	%>    
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_review_Write</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script>


//사진 미리보기
$(document).ready(function(e){

	$("input[type='file']").change(function(e){
		
		var files = e.target.files;
		var arr =Array.prototype.slice.call(files);
		
		//업로드 가능 파일인지 체크
		for(var i=0;i<files.length;i++){
			if(!/\.(gif|jpg|jpeg|png)$/i.test(files[i].name)){
				alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + files[i].name);
				return false;
			};
		};

		//div 내용 비워주기
		$('#preview').empty();
		preview(arr);
	});//file change

    
    //실제 화면에 뿌려주는 부분
	function preview(arr){

		alert("arr.length : "+arr.length);
    	
		var str = '';
		
		var arrlength = arr.length;
		
		//사진 한장 업로드
		if(arrlength == 1){
			alert("arr.length ===== 1");
			var reader = new FileReader();
			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러	  
				str += '<div class="carousel-item active">';
				str += '<img src="'+e.target.result+'" style="max-height:384px; object-fit: cover;" class="d-block w-100" title="'+arr[0].name+'" alt="">';
				str += '</div>';
				
				alert(str);
				$('#preview').html(str);
			};
			reader.readAsDataURL(arr[0]);
			
		//사진 한장 이상 업로드
		}else if(arrlength > 1){
			alert("arr.length >>>>> 1");
			var reader = new FileReader();
			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러	 
				alert(e);
				str += '<div class="carousel-item active">';
				str += '<img src="'+e.target.result+'" style="max-height:384px; object-fit: cover;" class="d-block w-100" title="'+arr[0].name+'" alt="">';
				str += '</div>';
				alert(str);
				for(var i=1; i<arr.length; i++){
					str += '<div class="carousel-item">';
					str += '<img src="'+e.target.result+'" style="max-height:384px; object-fit: cover;" class="d-block w-100" title="'+arr[i].name+'" alt="">';
					str += '</div>';
				};
				$('#preview').html(str);			
			};
			for(var i=0; i<arr.length; i++){
				reader = new FileReader();
				reader.readAsDataURL(arr[i]);
			};
			
		//사진 0장 업로드
		}else{
			alert("else else else else");
			str+='<div class="carousel-item active">'
			str+='<img src="../seletimg.jpg" class="d-block w-100" alt="">'
			str+='<div class="carousel-caption d-none d-md-block">'
			str+='<h5>이미지 파일을 선택해주세요.</h5>'
			str+='<p>파일 선택시 미리보기 됩니다요.</p>'
			str+='</div>'
			str+='</div>';
			$('#preview').html(str);
		};
	};
});



//게시글 작성 완료 모달
	function submitmodalFn(){
			
		if(frm.cata.value =="catamenu"){
			frm.cata.focus();
			$("#textbox1").html("카테고리를 선택해주세요.");
			$("#modal1").modal("show");
			return;
		
		}else if(frm.hloca.value==""){
			frm.cata.focus();
			$("#textbox1").html("장소를 입력해주세요.");
			$("#modal1").modal("show");
			return;
			
		}else if(frm.startdate.value == ""){
			frm.startdate.focus();
			$("#textbox1").html("시작일을 선택해주세요.");
			$("#modal1").modal("show");
			return;
			
		}else if(frm.enddate.value == ""){
			frm.enddate.focus();
			$("#textbox1").html("종료일을 선택해주세요.");
			$("#modal1").modal("show");
			return;
			
		}else if(frm.price.value == "catamenu"){
			frm.price.focus();
			$("#textbox1").html("예산을 선택해주세요.");
			$("#modal1").modal("show");
			return;
			
		}else if(frm.people.value == "catamenu"){
			frm.people.focus();
			$("#textbox1").html("인원을 선택해주세요.");
			$("#modal1").modal("show");
			return;
			
		}else if(frm.target.value == "catamenu"){
			frm.target.focus();
			$("#textbox1").html("대상을 선택해주세요.");
			$("#modal1").modal("show");
			return;
			
		}else if(frm.staff.value == ""){
			frm.staff.focus();
			$("#textbox1").html("진행 답당자를 입력해주새요.");
			$("#modal1").modal("show");
			return;
			
		}else if(frm.company.value == ""){
			frm.company.focus();
			$("#textbox1").html("기관·단체명을 입력해주새요.");
			$("#modal1").modal("show");
			return;
			
		}else if(frm.title.value == ""){
			frm.title.focus();
			$("#textbox1").html("제목을 입력해주세요.");
			$("#modal1").modal("show");
			return;
			
		}else if(frm.content.value == ""){
			frm.content.focus();
			$("#textbox1").html("내용을 입력해주세요.");
			$("#modal1").modal("show");
			return;
			
		}else{
			$("#textbox").html("게시글을 등록합니다.");
			$("#modal").modal("show");
		};
		
};


//게시글 SUBMIT버튼
	function submitFn(){
	
	document.frm.action="<%=request.getContextPath()%>/EventMan_Master/EventMan_Review_Write_Action.do";
	document.frm.enctype="multipart/form-data";
	document.frm.method="post";
	document.frm.submit();
	return;
};

</script>

<style>

	.imgbax{
		object-fit: cover;
		max-height:384px;
	}
	
	/* 이미지 박스*/
	#carouselExampleIndicators{
		max-width:576px;
		max-height:370px;
	}

	
	/*카테고리 아이콘 박스*/

	#catatable{
		border-collapse: separate;
	}

	
	/* 내용 */
	
	.icon{
		max-width:70px;
	}
	

</style>



</head>
<body>

<form name="frm">
	<div class="shadow p-3 mb-5 bg-body rounded mt-5 mb-5" >
		<!-- 상단 제목 -->
		<div class="mt-5 ">
			<p class="fs-1 fw-bold"></p><br>
			<p class="fs-6"></p>
		</div>
		
		
		<!-- 이미지 -->
	
		<div class="container">
				
			<div class="container mb-2">
				<div class="row">
					<input type="hidden" name="gidx" value="<%=gidx%>">
					<div class="col-md">
						<label for="uploadFile" class="form-label"></label>
						<input class="form-control" name="file" type="file" id="formFile" onchange="setImageFn(this)" multiple>
					</div>
					<div class="col-md mt-2">
						<select class="form-select" aria-label="Default select example" name="cata" class="catanon">
							<option selected value="catamenu">카테고리</option>
							<option value="기업">기업</option>
							<option value="대학">대학</option>
							<option value="공연">공연</option>
							<option value="예술">예술</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<div class="col-md  mt-2">
						<input type="text" name="hloca" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 placeholder="장소">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg">
					<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
	
							<div class="carousel-inner " id="preview">
							
									<div class="carousel-item active">
										<img src="../seletimg.jpg" class="d-block w-100" alt="">
										<div class="carousel-caption d-none d-md-block">
											<h5>이미지 파일을 선택해주세요.</h5>
											<p>파일 선택시 미리보기 됩니다.</p>
										</div>
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
										<div class="row mt-2">
											<div class="col">
												<input type="date" name="startdate" class="form-control CostDate">
											</div>
											<div class="col">
											~
											</div>
											<div class="col">
												<input type="date" name="enddate" class="form-control CostDate">
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm align-self-center">
									<div>
										<img class="icon w-100" src="../icon/free-icon-money-bills-72167.png">
										<div class="mt-2">
											<select class="form-select me-5" aria-label="Default select example" name="price" class="catanon">
												<option selected value="catamenu">예산</option>
												<option value="1,000만원 미만">1,000만원 미만</option>
												<option value="1,000만원 이상 ~ 5,000만원 미만">1,000만원 이상 ~ 5,000만원 미만</option>
												<option value="5,000만원 ~ 1억 미만">5,000만원 ~ 1억 미만</option>
												<option value="1억 이상 ~ 3억 미만">1억 이상 ~ 3억 미만</option>
												<option value="3억 이상">3억 이상</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-sm align-self-center">
									<div>
										<img class="icon w-100" src="../icon/free-icon-people-711168.png">
										<div class="mt-2">
											<select class="form-select me-5"" aria-label="Default select example" name="people" class="catanon">
												<option selected value="catamenu">참여인원</option>
												<option value="50명 미만">50명 미만</option>
												<option value="50명~100명 미만">50명~100명 미만</option>
												<option value="100~500명 미만">100~500명 미만</option>
												<option value="500~1000명 미만">500~1000명 미만</option>
												<option value="1000명이상">1000명 이상</option>
											</select>
										</div>
									</div>
								</div>
		
								<div class="col-sm align-self-center">
									<img class="icon w-100" src="../icon/free-icon-question-sign-on-person-head-42994.png">
									<div class="mt-2">
										<select class="form-select me-5" aria-label="Default select example" name="target" class="catanon">
											<option selected value="catamenu">참여대상</option>
											<option value="전체">전체</option>
											<option value="어린이이">어린이</option>
											<option value="학생">학생</option>
											<option value="청년">청년</option>
											<option value="여성">여성</option>
											<option value="직장인">직장인</option>
											<option value="장애인">장애인</option>
											<option value="노인">노인</option>
											<option value="기업·단체">기업·단체</option>
											<option value="기타">기타</option>
										</select>
									</div>
								</div>
								<div class="col-sm align-self-center">
									<img class="icon w-100" src="../icon/free-icon-business-cards-47976.png">
									<div class="mt-2">
										<input type="text" name="staff" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 placeholder="진행담당">
									</div>
								</div>
								<div class="col-sm align-self-center">
									<img class="icon w-100" src="../icon/free-icon-university-campus-68286.png">
									<div class="mt-2">
										<input type="text" name="company" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 placeholder="기관,단체">
									</div>
								</div>
							</div>
					</div>
	
				</div>	
			</div>	
			<div class="row mt-5">
				<div class="mt-5">
					<div class="mt-5">			
						<div class="fs-5">주요 프로그램</div>
					</div>		
					<div>
						<div class="fs-1 fw-bold mt-5 ">
							<input class="form-control form-control-lg fs-1 fw-bold mb-3" type="text" name="title" aria-label=".form-control-lg example" placeholder="제목을 입력해주세요.">
						</div>
					</div>
					<div>
						<div class="fs-5 mt-5">
							<textarea class="form-control" id="floatingTextarea2" style="height: 400px" name="content" placeholder="내용을 입력해주세요."></textarea>
						</div>	
					</div>
				</div>
			</div>
		</div>
		<div class="text-end mt-5">
			<button type="button" class="btn btn-outline-secondary " onclick="location.href='<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do'">뒤로가기</button>
			<button type="button" class="btn btn-outline-secondary " onclick="submitmodalFn()">작성완료</button>
		</div>
	</div>
</form>						


<!-- 입력요구모달 -->
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
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>


	
	
<!-- submut 모달 -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
			</div>
			<div class="modal-body">
				<span id="textbox"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="submitFn()">확인</button>
			</div>
		</div>
	</div>
</div>	
				

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>	

</body>
</html>