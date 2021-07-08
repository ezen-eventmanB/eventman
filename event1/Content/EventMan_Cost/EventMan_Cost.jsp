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
<title>EVENT MAN!</title>
      <!-- top nav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">
   <!-- footer CSS -->  
   <link rel="stylesheet" type="text/css" href="../css/footer.css">
   <!-- subnav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/subnav.css">
   <!-- 메인페이지 행사리뷰 CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mainpagereview.css">
   <!-- 메인페이지 하단 게시판 CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mainpageboard.css">
   

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>   
<script language = "javascript">

function check(){

var fm = document.frm;   
var costCataChk = $("input:checkbox[name='cCata']").is(":checked");

	if (fm.cName.value =="")   {
		$("#textbox").html("행사명을 입력해주세요.");
		$("#modal").modal("show")
		return;
	}else if (fm.cSdate.value ==""){
		$("#textbox").html("행사 시작일을 선택해주세요.");
		$("#modal").modal("show")
		return;
	}else if (fm.cEdate.value ==""){
		$("#textbox").html("행사 종료일을 선택해주세요.");
		$("#modal").modal("show")
		return;
	}else if(!costCataChk){
		$("#textbox").html("카테고리를 한개 이상 선택해주세요.");
		$("#modal").modal("show")
		return;  
	}else if (fm.cLoca.value ==""){
		$("#textbox").html("행사 지역을 입력 해주세요.");
		$("#modal").modal("show")
		return;
	}else if (fm.cTarget.value == "catamenu"){
		$("#textbox").html("참여 대상을 선택해주세요.");
		$("#modal").modal("show")
		return;  
	}else if (fm.cMethod.value == "catamenu"){
		$("#textbox").html("방식을 선택해주세요.");
		$("#modal").modal("show")
		return; 
	}else if (fm.cPrice.value == "catamenu"){
		$("#textbox").html("예산을 선택해주세요.");
		$("#modal").modal("show")
		return; 
	}else if (fm.cPeople.value == "catamenu"){
		$("#textbox").html("인원을 선택해주세요.");
		$("#modal").modal("show")
		return; 
	}else if($(".catanon").value =="catamenu"){
		$("#textbox").html("카테고리를 선택해주세요.");
		$("#modal").modal("show")
		return;
	}else if (document.frm.cText.value ==""){
		$("#textbox").html("행사 설명을 적어주세요.");
		$("#modal").modal("show")
		return;
	}else{
		$("#textbox1").html("견적신청을 완료합니다.");
		$("#modal1").modal("show")
	} 
}
             
function moveFn(){
	
var fm = document.frm; 
var costCataChk = $("input:checkbox[name='cCata']").is(":checked");
	  
	if (fm.cName.value =="")   {
        fm.cName.focus();
        return;
     }else if (fm.cSdate.value ==""){
        fm.cSdate.focus();
        return;
     }else if (fm.cEdate.value ==""){
         fm.cEdate.focus();
         return;
     }else if(!costCataChk){
     	location.href="#cataA";
        return;  
     }else if (fm.cLoca.value ==""){
          fm.cLoca.focus();
          return;
     }else if (fm.cTarget.value == "catamenu"){
  		  fm.cTarget.focus();
  		  return;
     }else if (fm.cMethod.value == "catamenu"){
 		  fm.cMethod.focus();
 		  return;
     }else if (fm.cPrice.value == "catamenu"){
 		  fm.cPrice.focus();
 		  return;
     }else if (fm.cPeople.value == "catamenu"){
 		  fm.cPeople.focus();
 		  return;
     }else if (document.frm.cText.value ==""){
          document.frm.cText.focus();
          return;
     }
}
 

