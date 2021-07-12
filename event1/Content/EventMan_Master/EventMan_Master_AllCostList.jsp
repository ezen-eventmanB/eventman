<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.EvCostVo" %>
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
	<%
	ArrayList<EvCostVo> descalist = (ArrayList<EvCostVo>)request.getAttribute("descalist");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap에 필요한 CSS파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	
	
<title>견적신청리스트</title>

<script>

function submitFn(){
	
	alert("실행");
	
	var order = $("input:radio[name=btnradio]:checked").val();
	var searchtype=$("select[name=serchtype]").val();
	var text = $("input[name=text]").val();
	var check = $("input:checkbox[name=check]:checked").val();
	
	//ar form = {"order":oreder , "searchType":searchType , "text":text};
	
	$.ajax({
		url:"<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_ajax_costlist.do?order="+order+"&searchtype="+searchtype+"&text="+text+"&check="+check,
		type:"post",
		datatype:"html",
		success:function(data){
			$("#listajax").html(data);
		}	
	});
	

};


</script>

</head>
<body>



<!-- header include -->
<jsp:include page="/WEB-INF/header.jsp"/>
     


<!-- 견적신청 페이지 -->

<div class="container">
	<p class="fs-2 fw-bold mt-5 mb-5">견적 신청함</p>
	<div class="row float-end mt-5">
		<div class="col-md-auto mt-1">
			<div class="form-check form-switch" onchange="submitFn()">
				<input class="form-check-input" name="check" type="checkbox" id="flexSwitchCheckDefault">
				<label class="form-check-label" for="flexSwitchCheckDefault">삭제 글 포함</label>
			</div>
		</div>
		<div class="col-md-auto mt-1">
			<div class="btn-group btn-group-sm"  role="group" aria-label="Basic radio toggle button group" onchange="submitFn()">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1" value="ASC" autocomplete="off" >
				<label class="btn btn-outline-secondary" for="btnradio1">과거</label>
				
				<input type="radio" class="btn-check" name="btnradio" id="btnradio2" value="DESC" autocomplete="off" checked>
				<label class="btn btn-outline-secondary" for="btnradio2">최신</label>
			</div>
		</div>
		<div class="col-md-auto mt-1">	
			<select class="form-select form-select-sm" name="serchtype" aria-label=".form-select-sm example">
				<option selected>검색타입</option>
				<option value="title">제목</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select>
		</div>	
		<div class="col-md-auto mt-1">
			<div class="input-group input-group-sm mb-3">
				<input type="text" class="form-control" id="searchbox2" name="text" placeholder="검색어입력" aria-label="Recipient's username" aria-describedby="button-addon2" onkeypress="if( event.keyCode == 13 ){submitFn();}">
				<button class="btn btn-outline-secondary " type="button" id="button-addon2" onclick="submitFn()">검색</button>
			</div>
		</div>
	</div>
</div>


<!-- 견적신청 리스트 table -->
<div class="container" id="listajax">
	<table class="table table-hover">
		<thead>
			<tr class="text-center">
				<th>글번호</th>
				<th colspan="2">제목</th>
				<th></th>
				<th>작성일</th>
				<th>작성아이디</th>
				<th>작성자</th>
				<th>조회수</th>
				<th></th>
			</tr>
		</thead>
		<tbody class="align-middle">
			<div id="ordertext">
			<% for(EvCostVo cvo : descalist){ %>
			</div>
				<tr onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Mypage_CostDetail.do?bidx=<%=cvo.getCidx()%>'">
					<td class="text-center"><%=cvo.getCidx() %></td>
					<td colspan="2"><%=cvo.getCostName()%></td>
					<td></td>
					<td class="text-center"><%=cvo.getSubWritedate()%></td>
					<td class="text-center"><%=cvo.getCName()%></td>
					<td class="text-center"><%=cvo.getRealname()%></td>
					<td class="text-center"><%=cvo.getCcount() %></td>
					<td>
						<div class="btn-group" role="group" aria-label="Basic outlined example">
							<button type="button" class="btn btn-outline-secondary btn-sm">답변</button>
							<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
						</div>
					</td>
				</tr>
			<div id="ordertext2"> <%}; %> </div>
		</tbody>
	</table>
</div>


<%-- 
<!-- 행사리뷰 페이징 처리 -->
	<div class="container mt-5 text-center">
		<div class="row justify-content-md-center">
			<div class="col-md-auto">	
				<nav aria-label="Page navigation example">
					<ul class="pagination">
					<%if(pm.isPrev() == true) {%>
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=pm.getStartPage()-1 %>">
								<span aria-hidden="false">&laquo;</span>
							</a>
						</li>
					<%} %>
					<% for(int i = pm.getStartPage(); i<=pm.getEndPage(); i++) {%>
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=i %>"><%=i %></a>
						</li>
					<% } %>
				
					<% if(pm.isNext() == true){ %>
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=pm.getEndPage()+1 %>" >
								<span aria-hidden="false">&raquo;</span>
							</a>
						</li>
					<%} %>
					</ul>
				</nav>
			</div>
		</div>
	</div> --%>








<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>

<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</body>
</html>