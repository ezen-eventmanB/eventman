<%@page import="vo.EvMemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*" %>    
	<%@ page import ="service.*" %> 
    
<%  ArrayList<EvMemberVo> alist =  (ArrayList<EvMemberVo>)request.getAttribute("alist"); %>        

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<table border=1 style="text-align:left;width:500px;height:80px">
			<tr>
			<td>번호</td>
			<td>이름</td>
			<td>아이디</td>
			<td>등록일</td>
			</tr>
			<%for(EvMemberVo ev : alist) { %>
			<tr>
			<td><%=ev.getMidx()%></td>
			<td><%=ev.getMemberName() %></td>
			<td><%=ev.getMemberId() %></td>
			</tr>
			<% } %>
		</table>
		
</body>
</html>