function submitFn(){

	   document.frm.action ="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost_Submit_Action.do";
	   document.frm.enctype="multipart/form-data";
	   document.frm.method="POST";
	   document.frm.submit();

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
						if(midx == 0 && gidx ==0){
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
				      	}else if(midx > 0){
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
				   		}else if(gidx > 0){
				   		%>
				   		<ul class="navbar-nav" id="Memberbox" >	
			       		<li class="nav-item">
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_Mainpage.do?midx=<%=gidx%>">Master page</a>
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
   견적신청
</div>

     	
     	
     	
     	
     	
     	
     	
<!-- 행사 견적 신청 로그인시 확인  -->   
 	
<%
if(member_id == null){
%>
	<!-- 로그인이 안되있다면 -->
	<div class="container text-center">
		<div class="container w-50">
			<br/>   
			<img src="../padlock.png" class="lock w-50 mb-3" >
			<br/>
			<header class="fs-3">로그인이 필요한 서비스입니다.</header>
			<button type="button" class="btn btn-secondary btn-lg" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do'">Login</button>
		</div>
	</div>

<%
 }else{
%>
<!-- 로그인을 한 후에 나타나는 화면 -->

<!-- 행사 기본정보 -->
<div class="container">
	<div class="fs-2 fw-bold mt-5">행사 견적신청</div>
</div>
   

<form name="frm">

	<!-- input HIDDEN -->
	<input type="hidden" name="midx" value="<%=session.getAttribute("midx")%>">
	
	<!-- 행사 명 -->
	<div class="container mt-3">
		<div class="fs-4 fw-bold mt-5">행사 명</div>
		<input type="text" name="cName" class="form-control mt-3" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 placeholder="행사 명을 입력해주세요">
	</div>
   
	<!-- 행사 일정 -->   
	<div class="container mt-5">
		<div class="fs-4 fw-bold">행사 일정</div>
		<div class="row mt-3">
			<div class="col">
				<input type="date" id="cSdate" name="cSdate" class="form-control CostDate">
			</div>
			<div class="col-sm-auto">
				~
			</div>
			<div class="col">
				<input type="date" id="cSdate2" name="cEdate" class="form-control CostDate">
			</div>
		</div>
	</div>

	<!-- 행사 카테고리 선택 -->
	<div class="container fs-4 fw-bold mt-5">행사 카테고리</div>
	
		<!-- 카테고리 -->		
		<div class="container mt-3 rounded-3 border border-1 p-4">
		
					<div class="fs-5 fw-bold mb-1" id="cataA">기업행사</div>
					<div class="row">
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기업 워크숍" >
			                <label class="form-check-label" for="inlineCheckbox1">워크숍</label>
			            </div>
						<div class="col">
			                <input class="form-check-input" type="checkbox" name="cCata" value="기업 판촉행사">
							<label class="form-check-label" for="inlineCheckbox2">판촉행사</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기업 체육대회">
							<label class="form-check-label" for="inlineCheckbox3">체육대회</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기업 오픈행사">
							<label class="form-check-label" for="inlineCheckbox4">오픈행사</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기업 레크레이션">
							<label class="form-check-label" for="inlineCheckbox5">레크레이션</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기업 기타">
							<label class="form-check-label" for="inlineCheckbox6">기타</label>
						</div>
					</div>

					<div class="fs-5 fw-bold mb-1 mt-3">공연</div>
					<div class="row">
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="공연 지역 페스티벌">
							<label class="form-check-label" for="inlineCheckbox1">페스티벌</label>
						</div>
						<div class="col">
			                <input class="form-check-input" type="checkbox" name="cCata" value="공연 댄스">
							<label class="form-check-label" for="inlineCheckbox2">댄스</label>
						</div>
						<div class="col">
			                <input class="form-check-input" type="checkbox" name="cCata" value="공연  마술">
							<label class="form-check-label" for="inlineCheckbox3">마술</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="공연 클래식">
			                <label class="form-check-label" for="inlineCheckbox4">클래식</label>
		                </div>
						<div class="col">
			                <input class="form-check-input" type="checkbox" name="cCata" value="공연 장기자랑">
							<label class="form-check-label" for="inlineCheckbox5">장기자랑</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="공연 기타">
							<label class="form-check-label" for="inlineCheckbox6">기타</label>
						</div>
					</div>

			

					<div class="fs-5 fw-bold mb-1 mt-3">대학</div>
					<div class="row">
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="대학 축제">
							<label class="form-check-label" for="inlineCheckbox1">축제</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="대학 섭외">
							<label class="form-check-label" for="inlineCheckbox2">연예인 섭외</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="대학 체육대회">
							<label class="form-check-label" for="inlineCheckbox3">체육대회</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="대학 개강행사">
							<label class="form-check-label" for="inlineCheckbox4">개강 행사</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata"  value="대학 종강이벤트">
							<label class="form-check-label" for="inlineCheckbox5">종강 이벤트</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="대학 기타">
							<label class="form-check-label" for="inlineCheckbox6">기타</label>
						</div>

					<div class="fs-5 fw-bold mb-1 mt-3">기타</div>
					<div class="row">
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기타 결혼식">
							<label class="form-check-label" for="inlineCheckbox1">결혼식</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기타 약혼식">
							<label class="form-check-label" for="inlineCheckbox2">약혼식</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기타 돌잔치">
							<label class="form-check-label" for="inlineCheckbox3">돌잔치</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기타 칠순잔치">
							<label class="form-check-label" for="inlineCheckbox4">칠순잔치</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기타 프로포즈">
							<label class="form-check-label" for="inlineCheckbox5">프로포즈</label>
						</div>
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기타 기타">
							<label class="form-check-label" for="inlineCheckbox6">기타</label>
						</div>
					</div>
				</div>
			</div>


      
	<!-- 행사 지역  -->
	<div class="container">
		<div class="fs-4 fw-bold mt-5">행사 지역</div>
		<input type="text" name="cLoca" class="form-control mt-2" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 placeholder="행사 지역을 입력해주세요.">
	</div>


	<!-- 행사 설명 -->   
	<div class="container">
		<div class="fs-4 fw-bold mt-5">행사 구성</div>
		<div class="row">
			<div class="col">
				<select class="form-select mt-2" aria-label="Default select example" name="cTarget" class="catanon">
					<option selected value="catamenu" name="joinTarget">참여대상</option>
					<option value="전체">전체</option>
					<option value="어린이이">어린이</option>
					<option value="학생">학생</option>
					<option value="청년">청년</option>
					<option value="여성">여성</option>
					<option value="직장인">직장인</option>
					<option value="장애인">장애인</option>
					<option value="노인">노인</option>
					<option value="기업·단체">기업·단체</option>
					<option value="참여대상 기타">기타</option>
				</select>
			</div>
			
			<div class="col">
				<select class="form-select mt-2" aria-label="Default select example" name="cMethod" class="catanon">
					<option selected value="catamenu">방식</option>
					<option value="오프라인">오프라인</option>
					<option value="온라인">온라인</option>
					<option value="온ㆍ오프라인">온ㆍ오프라인</option>
					<option value="방식 기타">기타</option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<select class="form-select mt-2" aria-label="Default select example" name="cPrice" class="catanon">
					<option selected value="catamenu">예산</option>
					<option value="1000만원 미만">1,000만원 미만</option>
					<option value="1000~5000만원 미만">1,000만원 이상 ~ 5,000만원 미만</option>
					<option value="5000~1억 미만">5,000만원 ~ 1억 미만</option>
					<option value="1억 이상~3억 미만">1억 이상 ~ 3억 미만</option>
					<option value="3억 이상">3억 이상</option>
					<option value="예산 기타">기타</option>
				</select>
			</div>
			<div class="col">
				<select class="form-select mt-2" aria-label="Default select example" name="cPeople" class="catanon">
					<option selected value="catamenu">참여인원</option>
					<option value="50명 미만">50명 미만</option>
					<option value="50~100명미만">50명~100명 미만</option>
					<option value="100~500명미만">100~500명 미만</option>
					<option value="500~1000명 미만">500~1000명 미만</option>
					<option value="1000명이상">1000명 이상</option>
					<option value="인원 기타">기타</option>
				</select>
			</div>
	</div>

	<!-- 행사 설명 -->   
	<div class="fs-4 fw-bold mt-5">행사 설명</div>
		<div class="form-floating">
			<textarea class="form-control" id="floatingTextarea2" style="height: 400px" name="cText"></textarea>
			<label for="floatingTextarea2">진행하고자 하는 행사에 대해 적어주세요.</label>
		</div>
	</div>
   

	<!-- 참고자료  -->
	<div class="container">
		<div class="fs-4 fw-bold mt-5">참고 자료</div>
		<div class="form-group">
			<input class="form-control" type="file" id="formFile" name="file">
		</div>
	
		<div class="d-grid gap-2">
			<button type="button" class="btn btn-outline-secondary mt-4"  onclick="check();">제출하기</button>
		</div>
	</div>
</form>


<%
}
%>





<!-- 입력요구모달 -->
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
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="moveFn()">확인</button>
			</div>
		</div>
	</div>
</div>


<!-- submit모달 -->
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
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="submitFn()">확인</button>
			</div>
		</div>
	</div>
</div>






<!-- 메인 푸터 -->
   <div class="footer">
   </div>
      <div class="container">
          <div class="row justify-content-md-center">
            <div class="col-md-auto">
               <img src="../rogo1.png" alt="" width="200" class="d-inline-block align-text-center">
            </div>
            <div class="col-md-auto">
               <small class="text-muted">
                  전화번호 063-222-2222<br>
                  EVENTMAN | 전주시 덕진구 효자동 | 대표. 000<br>
                  ACC. 계좌번호 (예금주 :홍길동) | 사업자 번호. 000-000-0000<br>
               </small>
            </div>
         </div>
      </div>

</div>






<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>