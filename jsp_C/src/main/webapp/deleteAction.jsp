<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="userSubject.userSubDAO"%>
<jsp:useBean id="userSub" class="userSubject.userSub" scope="page" />
<jsp:setProperty name="userSub" property="*" />
<%@ page import="java.io.PrintWriter"%>
<!-- 자바스크립트 만들어주기위해 -->




<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	int userID = 0;
	if (session.getAttribute("userID") != null) {
		userID = ((Integer) (session.getAttribute("userID"))).intValue();
	}

	if (userID == 0) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인이 필요한페이지 입니다.')");

		script.println("location.href = 'login.jsp'"); /* 이전페이지로 보내기 */

		script.println("</script>");

	} else {

		
		userSubDAO userSubDAO = new userSubDAO();

		int result = userSubDAO.delSub(userID);

		if (result == -1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('실패했습니다.')");

			script.println("history.back()");

			script.println("</script>");

		} else {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('수강목록이 초기화 되었습니다.')");

			script.println("location.href = 'enrolment.jsp'");
			
			script.println("</script>");

		}

	}
	%>

</body>
</html>