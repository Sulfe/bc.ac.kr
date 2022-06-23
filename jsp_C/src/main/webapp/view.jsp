<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.board"%>
<%@ page import="board.boardDAO"%>
<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/view.css">
<link rel="stylesheet" href="">
</head>
<body>
	<%
	int userID = 0; /* 로그인 되어있지 않은 사람은 userID에 0값을 받음*/

	
	if (session.getAttribute("userID") != null) {

		userID = ((Integer) (session.getAttribute("userID"))).intValue();
		/* 로그인 된 사람은 userID 에 본인 아이디 값을 받음 */

	} else {
		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인이 필요한 페이지 입니다.')");

		script.println("location.href = 'login.jsp'");

		script.println("</script>");
		
	}

	int bdNum = 0;
	if (request.getParameter("bdNum") != null) {
		bdNum = Integer.parseInt(request.getParameter("bdNum"));
	}
	if (bdNum == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'Bu_Enrolment_board_language_korean_main1.jsp'");
		script.println("</script>");
	}
	board board = new boardDAO().getContent(bdNum);
	%>
	<a style="padding:3px;border:1px solid #000;background-color: aliceblue; position: absolute; text-decoration: none; color: black; top:130px; left:555px" href="javascript:history.back();">뒤로가기</a>
	
	<div class="box1">
		<p class="borad_grade"><%=board.getBdTitle()%></p>
		<hr class="board_hr">
		<table border="1">
			<th style height="50px" width="200px">수강학기</th>
			<th style height="50px" width="200px"><%=board.getBdTerm()%></th>
			<th style height="50px" width="200px">과제</th>
			<th style height="50px" width="200px"><%=board.getBdTask()%></th>
			<tr>
				<th style height="50px" width="200px">조모임</th>
				<th style height="50px" width="200px"><%=board.getBdMeeting()%></th>
				<th style height="50px" width="200px">수업진행방식</th>
				<th style height="50px" width="200px"><%=board.getBdWay()%></th>
			</tr>
			<tr>
				<th style height="50px" width="200px">시험횟수</th>
				<th style height="50px" width="200px"><%=board.getBdTest()%></th>
				<th style height="50px" width="200px">학점비율</th>
				<th style height="50px" width="200px"><%=board.getBdCredit()%></th>
			</tr>
			<tr>
				<th style height="50px" width="200px">총점</th>
				<th style height="50px" width="200px"><%=board.getBdScore()%></th>
				<th style height="50px" width="200px" colspan="2"></th>
			</tr>
			<tr>
				<th style height="300px" width="200px" rowspan="3">내용</th>
				<th style height="300px" width="200px" colspan="3"><%=board.getBdContent()%></th>
			</tr>

		</table>
	</div>
</body>
</html>