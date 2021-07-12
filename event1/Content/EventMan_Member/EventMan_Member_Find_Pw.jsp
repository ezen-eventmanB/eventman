<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }	
	
	
	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script>

</script>

	<!-- footer CSS -->
	<link rel="stylesheet" type="text/css"   href="../css/footer.css">
	
<style>



/* 아이디 찾기 화면 */
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
	
	#roginbtn{
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
	
</style>



</head>
<body>

<!-- header include -->
<jsp:include page="/WEB-INF/header.jsp"/>
     
		
		
		
		
		
<!-- 비밀번호 찾기 화면 -->		
	<div class="container">
		
		<div id="roginbox">
			<div id="underline1">
				<p class="fs-5 text-black-50">비밀번호 찾기</p>
			</div>
			<div id="underline2">
				<p class="fs-1 text-muted" id="EVENTMAN">EVENT MAN</p>
			</div>
			<form>
				<table>
					<tr>
						<td id="inputwidth">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">핸드폰번호</span>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1>
								<button class="btn btn-outline-secondary" type="button" id="button-addon2">인증번호</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">&nbsp;&nbsp;인증번호&nbsp;</span>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1>
								<button class="btn btn-outline-secondary" type="button" id="button-addon2">인증확인</button>
							</div>
						</td>
					</tr>
				</table>
			
			
				
				
				<div class="d-grid gap-2">
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="#">확인</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do'">로그인</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Main/EventMan_Main.do'">홈 화면</button>
				</div>
			</form>
		</div>
	</div>
		



<!-- 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">로그인 실패!</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        로그인 확인문 결과 실패시 나옴
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>




<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>






<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>