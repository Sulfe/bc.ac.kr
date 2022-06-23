<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.board"%>
<%@ page import="board.boardDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>수강신청 메인화면</title>
<link rel="shortcut icon" href="favicon/bu.ico" type="image/x-icon">
<link rel="stylesheet"
	href="css/Bu_Enrolment_board_language_korean_main1.css">
<link rel="stylesheet" href="css/highbar.css">
<link rel="stylesheet" href="css/modal.css">
<script src="js/modal.js" charset="utf-8"></script>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

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
	

	
	

	int pageNumber = 1; //기본1페이지를 의미
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //넘어온 파라메터값을 정수형으로 바꿔줌
	}
	%>

	<div class="wrapper">
		<div class="logo">
			<!--버튼형식의 로고를 생성하였습니다.-->
			<a href="main.jsp">
				<button class="logobtn">백석대학교</button>
			</a>
		</div>
		<input type="checkbox" id="menuicon"> <label for="menuicon">
			<span></span> <span></span> <span></span>
		</label>
		<div class="sidebar">
			<div class="side_list">
				<p class="p">백석대학교 메인 홈페이지 이동</p>
				<a href="https://www.bu.ac.kr/sites/web/intro/intro.html"><img
					src="bu_img/bu_logo.png" alt="" class="logoimg"></a>
				<hr class="hr_bar1">
				<h2 class="title">학부별 전공 시간표 다운로드</h2>
				<li><a href="class/기독교학부.pdf" download class="category">기독교학부</a></li>
				<li><a href="class/어문학부.pdf" download class="category">어문학부</a></li>
				<li><a href="class/사회복지학부.pdf" download class="category">사회복지학부</a></li>
				<li><a href="class/경찰학부.pdf" download class="category">경찰학부</a></li>
				<li><a href="class/경상학부.pdf" download class="category">경상학부</a></li>
				<li><a href="class/관광학부.pdf" download class="category">관광학부</a></li>
				<li><a href="class/사범학부.pdf" download class="category">사범학부</a></li>
				<li><a href="class/컴퓨터공학부.pdf" download class="category">컴퓨터공학부</a></li>
				<li><a href="class/스마트it공학부.pdf" download class="category">스마트IT공학부</a></li>
				<li><a href="class/보건학부.pdf" download class="category">보건학부</a></li>
				<li><a href="class/간호학과.pdf" download class="category">간호학과</a></li>
				<li><a href="class/디자인영상학부.pdf" download class="category">디자인영상학부</a></li>
				<li><a href="class/스포츠과학부.pdf" download class="category">스포츠과학부</a></li>
				<li><a href="class/문화예술학부.pdf" download class="category">문화예술학부</a></li>
				<li><a href="class/혁신융합학부.pdf" download class="category">혁신융합학부</a></li>
				<hr class="hr_bar1">
				<h2 class="title">교양 및 교직 안내 및 시간표</h2>
				<li><a href="class/교양.pdf" download class="category">교양</a></li>
				<li><a href="class/교직.pdf" download class="category">교직</a></li>
				<hr class="hr_bar1">
				<h5 class="pdfdownload">Abobe Acrobat Reader download</h5>
				<h5 class="pdfdownload1">PDF파일 리더기 다운</h5>
				<li><a
					href="http://ardownload.adobe.com/pub/adobe/reader/win/7x/7.0/kor/AdbeRdr70_kor_full.exe"
					download class="category">PDF 파일 리더기 다운</a></li>
				<hr class="hr_bar1">
				<div class="student_info"></div>
			</div>
		</div>
	</div>
	</div>
	<div class="info">
		<p class="lecture">현대소설의 이해 과목 정보</p>
		<div class="professorinfo">
			<h2 class="infopro">교수님 정보</h2>
			<img class="professorimg" src="bu_img/girl_profile.png"
				title="이혜자 교수"> <span class="professorin"> 교수 : 이혜자 <br>전화번호
				: 041-550-2787 <br>이메일 : leejart@bu.ac.kr <br>학부 : 어문학부<br>학과
				: 일본어학과
			</span>
		</div>
		<div class="lecture_info">
			<h2 class="infopro">수업 정보</h2>
			<table class="lecture_info_table">
				<tr>
					<th class="stinfo">이수구분</th>
					<th>핵심교과군</th>
				</tr>
				<tr>
					<th class="stinfo">과목 코드</th>
					<th>185701</th>
				</tr>
				<tr>
					<th class="stinfo">과목명</th>
					<th>현대소설의 이해</th>
				</tr>
				<tr>
					<th class="stinfo">시수</th>
					<th>3</th>
				</tr>
				<tr>
					<th class="stinfo">학점</th>
					<th>3</th>
				</tr>
				<tr>
					<th class="stinfo">제한 인원</th>
					<th>60</th>
				</tr>
				<tr>
					<th class="stinfo">요일/교시</th>
					<th>수 / 4,5,6</th>
				</tr>
				<tr>
					<th class="stinfo">핵심역량(비율)</th>
					<th>전공(73)/혁신(27)</th>
				</tr>
			</table>
		</div>
		<div class="lecture_history">
			<h2 class="infopro">개설 학기</h2>
			<table class="lecture_info_table">
				<tr>
					<th class="stinfo">2021-2</th>
				</tr>
			</table>
		</div>
	</div>
	<div class="by_subject">
		<div class="container_1">
			<div class="row">
				<table class="table_striped" style="text-align: center; border: 1px">

					<thead>
						<tr>
							<th class="th1"
								style="background-color: #67b0ff; text-align: center; font-size: 20px;">번호</th>
							<th
								style="background-color: #67b0ff; text-align: center; font-size: 20px;">제목</th>
							<th
								style="background-color: #67b0ff; text-align: center; font-size: 20px;">작성자</th>
							<th class="th4"
								style="background-color: #67b0ff; text-align: center; font-size: 20px;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
						boardDAO boardDAO = new boardDAO();
						ArrayList<board> list = boardDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getBdNum()%></td>
							<td><a style="text-decoration: none"
								href="view.jsp?bdNum=<%=list.get(i).getBdNum()%>"><%=list.get(i).getBdTitle()%></a></td>
							<td><%=list.get(i).getUserID()%></td>
							<td><%=list.get(i).getBdDate().substring(0, 11) + list.get(i).getBdDate().substring(11, 13) + "시"
		+ list.get(i).getBdDate().substring(14, 16) + "분"%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<%
				if (pageNumber != 1) {
				%>
				<a
					href="Bu_Enrolment_board_language_korean_main1.jsp?pageNumber=<%=pageNumber - 1%>"
					style="position: absolute; text-decoration: none; color: black; bottom: 140px; left:580px">이전</a>
				<%
				}
				if (boardDAO.nextPage(pageNumber + 1)) {
				%>
				<a
					href="Bu_Enrolment_board_language_korean_main1.jsp?pageNumber=<%=pageNumber + 1%>"
					style="position: absolute; text-decoration: none; color: black; bottom: 140px; left:630px">다음</a>

				<%
				}
				%>


			</div>
		</div>
		<button class="textmakebtn" type='link' id="pop_link">글쓰기</button>
		<form class="news" action="writeAction.jsp" method=post id="writeForm"
			accept-charset="utf-8">
			<div class="pop_link">
				<div class="pop_wrap">
					<div class="notice_board">
						<p class="borad_grade1">새 강의평가 쓰기</p>
						<hr class="board_hr">
						<p class="borad_grade">총 평가</p>
						<hr class="board_hr">
						<label class="notice_boardtext">과제</label> <select
							class="board_list" name="bdTask">
							<option value="과제없음" selected>없음</option>
							<option value="과제적음">적음</option>
							<option value="과제많음">많음</option>
						</select> <br> <label class="notice_boardtext">조모임</label> <select
							class="board_list" name="bdMeeting">
							<option value="조모임없음" selected>없음</option>
							<option value="조모임있음">있음</option>
						</select> <br> <label class="notice_boardtext">수업 진행 방식</label> <select
							class="board_list" name="bdWay">
							<option value="수업" selected>수업</option>
							<option value="프로젝트">프로젝트</option>
						</select> <br> <label class="notice_boardtext">시험 횟수</label> <select
							class="board_list" name="bdTest">
							<option value="0회" selected>0</option>
							<option value="1회">1</option>
							<option value="2회">2</option>
						</select> <br> <label class="notice_boardtext">학점 비율</label> <select
							class="board_list" name="bdCredit">
							<option value="학점느님" selected>학점느님</option>
							<option value="비율채움">비율채워줌</option>
							<option value="매우 깐깐">매우 깐깐</option>
						</select> <br>
						<hr class="board_hr">
						<p class="borad_grade">총 평가</p>
						<label class="notice_boardtext">총점</label> <select
							class="board_list" name="bdScore">
							<option value="1점">1</option>
							<option value="2점">2</option>
							<option value="3점" selected>3</option>
							<option value="4점">4</option>
							<option value="5점">5</option>

						</select> <br> <label class="notice_boardtext">수강학기</label> <select
							class="board_list" name="bdTerm">
							<option value="2021-2" selected>2021-2</option>
							<option value="2022-1">2022-1</option>
						</select>
						<hr class="board_hr">
						<label class="borad_grade">제목</label> <br> <input
							class="board_title" type="text" name="bdTitle"
							placeholder="글의 제목을 입력해주시길 바랍니다."> <label
							class="borad_grade">내용</label>
						<textarea class="notice_textarea" name="bdContent"
							placeholder="상대방에게 모욕적이거나 비하는 글을 쓸 경우 처벌의 대상이 될 수 있으니
그 점 유의하시고 강의평가를 작성해주시길 바랍니다."></textarea>
						<label class="Notice_check">비하하거나 비판을 유도하는 글이 될 경우 삭제될 수
							있습니다 확인하셨으면 체크</label>
						<p class="btn-switch">
						<div class="w">
							<label class="lock"> <input type="checkbox" name="agree"
								id="chk"> <span><a class="ag"
									href="javascript:agree();"
									onclick="document.getElementById('writeForm').submit();">등록하기</a></span>
								<!--   <button type="submit">등록하기</button> -->


							</label>
						</div>
						</p>
						<div class="pop_close">
							X
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>