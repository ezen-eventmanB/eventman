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
   out.println("세션에 담긴 아이디는?");
   out.println(member_id);

   out.println(midx); 
   
   %>    
   
<!doctype html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
   
<title>EVENT MAN!</title>
      <!-- top nav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/topnav.css">
   <!-- footer CSS -->
   <link rel="stylesheet" type="text/css" href="../css/footer.css">
   <!-- subnav CSS -->
   <link rel="stylesheet" type="text/css" href="../css/subnav.css">
   <!-- 메인페이지 행사리뷰 CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mainpagereview.css">
   <!-- 메인페이지 하단 게시판 CSS -->
   <link rel="stylesheet" type="text/css" href="../css/mainpageboard.css">
   
<style>
   /* 견적 신청 부분*/
      .joinroom{
      width:900px;
      height:800px;
      margin:0px auto;
      margin-top:50px;
      border:1px solid black;
   }
   

   .hQBClp {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    font-size: 1.2rem;
    font-weight: 700;
    padding: 0px 1rem;
    margin-top: auto;
    color: rgb(34, 140, 182);

}

   
/* 부제목 글꼴 굵게 , 크기 변경 */
   .eXGQeW {
    position: relative;
    box-sizing: border-box;
    flex: 1 1 auto;
    padding: 1rem 1rem 0px;
    font-size: 1.2rem;
    font-weight: 700;
    color: rgb(47, 51, 56);
}
   
   .jKoelK {
    display: block;
    outline: none;
    box-sizing: border-box;
    border: 0px;
    padding: 0.85rem;
    border-radius: 3px;
    transition: all 0.3s ease 0s;
    width: 40%;
    max-width: 40%;
    box-shadow: rgb(234 234 235) 0px 0px 4px;
    color: rgb(47, 51, 56);
}

    .box {
        float: left;
        width: 200px;
        height: 100px;
        margin: 1em;
      }
            
     #catagoryimg{
         width:100px;
      }
     .CostCata{
         width:550px;
         margin-left:65px;
         display: inline-block;
      }
      catatitle{
         width:100px;
         text-align:center;
      }
     #cataSelect{
         display: inline-block;
      }
         .cataimg{
      width:100%;
      }
      td{
         width:50px;
      }
        .cataselect{
         display: inline-block;
         margin-left:180px;
      }
      .form-select{
         width:50px;
         
      }
      
