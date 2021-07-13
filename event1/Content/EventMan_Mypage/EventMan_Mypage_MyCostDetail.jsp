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

   <!-- subnav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/subnav.css">
   <!-- mypage CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mypage.css">

<title>EVENT MAN!</title>

<script>
function ModalcostDeletFn(){
	$("#textbox").html("&#34;<%=covo.getCostName()%>&#34; 글을 삭제합니다.");
	$("#modal").modal("show");

};

function costDeletFn() {
	location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_MyCostDelete.do?cidx=<%=covo.getCidx()%>&midx=<%=midx%>';
};

function masterreplyFn(){
	
	$("#replybox").empty();
	$("#replybox").html('<div class="mb-3"><label for="exampleFormControlTextarea1" class="form-label">답변글 작성하기</label><textarea class="form-control" name="reply" id="exampleFormControlTextarea1" rows="3"></textarea></div>');
	$("#replybtn").empty();
	$("#replybtn").html('<button type="button" class="btn btn-outline-secondary btn-sm me-1" onclick="replyActionFn()">답변작성완료</button>'+'<button type="button" class="btn btn-outline-secondary btn-sm" onclick="listmoveFn()">목록</button>');
	
};

function replyActionFn(){
	alert('<%=covo.getCidx()%>');
	
	var reple = $("#exampleFormControlTextarea1").val();
	
	alert(reple);
	var alldata = {"cidx" : <%=covo.getCidx()%>, "creply" : reple};
	
	alert(alldata);
	
	$.ajax({
		url:"<%=request.getContextPath()%>/EventMan_Cost/EventMan_Master_Reply.do?",
		type:"post",
		data:alldata,
		success:function(data){
			location.href="<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_AllCostList.do";
		}	
	});

	
};

