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
<!doctype html>
<html>
<head>
<meta charset="utf-8">

 <!-- Bootstrap에 필요한 CSS파일 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<title>EVENT MAN!</title>

	 <!-- topmenue CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">
   <!-- subnav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/subnav.css">
   <!-- 메인페이지 행사리뷰 CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mainpagereview.css">
   <!-- 메인페이지 하단 게시판 CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mainpageboard.css">
   

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>   
<script language = "javascript">

function check(){

var fm = document.frm;   
var costCataChk = $("input:checkbox[name='cCata']").is(":checked");

   if (fm.cName.value =="")   {
      $("#textbox").html("행사명을 입력해주세요.");
      $("#modal").modal("show")
      return;
   }else if (fm.cSdate.value ==""){
      $("#textbox").html("행사 시작일을 선택해주세요.");
      $("#modal").modal("show")
      return;
   }else if (fm.cEdate.value ==""){
      $("#textbox").html("행사 종료일을 선택해주세요.");
      $("#modal").modal("show")
      return;
   }else if(!costCataChk){
      $("#textbox").html("카테고리를 한개 이상 선택해주세요.");
      $("#modal").modal("show")
      return;  
   }else if (fm.cLoca.value ==""){
      $("#textbox").html("행사 지역을 입력 해주세요.");
      $("#modal").modal("show")
      return;
   }else if (fm.cTarget.value == "catamenu"){
      $("#textbox").html("참여 대상을 선택해주세요.");
      $("#modal").modal("show")
      return;  
   }else if (fm.cMethod.value == "catamenu"){
      $("#textbox").html("방식을 선택해주세요.");
      $("#modal").modal("show")
      return; 
   }else if (fm.cPrice.value == "catamenu"){
      $("#textbox").html("예산을 선택해주세요.");
      $("#modal").modal("show")
      return; 
   }else if (fm.cPeople.value == "catamenu"){
      $("#textbox").html("인원을 선택해주세요.");
      $("#modal").modal("show")
      return; 
   }else if($(".catanon").value =="catamenu"){
      $("#textbox").html("카테고리를 선택해주세요.");
      $("#modal").modal("show")
      return;
   }else if (document.frm.cText.value ==""){
      $("#textbox").html("행사 설명을 적어주세요.");
      $("#modal").modal("show")
      return;
   }else{
      $("#textbox1").html("견적신청을 완료합니다.");
      $("#modal1").modal("show")
   } 
}
             
function moveFn(){
   
var fm = document.frm; 
var costCataChk = $("input:checkbox[name='cCata']").is(":checked");
     
   if (fm.cName.value =="")   {
        fm.cName.focus();
        return;
     }else if (fm.cSdate.value ==""){
        fm.cSdate.focus();
        return;
     }else if (fm.cEdate.value ==""){
         fm.cEdate.focus();
         return;
     }else if(!costCataChk){
        location.href="#cataA";
        return;  
     }else if (fm.cLoca.value ==""){
          fm.cLoca.focus();
          return;
     }else if (fm.cTarget.value == "catamenu"){
          fm.cTarget.focus();
          return;
     }else if (fm.cMethod.value == "catamenu"){
         fm.cMethod.focus();
         return;
     }else if (fm.cPrice.value == "catamenu"){
         fm.cPrice.focus();
         return;
     }else if (fm.cPeople.value == "catamenu"){
         fm.cPeople.focus();
         return;
     }else if (document.frm.cText.value ==""){
          document.frm.cText.focus();
          return;
     }
}
 

function submitFn(){

      document.frm.action ="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost_Submit_Action.do";
      document.frm.enctype="multipart/form-data";
      document.frm.method="POST";
      document.frm.submit();

}


//사진 미리보기
$(document).ready(function(e){

	$("input[type='file']").change(function(e){
		
		//div 내용 비워주기
		$('#preview').empty();
		
		var files = e.target.files;
		var arr =Array.prototype.slice.call(files);
		
		//업로드 가능 파일인지 체크
		for(var i=0;i<files.length;i++){
			if(!/\.(gif|jpg|jpeg|png)$/i.test(files[i].name)){
				alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + files[i].name);
				return false;
			};
		};
		preview(arr);
	});//file change

  
  //실제 화면에 뿌려주는 부분
	function preview(arr){

		var str = '';
		
		var arrlength = arr.length;
		
		//사진 한장 업로드
		if(arrlength == 1){
			var reader = new FileReader();
			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러	  
				str += '<img src="'+e.target.result+'" style="max-width:90%; object-fit: cover;" class="d-block w-100 mx-auto mt-2" title="'+arr[0].name+'" alt="">';
				$('#preview').html(str);
			};
			reader.readAsDataURL(arr[0]);
		};	
	};
});
</script>
</head>
<body>


