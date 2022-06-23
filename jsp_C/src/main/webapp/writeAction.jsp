<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.boardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 자바스크립트 만들어주기위해 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.board" scope="page" />
<jsp:setProperty name="board" property="bdTitle" />
<jsp:setProperty name="board" property="bdContent" />
<jsp:setProperty name="board" property="bdTask" />
<jsp:setProperty name="board" property="bdMeeting" />
<jsp:setProperty name="board" property="bdWay" />
<jsp:setProperty name="board" property="bdTest" />
<jsp:setProperty name="board" property="bdCredit" />
<jsp:setProperty name="board" property="bdScore" />
<jsp:setProperty name="board" property="bdTerm" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
int userID = 0;

if(session.getAttribute("userID") != null) {
userID = ((Integer)(session.getAttribute("userID"))).intValue();
}

if(userID == 0) {

    PrintWriter script = response.getWriter();

    script.println("<script>");

    script.println("alert('로그인이 필요한페이지 입니다.')");

    script.println("location.href = 'login.jsp'"); /* 이전페이지로 보내기 */

    script.println("</script>");

} else {

      if(board.getBdTitle() == null || board.getBdContent() == null || board.getBdTask() == null || board.getBdMeeting() == null || board.getBdWay() == null || board.getBdTest() == null || board.getBdCredit() == null || board.getBdScore() == null || board.getBdTerm() == null) {

            PrintWriter script = response.getWriter();

            script.println("<script>");

            script.println("alert('모든 항목에 입력해 주세요.')");

            script.println("history.back()");

            script.println("</script>");

        } else{

              boardDAO boardDAO = new boardDAO();

              /* 글입력하게 해주는 int문 */

              int result = boardDAO.write(board.getBdTitle(), board.getBdContent(), userID, board.getBdTask(), board.getBdMeeting(), board.getBdWay(),board.getBdTest(), board.getBdCredit(), board.getBdScore(), board.getBdTerm()); 



              if (result == -1) {

                PrintWriter script = response.getWriter();

                script.println("<script>");

                script.println("alert('작성된 글 저장에 실패했습니다.')");

                script.println("history.back()");

                script.println("</script>");

              }



              else {       

                  PrintWriter script = response.getWriter();

                  script.println("<script>");

                  script.println("location.href = 'Bu_Enrolment_board_language_korean_main1.jsp'");

                  script.println("</script>");

              } 

        }

}

%>

</body>
</html>