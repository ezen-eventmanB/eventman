<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>    
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "domain.*" %>

 <%
   String member_id = (String)session.getAttribute("S_memberId");
 
    int midx = 0;
    
    if (session.getAttribute("midx") != null) {
       midx = (int)session.getAttribute("midx");
    }
   out.println("세션에 담긴 아이디는?");
   out.println(member_id);
   out.println(midx);  
   
	EvCostVo covo = (EvCostVo)request.getAttribute("covo");
   
   %>    
    
    
<!doctype html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
   <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
   <!-- top nav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">
   <!-- footer CSS -->
   <link rel="stylesheet" type="text/css" href="../css/footer.css">
   <!-- subnav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/subnav.css">
   <!-- mypage CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mypage.css">

<title>EVENT MAN!</title>

<script>
	function costDeletModalFn(){
		$("#textbox").html("&#34;<%=covo.getCostName()%>&#34; 글을 삭제합니다.");
		$("#modal").modal("show");

	};
	
	function costDeletFn() {
		location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_MyCostDelet.do?cidx=<%=covo.getCidx()%>&midx=<%=midx%>'
	};
</script>
</head>
<body>
<!-- 상단 네비 부분 -->
	<div class="container">
		<nav class="navbar navbar-expand-xxl navbar-light " id="topnav">
		
			<a class="navbar-brand" href="../EventMan_Main/EventMan_Main.jsp">
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
      My page
   </div>
      

<div class="container">
   <dvi class="row justify-content-md-center">
      <div class="col-md-auto">
         <img src="../mypagemain.png " alt="마이페이지이미지" class="w-100">
      </div>
   </dvi>
      
<div class="mypageajax">
	<div class="fs-4 fw-bold mb-5">견적신청 상세보기</div>
	
	<!-- 상세보기-->
	<div class="shadow p-3 mb-5 bg-body rounded mt-5 mb-5" >
		   <div class="container">
      <div class="sc-qPIWj eXGQeW">행사 견적신청</div>
      <hr/>   
   </div>
   
   <form name="frm">
   
   <input type="hidden" name="midx" value="<%=session.getAttribute("midx")%>">
<!-- 행사 명 -->
	     <div class="container">
	     	<div class="sc-qPIWj eXGQeW">행사 명</div>
	      		<div class="sc-qPIWj eXGQeW"><%=covo.getCostName() %></div>
	   <hr/>
	    </div>
   
<!-- 행사 일정 -->   
	   <div class="container">
	        <div class="sc-qPIWj eXGQeW">행사 일정</div>
	        	<div class="container">
				    <input type="date" id="cSdate" name="cSdate" class="CostDate" value="<%=covo.getCostStartDate()%>"> ~
				    <input type="date" id="cSdate2" name="cEdate" class="CostDate" value="<%=covo.getCostEndDate()%>">
				</div>		
	      	<div class="icon">
	      <hr/>
	 	  </div>

