<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 자바스크립트 만들어주기위해 -->
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	/* 로그인이 된 유저가  또다시 로그인 페이지와, 회원가입 페이지에 접속하지 못하도록 함 */

	int userID = 0;

	if (session.getAttribute("userID") != null) {
		userID = ((Integer) (session.getAttribute("userID"))).intValue();

	}

	if (userID != 0) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('이미 로그인이 되어 있습니다.')");

		script.println("location.href = 'main.jsp'");

		script.println("</script>");

	}

	UserDAO userDAO = new UserDAO();

	int result = userDAO.login(user.getUserID(), user.getUserPassword());

	/* 로그인 함수에 넣어줌 */

	if (result == 1) {

		session.setAttribute("userID", user.getUserID()); /* 로그인에 성공한 사용자에게 세션을 부여  */

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("location.href = 'main.jsp'");

		script.println("</script>");

	} /* result값이 1이면 메인페이지로 넘겨줌 */

	else if (result == 0) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('비밀번호가 일치하지 않습니다.')");

		script.println("history.back()"); /* 이전페이지로 보내기 */

		script.println("</script>");

	} /* 비밀번호가 틀려서 이전페이지로 */

	else if (result == -1) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('ID가 존재하지 않습니다.')");

		script.println("history.back()");

		script.println("</script>");

	} /* 아이디가 틀리므로 이전페이지로 */

	else if (result == -2) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('데이터 오류가 발생했습니다.')");

		script.println("history.back()");

		script.println("</script>");

	}
	%>
</body>
</html>