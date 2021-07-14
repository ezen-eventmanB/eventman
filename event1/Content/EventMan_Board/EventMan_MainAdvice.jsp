<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <%
	String member_id = (String)session.getAttribute("S_memberId");
	 int midx = 0;
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }
	 

%>    

    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
    <!-- Bootstrap에 필요한 CSS파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    
<title>EVENT MAN!</title>

	<!-- BoardWrite CSS -->
	<link rel="stylesheet" type="text/css" href="../css/boardwrite.css">
	
	
<style>

</style>

<script>
/*	이미지 미리보이 스크립트*/
  function setImageFn(f){
	/*alert(f.files);
	var files[] = f.files;
	
	$(document).ready(function(){
		$("#formFile").on("change",handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파이일만 업로드 가능합니다.");
				return;
			}
			sel_file.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img style='max-width:90%; margin:5px auto;' src=" + e.target.result + ">";
				$("#preview").append(img_html)
			}
			reader.readAsDataURL(f);
		});
	}
}	
	 */
/////////////////////////////////////
	 	var file = f.files;
		
		alert(f.files);
		
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
			alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
		
			f.outerHTML = f.outerHTML;

			document.getElementById('preview').innerHTML = '';

		}else {

			var reader = new FileReader();

			reader.onload = function(rst){
				document.getElementById('preview').innerHTML = '<img style="max-width:90%; margin:5px auto;" src="' + rst.target.result + '">';
			}
		
			reader.readAsDataURL(file[0]);

		}
		
	
	
}

/*	확인 모달 띄우기	*/
function ajaxsubimtFn(){
	$("#exampleModal").modal("show");
	
}

/*	제출하기 */
 function submitFn(){
	
	var frm = document.frm;
	var cata = $("#cata").val();
	var title = $("#title").val();
	var content = $("#floatingTextarea2").val();
	
	if(cata == "카테고리"){
		$("#textbox").html("카테고리를 선택해주세요");
		$("#modal1").modal("show");
		$("#cata").focus();
		
	}else if(title == ""){
		$("#textbox").html("제목을 입력해주세요.");
		$("#modal1").modal("show");
		
	}else if(content == ""){
		$("#textbox").html("내용을 입력해주세요.");
		$("#modal1").modal("show");	
		
	}else{
		frm.action="<%=request.getContextPath()%>/EventMan_Board/EventMan_AdvicewriteAction.do";
		frm.enctype="multipart/form-data";
		frm.method="POST";
		frm.submit();
		return;
	}
}

/*	이미지 지우기	*/
function imageemptyFn(){
	$("#preview").empty();
	$("#formFile").val("");
	
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
		상담하기
	</div>
	
	
<!-- 상담 글 작성 부분 -->
<div class="boardwritearea">
	<div class="container">
		<header>
			<div class="writeheader">상담 신청하기</div>
		</header>	
		
		<!-- 폼 -->
		<form name=frm>
			<!-- 로그인 정보 / 리뷰번호 담는 부분 -->
			<input type="hidden" name="midx" value="<%=midx%>">
			<input type="hidden" name="hidx" value="<%=request.getParameter("hidx")%>">
			<!-- 카테고리 -->
			<select class="form-select" aria-label="Default select example" name="cata" id="cata">
				<option selected>카테고리</option>
				<option value="서비스 문의">서비스 문의</option>
				<option value="입점 문의">입점 문의</option>
				<option value="제휴 문의">제휴 문의</option>
				<option value="오류 문의">오류 문의</option>
				<option value="행사 홍보">행사 홍보</option>
				<option value="공지 사항">공지 사항</option>
				<option value="기타 문의">기타 문의</option>
				<option value="견적 문의">견적 문의</option>
			</select>
			
			<!-- 제목 부분 -->
			<div class="writetitle">
				<input  class="form-control writetitle" type="text" name="title" id="title" placeholder="제목을 입력해주세요">
			</div>
		
			<!-- 내용 작성 부분 -->
			<div class="form-floating mb-3">
				<textarea class="form-control" id="floatingTextarea2" name="content" style="height: 400px" placeholder="상담 내용을 작성해주세요."></textarea>
				<div id="preview">
				</div>
				<div id="img"></div>
			</div>
		
			<!-- 첨부파일 -->
			<div class="input-group mb-3">
				<input class="form-control" type="file" id="formFile" name="file" onchange="setImageFn(this)" multiple/>
				<button class="btn btn-outline-secondary" type="button" id="imageempty" onclick="imageemptyFn()">지우기</button>
			</div>
			
			<div class="d-grid gap-2">
				<button class="btn btn-outline-secondary" type="button" onclick="ajaxsubimtFn()">제출하기</button>
			</div>
			
			<!-- 모달 부분 -->
			<div class="modal"  id="exampleModal" tabindex="-1">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">게시물 작성</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="취소"></button>
			      </div>
			      <div class="modal-body">
			        <p>게시물을 작성하시겠습니까?</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" onclick="submitFn()">제출 하기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
	<!-- 입력요구 모달 -->
		<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >확인</button>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</div>




	
	
	
	
	
	
	
		
		


<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>








<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>