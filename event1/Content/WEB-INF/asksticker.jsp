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

	
	%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EVENT MAN!</title>

<!-- Bootstrap에 필요한 CSS파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>


<style>
#fixedbutton {
	position: fixed;
	bottom: 5px;
	right: 5px; 
}

</style>

<script>
/*   화면구석 상담하기 버튼   */
function askFn(){
  //일단 로그인 확인 로그인 안되있다면 로그인 요구 모달창 - 로그인창
  //로그인 된상태라면 이동
  
   if(<%=session.getAttribute("midx")%> == null){
      $("#textbox").html("로그인후 이용해주세요.");
      $("#modal").modal("show");
   }else{
      location.href="<%=request.getContextPath()%>/EventMan_Board/EventMan_MainAdvice.do?midx="+<%=session.getAttribute("midx")%>;
   };
}
</script>
</head>
<body>

<!-- 화면구석 상담하기 버튼 -->
<div id="fixedbutton" class="mb-3">
   <div class="rounded-3 border border-3 border-warning">
      <div class="bg-warning bg-gradient">
         <div class="text-center fw-bold">EVENT</div>
         <div class="text-center fw-bold">MAN</div>
         <div class="text-center fw-bold">상담문의</div>
         <button type="button" class="bg-light rounded-3 border border-1 border-secondary text-center ms-1 me-1 pb-1" onclick="askFn()">
            <img src="../pencil.png" class="mt-1 mb-1 ms-3 me-3" style="width:50px;"/><br>
            <div class="fw-bold">상담문의</div>
            <div class="fw-bold">신청</div>
         </button>
      </div>
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
            <span id="textbox"></span>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do'">로그인페이지로 이동</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="moveFn()">취소</button>
         </div>
      </div>
   </div>
</div>


	<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>