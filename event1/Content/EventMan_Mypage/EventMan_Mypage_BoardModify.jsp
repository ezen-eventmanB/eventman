<%@page import="vo.EvBoardAskVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }
	
	EvBoardAskVo bavo = (EvBoardAskVo)request.getAttribute("bavo");
	 
	%>    
    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script>

/* 사진 미리보기*/
function setImageFn(f){
	var file = f.files; 
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
		f.outerHTML = f.outerHTML;
		document.getElementById('preview').innerHTML = '';
	}else {
		var reader = new FileReader();
		reader.onload = function(rst){
			document.getElementById('preview').innerHTML = '<img style="max-width:90%; margin:5px auto;" src="' + rst.target.result + '">';
		};
		reader.readAsDataURL(file[0]);
	};
};


/*	취소모달창	*/
function backboardFn(){
	$("#textbox").html("수정을 취소하고 목록으로 돌아갑니다.")
	$("#modal1").modal("show")
};

/*	수정취소	*/
function myBoardListFn(){
   var midx = <%=midx%>;

   $.ajax({
      url:"<%=request.getContextPath()%>/EventMan_Board/EventMan_Mypage_Myboardlist.do", 
      type:"post",
      data:{midx:midx},
      datatype:"html",
      success:function(data){
         $("#mypageajax").html(data);
      }
   });
};

/*	수정모달창		*/
function submitFn(){
	$("#textbox2").html("수정한 내용으로 변경합니다.");
	$("#modal2").modal("show");
};
	 

/*	수정완료	*/
function submitmodalFn(){
	
	var frm = document.frm;

	var midx = <%=midx%>;
	
	frm.action = "<%=request.getContextPath()%>/EventMan_Board/EventMan_Mypage_BoardModify_Action.do";
	frm.method = "post";
	frm.submit();
	
	//ajax 로 submit을 시켜야하는데......
	return;
	
};
</script>
<title>EVENT MAN!</title>
	
<style>

</style>
</head>
<body>

<div class="mypageajax">

<form name="frm">
	<div class="fs-4 fw-bold mb-5">게시글 수정하기</div>
	<input type="hidden" name="bidx" value="<%=bavo.getBidx()%>">
	<div class="mb-1"><%=bavo.getBcata() %></div>
	
	<input class="form-control form-control-lg fs-1 fw-bold mb-3" type="text" name="title" value="<%=bavo.getBtitle() %>" aria-label=".form-control-lg example">

	<div class="mb-5 pb-2 border-bottom border-3 ">
		<span class="fw-bold me-2">등록일</span>
		<span class=" me-3"><%=bavo.getBWrieday2() %></span>
		<span class="fw-bold me-2">작성자</span>
		<span class=" me-3"><%=bavo.getBname() %></span>
		<span class="fw-bold me-2">조회수</span>
		<span class=" me-3"><%=bavo.getBcount() %></span>
	</div>
	
	<div>
		<textarea class="form-control" id="floatingTextarea2" name="content" style="height: 400px" ><%=bavo.getBcontents() %></textarea>
		<div id="preview"></div>
		<div>
			<div>
				<%if(bavo.getBfile() != null){%>
					<img style="max-width:90%; margin:5px auto;" src="../Advice_img/<%=bavo.getBfile() %>">
				<%}; %>
			</div>
			<div class="mb-3">
				<label for="formFile" class="form-label">첨부파일</label>
				<input class="form-control" type="file" id="formFile" name="file"  onchange="setImageFn(this)" multiple>
			</div>
		</div>
	</div>
	<div class="text-end">
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="backboardFn()">뒤로</button>
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="submitFn()">완료</button>
	</div>
</form>


<!-- 취소 모달 -->
<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="myBoardListFn()">확인</button>
      </div>
    </div>
  </div>
</div>


<!-- submut 모달 -->
<div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
      </div>
      <div class="modal-body">
         <span id="textbox2"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="submitmodalFn()">확인</button>
      </div>
    </div>
  </div>
</div>


</div>

<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>