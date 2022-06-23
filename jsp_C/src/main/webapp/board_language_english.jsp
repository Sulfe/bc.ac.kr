<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>수강신청 메인화면</title>
<link rel="shortcut icon" href="favicon/bu.ico" type="image/x-icon">
<link rel="stylesheet" href="css/Bu_Enrolment_board_language.css">
<link rel="stylesheet" href="css/highbar.css">
<script src="js/board.js"></script>

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
	UserDAO udao = new UserDAO();
	User us = udao.getMember(userID);
	%>
	<div class="wrapper">
		<div class="logo">
			<!--버튼형식의 로고를 생성하였습니다.-->
			<a href="Bu_Enrolment_main.html">
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
		<p class="p1">내 정보</p>
		<div class="logout">
			<a href="logoutAction.jsp"><img src="bu_img/logout.png"
				alt="로그아웃" class="logout_btn"></a>
		</div>

		<table class="student_info">
			<tr>
				<th class="stinfo">학번</th>
				<th><%=us.getUserNum()%></th>
			</tr>
			<tr>
				<th class="stinfo">이름</th>
				<th><%=us.getUserName()%></th>
			</tr>
			<tr>
				<th class="stinfo">학부</th>
				<th><%=us.getUserDep()%></th>
			</tr>
			<tr>
				<th class="stinfo">학과</th>
				<th><%=us.getUserMajor()%></th>
			</tr>
			<tr>
				<th class="stinfo">학년</th>
				<th><%=us.getUserYear()%></th>
			</tr>
			<tr>
				<th class="stinfo">수강 학기</th>
				<th><%=us.getUserLevel()%></th>
			</tr>
			<tr>
				<th class="stinfo">영어트랙</th>
				<th><%=us.getUserEng()%></th>
			</tr>
			<tr>
				<th class="stinfo">신청가능학점</th>
				<th><%=us.getUserCredit()%></th>
			</tr>
		</table>
		<pre>
<span class="info_important">◈ 수강신청기간 ◈</span> 
1, 2 학년 : 1 ~ 4학기이하 재학생
2022. 2. 7(월) 09:30 ~ 20:00

3, 4 학년 : 5학기이상 재학생
2022. 2. 8(화) 09:30 ~ 20:00

전체학년 :
2022. 2. 9(수) 09:30 ~ 2. 12(금) 20:00

<span class="info_important">◈ 수강신청 정정기간 ◈</span>

수강 정정기간1 : 
2022. 2. 22(화) 09:30 ~ 2. 25(금) 12:00

