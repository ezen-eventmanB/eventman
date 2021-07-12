<%@page import="service.MemberServiceImpl"%>
<%@page import="vo.EvMemberVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%

	 String member_id = (String)session.getAttribute("S_memberId");

  	int midx = 0;
  
  	if (session.getAttribute("midx") != null) {
  	   midx = (int)session.getAttribute("midx");
  	}
   
 	EvMemberVo mbvo = (EvMemberVo)request.getAttribute("mbvo");
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

	<!-- subnav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/subnav.css">
<style>

<style>

/*중앙 행사리뷰 앨범 CSS*/
	.album{
		margin-bottom: 40px;
	}
	/*행사리뷰 앨범 페이징처리*/
	.pagination {
   		justify-content: center;
	}


/* 메인 하단 게시판 노출*/
	.table{
		max-width: 1300px;	
		margin:10px auto;
		text-align:center;
	}
	table{
		max-width: 1300px;	
		margin:10px auto;
		text-align:center;
	}
	#roginbox{
		max-width:500px;
		margin:0px auto;
		margin-top:100px;
		margin-bottom:200px;
		font-style: gray;
	}
	
	#inputwidth{
		width:400px;
	}
	
	#loginbtn{
		height:100px;
		margin-left:20px;
		position: relative;
		bottom: 5px;
	}
	
	table{
		width:500px;
	}
	.input-group{
		margin:5px;	
	}
	#underline1, #underline2{
		border-bottom: 1px solid lightgray;
		margin-bottom: 30px;
	}
	#underline1{
		margin-bottom:50px;	
	}
	tr{
		height:50px;
	}
	#EVENTMAN{
		text-align:center;
	}
	.input-group-text{
		width:180px;
	}
	#b1{
		width:247px;
	}
	
</style>
	 <script type="text/javascript">
	 
	 function check(){         
			 var frm = document.frm;
		 
			 if(document.frm.mPwd.value==""){
				$("#modaltext").html("비밀번호를 입력해주세요");
				$("#failModal").modal("show");	
				document.getlementById('mPwd').focus();
			}else{                                 
				document.frm.action ="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Dropout_Action.do";
				document.frm.method = "post";
				document.frm.submit();    
				return;
		    }
		 }
	 </script>
</head>
<body>

<div class="container ajax">

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
				계정 수정하기
			</div>
					
					
			<!-- 회원정보 수정 테이블 -->		
			<div class="container">
				<div id="roginbox">
					<div id="underline1">
						<p class="fs-5 text-black-50">Drop Out</p>
					</div>
		
				<div id="underline2">
					<p class="fs-1 text-muted" id="EVENTMAN">탈 퇴 하 기</p>
				</div>
				<form name="frm">
								<input type="hidden" name="midx" value="<%=midx%>">
							<table>
								<tr>
									<td>계정 종류</td>
									<td><%=mbvo.getmType() %></td>
								</tr>
								<tr>
									<td>아이디</td>
									<td><%=mbvo.getmId() %></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><%=mbvo.getmName() %></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td>
									<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=2 name="mPwd"></td>
								</tr>
							</table>
						<div class="d-grid gap-2">		
							<button type="button" class="btn btn-outline-danger" onclick="check()">탈퇴하기</button>
						</div>
				
					</form>
				</div>
			</div>
		
</div>

				<!-- 아이디 및 비밀번호 틀렸을때  -->
					<div class="modal fade" id="failModal" tabindex="-2" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">탈퇴 실패</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					       	 비밀번호를 입력해주세요.
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>





<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>


<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>