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
   
	<% int costcount = (int)request.getAttribute("value"); %>
	<% int boardcount = (int)request.getAttribute("value"); %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap에 필요한 CSS파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<!-- 관리자 마이페이지 CSS -->
<link rel="stylesheet" type="text/css" href="../css/masterpage.css">

<title>관리자페이지</title>
</head>
<body>



<!-- header include -->
<jsp:include page="/WEB-INF/header.jsp"/>
      
<br>
<br>
<!-- 관리자 페이지 화면 -->
<div class="container" id="masterpage">

   <div class="row">
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../cost.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize1" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_AllCostList.do'">견적신청<br><%=costcount %> 건</button>
         </div>
      </div>
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../counselling.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize1" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_AllBoardList.do'">상담신청<br> 건</button>
         </div>
      </div>
   </div>
   <div class="row">
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../review.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do'">행사리뷰</button>
         </div>
      </div>
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../company.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do'">회사소개</button>
         </div>
      </div>
   </div>
   <div class="row">
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../board.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do'">게시판</button>
         </div>
      </div>
      <div class="col-sm-4 mx-auto">
         <img class="iconimg" src="../member.png">
         <div class="d-grid gap-2">
            <button class="btn btn-outline-secondary heightsize" type="button" onclick="location.href='<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_Modify.do'">회원관리</button>
         </div>
      </div>
   </div>

</div>









   
   


<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>


<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</body>
</html>