<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
String member_id = (String)session.getAttribute("S_memberId");
%>     
    
    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>EVENT MAN!</title>


	
<style>

</style>
</head>
<body>

<div class="fs-4 fw-bold">게시글 목록</div>
<div class="text-end">
	<button type="button" class="btn btn-outline-secondary btn-sm">게시글 작성</button>
</div>

<!-- 게시글 리스트 -->
<table class="table table-hover">
     <thead>
       <th>카테고리</th>
       <th colspan="2">제목</th>
       <th></th>
       <th>작성일</th>
       <th>작성자</th>
       <th>조회수</th>  
     </thead>
  <tbody>
    <tr>
      <td>행사</td>
      <td colspan="2"><a href="#">[행사홍보] 전북대학교 대동제 </a></td>
      <th></th>
      <td>2021-06-14</td>
      <td>EVENTMAN</td>
      <td>1</td>
    </tr>
  </tbody>
  
  
</table>
      <nav aria-label="Page navigation example">
         <ul class="pagination">
            <li class="page-item">
               <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
               </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
               <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
               </a>
            </li>
         </ul>
      </nav>




<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>