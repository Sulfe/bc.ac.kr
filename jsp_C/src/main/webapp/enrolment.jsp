<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="userSubject.userSubDAO"%>
<%@ page import="userSubject.userSub"%>
<%@ page import="schedule.schedule"%>
<%@ page import="schedule.scheduleDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="shortcut icon" href="favicon/bu.ico" type="image/x-icon">
<link rel="stylesheet" href="css/Bu_Enrolment_Enrolment.css">
<link rel="stylesheet" href="css/highbar.css">
<script src="js/Enrolment.js"></script>
<script src="js/Enrolment_plus.js"></script>
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

	userSubDAO usdao = new userSubDAO();
	userSub us = usdao.getSub(userID);
	scheduleDAO scdao = new scheduleDAO();
	schedule mon = scdao.getMon(userID);
	schedule tue = scdao.gettue(userID);
	schedule wed = scdao.getwed(userID);
	schedule thu = scdao.getthu(userID);
	schedule fir = scdao.getfir(userID);
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
	<div class="by_subject">
		<nav class="by_subject_list">
			<ul>
				<li><a href="main.jsp" class="notice">공지사항</a></li>
				<li><a href="boardMain.jsp" class="board">게시판</a></li>
				<li><a href="enrolment.jsp" class="Enrolment">수강신청 및 수강바구니</a></li>
				<li><a href="schedule.jsp" class="schedule">시간표</a></li>
			</ul>
		</nav>
	</div>
	<div class="subject_list_in">
		<div class="subject_info">
			<p>수강 목록</p>
			<p class="borad_1_hr">
			<form class="subject_list" method="get" action="enrolmentAction.jsp">
				<select onchange="window.open(value, '_self');" class="subject_S">
					<option value="Bu_Enrolment_main_Enrolment.html.html">전체보기</option>
					<option value="Bu_Enrolment_main_Enrolment_christian.html">기독교학부</option>
					<option value="Bu_Enrolment_main_Enrolment_language.html" selected>어문학부</option>
					<option value="Bu_Enrolment_main_Enrolment_social.html">사회복지학부</option>
					<option value="Bu_Enrolment_main_Enrolment_police.html">경찰학부</option>
					<option value="Bu_Enrolment_main_Enrolment_minor.html">경상학부</option>
					<option value="Bu_Enrolment_main_Enrolment_tourism.html">관광학부</option>
					<option value="Bu_Enrolment_main_Enrolment_master.html">사범학부</option>
					<option value="Bu_Enrolment_main_Enrolment_computer.html">컴퓨터공학부</option>
					<option value="Bu_Enrolment_main_Enrolment_SmartIT.html">스마트IT공학부</option>
					<option value="Bu_Enrolment_main_Enrolment_health.html">보건학부</option>
					<option value="Bu_Enrolment_main_Enrolment_nurse.html">간호학부</option>
					<option value="Bu_Enrolment_main_Enrolment_desigevideo.html">디자인영상학부</option>
					<option value="Bu_Enrolment_main_Enrolment_sportsscience.html">스포츠과학부</option>
					<option value="Bu_Enrolment_main_Enrolment_cultureart.html">문화예술학부</option>
					<option
						value="Bu_Enrolment_main_Enrolment_InnovationConvergence.html">혁신융합학부</option>
				</select> <select onchange="window.open(value, '_self');"
					class="subject_S_sub">
					<option value="Bu_Enrolment_board_language.html" selected>전체보기</option>
					<option value="Bu_Enrolment_main_Enrolment_language_korea.html">국어국문학</option>
					<option value="Bu_Enrolment_main_Enrolment_language_english.html">영어학</option>
					<option value="Bu_Enrolment_main_Enrolment_language_japan.html">일본어학</option>
					<option value="Bu_Enrolment_main_Enrolment_language_china.html">중국어학</option>
				</select>
				<div class="header">
					<p class="search">검색</p>
					<input class="input_search" onkeyup="filter()" type="text"
						id="value" placeholder="과목명 or 과목코드 입력 : 검색버튼 없어도 검색이 됨">
				</div>
				<div class="container"
					style="overflow: auto; width: 1130px; height: 300px; border: 1px solid black; margin-top: 25px; margin-left: 15px;">
					<div class="item">
						<span class="icon">이수구분</span> <span class="code">과목코드</span> <span
							class="name">과목명</span> <span class="professor">교수명</span> <span
							class="point">학점</span> <span class="limit">인원</span> <span
							class="day">&nbsp;&nbsp;요일/교시</span> <span class="class">강의실</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="193801"
							onclick="getCheckboxValue()"> <span class="icon_s">기초교과군</span>
						<span class="code_s">193801</span> <span class="name_s">영어어휘의
							이해와 활용</span> <span class="professor_s">이미영</span> <span class="point_s">3</span>
						<span class="limit_s">50</span> <span class="day_s">월/
							7,8,9교시</span> <span class="class_s">본부315</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="252201"
							onclick="getCheckboxValue()"> <span class="icon_s">기초교과군</span>
						<span class="code_s">252201</span> <span class="name_s">영어
							연습</span> <span class="professor_s">신현호</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">목/
							7,8,9교시</span> <span class="class_s">본부308</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="677401"
							onclick="getCheckboxValue()"> <span class="icon_s">기초교과군</span>
						<span class="code_s">677401</span> <span class="name_s">일본어
							커뮤니케이션</span> <span class="professor_s">김현정</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">금/
							2,3사1</span> <span class="class_s">본부319</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="195101"
							onclick="getCheckboxValue()"> <span class="icon_s">기초교과군</span>
						<span class="code_s">195101</span> <span class="name_s">중국어
							입문</span> <span class="professor_s">원정원</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">금/
							1,2,3교시</span> <span class="class_s">본부313</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="252701"
							onclick="getCheckboxValue()"> <span class="icon_s">기초교과군</span>
						<span class="code_s">252701</span> <span class="name_s">중국어와
							중국문화</span> <span class="professor_s">류영화</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">수/
							6교시/사1,2</span> <span class="class_s">본부319</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="185701"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">185701</span> <span class="name_s">현대소설의
							이해</span> <span class="professor_s">이혜자</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">수/
							4,5,6교시</span> <span class="class_s">본부312</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="779401"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">779401</span> <span class="name_s">드라마의
							이해와 실제</span> <span class="professor_s">이혜자</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">수/
							7,8,9교시</span> <span class="class_s">본부312</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="193901"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">193901</span> <span class="name_s">영문읽기와
							스토리텔링</span> <span class="professor_s">이혜자</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">수/
							7,8,9교시</span> <span class="class_s">본부314</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="252301"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">252301</span> <span class="name_s">영어어와
							영미문화</span> <span class="professor_s">김순영</span> <span class="point_s">3</span>
						<span class="limit_s">50</span> <span class="day_s">목/
							1,2,3교시</span> <span class="class_s">본부312</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="253401"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">253401</span> <span class="name_s">영작문</span>
						<span class="professor_s">정정미</span> <span class="point_s">3</span>
						<span class="limit_s">50</span> <span class="day_s">월/
							7,8,9교시</span> <span class="class_s">본부302</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="780101"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">780101</span> <span class="name_s">초급
							일본어</span> <span class="professor_s">임성규</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">수/
							7,8,9교시</span> <span class="class_s">본부717</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="780201"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">780201</span> <span class="name_s"> 초급
							일본어 회화</span> <span class="professor_s">이혜자</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">목/4,5,6</span>
						<span class="class_s">본부314</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="780501"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">780501</span> <span class="name_s">일본
							한자 연습</span> <span class="professor_s">이혜자</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">화/4,5,6</span>
						<span class="class_s">본부312</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="166701"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">166701</span> <span class="name_s">중국문학개론</span>
						<span class="professor_s">이혜자</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">화/4,5,6</span>
						<span class="class_s">본부312</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="780501"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">780501</span> <span class="name_s">중국어문법</span>
						<span class="professor_s">이종구</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">수/4,5,6</span>
						<span class="class_s">본부314</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="201301"
							onclick="getCheckboxValue()"> <span class="icon_s">핵심교과군</span>
						<span class="code_s">201301</span> <span class="name_s">중국어문법</span>
						<span class="professor_s">서해영</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">수/1,2,3</span>
						<span class="class_s">본부314</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="184901"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">184901</span> <span class="name_s">
							현대시론</span> <span class="professor_s">문현미</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">월/7,8,9</span>
						<span class="class_s">본부308</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="676501"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">676501</span> <span class="name_s">
							고전소설의 이해</span> <span class="professor_s">권도경</span> <span
							class="point_s">3</span> <span class="limit_s">60</span> <span
							class="day_s">수/7,8,9</span> <span class="class_s">본부308</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="186101"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">186101</span> <span class="name_s">국어사</span>
						<span class="professor_s">박석문</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">화/4,5,6</span>
						<span class="class_s">본부302</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="123801"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">123801</span> <span class="name_s">미문학개관</span>
						<span class="professor_s">신현호</span> <span class="point_s">3</span>
						<span class="limit_s">50</span> <span class="day_s">화/7,8,9</span>
						<span class="class_s">본부319</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="146401"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">146401</span> <span class="name_s">영문학개관</span>
						<span class="professor_s">김순영</span> <span class="point_s">3</span>
						<span class="limit_s">50</span> <span class="day_s">월/7,8,9</span>
						<span class="class_s">본부717</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="147001"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">147001</span> <span class="name_s">영미희곡</span>
						<span class="professor_s">김미경</span> <span class="point_s">3</span>
						<span class="limit_s">50</span> <span class="day_s">목/4,5,6</span>
						<span class="class_s">본부304</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="483101"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">483101</span> <span class="name_s">일본어교과교육론</span>
						<span class="professor_s">이남희</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">월/7,8,9</span>
						<span class="class_s">본부313</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="483201"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">483201</span> <span class="name_s">일본어교과교재연구
							<br>지도법
						</span> <span class="professor_s">김미경</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">월/1,2,3</span>
						<span class="class_s">본부315</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="558701"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">558701</span> <span class="name_s">일본어능력시험N2</span>
						<span class="professor_s">임성규</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">화/4,5,6</span>
						<span class="class_s">본부717</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="166801"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">166801</span> <span class="name_s">중국문학사</span>
						<span class="professor_s">임성규</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">목/1,2,3</span>
						<span class="class_s">본부313</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="168101"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">168101</span> <span class="name_s">중국어학개론</span>
						<span class="professor_s">이종구</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">화/4,5,6</span>
						<span class="class_s">본부315</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="201501"
							onclick="getCheckboxValue()"> <span class="icon_s">심화교과군</span>
						<span class="code_s">201501</span> <span class="name_s">중국어작문</span>
						<span class="professor_s">이종구</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">목/7,8,9</span>
						<span class="class_s">본부318</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="194301"
							onclick="getCheckboxValue()"> <span class="icon_s">응용교과군</span>
						<span class="code_s">194301</span> <span class="name_s">토익
							스피킹</span> <span class="professor_s">ROLANDRA YVETTE</span> <span
							class="point_s">2</span> <span class="limit_s">40</span> <span
							class="day_s">목/1,2</span> <span class="class_s">본부314</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="194401"
							onclick="getCheckboxValue()"> <span class="icon_s">응용교과군</span>
						<span class="code_s">194401</span> <span class="name_s">문화간
							의사소통</span> <span class="professor_s">서장국</span> <span class="point_s">3</span>
						<span class="limit_s">50</span> <span class="day_s">목/7,8,9</span>
						<span class="class_s">본부319</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="194501"
							onclick="getCheckboxValue()"> <span class="icon_s">응용교과군</span>
						<span class="code_s">194501</span> <span class="name_s">실무영작문</span>
						<span class="professor_s">장승재</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">목/4,5,6</span>
						<span class="class_s">본부302</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="195001"
							onclick="getCheckboxValue()"> <span class="icon_s">응용교과군</span>
						<span class="code_s">195001</span> <span class="name_s">통상실무일본어</span>
						<span class="professor_s">문광헌</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">화/4,5,6</span>
						<span class="class_s">본부308</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="329401"
							onclick="getCheckboxValue()"> <span class="icon_s">응용교과군</span>
						<span class="code_s">329401</span> <span class="name_s">실무영작문</span>
						<span class="professor_s">임성규</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">월/7,8,9</span>
						<span class="class_s">본부319</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="359801"
							onclick="getCheckboxValue()"> <span class="icon_s">응용교과군</span>
						<span class="code_s">359801</span> <span class="name_s">비즈니스일본어</span>
						<span class="professor_s">김현정</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">사1,2,3</span>
						<span class="class_s">사이버강의</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="201401"
							onclick="getCheckboxValue()"> <span class="icon_s">응용교과군</span>
						<span class="code_s">201401</span> <span class="name_s">중국어강독</span>
						<span class="professor_s">최경진</span> <span class="point_s">3</span>
						<span class="limit_s">60</span> <span class="day_s">월/1,2,3</span>
						<span class="class_s">본부319</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="257601"
							onclick="getCheckboxValue()"> <span class="icon_s">응용교과군</span>
						<span class="code_s">257601</span> <span class="name_s">고급중국어회화</span>
						<span class="professor_s">서해영</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">수/4,5,6</span>
						<span class="class_s">본부318</span>
					</div>
					<div class="item_s">
						<input type="checkbox" name="subject" value="361601"
							onclick="getCheckboxValue()" /> <span class="icon_s">응용교과군</span>
						<span class="code_s">361601</span> <span class="name_s">통상실무중국어</span>
						<span class="professor_s">원정원</span> <span class="point_s">3</span>
						<span class="limit_s">40</span> <span class="day_s">금/4,5,6</span>
						<span class="class_s">본부313</span>
					</div>
				</div>
				<button class="save_time">수강 신청/시간표 출력</button>
			</form>
		</div>
		<div class="subject_basket">
			<div class="basket_info">
				<p>수강 바구니</p>
				<table class="another_table">

					<th><%=us.getSubName()%></th>

				</table>
				<form method="get" action="deleteAction.jsp">
					<button class="save_delete">수강철회</button>
				</form>
			</div>

		</div>
		<div class="time_schedule">
			<form class="time_list">
				<table>
					<caption>시간표</caption>
					<tr>
						<th></th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
					</tr>
					<tr>
						<th>1교시<br>09:00~09:50
						</th>
						<td><%=mon.getTime1()%></td>
						<td><%=tue.getTime1()%></td>
						<td><%=wed.getTime1()%></td>
						<td><%=thu.getTime1()%></td>
						<td><%=fir.getTime1()%></td>
					</tr>
					<tr>
						<th>2교시<br>10:00~10:50
						</th>
						<td><%=mon.getTime2()%></td>
						<td><%=tue.getTime2()%></td>
						<td><%=wed.getTime2()%></td>
						<td><%=thu.getTime2()%></td>
						<td><%=fir.getTime2()%></td>
					</tr>
					<tr>
						<th>3교시<br>11:00~11:50
						</th>
						<td><%=mon.getTime3()%></td>
						<td><%=tue.getTime3()%></td>
						<td><%=wed.getTime3()%></td>
						<td><%=thu.getTime3()%></td>
						<td><%=fir.getTime3()%></td>
					</tr>
					<tr>
						<th>4교시<br>12:00~12:50
						</th>
						<td><%=mon.getTime4()%></td>
						<td><%=tue.getTime4()%></td>
						<td><%=wed.getTime4()%></td>
						<td><%=thu.getTime4()%></td>
						<td><%=fir.getTime4()%></td>
					</tr>
					<tr>
						<th>5교시<br>13:00~13:50
						</th>
						<td><%=mon.getTime5()%></td>
						<td><%=tue.getTime5()%></td>
						<td><%=wed.getTime5()%></td>
						<td><%=thu.getTime5()%></td>
						<td><%=fir.getTime5()%></td>
					</tr>
					<tr>
						<th>6교시<br>14:00~14:50
						</th>
						<td><%=mon.getTime6()%></td>
						<td><%=tue.getTime6()%></td>
						<td><%=wed.getTime6()%></td>
						<td><%=thu.getTime6()%></td>
						<td><%=fir.getTime6()%></td>
					</tr>
					<tr>
						<th>7교시<br>15:00~15:50
						</th>
						<td><%=mon.getTime7()%></td>
						<td><%=tue.getTime7()%></td>
						<td><%=wed.getTime7()%></td>
						<td><%=thu.getTime7()%></td>
						<td><%=fir.getTime7()%></td>
					</tr>
					<tr>
						<th>8교시<br>16:00~16:50
						</th>
						<td><%=mon.getTime8()%></td>
						<td><%=tue.getTime8()%></td>
						<td><%=wed.getTime8()%></td>
						<td><%=thu.getTime8()%></td>
						<td><%=fir.getTime8()%></td>
					</tr>
					<tr>
						<th>9교시<br>17:00~17:50
						</th>
						<td><%=mon.getTime9()%></td>
						<td><%=tue.getTime9()%></td>
						<td><%=wed.getTime9()%></td>
						<td><%=thu.getTime9()%></td>
						<td><%=fir.getTime9()%></td>
					</tr>
				</table>
			</form>
		</div>
</body>