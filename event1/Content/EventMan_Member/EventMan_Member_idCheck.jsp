<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String lID = request.getParameter("lID");
		MemberServiceImpl mDao = new MemberServiceImpl();
		boolean result = mDao.confirmId(lID);
		System.out.println("result는" +result);
		if(result) {
	%>
	<script>
		alert("result는" + result);
	</script>
		<center>
		<br /><br />
		<h4>이미 사용중인 ID 입니다.</h4>
		</center>
	<% } else { %>
		<center>
		<br /><br />
		<h4>입력하신 <%=lID %>는 사용하실 수 있는 ID입니다.</h4>
		</center>
	<% } %>
</body>
</html>