<!-- 행사 카테고리 선택 -->
  <!-- 행사 카테고리 선택 -->
   <div class="sc-qPIWj eXGQeW">행사 카테고리</div>
   
   
         <!-- 기업 행사 -->
   	<div class="cataselect">          

      <table>
         <tr>
         	<th>기업행사</th>
         </tr>
        	 <tr>   
            <td>
                      <input class="form-check-input" type="checkbox" name="cCata" value="기업 워크숍" <%=covo.getCostTarget().equals("기업 워크숍") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox1">워크숍</label>
                </td>
                <td>
                        <input class="form-check-input" type="checkbox" name="cCata" value="기업 판촉행사" <%=covo.getCostTarget().equals("기업 판촉행사") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox2">판촉행사</label>
                </td>
            </tr> 
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="기업 체육대회" <%=covo.getCostTarget().equals("기업 체육대회") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox3">체육대회</label>
                </td>
                <td>       
                          <input class="form-check-input" type="checkbox" name="cCata" value="기업 오픈행사" <%=covo.getCostTarget().equals("기업 오픈행사") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox4">오픈행사</label>
                </td>
            </tr>
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="기업 레크레이션" <%=covo.getCostTarget().equals("기업 레크레이션") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox5">레크레이션</label>
                </td>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="기업 기타" <%=covo.getCostTarget().equals("기업 기타") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox6">기타</label>
                </td>
            </tr>
   
            <!-- 공연 -->
	         <tr>
	         	<th>공연</th>
	         </tr>
	         <tr> 
	           
            <td>
                      <input class="form-check-input" type="checkbox" name="cCata" value="공연 지역 페스티벌" <%=covo.getCostTarget().equals("공연 지역 페스티벌") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox1">페스티벌</label>
                </td>
                <td>
                        <input class="form-check-input" type="checkbox" name="cCata" value="공연 댄스" <%=covo.getCostTarget().equals("공연 댄스") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox2">댄스</label>
                </td>
            </tr> 
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="공연 마슬" <%=covo.getCostTarget().equals("공연 마슬") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox3">마술</label>
                </td>
                <td>       
                          <input class="form-check-input" type="checkbox" name="cCata" value="공연 클래식" <%=covo.getCostTarget().equals("공연 클래식") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox4">클래식</label>
                </td>
            </tr>
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="공연 장기자랑" <%=covo.getCostTarget().equals("공연 장기자랑") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox5">장기자랑</label>
                </td>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="공연 기타" <%=covo.getCostTarget().equals("공연 기타") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox6">기타</label>
                </td>
            </tr>

               <!-- 대학 -->
        <tr>
      
         <th>대학</th>
         </tr>
         <tr>   
            <td>
                      <input class="form-check-input" type="checkbox" name="cCata" value="대학 축제" <%=covo.getCostTarget().equals("대학 축제") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox1">축제</label>
                </td>
                <td>
                        <input class="form-check-input" type="checkbox" name="cCata" value="대학 섭외" <%=covo.getCostTarget().equals("대학 섭외") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox2">연예인 섭외</label>
                </td>
            </tr>   
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="대학 체육대회" <%=covo.getCostTarget().equals("대학 체육대회") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox3">체육대회</label>
                </td>
                <td>       
                          <input class="form-check-input" type="checkbox" name="cCata" value="대학 개강행사" <%=covo.getCostTarget().equals("대학 개강행사") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox4">개강 행사</label>
                </td>
            </tr>
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata"  value="대학 종강이벤트" <%=covo.getCostTarget().equals("기타 종강이벤트") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox5">종강 이벤트</label>
                </td>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="대학 기타" <%=covo.getCostTarget().equals("대학 결혼식") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox6">기타</label>
                </td>
            </tr>

         <!-- 기타-->
  
         <tr>
         <th>기타</th>
         </tr>
         <tr>   
           		<td>
                      <input class="form-check-input" type="checkbox" name="cCata" value="기타 결혼식" <%=covo.getCostTarget().equals("기타 결혼식") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox1">결혼식</label>
                </td>
                <td>
                        <input class="form-check-input" type="checkbox" name="cCata" value="기타 약혼식" <%=covo.getCostTarget().equals("기타 약혼식") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox2">약혼식</label>
                </td>
            </tr> 
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="기타 돌잔치" <%=covo.getCostTarget().equals("기타 돌잔치") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox3">돌잔치</label>
                </td>
                <td>       
                          <input class="form-check-input" type="checkbox" name="cCata" value="기타 칠순잔치" <%=covo.getCostTarget().equals("기타 칠순잔치") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox4">칠순잔치</label>
                </td>
            </tr>
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="기타 프로포즈" <%=covo.getCostTarget().equals("기타 프로포즈") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox5">프로포즈</label>
                </td>
                <td>
                          <input class="form-check-input" type="checkbox" name="cCata" value="기타 기타" <%=covo.getCostTarget().equals("기타 기타") ? " checked" : "" %>>
                         <label class="form-check-label" for="inlineCheckbox6">기타</label>
                </td>
            </tr>
            
     	 </table>
      </div>
      <hr/>
      
<!-- 행사 지역  -->
      	<div class="sc-qPIWj eXGQeW">행사 지역</div>
	     <div class="sc-qPIWj eXGQeW"><%=covo.getCostLocation() %></div>
	   <hr/>

   
