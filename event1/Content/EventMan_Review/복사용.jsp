
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
<title>event_review_detail</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script>
<%-- 
 function AdviceFn(){
	 if(<%=session.getAttribute("midx")%> == null){
		 $("#findidspan").html("로그인후 이용해주세요.");
		 $("#modal").modal("show")
	 }else{
		 document.location.href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Advicewrite.do?hidx=<%=erv.getHidx()%>";
	 }
 }; --%>
 
$(document).ready(function (e){
	 
	$("input[type='file']").change(function(e){
	
		//div 내용 비워주기
		$('#preview').empty();
		
		var files = e.target.files;
		var arr =Array.prototype.slice.call(files);
			
		//업로드 가능 파일인지 체크
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
		}
		//배열형태로 보냄..?
		preview(arr);
	  
	});//file change
    
	
	//파일 사이즈와 확장자 확인하는 부분
	function checkExtension(fileName,fileSize){
	
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 20971520;  //20MB
		  
		if(fileSize >= maxSize){
			alert('파일 사이즈 초과');
			$("input[type='file']").val("");  //파일 초기화
			return false;
		}
		  
		if(regex.test(fileName)){
			alert('업로드 불가능한 파일이 있습니다.');
			$("input[type='file']").val("");  //파일 초기화
			return false;
		}
		return true;
	}
	
    
    //실제 화면에 뿌려주는 부분
	function preview(arr){
    	
		arr.forEach(function(f){
			
			alert(arr.forEach());
			
			/* 		
			//파일명이 길면 파일명...으로 처리
			var fileName = f.name;
			if(fileName.length > 10){
				fileName = fileName.substring(0,7)+"...";
			}
			 */
			 
		//div에 이미지 추가
			var str = '';
		
		//이미지 파일 미리보기
			if(f.type.match('image.*')){	//f의 타입이 image라면?
					
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				
				reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러	  
					
					alert(e);
					
					for(var i=0; i<arr.length; i++ ){
						
					}
					
					for(var i=0, i<1, i++){
						str += '<div class="carousel-item active">';
					}
				
					str += '<img src="'+e.target.result+'" style="max-height:384px; object-fit: cover; class="d-block w-100" title="'+f.name+'"/>';
					str += '</div>';
					str += '<div class="carousel-item">';
					str += '<img src="'+e.target.result+'" style="max-height:384px; object-fit: cover; class="d-block w-100" title="'+f.name+'"/>';
					str += '</div>';
					$('#preview').html(str);
				} 
				reader.readAsDataURL(f);
			}else{
				str += '<div class="carousel-item active">';
				str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
				str += '</div>';
				$(str).appendTo('#preview');
			}
		
		});//arr.forEach
	}
});
 
 
 
/*  
 <div class="carousel-item active">
	<img src="../filefolder/detailimg.jpg" style="max-height:384px; object-fit: cover;" class="d-block w-100 " alt="">
</div>

<div class="carousel-item">
	<img src="../filefolder/review.png" style="max-height:384px; object-fit: cover;"  class="d-block w-100 " alt="">
</div>

<div class="carousel-item">
	<img src="../filefolder/detailimg.jpg" style="max-height:384px; object-fit: cover;" class="d-block w-100 " alt="">
</div>
*/
 
 
 
/* 실패시 <div class="carousel-item active">
	<img src="../seletimg.jpg" class="d-block w-100" alt="">
	<div class="carousel-caption d-none d-md-block">
		<h5>이미지 파일을 선택해주세요.</h5>
		<p>파일 선택시 미리보기 됩니다.</p>
	</div>
</div> 


$(str).appendTo('#preview');
*
*
*/
 
</script>
<style>
	/* 이미지 박스*/
	#carouselExampleIndicators{
		heighr:370px;
		max-width:576px;
		min-width:576px;
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

<div class="shadow p-3 mb-5 bg-body rounded mt-5 mb-5" >
	<!-- 상단 제목 -->
	<div class="mt-5 ">
		<p class="fs-1 fw-bold"></p><br>
		<p class="fs-6"></p>
	</div>
	
	
	<!-- 이미지 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg">
				<div id="carouselExampleCaptions" class="carousel slide " data-bs-ride="carousel">

						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner ">
							<input type="file" name="uploadFile" id="uploadFile" multiple>
							<div id="preview">
								<div class="carousel-item active">
									<img src="../seletimg.jpg" class="d-block w-100" alt="">
									<div class="carousel-caption d-none d-md-block">
										<h5>이미지 파일을 선택해주세요.</h5>
										<p>파일 선택시 미리보기 됩니다.</p>
									</div>
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
									<div class="mt-2"><input type="text" placeholder="1"><br>~<br><input type="text" placeholder="1"></div>
								</div>
							</div>
							<div class="col-sm align-self-center">
								<div>
									<img class="icon w-100" src="../icon/free-icon-money-bills-72167.png">
									<div class="mt-2"><input type="text" placeholder="2"></div>
								</div>
							</div>
							<div class="col-sm align-self-center">
								<div>
									<img class="icon w-100" src="../icon/free-icon-people-711168.png">
									<div class="mt-2"><input type="text" placeholder="3"></div>
								</div>
							</div>
	
							<div class="col-sm align-self-center">
								<img class="icon w-100" src="../icon/free-icon-question-sign-on-person-head-42994.png">
								<div class="mt-2"><input type="text" placeholder="4"></div>
							</div>
							<div class="col-sm align-self-center">
								<img class="icon w-100" src="../icon/free-icon-business-cards-47976.png">
								<div class="mt-2"><input type="text" placeholder="5"></div>
							</div>
							<div class="col-sm align-self-center">
								<img class="icon w-100" src="../icon/free-icon-university-campus-68286.png">
								<div class="mt-2"><input type="text" placeholder="6"></div>
							</div>
						</div>
				</div>
				<div class="row mt-2">
					<div class="col-md">
						<button type="button" class="btn btn-outline-secondary w-100" onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do'">견적신청</button>
					</div>	
					<div class="col-md">
						<button type="button" class="btn btn-outline-secondary w-100" onclick="AdviceFn()">상담하기</button>
					</div>
				</div>
			</div>	
		</div>	
		<div class="row mt-5">
			<div class="mt-5">
				<div class="mt-5">			
					<div class="fs-5">주요 프로그램?</div>
				</div>			
				<div>
					<div class="fs-1 fw-bold mt-5 "><input type="text" placeholder="제목"></div>
				</div>
				<div>
					<div class="fs-5 mt-5"><input type="text" placeholder="내용"></div>	
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
				
				

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>	

</body>
</html>