</style>
</head>
<body>
<!-- 상단 네비 부분 -->
   <div class="container">
      <nav class="navbar navbar-expand-xxl navbar-light " id="topnav">
      
         <a class="navbar-brand" href="../EventMan_Main/EventMan_Main.jsp">
              <img src="../rogo1.png" alt="" class="d-inline-block align-text-top" id="toprogoimg">
          </a>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
          <div class="collapse navbar-collapse w-50" id="navbarNav">
          
               <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="navbar-nav">
                 <li class="nav-item px-5">
                      <a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do">견적신청</a>
                 </li>
                 <li class="nav-item px-5">
                      <a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do">행사리뷰</a>
                 </li>
                   <li class="nav-item px-5">
                      <a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do">회사소개</a>
                   </li>
                   <li class="nav-item px-5">
                      <a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do">게시판</a>
                   </li>
                </ul>
             
   
               <!--로그인 전 상단 화면  -->   
                  <%
                  if(midx == 0 && gidx ==0){
                  %>
                  
                   <ul class="navbar-nav" id="Memberbox" >   
                      <li class="nav-item">
                         <a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Join.do">회원가입</a>
                      </li>
                      <li class="nav-item"> 
                         <a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do">로그인</a>
                      </li>                                                   
                  </ul>
                  
               <!--로그인 후 상단 화면  -->
                  <%
                     }else if(midx > 0){
                  %>   
                   <ul class="navbar-nav" id="Memberbox" >   
                      <li class="nav-item">
                         <a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do?midx=<%=midx%>">My page</a>
                      </li>
                      <li class="nav-item"> 
                         <a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Modify.do">계정 설정</a>
                      </li>
                      <li class="nav-item"> 
                         <a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
                      </li>                                                         
                  </ul>
                     <%
                     }else if(gidx > 0){
                     %>
                     <ul class="navbar-nav" id="Memberbox" >   
                      <li class="nav-item">
                         <a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do?midx=<%=gidx%>">Master page</a>
                      </li>
                      <li class="nav-item"> 
                         <a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
                      </li>                                                         
                  </ul>
                     <%
                     }
                     %>
                     
                   
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
      견적 신청
   </div>

   <%
      if(member_id == null){
      %>
      <div class="container text-center">
         <div class="container w-50">
         <br/>   
         <img src="../padlock.png" class="lock w-50 mb-3" >
         <br/>
         <header class="fs-3">로그인이 필요한 서비스입니다.</header>
         <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do'">Login</button>
         </div>
      </div>
      <!-- 로그인을 한 후에 나타나는 화면 -->
      <%
           }else{
      %>   




<!-- 행사 기본정보 -->
   <div class="container">
      <div class="sc-qPIWj eXGQeW">행사 기본정보
      <div step="1" class="sc-pIUfD hQBClp">STEP
      <div step="2" class="sc-pIUfD hQBClp">1</div>
      </div>
      </div>
      <hr/>   
   </div>
   
   <form name="frm">
   
   <!-- 행사 명 -->
        <div class="container">
        <div class="sc-qPIWj eXGQeW">행사 명</div>
         <input type="text" class="form-control" placeholder="행사 명을 입력해주세요" aria-label="cost name">
      <hr/>
       </div>

   
   
   <!-- 행사 일정 -->   
      <div class="container">
           <div class="sc-qPIWj eXGQeW">행사 일정</div>
            <input type = "text" placeholder = "행사 시작일" readonly class="calendar"> <input type = "text" placeholder = "행사 종료일" readonly class="calendar">  
         <div class="icon">
         <span class="calendar">
         </span>
         <hr/>
      </div>



<!-- 행사 카테고리 선택 -->
   <div class="sc-qPIWj eXGQeW">행사 카테고리</div>
   
   
         <!-- 기업 행사 -->
   <div class="cataselect">          

      <table  style="text-align:left;width:400px;height:150px">
         <tr>
         <td rowspan="4"><img src="../enterprise.png" class="cataimg"></td>
         <tr>   
            <td>
                      <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                         <label class="form-check-label" for="inlineCheckbox1">워크숍</label>
                </td>
                <td>
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                         <label class="form-check-label" for="inlineCheckbox2">판촉행사</label>
                </td>
            </tr> 
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">체육대회</label>
                </td>
                <td>       
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">오픈행사</label>
                </td>
            </tr>
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">레크레이션</label>
                </td>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">기타</label>
                </td>
            </tr>
      </table>
      </div>
         <div class="cataselect">      
            <!-- 공연 -->
            <table  style="text-align:left;width:400px;height:150px">
         <tr>
         <td rowspan="4"><img src="../music.png" class="cataimg" ></td>
         <tr>   
            <td>
                      <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                         <label class="form-check-label" for="inlineCheckbox1">지역 페스티벌</label>
                </td>
                <td>
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                         <label class="form-check-label" for="inlineCheckbox2">댄스</label>
                </td>
            </tr> 
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">마술</label>
                </td>
                <td>       
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">클래식</label>
                </td>
            </tr>
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">장기자랑</label>
                </td>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">기타</label>
                </td>
            </tr>
         </table>
         </div>
      <div class="cataselect">
               <!-- 대학 -->
      <table  style="text-align:left;width:400px;height:150px">
         <tr>
         <td rowspan="4"><img src="../school.png" class="cataimg"></td>
         <tr>   
            <td>
                      <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                         <label class="form-check-label" for="inlineCheckbox1">축제</label>
                </td>
                <td>
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                         <label class="form-check-label" for="inlineCheckbox2">단과대학 행사</label>
                </td>
            </tr> 
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">체육대회</label>
                </td>
                <td>       
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">개강 행사</label>
                </td>
            </tr>
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">종강 이벤트</label>
                </td>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">기타</label>
                </td>
            </tr>
      </table>
      </div>
      <div class="cataselect">
         <!-- 기타-->
      <table  style="text-align:left;width:400px;height:150px">
         <tr>
         <td rowspan="4"><img src="../confetti.png" class="cataimg"></td>
         <tr>   
                 <td>
                      <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                         <label class="form-check-label" for="inlineCheckbox1">결혼식</label>
                </td>
                <td>
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                         <label class="form-check-label" for="inlineCheckbox2">약혼식</label>
                </td>
            </tr> 
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">돌잔치</label>
                </td>
                <td>       
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">칠순잔치</label>
                </td>
            </tr>
            <tr>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">프로포즈</label>
                </td>
                <td>
                          <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                         <label class="form-check-label" for="inlineCheckbox3">기타</label>
                </td>
            </tr>
            
      </table>
      </div>
         <hr/>
<!-- 행사 설명 -->   
        <div class="sc-qPIWj eXGQeW">행사 구성</div>
         
         <div class="container" id="pakage">
         <table>
         <tr>   
                 <select class="form-select" aria-label="Default select example" name="joinPeople1">
                 <option selected>참여대상</option>
                 <option value="전체">전체</option>
                 <option value="어린이이">어린이</option>
                 <option value="학생">학생</option>
                 <option value="청년">청년</option>
                 <option value="여성">여성</option>
                 <option value="직장인">직장인</option>
                 <option value="장애인">장애인</option>
                 <option value="노인">노인</option>
                 <option value="기업·단체">기업·단체</option>
                 <option value="참여대상 기타">기타</option>
               	 </select>
                         <select class="form-select" aria-label="Default select example" name="joinMethod">
                        <option selected>방식</option>
                        <option value="오프라인">오프라인</option>
                        <option value="온라인">온라인</option>
                        <option value="온ㆍ오프라인">온ㆍ오프라인</option>
                        <option value="방식 기타">기타</option>
                     </select>
            </tr> 
            <tr></tr>
         <tr>
            <td>
                <select class="form-select" aria-label="Default select example" name="joinMoney">
                  <option selected>예산</option>
                  <option value="1000만원 미만">1,000만원 미만</option>
                  <option value="1000~5000">1,000만원 이상 ~ 5,000만원 미만</option>
                  <option value="5000~1억">5,000만원 ~ 1억 미만</option>
                  <option value="1억 이상">1억 이상 ~ 3억 미만</option>
                  <option value="3억 이상">3억 이상</option>
                  <option value="예산 기타">기타</option>
                 </select>
            </td>
            <td>
               <select class="form-select" aria-label="Default select example" name="joinPeople2">
                  <option selected>참여인원</option>
                  <option value="50명 미만">50명 미만</option>
                  <option value="50~100명미만">50명~100명 미만</option>
                  <option value="100~500명미만">100~500명 미만</option>
                  <option value="500~1000명 미만">500~1000명 미만</option>
                  <option value="1000명이상">1000명 이상</option>
                  <option value="인원 기타">기타</option>
                  </select>
            </td>
         </tr>
         </table>
         
      </div>
      <br>
      <hr/>
<!-- 행사 설명 -->   
        <div class="sc-qPIWj eXGQeW">행사 설명</div>
                <div class="form-floating">
              <textarea class="form-control" id="floatingTextarea2" style="height: 400px"></textarea>
              <label for="floatingTextarea2">진행하고자 하는 행사에 대해 적어주세요.</label>
            </div>
         </div>
   
   
<!-- 참고자료  -->
   <div class="container">
   <div class="sc-qPIWj eXGQeW">참고 자료</div>
   <div class="form-group">
      <input class="form-control" type="file" id="formFile">
    <hr/>
    </div>
             <div>
                 <button type="button" class="btn btn-outline-secondary">제출하기</button>
             </div>
       </div>
   </form>


     <%
         }
         %>



<!-- 메인 푸터 -->
   <div class="footer">
   </div>
      <div class="container">
          <div class="row justify-content-md-center">
            <div class="col-md-auto">
               <img src="../rogo1.png" alt="" width="200" class="d-inline-block align-text-center">
            </div>
            <div class="col-md-auto">
               <small class="text-muted">
                  전화번호 063-222-2222<br>
                  EVENTMAN | 전주시 덕진구 효자동 | 대표. 000<br>
                  ACC. 계좌번호 (예금주 :홍길동) | 사업자 번호. 000-000-0000<br>
               </small>
            </div>
         </div>
      </div>

</div>






<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>