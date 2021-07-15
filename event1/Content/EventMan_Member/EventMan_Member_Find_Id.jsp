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
<title>아이디 찾기</title>

 <!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>

<script>

function findId(){

<%-- 		if(frm.name == ""){
			alert('아이디를 입력해주세요.');
			document.getlementById('name').focus();
		}else if(frm.phone == ""){
			alert('전화번호를 입력해주세요.')
			document.getlementById('phone').focus();
		}else{
			frm.action="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Find_Id_Action.do"; 
			frm.method = "POST";
			frm.submit();
			return;	
			textbox
		} --%>
		

    var username = $("#name").val();
    var userphone = $("#phone").val();
    var alldata = { "name": username, "phone": userphone };
    
    if(username.trim() =='' && userphone.trim()==''){
    	$("#textbox").html("이름과 전화번호를")
		$("#modal1").modal("show");	
		
	}else if(username.trim() ==''){
    	$("#textbox").html("이름을")
		$("#modal1").modal("show");	
		
		
	}else if(userphone.trim()==''){
    	$("#textbox").html("전화번호를")
		$("#modal1").modal("show");	
		
	}else{
		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Find_Id_Action.do",
			type:"post",
			data:alldata,
			success:function(data){
				var str = data.trim();
				$("#findidspan").html(str);
				$("#modal").modal("show");
			}	
		})

	};

};



function phonecheckFn(){
		
	    var username = $("#name").val();
	    var userphone = $("#phone").val();
	    var alldata = { "name": username, "phone": userphone };
	    
	    if(username.trim() =='' || userphone.trim()==''){
	    	
			$("#modal1").modal("show");	
			
  }else{

		$.ajax({
			url:"<%=request.getContextPath()%>/EventMan_Member/EventMan_phonecheck.do",
			type:'post',
			data:alldata,
			success: function(data){
				$('#phonecheck').html(data);
				$("#modal3").modal("show");
			}// end
		});// end ajax
			
			return false;
			
		
	};
};

	


</script>


<!-- footer CSS -->
<link rel="stylesheet" type="text/css"   href="../css/footer.css">



</script>

		<%-- <script>
		   function findId(){
		      
		      $.ajax({
		         url:"<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Find_Id_Action.do",
		         type:"post",
		         data:"",
		         success:function(data){
		            $("#truemodal").modal("show");
		         }   
		
		      });
		            
		   }
		   
		</script> --%>


<!-- <script>
	$('#truemodal').modal('toggle')
</script>
 -->


<style>



/* /* 아이디 찾기 화면 */
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
	} */
	
</style>



</head>
<body>


<!-- header include -->
<jsp:include page="/WEB-INF/header.jsp"/>
     
		
		
		
		
		
		
<!-- 아이디 찾기 화면 -->		
	<div class="container">
		
		<div id="roginbox">
			<div id="underline1">
				<p class="fs-5 text-black-50">아이디 찾기</p>
			</div>
			<div id="underline2">
				<p class="fs-1 text-muted" id="EVENTMAN">EVENT MAN</p>
			</div>
			<form name="frm">

						
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<input type="text" name="name" id="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1>
				</div>

				<!--
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">핸드폰번호</span>
					<input type="text" class="form-control" name="phone" id="phone" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1>
					<button class="btn btn-outline-secondary" type="button" id="button-addon2"  onclick="location.href='EventMan_phonecheck.jsp'">인증번호</button>
				</div>
				 -->
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">핸드폰번호</span>
					<input type="text" class="form-control" name="phone" id="phone" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1>
					<button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="phonecheckFn()">인증번호</button>
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">&nbsp;&nbsp;인증번호&nbsp;</span>
					<input type="text" class="form-control" name="number" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1>
					<button class="btn btn-outline-secondary" type="button" id="button-addon2">인증확인</button>
				</div>

			
			
				
				
				<div class="d-grid gap-2">
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="findId()">확인</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Find_Pw.do'">비밀번호찾기</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do'">뒤로</button>
				</div>
			</form>
		</div>
	</div>
		


<!-- 성공 모달 -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
      </div>
      <div class="modal-body">
         <span id="findidspan"> </span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>


<!-- 이름 or 전화번호 입력 요구 모달 -->
<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
      </div>
      <div class="modal-body">
         <span id="textbox"></span> 정확히 입력해주세요.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 휴대폰 인증모달 -->
<div class="modal fade" id="modal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
      </div>
      <div class="modal-body">
         <div id="phonecheck">      
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>








<!-- footer include -->
<jsp:include page="/WEB-INF/footer.jsp"/>





<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>

</body>
</html>