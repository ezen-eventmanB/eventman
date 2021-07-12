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

   ArrayList<EvBoardAskVo> alistboardask = (ArrayList<EvBoardAskVo>)request.getAttribute("alistboard");   
   
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
      My page
   </div>
      

<div class="container">
   <dvi class="row justify-content-md-center">
      <div class="col-md-auto">
         <img src="../mypagemain.png " alt="마이페이지이미지" class="w-100">
      </div>
   </dvi>
      
   <!-- 게시글 리스트 -->
   <div class="container">
      <table class="table table-hover">
         <thead>
         	<tr>
	            <th>카테고리</th>
	            <th colspan="2">제목</th>
	            <th></th>
	            <th>작성일</th>
	            <th>작성자</th>
	            <th>조회수</th>
            </tr>
         </thead>
         <tbody>
         <% for(EvBoardAskVo bavo: alistboardask){ %>
            <tr onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Mypage_MyboardlistDetail.do?bidx=<%=bavo.getBidx()%>'">
               <td><%=bavo.getBcata()%></td>
               <td colspan="2"><%=bavo.getBtitle()%></td>
               <td></td>
               <td><%=bavo.getBWrieday2()%></td>
               <td><%=bavo.getBname()%></td>
               <td><%=bavo.getBcount() %></td>
            </tr>
         <%}; %>
         </tbody>
      </table>
   </div>



</div>




<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>






<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>