<!-- 상단 네비 부분 -->
<div class="container">
	<nav class="navbar navbar-expand-xxl navbar-light" id="topnav">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/EventMan_Main/EventMan_Main.do">
				<img src="../rogo1.png" alt="" class="d-inline-block align-text-top" id="toprogoimg">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>	

			<div class="collapse navbar-collapse w-50" id="navbarNav">
	
				<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="navbar-nav">
					<li class="nav-item px-5 mx-auto"><a class="nav-link fw-bolder text-dark fs-5" href="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do">견적신청</a>
					</li>
					<li class="nav-item px-5 mx-auto"><a class="nav-link fw-bolder text-dark fs-5" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do">행사리뷰</a>
					</li>
					<li class="nav-item px-5 mx-auto"><a 
						class="nav-link fw-bolder text-dark fs-5"
						href="<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do">회사소개</a>
					</li>
					<li class="nav-item px-5 mx-auto"><a
						class="nav-link fw-bolder text-dark  fs-5"
						href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do">게시판</a>
					</li>
				</ul>
	
	
				<!--로그인 전 상단 화면  -->
				<%
				if (midx == 0 && gidx == 0) {
				%>
	
				<ul class="navbar-nav" id="Memberbox">
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Join.do">회원가입</a>
					</li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do">로그인</a>
					</li>
				</ul>
	
				<!--맴버 로그인 후 상단 화면  -->
				<%
				} else if (midx > 0) {
				%>
				<ul class="navbar-nav" id="Memberbox">
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do?midx=<%=midx%>">My
							page</a></li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Modify.do">계정
							설정</a></li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
					</li>
				</ul>
				
				<!-- 마스터 로그인 후 상단 화면 -->
				<%
				} else if (gidx > 0) {
				%>
				<ul class="navbar-nav" id="Memberbox">
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_Mainpage.do">Master
							page</a></li>
					<li class="nav-item mx-auto"><a class="nav-link fw-bold"
						href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
					</li>
				</ul>
				<%
				}
				%>
			</div>
		</div>
	</nav>
</div>
      
      

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
   견적신청
</div>

        
        
        
        
        
        
        
<!-- 행사 견적 신청 로그인시 확인  -->   
    
