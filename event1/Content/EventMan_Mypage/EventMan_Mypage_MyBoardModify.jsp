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

   
	EvBoardAskVo bavo = (EvBoardAskVo)request.getAttribute("bavo");
   
   %>    
    
    
<!doctype html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
   <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	
	 <!-- topmenue CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">
   <!-- subnav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/subnav.css">
   <!-- mypage CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mypage.css">

<title>EVENT MAN!</title>

<script>
/* 사진 미리보기*/
	function setImageFn(f){
		var file = f.files; 
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
			alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
			f.outerHTML = f.outerHTML;
			document.getElementById('preview').innerHTML = '';
		}else {
			var reader = new FileReader();
			reader.onload = function(rst){
				document.getElementById('preview').innerHTML = '<img style="max-width:90%; margin:5px auto;" src="' + rst.target.result + '">';
			};
			reader.readAsDataURL(file[0]);
		};
	};


/*	취소모달창	*/
	function backboardFn(){
		$("#textbox").html("수정을 취소하고 목록으로 돌아갑니다.")
		$("#modal1").modal("show")
	};


/*	수정취소	*/
	function myBoardListFn(){
		
		location.href=location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Mypage_MyboardlistDetail.do?bidx=<%=bavo.getBidx()%>';

	};


/*	수정모달창		*/
	function submitFn(){
		$("#textbox2").html("수정한 내용으로 변경합니다.");
		$("#modal2").modal("show");
	};
 

/*	수정완료	*/
	function submitmodalFn(){
		
	var frm = document.form;
	
	document.frm.action="<%=request.getContextPath()%>/EventMan_Board/EventMan_Mypage_BoardModify_Action.do";
	document.frm.method="post";
	document.frm.submit();
	
	};
	
/*	이미지 지우기	*/
	function imageemptyFn(){
		$("#preview").empty();
		$("#formFile").val("");

		
	}
	
/*	이미지 삭제/변경하기	*/
 	function imgchangeFn(){
	
 	imageemptyFn();
	
	var str ="<div id='preview'></div>" 
			 +"<div class='input-group mb-3 mt-5'>"
			 +"		<input class='form-control ' type='file' id='formFile' name='file' onchange='setImageFn(this)'>"
	         +"		<button class='btn btn-outline-secondary' type='button' id='imageempty' onclick='imageemptyFn()'>지우기</button>"
             +"</div>"
             +"<button type='button' class='btn btn-outline-secondary' onclick='imgchangecanclefn()'>이미지 삭제/변경 취소</button>";
             
	$("#imgbtn").html(str);
	
	}

/*	이미지 삭제/변경 취소 */
	
	function imgchangecanclefn(){
		var str = "<div id='imgbtn'>"
				+"<div id='preview'>"
				+"<%if(bavo.getBfile() != null){%>"
				+"<img style='max-width:90%; margin:5px auto;' src='../Advice_img/<%=bavo.getBfile() %>'>"
				+"<%}; %>"
				+"</div>"
				+"<div>"
				+"<button type='button' class='btn btn-outline-secondary btn-sm mt-2' onclick='imgchangeFn()'>이미지 삭제/변경</button>"
				+"<input type='hidden' name='file' value='<%=bavo.getBfile()%>'>"
				+"</div>"
				+"</div>";
				
		$("#imgbtn1").html(str);				
	}
</script>

</head>
<body>

