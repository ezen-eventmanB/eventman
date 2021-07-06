<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
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

    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
    <!-- Bootstrap에 필요한 CSS파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    
<title>EVENT MAN!</title>

	<!-- top nav CSS -->
	<link rel="stylesheet" type="text/css"   href="../css/topnav.css">
	<!-- footer CSS -->
	<link rel="stylesheet" type="text/css"   href="../css/footer.css">
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


<!-- 상단 네비 부분 -->
	<div class="container">
		<nav class="navbar navbar-expand-xxl navbar-light " id="topnav">
		
			<a class="navbar-brand" href="<%=request.getContextPath()%>/EventMan_Main/EventMan_Main.do">
		     	<img src="../rogo1.png" alt="" class="d-inline-block align-text-top" id="toprogoimg">
		    </a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      	<span class="navbar-toggler-icon"></span>
		   	</button>
		    <div class="collapse navbar-collapse w-50" id="navbarNav">
		    
	      		<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="navbar-nav">
	        		<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do">견적신청</a>
	        		</li>
	        		<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do">행사리뷰</a>
	        		</li>
	       			<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do">회사소개</a>
	       			</li>
	       			<li class="nav-item px-5">
	          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do">게시판</a>
	       			</li>
	       		</ul>
	       	
	
					<!--로그인 전 상단 화면  -->	
						<%
						if(member_id == null){
						%>
						
		       		<ul class="navbar-nav" id="Memberbox" >	
		       			<li class="nav-item">
		          			<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Join.do">회원가입</a>
		       			</li>
		       			<li class="nav-item"> 
		          			<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do">로그인</a>
		       			</li>																	
		      		</ul>
		      		
		      	<!--로그인 후 상단 화면  -->
						<%
				      	}else{
						%>	
			       	<ul class="navbar-nav" id="Memberbox" >	
			       		<li class="nav-item">
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do?midx=<%=midx%>">My page</a>
			       		</li>
			       		<li class="nav-item"> 
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Modify.do">계정 설정</a>
			       		</li>
			       		<li class="nav-item"> 
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
			       		</li>																			
			      	</ul>
				   		<%
				   		}
				    	%>
	    	</div>	
		</nav>
</div>
		
		
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
				<option value="1">행사 홍보</option>
				<option value="2">행사 콘텐츠</option>
				<option value="3">기타</option>
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





<!-- 메인 푸터 -->
<footer class="footer">
	<div class="d-flex justify-content-between align-items-center">
		<div class="btn-group">
			<img src="../rogo1.png" alt="" width="150" class="d-inline-block align-text-top">
		</div>
		<div>
			<div class="container">
				<span class="text-muted">
					<small>전화번호 063-222-2222</small>
				</span>
			</div>
			<div class="container">
				<span class="text-muted">
					<small>EVENTMAN | 전주시 덕진구 효자동 | 대표. 000</small>
				</span>
			</div>
			<div class="container">
				<span class="text-muted">
					<small>ACC. 계좌번호 (예금주 :홍길동) | 사업자 번호. 000-000-0000 </small>
				</span>
			</div>
		</div>
    </div>
</footer>








<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>