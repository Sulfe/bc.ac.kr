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

		script.println("location.href = 'login.jsp'");

		script.println("</script>");

	} else {

		String subject[] = request.getParameterValues("subject");

		userSub.setSub(subject);

		userSubDAO userSubDAO = new userSubDAO();

		int result = userSubDAO.writeSub(userID, userSub.getSub());

		if (result == -1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('신청에 실패했습니다.')");

			script.println("history.back()");

			script.println("</script>");

		} else {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('신청에 성공했습니다.')");

			script.println("location.href = 'enrolment.jsp'");

			script.println("</script>");

		}
		
		
		
		
		
		
		

	}
	%>

</body>
</html>