<!-- 상단 네비 부분 -->
<div class="container">
	<nav class="navbar navbar-expand-xxl navbar-light" id="topnav">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/EventMan_Main/EventMan_Main.do">
				<img src="../rogo1.png" alt="" class="d-inline-block align-text-top" id="toprogoimg">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>	

			<div class="collapse navbar-collapse w-50" id="navbarNav">
	
				<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="navbar-nav">
					<li class="nav-item px-5 mx-auto"><a class="nav-link fw-bolder text-dark fs-5" href="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do">견적신청</a>
					</li>
					<li class="nav-item px-5 mx-auto"><a class="nav-link fw-bolder text-dark fs-5" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do">행사리뷰</a>
					</li>
					<li class="nav-item px-5 mx-auto"><a 
						class="nav-link fw-bolder text-dark fs-5"
						href="<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do">회사소개</a>
					</li>
					<li class="nav-item px-5 mx-auto"><a
						class="nav-link fw-bolder text-dark  fs-5"
						href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do">게시판</a>
					</li>
				</ul>
	
	
				<!--로그인 전 상단 화면  -->
				<%
				if (midx == 0 && gidx == 0) {
				%>
	
				<ul class="navbar-nav" id="Memberbox">
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Join.do">회원가입</a>
					</li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do">로그인</a>
					</li>
				</ul>
	
				<!--맴버 로그인 후 상단 화면  -->
				<%
				} else if (midx > 0) {
				%>
				<ul class="navbar-nav" id="Memberbox">
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do?midx=<%=midx%>">My
							page</a></li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Modify.do">계정
							설정</a></li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
					</li>
				</ul>
				
				<!-- 마스터 로그인 후 상단 화면 -->
				<%
				} else if (gidx > 0) {
				%>
				<ul class="navbar-nav" id="Memberbox">
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_Mainpage.do">Master
							page</a></li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
					</li>
				</ul>
				<%
				}
				%>
			</div>
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
      My page
   </div>
      

<!-- 게시글 수정하기 화면 -->
 <div class="container">
	<form name="frm" id="frm">
		<div class="fs-4 fw-bold mb-5">게시글 수정하기</div>
		<input type="hidden" name="bidx" value="<%=bavo.getBidx()%>">
		<div class="mb-1"><%=bavo.getBcata() %></div>
		<input class="form-control form-control-lg fs-1 fw-bold mb-3" type="text" name="title" value="<%=bavo.getBtitle() %>" aria-label=".form-control-lg example">
		<div class="mb-5 pb-2 border-bottom border-3 ">
			<span class="fw-bold me-2">등록일</span>
			<span class=" me-3"><%=bavo.getBwriteday() %></span>
			<span class="fw-bold me-2">작성자</span>
			<span class=" me-3"><%=bavo.getBname() %></span>
			<span class="fw-bold me-2">조회수</span>
			<span class=" me-3"><%=bavo.getBcount() %></span>
		</div>
		
		<div>
			<textarea class="form-control" id="floatingTextarea2" name="content" style="height: 400px" ><%=bavo.getBcontents() %></textarea>
			<div id="imgbtn1">
				<div id="imgbtn">
					<div id="preview">
						<%if(bavo.getBfile() != null){%>
							<img style="max-width:90%; margin:5px auto;" src="../Advice_img/<%=bavo.getBfile() %>">
						<%}; %>
					</div>
					<div>
						<button type="button" class="btn btn-outline-secondary btn-sm mt-2" onclick="imgchangeFn()">이미지 삭제/변경</button>
						<input type="hidden" name="file" value="<%=bavo.getBfile()%>">
					</div>
				</div>
			</div>
		</div>
		<div class="text-end">
			<button type="button" class="btn btn-outline-secondary btn-sm" onclick="submitFn()">완료</button>
			<button type="button" class="btn btn-outline-secondary btn-sm" onclick="backboardFn()">뒤로</button>
		</div>
	</form>
	
	
	

	
	
<!-- 취소 모달 -->
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
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="myBoardListFn()">확인</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
			</div>
		</div>
	</div>
</div>
	
	
<!-- submut 모달 -->
<div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
			</div>
			<div class="modal-body">
				<span id="textbox2"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="submitmodalFn()">확인</button>
			</div>
		</div>
	</div>
</div>




<!-- 메인 푸터 -->
<div class="footer mt-5"></div>
<div class="container mt-5 mb-5">
	<div class="row justify-content-md-center mt-5">
		<div class="col-md-auto">
			<img src="../rogo1.png" alt="" width="200"
				class="d-inline-block align-text-center">
		</div>
		<div class="col-md-auto">
			<small class="text-muted"> 전화번호 063-222-2222<br>
				EVENTMAN | 전주시 덕진구 효자동 | 대표. 000<br> ACC. 계좌번호 (예금주 :홍길동) |
				사업자 번호. 000-000-0000<br>
			</small>
		</div>
	</div>
</div>


<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>