function listmoveFn(){
	location.href='<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_AllCostList.do';
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
      My Cost Detail
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

								<div class="text-center align-middle ">
									<div class="mt-2"><%=covo.getCostStartDate2()%><br>~<br><%=covo.getCostEndDate2()%></div>
								</div>
							</div>	
	      	<div class="icon">
	      <hr/>
	 	  </div>

<!-- 행사 카테고리 선택 -->
  <!-- 행사 카테고리 선택 -->
   <div class="sc-qPIWj eXGQeW">행사 카테고리</div>
   
   
         <!-- 기업 행사 -->
   	<div class="cataselect">          
			         <div class="container">
			            <div class="fs-5 text-black-50">기업행사</div>
						  <div class="row">
						    <div class="col">
						    	<div>
						    		<input class="form-check-input" type="checkbox" name="cCata" value="기업 워크숍" 
						    		<%if(covo.getCostCatagory().indexOf("기업 워크숍")>=0) { out.println("checked"); } %>   disabled="disabled">
                        			<label class="form-check-label" for="inlineCheckbox1">워크숍</label>
                        		 </div>
						    </div>
						    <div class="col">
						    <div>
						     		<input class="form-check-input" type="checkbox" name="cCata" value="기업 판촉행사" 
									<%if(covo.getCostCatagory().indexOf("기업 판촉행사")>=0) { out.println("checked"); } %>   disabled="disabled">
                         			<label class="form-check-label" for="inlineCheckbox2">판촉행사</label>
                         			</div>
						    </div>
						    <div class="col">
						     <div>
						    		<input class="form-check-input" type="checkbox" name="cCata" value="기업 체육대회" 
						    		<%if(covo.getCostCatagory().indexOf("기업 체육대회")>=0) { out.println("checked"); } %>   disabled="disabled">
                         			<label class="form-check-label" for="inlineCheckbox3">체육대회</label>
                        		 </div>
						    </div>
						     <div class="col">
						      <div>
						    		<input class="form-check-input" type="checkbox" name="cCata" value="기업 오픈행사" 
						    		<%if(covo.getCostCatagory().indexOf("기업 오픈행사")>=0) { out.println("checked"); } %>   disabled="disabled">
                         			<label class="form-check-label" for="inlineCheckbox4">오픈행사</label>
                        		 </div>
						    </div>
						    <div class="col">
						      <div>
						    		<input class="form-check-input" type="checkbox" name="cCata" value="기업 레크레이션" 
						    		<%if(covo.getCostCatagory().indexOf("기업 레크레이션")>=0) { out.println("checked"); } %>   disabled="disabled">
                         			<label class="form-check-label" for="inlineCheckbox5">레크레이션</label>
                        		 </div>
						    </div>
						    <div class="col">
						      <div>
						    		<input class="form-check-input" type="checkbox" name="cCata" value="기업 기타" 
						    		<%if(covo.getCostCatagory().indexOf("기업 기타")>=0) { out.println("checked"); } %>   disabled="disabled">
                         			<label class="form-check-label" for="inlineCheckbox6">기타</label>
                        		 </div>
						    </div>
						  </div>
						  <p>
						  
						  
						   <div class="fs-5 text-black-50">공연</div>
						  <div class="row">
						    <div class="col">
						    	<div>
						    		<input class="form-check-input" type="checkbox" name="cCata" value="공연 지역 페스티벌" 
						    		<%if(covo.getCostCatagory().indexOf("공연 지역 페스티벌")>=0) { out.println("checked"); } %>   disabled="disabled">
                         			<label class="form-check-label" for="inlineCheckbox1">페스티벌</label>
                        		 </div>
						    </div>
						    <div class="col">
						    <div>
						     		<input class="form-check-input" type="checkbox" name="cCata" value="공연 댄스" 
						     		<%if(covo.getCostCatagory().indexOf("공연 댄스")>=0) { out.println("checked"); } %>   disabled="disabled">
                       				<label class="form-check-label" for="inlineCheckbox2">댄스</label>
                         			</div>
						    </div>
						    <div class="col">
						     <div>	
						    		<input class="form-check-input" type="checkbox" name="cCata" value="공연  마술" 
						    		<%if(covo.getCostCatagory().indexOf("공연 마술")>=0) { out.println("checked"); } %>   disabled="disabled">
                        			<label class="form-check-label" for="inlineCheckbox3">마술</label>
                        		 </div>
						    </div>
						     <div class="col">
						      <div>
						    		<input class="form-check-input" type="checkbox" name="cCata" value="공연 클래식" 
						    		<%if(covo.getCostCatagory().indexOf("공연 클래식")>=0) { out.println("checked"); } %>   disabled="disabled">
                      				<label class="form-check-label" for="inlineCheckbox4">클래식</label>
                        		 </div>
						    </div>
						    <div class="col">
						      <div>
						    		<input class="form-check-input" type="checkbox" name="cCata" value="공연 장기자랑" 
						    		<%if(covo.getCostCatagory().indexOf("공연 장기자랑")>=0) { out.println("checked"); } %>   disabled="disabled">
                         			<label class="form-check-label" for="inlineCheckbox5">장기자랑</label>
                        		 </div>
						    </div>
						    <div class="col">
						      <div>
						    		<input class="form-check-input" type="checkbox" name="cCata" value="공연 기타" 
						    		<%if(covo.getCostCatagory().indexOf("공연 기타")>=0) { out.println("checked"); } %>   disabled="disabled">
                         			<label class="form-check-label" for="inlineCheckbox6">기타</label>
                        		 </div>
						    </div>
						  </div>
						  <p>
						  
						  <div class="fs-5 text-black-50">대학</div>
						  <div class="row">
						    <div class="col">
						    	<div>
						    		    <input class="form-check-input" type="checkbox" name="cCata" value="대학 축제" 
						    		    <%if(covo.getCostCatagory().indexOf("대학 축제")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox1">축제</label>
                        		 </div>
						    </div>
						    <div class="col">
						    <div>
		            					<input class="form-check-input" type="checkbox" name="cCata" value="대학 섭외" 
		            					<%if(covo.getCostCatagory().indexOf("대학 섭외")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox2">연예인 섭외</label>
                         			</div>
						    </div>
						    <div class="col">
						     <div>
						             	<input class="form-check-input" type="checkbox" name="cCata" value="대학 체육대회" 
						             	<%if(covo.getCostCatagory().indexOf("대학 체육대회")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox3">체육대회</label>
                        		 </div>
						    </div>
						     <div class="col">
						      <div>
                          				<input class="form-check-input" type="checkbox" name="cCata" value="대학 개강행사" 
                          				<%if(covo.getCostCatagory().indexOf("대학 개강행사")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox4">개강 행사</label>
                        		 </div>
						    </div>
						    <div class="col">
						      <div>
						    		 	<input class="form-check-input" type="checkbox" name="cCata"  value="대학 종강이벤트" 
						    		 	<%if(covo.getCostCatagory().indexOf("대학 종강이벤트")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox5">종강 이벤트</label>
                        		 </div>
						    </div>
						    <div class="col">
						      <div>
						    			<input class="form-check-input" type="checkbox" name="cCata" value="대학 기타" 
						    			<%if(covo.getCostCatagory().indexOf("대학 기타")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox6">기타</label>
                        		 </div>
						    </div>
						  </div>
						  <p>
						  
						  <div class="fs-5 text-black-50">기타</div>
						  <div class="row">
						    <div class="col">
						    	<div>
						    		    <input class="form-check-input" type="checkbox" name="cCata" value="기타 결혼식" 
						    		    <%if(covo.getCostCatagory().indexOf("기타 결혼식")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox1">결혼식</label>
                        		 </div>
						    </div>
						    <div class="col">
						    <div>
		            					<input class="form-check-input" type="checkbox" name="cCata" value="기타 약혼식" 
		            					<%if(covo.getCostCatagory().indexOf("기타 약혼식")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox2">약혼식</label>
                         			</div>
						    </div>
						    <div class="col">
						     <div>
						             	<input class="form-check-input" type="checkbox" name="cCata" value="기타 돌잔치" 
						             	<%if(covo.getCostCatagory().indexOf("기타 돌잔치")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox3">돌잔치</label>
                        		 </div>
						    </div>
						     <div class="col">
						      <div>
                          				<input class="form-check-input" type="checkbox" name="cCata" value="기타 칠순잔치" 
                          				<%if(covo.getCostCatagory().indexOf("기타 칠순잔치")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox4">칠순잔치</label>
                        		 </div>
						    </div>
						    <div class="col">
						      <div>
						    		 	<input class="form-check-input" type="checkbox" name="cCata" value="기타 프로포즈" 
						    		 	<%if(covo.getCostCatagory().indexOf("기타 프로포즈")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox5">프로포즈</label>
                        		 </div>
						    </div>
						    <div class="col">
						      <div>
						    			<input class="form-check-input" type="checkbox" name="cCata" value="기타 기타" 
						    			<%if(covo.getCostCatagory().indexOf("기타 기타")>=0) { out.println("checked"); } %>   disabled="disabled">
                         				<label class="form-check-label" for="inlineCheckbox6">기타</label>
                        		 </div>
						    </div>
						  </div>
						  
						</div>
      </div>
      <hr/>
      
<!-- 행사 지역  -->
      	<div class="sc-qPIWj eXGQeW">행사 지역</div>
	     <div class="sc-qPIWj eXGQeW"><%=covo.getCostLocation() %></div>
	   <hr/>

   
<!-- 행사 설명 -->   
        <div class="sc-qPIWj eXGQeW">행사 구성</div>
			
			<div class="container">
				<div class="fs-5 text-black-50">참여대상</div>
				<div class="mt-2"><%=covo.getCostTarget()%></div>
				<p>
				
				<div class="fs-5 text-black-50">행사 방식</div>
				<div class="mt-2"><%=covo.getCostMethod()%></div>
				<p>
				
				<div class="fs-5 text-black-50">행사 예산</div>
				<div class="mt-2"><%=covo.getCostPrice()%></div>
				<p>
				
				<div class="fs-5 text-black-50">행사 인원</div>
				<div class="mt-2"><%=covo.getCostPeople() %></div>	 
			</div>
				<hr/>
				
				
		      		<%-- <select class="form-select me-5" aria-label="Default select example" name="cTarget" class="catanon">
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
					</select> --%>

                    <%--  <select class="form-select me-5"" aria-label="Default select example" name="cMethod" class="catanon">
					     <option selected value="catamenu">방식</option>
					     <option value="오프라인"<%=covo.getCostMethod().equals("오프라인") ? " selected" : "" %>>오프라인</option>
					     <option value="온라인"<%=covo.getCostMethod().equals("온라인") ? " selected" : "" %>>온라인</option>
					     <option value="온ㆍ오프라인"<%=covo.getCostMethod().equals("온ㆍ오프라인") ? " selected" : "" %>>온ㆍ오프라인</option>
					     <option value="방식 기타"<%=covo.getCostMethod().equals("방식 기타") ? " selected" : "" %>>기타</option>
				     </select> --%>
					 								
					<%--  <select class="form-select me-5" aria-label="Default select example" name="cPrice" class="catanon">
					 <option selected value="catamenu">예산</option>
			         <option value="1000만원 미만"<%=covo.getCostPrice().equals("1000만원 미만") ? " selected" : "" %>>1,000만원 미만</option>
			         <option value="1000~5000만원 미만"<%=covo.getCostPrice().equals("1000~5000만원 미만") ? " selected" : "" %>>1,000만원 이상 ~ 5,000만원 미만</option>
			         <option value="5000~1억원 미만"<%=covo.getCostPrice().equals("5000~1억원 미만") ? " selected" : "" %>>5,000만원 ~ 1억 미만</option>
			         <option value="1억 이상"<%=covo.getCostPrice().equals("1억 이상") ? " selected" : "" %>>1억 이상 ~ 3억 미만</option>
			         <option value="3억 이상"<%=covo.getCostPrice().equals("3억 이상") ? " selected" : "" %>>3억 이상</option>
			         <option value="예산 기타"<%=covo.getCostPrice().equals("예산 기타") ? " selected" : "" %>>기타</option>
		    		 </select> --%>

					<%-- <select class="form-select me-5"" aria-label="Default select example" name="cPeople" class="catanon">	
											
		         	 <option selected value="catamenu">참여인원</option>
			         <option value="50명 미만" <%=covo.getCostPeople().equals("1000만원 미만") ? " selected" : "" %>>50명 미만</option>
			         <option value="50~100명미만"<%=covo.getCostPeople().equals("50~100명미만") ? " selected" : "" %>>50명~100명 미만</option>
			         <option value="100~500명미만"<%=covo.getCostPeople().equals("100~500명미만") ? " selected" : "" %>>100~500명 미만</option>
			         <option value="500~1000명 미만"<%=covo.getCostPeople().equals("500~1000명 미만") ? " selected" : "" %>>500~1000명 미만</option>
			         <option value="1000명이상"<%=covo.getCostPeople().equals("1000명이상만") ? " selected" : "" %>>1000명 이상</option>
			         <option value="인원 기타"<%=covo.getCostPeople().equals("인원 기타") ? " selected" : "" %>>기타</option>
		      		</select> --%>
			
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
   <div class="sc-qPIWj eXGQeW">참고 자료<%if(covo.getCostFile() != null){%><img class="mt-3" style="max-width:90%; margin:5px auto;" src="../Advice_img/<%=covo.getCostFile() %>"><%}; %></div>
   <div class="form-group">
      <input class="form-control" type="file" id="formFile" name="file">
    <hr/>
    
    
<!-- 관리자의 답변이 들어가는 부분 -->
    <div id="replybox">
		<%if(covo.getCcondition().equals("견적등록완료")){%>
			<div>견적신청등록이 완료되었습니다.</div>
			<div>해당 상담사가 1~2일내로 연락 드리겠습니다.</div>
			<div>최고의 행사 파트너가 되겠습니다.</div>
			<div>감사합니다.</div>
			<div>연락처:063-222-2222</div>
		<%}else if(covo.getCcondition().equals("상담중") || covo.getCcondition().equals("상담완료") ){ %>
			<div><%=covo.getCreply() %></div>
		<%}; %>
	</div>
    
    </div>
		<%if(midx>0){ %>
			<!-- 맴버 버튼 -->
			<div class="text-end mt-5">
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_MyCostModify.do?cidx=<%=covo.getCidx()%>'">수정</button>
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="ModalcostDeletFn()">삭제</button>
				<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_MyCostlist.do?midx=<%=midx%>'">목록</button>
			</div>	
		<%}else if(gidx>0){ %>
			<!-- 관리자 버튼 -->
			<div class="text-end mt-5">
				<div id="replybtn">
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="masterreplyFn()">답변</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_AllCostList.do'">목록</button>
				</div>
			</div>	
		<%}; %>
    	</div>
	</form>

	
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
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="costDeletFn()">확인</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
			</div>
		</div>
	</div>
</div>



<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>

<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</body>
</html>