<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
    <title>백석대학교 수강신청 로그아웃</title>
 
</head>
 
<body>
<!-- 로그아웃  -->
    <%
        session.invalidate();
    %>
    <script>
        location.href = 'login.jsp';  //로그아웃시에 login.jsp로 이동하게 해줌
    </script>
</body>
 
</html>