<!-- 행사 설명 -->   
        <div class="sc-qPIWj eXGQeW">행사 구성</div>
			
			<div class="container">
			<table>
			<tr>   
          		<td>
		      		<select class="form-select me-5" aria-label="Default select example" name="cTarget" class="catanon">
					  <option selected value="catamenu">참여대상</option>
					  <option value="전체"<%=covo.getCostTarget().equals("전체") ? " selected" : "" %>>전체</option>
					  <option value="어린아이"<%=covo.getCostTarget().equals("어린아이") ? " selected" : "" %>>어린이</option>
					  <option value="학생"<%=covo.getCostTarget().equals("학생") ? " selected" : "" %>>학생</option>
					  <option value="청년"<%=covo.getCostTarget().equals("청년") ? " selected" : "" %>>청년</option>
					  <option value="여성"<%=covo.getCostTarget().equals("여성") ? " selected" : "" %>>여성</option>
					  <option value="직장인"<%=covo.getCostTarget().equals("직장인") ? " selected" : "" %>>직장인</option>
					  <option value="장애인"<%=covo.getCostTarget().equals("장애인") ? " selected" : "" %>>장애인</option>
					  <option value="노인"<%=covo.getCostTarget().equals("노인") ? " selected" : "" %>>노인</option>
					  <option value="기업·단체"<%=covo.getCostTarget().equals("기업·단체") ? " selected" : "" %>>기업·단체</option>
					  <option value="참여대상 기타"<%=covo.getCostTarget().equals("참여대상 기타") ? " selected" : "" %>>기타</option>
					</select>
               	</td>
                <td>
                         <select class="form-select me-5"" aria-label="Default select example" name="cMethod" class="catanon">
					         <option selected value="catamenu">방식</option>
					         <option value="오프라인"<%=covo.getCostTarget().equals("오프라인") ? " selected" : "" %>>오프라인</option>
					         <option value="온라인"<%=covo.getCostTarget().equals("온라인") ? " selected" : "" %>>온라인</option>
					         <option value="온ㆍ오프라인"<%=covo.getCostTarget().equals("온ㆍ오프라인") ? " selected" : "" %>>온ㆍ오프라인</option>
					         <option value="방식 기타"<%=covo.getCostTarget().equals("방식 기타") ? " selected" : "" %>>기타</option>
					      </select>
                </td>
            </tr> 
            <tr></tr>
			<tr>
				<td>
					 <select class="form-select me-5" aria-label="Default select example" name="cPrice" class="catanon">
			         <option selected value="catamenu">예산</option>
			         <option value="1000만원 미만">1,000만원 미만</option>
			         <option value="1000~5000만원 미만">1,000만원 이상 ~ 5,000만원 미만</option>
			         <option value="5000~1억원 미만">5,000만원 ~ 1억 미만</option>
			         <option value="1억 이상">1억 이상 ~ 3억 미만</option>
			         <option value="3억 이상">3억 이상</option>
			         <option value="예산 기타">기타</option>
		    		 </select>
				</td>
				<td>
					<select class="form-select me-5"" aria-label="Default select example" name="cPeople" class="catanon">
		         	<option selected value="catamenu">참여인원</option>
			         <option value="50명 미만">50명 미만</option>
			         <option value="50~100명미만">50명~100명 미만</option>
			         <option value="100~500명미만">100~500명 미만</option>
			         <option value="500~1000명 미만">500~1000명 미만</option>
			         <option value="1000명이상">1000명 이상</option>
			         <option value="인원 기타">기타</option>
		      		</select>
				</td>
			</tr>
			</table>
			
		</div>
		<br>
		<hr/>
<!-- 행사 설명 -->   
        <div class="sc-qPIWj eXGQeW">행사 설명</div>
                <div class="form-floating">
              <textarea class="form-control" id="floatingTextarea2" style="height: 400px" name="cText" readonly><%=covo.getCostText() %></textarea>
              <label for="floatingTextarea2">진행하고자 하는 행사에 대해 적어주세요.</label>
            </div>
               <hr/>
         </div>
   

<!-- 참고자료  -->
   <div class="container">
   <div class="sc-qPIWj eXGQeW">참고 자료</div>
   <div class="form-group">
      <input class="form-control" type="file" id="formFile" name="file">
    <hr/>
    </div>

					<div class="text-end mt-5">
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_CostModify.do?cidx=<%=covo.getCidx()%>'">수정</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="costDeletModalFn()">삭제</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_MyCostlist.do?midx=<%=midx%>'">목록</button>
					</div>	
    	</div>
	</form>
		
									<table>
								<tr>
									<td>행사명</td>
									<td><%=covo.getCostName() %></td>
								</tr>
								<tr>
									<td>행사일정</td>
									<td><%=covo.getCostStartDate() %></td>
									<td><%=covo.getCostEndDate() %></td>
								</tr>
								<tr>
									<td>행사카테고리</td>
									<td><%=covo.getCostCatagory() %></td>
								</tr>
								<tr>
									<td>행사 지역</td>
									<td><%=covo.getCostLocation() %></td>
								</tr>
								<tr>
									<td>행사 구성</td>
									<td><%=covo.getCostTarget() %></td>
									<td><%=covo.getCostMethod() %></td>
									<td><%=covo.getCostPrice() %></td>
									<td><%=covo.getCostPeople() %></td>
								</tr>
								<tr>
									<td>행사 설명</td>
									<td><%=covo.getCostText() %></td>
								</tr>
							</table>
									<div>
										<div class="container">
							      			<div class="sc-qPIWj eXGQeW">행사 자료</div>
											<%if(covo.getCostFile() != null){%>
												<img class="mt-3" style="max-width:90%; margin:5px auto;" src="../Advice_img/<%=covo.getCostFile() %>">
											<%}; %>
										</div>
									</div>

<!--   모달   -->
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
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="costDeletModalFn()">확인</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
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

<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</body>
</html>