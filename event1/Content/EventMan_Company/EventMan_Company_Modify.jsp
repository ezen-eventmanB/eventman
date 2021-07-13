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

	%>          
    
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>


<script>
/*이미지 미리보기*/
	function setImageFn(f){

		var file = f.files;
	
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
			alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
	
			f.outerHTML = f.outerHTML;
	
			document.getElementById('container').innerHTML = '';
	
		}
		else {
	
			var reader = new FileReader();
	
			reader.onload = function(rst){
				document.getElementById('container').innerHTML = '<img class="bd-placeholder-img card-img-top stretched-link mt-3" src="' + rst.target.result + '">';
			}
	
			reader.readAsDataURL(file[0]);
		}
	}	
	
/*이미지 등록 액션*/
	
	function imgchageFn(){
		
		if($("#formFile").val() == ""){
			$("#textbox1").html("이미지를 선택해주세요.");
			$("#modal1").modal("show");
		}else{
			$("#textbox").html("회사소개 이미지를 변경합니다.");
			$("#modal").modal("show");
		}
	}
	
	function submitFn(){
		
        document.frm.action ="<%=request.getContextPath()%>/EventMan_Master/EventMan_CompanyModifyAction.do";	
        document.frm.enctype="multipart/form-data";
        document.frm.method = "post";
        document.frm.submit();
        
	}
</script>


</head>
<body>


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
		
		


	
<article>
<!-- 회사 소개 수정 -->
	<div class="container mt-5">
		<div class="card">
			<div class="card-body">
				<form  name="frm" class="mt-5">
					<div class="mb-3 mt-5">
						<label for="formFile" class="form-label ">'gif, jpg, png' 파일만 선택해 주세요.</label>
						<input class="form-control" type="file" id="formFile" name="file" onchange="setImageFn(this)">
					</div>
					<div class="text-end">
						<button type="button" class="btn btn-outline-primary " onclick="imgchageFn()">이미지 변경 완료</button>
					</div>
				</form>
			</div>
		</div>
		
	</div>
	<div class="container" id="container">	
	</div>

	
	
	
	<!-- 회사 지도 API-->
	<div class="container mt-3">	
		<div id="map" style="width:100%;height:350px;"></div>
		<div class="d-grid gap-2">
				<button type="button" class="btn btn-outline-secondary mt-5" onclick="panTo()">회사 위치 보기</button>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d13687712724db7a58c691808cbdaa56"></script>
	<script src="../js/kakaoView.js"></script>
	</div>




</article>

<!-- 이미지요구 모달 -->
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

<!-- submit모달 -->
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
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="submitFn()">확인</button>
         </div>
      </div>
   </div>
</div>






<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>





<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>