<%
if(member_id == null){
%>
   <!-- 로그인이 안되있다면 -->
   <div class="container text-center">
      <div class="container w-50">
         <br/>   
         <img src="../padlock.png" class="lock w-50 mb-3" >
         <br/>
         <header class="fs-3">로그인이 필요한 서비스입니다.</header>
         <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do'">Login</button>
      </div>
   </div>

<%
 }else{
%>
<!-- 로그인을 한 후에 나타나는 화면 -->

<!-- 행사 기본정보 -->
<div class="container">
   <div class="fs-2 fw-bold mt-5">행사 견적신청</div>
</div>
   

<form name="frm">

   <!-- input HIDDEN -->
   <input type="hidden" name="midx" value="<%=session.getAttribute("midx")%>">
   
   <!-- 행사 명 -->
   <div class="container mt-3">
	<div class="shadow p-3 mt-5 bg-body rounded">
      <div class="fs-4 fw-bold ">행사 명</div>
      <input type="text" name="cName" class="form-control mt-3" tabindex=1 aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1 placeholder="행사 명을 입력해주세요">
     </div>
   </div>
   
   <!-- 행사 일정 -->   
   <div class="container">
   	<div class="shadow p-3 mt-2 mb-2 bg-body rounded">
      <div class="fs-4 fw-bold">행사 일정</div>
      <div class="row mt-3">
         <div class="col">
            <input type="date" id="cSdate" name="cSdate" tabindex=2 class="form-control CostDate">
         </div>
         <div class="col-sm-auto text-center">
            ~
         </div>
         <div class="col">
            <input type="date" id="cSdate2" name="cEdate" tabindex=3 class="form-control CostDate">
         </div>
      </div>
     </div>
   </div>

   <!-- 행사 카테고리 선택 -->
   <div class="container">
   <div class="shadow p-3 mt-2 mb-2 bg-body rounded">
   <div class="container fs-4 fw-bold">행사 카테고리</div>
   
      <!-- 카테고리 -->      
      <div class="container mt-3 rounded-3 border border-1">
      			
			<div class="container">
				<div class="fs-5 fw-bold mb-1" id="cataA">기업행사</div>
					<div class="row row-cols-2 row-cols-sm-3 row-cols-lg-6">
						<div class="col">
							<input class="form-check-input" type="checkbox" name="cCata" value="기업 워크숍" tabindex=4>
							<label class="form-check-label" for="inlineCheckbox1">워크숍</label>
						</div>
                  <div class="col">
                         <input class="form-check-input" type="checkbox" name="cCata" value="기업 판촉행사" tabindex=5>
                     <label class="form-check-label" for="inlineCheckbox2">판촉행사</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기업 체육대회" tabindex=6>
                     <label class="form-check-label" for="inlineCheckbox3">체육대회</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기업 오픈행사" tabindex=7>
                     <label class="form-check-label" for="inlineCheckbox4">오픈행사</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기업 레크레이션" tabindex=8>
                     <label class="form-check-label" for="inlineCheckbox5">레크레이션</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기업 기타" tabindex=9>
                     <label class="form-check-label" for="inlineCheckbox6">기타</label>
                  </div>
               </div>
			</div>
			
			<div class="container">
               <div class="fs-5 fw-bold mb-1 mt-3">공연</div>
               <div class="row row-cols-2 row-cols-sm-3 row-cols-lg-6">
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="공연 지역 페스티벌" tabindex=10>
                     <label class="form-check-label" for="inlineCheckbox1">페스티벌</label>
                  </div>
                  <div class="col">
                         <input class="form-check-input" type="checkbox" name="cCata" value="공연 댄스" tabindex=11>
                     <label class="form-check-label" for="inlineCheckbox2">댄스</label>
                  </div>
                  <div class="col">
                         <input class="form-check-input" type="checkbox" name="cCata" value="공연  마술" tabindex=12>
                     <label class="form-check-label" for="inlineCheckbox3">마술</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="공연 클래식" tabindex=13>
                         <label class="form-check-label" for="inlineCheckbox4">클래식</label>
                      </div>
                  <div class="col">
                         <input class="form-check-input" type="checkbox" name="cCata" value="공연 장기자랑" tabindex=14>
                     <label class="form-check-label" for="inlineCheckbox5">장기자랑</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="공연 기타" tabindex=15>
                     <label class="form-check-label" for="inlineCheckbox6">기타</label>
                  </div>
               </div>
			</div>
         
			<div class="container">
               <div class="fs-5 fw-bold mb-1 mt-3">대학</div>
               <div class="row row-cols-2 row-cols-sm-3 row-cols-lg-6">
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="대학 축제" tabindex=16>
                     <label class="form-check-label" for="inlineCheckbox1">축제</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="대학 섭외" tabindex=17>
                     <label class="form-check-label" for="inlineCheckbox2">연예인 섭외</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="대학 체육대회" tabindex=18>
                     <label class="form-check-label" for="inlineCheckbox3">체육대회</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="대학 개강행사" tabindex=19>
                     <label class="form-check-label" for="inlineCheckbox4">개강 행사</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata"  value="대학 종강이벤트" tabindex=20>
                     <label class="form-check-label" for="inlineCheckbox5">종강 이벤트</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="대학 기타" tabindex=21>
                     <label class="form-check-label" for="inlineCheckbox6">기타</label>
                  </div>
				</div>
			</div>	
				
				
			<div class="container">
               <div class="fs-5 fw-bold mt-3">기타</div>
               <div class="row row-cols-2 row-cols-sm-3 row-cols-lg-6 mb-2">  
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기타 결혼식" tabindex=22>
                     <label class="form-check-label" for="inlineCheckbox1">결혼식</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기타 약혼식" tabindex=23>
                     <label class="form-check-label" for="inlineCheckbox2">약혼식</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기타 돌잔치" tabindex=24>
                     <label class="form-check-label" for="inlineCheckbox3">돌잔치</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기타 칠순잔치" tabindex=25>
                     <label class="form-check-label" for="inlineCheckbox4">칠순잔치</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기타 프로포즈" tabindex=26>
                     <label class="form-check-label" for="inlineCheckbox5">프로포즈</label>
                  </div>
                  <div class="col">
                     <input class="form-check-input" type="checkbox" name="cCata" value="기타 기타" tabindex=27>
                     <label class="form-check-label" for="inlineCheckbox6">기타</label>
                  </div>
               </div>
         </div>
	</div>
	</div>
	</div>

      
   <!-- 행사 지역  -->
   <div class="container">
   	<div class="shadow p-3 mt-2 mb-2 bg-body rounded">
      <div class="fs-4 fw-bold">행사 지역</div>
    
		<div class="input-group mt-3">
			<input type="text" class="form-control" id="sample5_address"  tabindex=28 placeholder="주소" name="cLoca" class="form-control mt-2" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" tabindex=1  tabindex=28>
			<input class="btn btn-outline-secondary" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" tabindex=29><br>
		</div>	
	</div>
		
<!-- 다음 지도 -->
  

<div id="map" style="width:300px;height:300px;margin:10px auto;display:none"></div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d13687712724db7a58c691808cbdaa56&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
	</div>	
   <!-- 행사 설명 -->   
   <div class="container">
   <div class="shadow p-3 mt-2 mb-2 bg-body rounded">
      <div class="fs-4 fw-bold">행사 구성</div>
      <div class="row">
         <div class="col">
            <select class="form-select mt-2" aria-label="Default select example" name="cTarget" class="catanon" tabindex=30>
               <option selected value="catamenu" name="joinTarget" disabled>참여대상</option>
               <option value="전체">전체</option>
               <option value="어린이">어린이</option>
               <option value="학생">학생</option>
               <option value="청년">청년</option>
               <option value="여성">여성</option>
               <option value="직장인">직장인</option>
               <option value="장애인">장애인</option>
               <option value="노인">노인</option>
               <option value="기업·단체">기업·단체</option>
               <option value="참여대상 기타">기타</option>
            </select>
         </div>
         
         <div class="col">
            <select class="form-select mt-2" aria-label="Default select example" name="cMethod" class="catanon" tabindex=31>
               <option selected value="catamenu" disabled>방식</option>
               <option value="오프라인">오프라인</option>
               <option value="온라인">온라인</option>
               <option value="온ㆍ오프라인">온ㆍ오프라인</option>
               <option value="방식 기타">기타</option>
            </select>
         </div>
      </div>
      <div class="row">
         <div class="col">
            <select class="form-select mt-2" aria-label="Default select example" name="cPrice" class="catanon" tabindex=32>
               <option selected value="catamenu" disabled>예산</option>
               <option value="1000만원 미만">1,000만원 미만</option>
               <option value="1000~5000만원 미만">1,000만원 이상 ~ 5,000만원 미만</option>
               <option value="5000~1억 미만">5,000만원 ~ 1억 미만</option>
               <option value="1억 이상~3억 미만">1억 이상 ~ 3억 미만</option>
               <option value="3억 이상">3억 이상</option>
               <option value="예산 기타">기타</option>
            </select>
         </div>
         <div class="col">
            <select class="form-select mt-2" aria-label="Default select example" name="cPeople" class="catanon" tabindex=33>
               <option selected value="catamenu" disabled>참여인원</option>
               <option value="50명 미만">50명 미만</option>
               <option value="50~100명미만">50명~100명 미만</option>
               <option value="100~500명미만">100~500명 미만</option>
               <option value="500~1000명 미만">500~1000명 미만</option>
               <option value="1000명이상">1000명 이상</option>
               <option value="인원 기타">기타</option>
            </select>
         </div>
   </div>
   </div>

   <!-- 행사 설명 -->
   <div class="container p-0">
   <div class="shadow p-3 mt-2 mb-2 bg-body rounded">   
   <div class="fs-4 fw-bold">행사 설명</div>
      <div class="form-floating">
         <textarea class="form-control" id="floatingTextarea2" style="height: 400px" name="cText" tabindex=34></textarea>
         <label for="floatingTextarea2">진행하고자 하는 행사에 대해 적어주세요.</label>
      </div>
   </div>
   </div>
   </div>
   

   <!-- 참고자료  -->
   <div class="container">
   <div class="shadow p-3 mt-2 mb-2 bg-body rounded">  
      <div class="fs-4 fw-bold mt-5">참고 자료</div>
      <div class="form-group">
      	 <div id="preview" class="text-center"></div>
         <input class="form-control mt-2" type="file" id="formFile" name="file" tabindex=35>
      </div>
   	
   </div>
      <div class="d-grid gap-2">
         <button type="button" class="btn btn-outline-secondary mt-4 shadow" style="border-color: rgb(0 0 0 / 0%);"onclick="check();" tabindex=36>제출하기</button>
         <button type="button" class="btn btn-outline-secondary mt-1 shadow" style="border-color: rgb(0 0 0 / 0%);onclick="history.back()">뒤로가기</button>
      </div>
   </div>
</form>


<%
}
%>





<!-- 입력요구모달 -->
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
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="moveFn()">확인</button>
         </div>
      </div>
   </div>
</div>


<!-- submit모달 -->
<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel"></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
         </div>
         <div class="modal-body">
            <span id="textbox1"></span>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="submitFn()">확인</button>
         </div>
      </div>
   </div>
</div>





<!-- 메인 푸터 -->
<div class="footer mt-5"></div>
<div class="container mt-5 mb-5">
	<div class="row justify-content-md-center mt-5">
		<div class="col-md-auto">
			<img src="../rogo1.png" alt="" width="200"
				class="d-inline-block align-text-center">
		</div>
		<div class="col-md-auto">
			<small class="text-muted"> 전화번호 063-222-2222<br>
				EVENTMAN | 전주시 덕진구 효자동 | 대표. 000<br> ACC. 계좌번호 (예금주 :홍길동) |
				사업자 번호. 000-000-0000<br>
			</small>
		</div>
	</div>
</div>

<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>