수강 정정기간2 : 
2022. 2. 25(금) 16:00 ~ 3. 4(금) 20:00
<hr class="info_line">
<span class="info_important">※ 재학생 수강신청안내 및 시간표</span> 
<span class="info_important">※ 상단 메뉴를 통해 시간표 다운</span>
<span class="info_important">※ 모바일 앱 수강신청 사용안내</span>
</pre>
	</div>
	<div class="by_subject">
		<nav class="by_subject_list">
			 <ul>
                <li><a href="main.jsp" class="notice">공지사항</a></li>
                <li><a href="boardMain.jsp" class="board">게시판</a></li>
                <li><a href="enrolment.jsp" class="Enrolment">수강신청 및 수강바구니</a></li>
                 <li><a href="schedule.jsp" class="schedule">시간표</a></li>
            </ul>
		</nav>
		<h1>강의 평가 게시판</h1>
		<hr class="borad_1_hr">
		<form class="searchbox">
			<select onchange="window.open(value, '_self');" class="subject_S">
				<option value="boardMain.jsp">전체보기</option>
				<option value="Bu_Enrolment_board_christian.html">기독교학부</option>
				<option value="board_language.jsp" selected>어문학부</option>
				<option value="Bu_Enrolment_board_social.html">사회복지학부</option>
				<option value="Bu_Enrolment_board_police.html">경찰학부</option>
				<option value="Bu_Enrolment_board_minor.html">경상학부</option>
				<option value="Bu_Enrolment_board_tourism.html">관광학부</option>
				<option value="Bu_Enrolment_board_master.html">사범학부</option>
				<option value="Bu_Enrolment_board_computer.html">컴퓨터공학부</option>
				<option value="Bu_Enrolment_board_SmartIT.html">스마트IT공학부</option>
				<option value="Bu_Enrolment_board_health.html">보건학부</option>
				<option value="Bu_Enrolment_board_nurse.html">간호학부</option>
				<option value="Bu_Enrolment_board_desigevideo.html">디자인영상학부</option>
				<option value="Bu_Enrolment_board_sportsscience.html">스포츠과학부</option>
				<option value="Bu_Enrolment_board_cultureart.html">문화예술학부</option>
				<option value="Bu_Enrolment_board_InnovationConvergence.html">혁신융합학부</option>
			</select> <select onchange="window.open(value, '_self');"
				class="subject_S_sub">
				<option value="board_language.jsp">전체보기</option>
				<option value="board_language_korea.jsp">국어국문학</option>
				<option value="board_language_english.jsp" selected>영어학</option>
				<option value="board_language_japan.jsp">일본어학</option>
				<option value="board_language_china.jsp">중국어학</option>
			</select>
			<div class="header">
				<p class="search">검색</p>
				<input class="input_search" onkeyup="filter()" type="text"
					id="value" placeholder="과목명 입력 : 검색버튼 없어도 검색이 됨">
			</div>
			<hr>
			<div class="container"
				style="overflow: auto; width: 1529px; height: 640px;">
				<div class="item">
					<span class="icon">기초</span> <a
						href="Bu_Enrolment_board_language_english_Basic1.html"
						class="name">영어어휘의 이해와 활용</a> <span class="professor">이미영</span>
				</div>

				<div class="item">
					<span class="icon">기초</span> <a
						href="Bu_Enrolment_board_language_english_Basic2.html"
						class="name">영어연습</a> <span class="professor">신현호</span>
				</div>

				<div class="item">
					<span class="icon">핵심</span> <a
						href="Bu_Enrolment_board_language_english_main1.html" class="name">영문읽기와
						스토리텔링</a> <span class="professor">이미영</span>
				</div>

				<div class="item">
					<span class="icon">핵심</span> <a
						href="Bu_Enrolment_board_language_english_main2.html" class="name">영어와
						영미문화</a> <span class="professor">김순영</span>
				</div>

				<div class="item">
					<span class="icon">핵심</span> <a
						href="Bu_Enrolment_board_language_english_main3.html" class="name">영작문</a>
					<span class="professor">정정미</span>
				</div>

				<div class="item">
					<span class="icon">심화</span> <a
						href="Bu_Enrolment_board_language_english_deep1.html" class="name">미문학개관</a>
					<span class="professor">신현호</span>
				</div>

				<div class="item">
					<span class="icon">심화</span> <a
						href="Bu_Enrolment_board_language_english_deep2.html" class="name">영문학개관</a>
					<span class="professor">김순영</span>
				</div>

				<div class="item">
					<span class="icon">심화</span> <a
						href="Bu_Enrolment_board_language_english_deep3.html" class="name">영미희곡</a>
					<span class="professor">김미경</span>
				</div>

				<div class="item">
					<span class="icon">응용</span> <a
						href="Bu_Enrolment_board_language_english_applications1.html"
						class="name">토익스피킹</a> <span class="professor">ROLANDRA
						YVETTE</span>
				</div>

				<div class="item">
					<span class="icon">응용</span> <a
						href="Bu_Enrolment_board_language_english_applications2.html"
						class="name">문화간 의사소통</a> <span class="professor">서장국</span>
				</div>

				<div class="item">
					<span class="icon">응용</span> <a
						href="Bu_Enrolment_board_language_english_applications3.html"
						class="name">실무영작문</a> <span class="professor">장승재</span>
				</div>
			</div>
		</form>
	</div>
</body>
</html>