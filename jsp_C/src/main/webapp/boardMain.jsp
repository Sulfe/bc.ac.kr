<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>수강신청 메인화면</title>
    <link rel="shortcut icon" href="favicon/bu.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/Bu_Enrolment_board.css">
    <link rel="stylesheet" href="css/highbar.css">
      <link rel="stylesheet" href="css/modal1.css">
    <script src="js/modal1.js"></script>

</head>
<body>
	<%
/* 	int id = ((Integer) (session.getAttribute("userID"))).intValue(); */
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
		<p class="p1">내 정보</p>
		<div class="logout">
			<a href="logoutAction.jsp"><img src="bu_img/logout.png"
				alt="로그아웃" class="logout_btn"></a>
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
         <label class="title1">강의 평가 게시판</label>
         <button class="notice_btn"  type='link' id="pop_link" > 게시판 이용 전 주의사항 보기</button>
         <form class="news">
            <div class="pop_link">  
                <div class="pop_wrap">
                <div class="pop_close">X</div>
<pre class="notice_pre">
  <span class="notice_title">강의평가 계시판 사용시 주의사항</span>

  백석대 학우분들께 강의평가 게시판 사용전 주의사항에 대해 알려드리록 하겠습니다.
                
  최근 강의평가 게시판에 욕설을 하거나 남을 비하하며 깍아내리는 글들이 정말 많습니다.
              
  백석대학교 강의평가 게시판을 사용하기 전 몇 가지 주의사항에 대해서 알려드리도록 하겠습니다.
             
 <span class="notice_red"> 광고성, 특정인의 명예 훼손, 동일내용의 글을 반복하여 게시하는 경우, 게시판 성격에 맞지 않는 글,
  음란성, 욕설, 비속어, 비방성, 음해성, 기타 불건전한 내용을 담고 있을 경우에는 사전통보 없이 
  삭제될 수 있으니 양해바랍니다.
                
  잠깐! 귀하가 게재한 내용은 타인이 열람할 수 있으며, 타인의 개인정보 등 인권침해하는 경우 
  명예 훼손 등으로 고소당할 수도 있습니다.
                
  게시판에 글쓰기를 하는 경우, 본문 또는 첨부파일내에 개인정보(주민등록번호, 성명, 연락처 등)가 
  포함되어 게시되지 않도록 유의하시기 바랍니다.
                
  개인정보를 포함하여 게시하는 경우에는 불특정 다수에게 개인정보가 노출되어 악용될 수 있으며, 
  특히 타인의 개인정보가 노출되는 경우에는 개인정보보호법에 따라 처벌을 받을 수 있음을 알려드립니다.
</span>              
  이하 내용을 잘 숙지 후에 백석대학교 강의평가 게시판을 이용해주시면 감사하겠습니다.
</pre>
            </div>
        </div>
        <div class="subject_list">    
                <img src="bu_img/subject_major.png" class="subject_img">
                <ul>
                <li class="subjectli"><a href="Bu_Enrolment_board_christian.html"  class="subjecta">기독교학부</a></li> 
                <li class="subjectli"><a href="board_language.jsp"  class="subjecta">어문학부</a></li> 
                <li class="subjectli"><a href="Bu_Enrolment_board_social.html"  class="subjecta">사회복지학부</a></li> 
                <li class="subjectli"><a href="Bu_Enrolment_board_police.html" class="subjecta">경찰학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_minor.html"  class="subjecta" >경상학부</a></li> 
                <li class="subjectli"><a href="Bu_Enrolment_board_tourism.html" class="subjecta" >관광학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_master.html"  class="subjecta">사범학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_computer.html"  class="subjecta">컴퓨터공학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_SmartIT.html"  class="subjecta">스마트IT공학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_health.html"  class="subjecta">보건학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_nurse.html"  class="subjecta">간호학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_desigevideo.html"  class="subjecta">디자인영상학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_sportsscience.html"  class="subjecta">스포츠과학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_cultureart.html"  class="subjecta">문화예술학부</a></li>
                <li class="subjectli"><a href="Bu_Enrolment_board_InnovationConvergence.html"  class="subjecta">혁신융합학부</a></li>  
                </ul>
        </div>  
        <div class="subject_list1">    
            <img src="bu_img/subject_select.png" class="subject_img">
            <ul>
            <li class="subjectli1"><a href="Bu_Enrolment_board_area1.html"  class="subjectb">인간⦁문화이해</a></li> 
            <li class="subjectli1"><a href="Bu_Enrolment_board_area2.html"  class="subjectb">사회⦁역사이해</a></li> 
            <li class="subjectli1"><a href="Bu_Enrolment_board_area3.html"  class="subjectb">자연과학⦁기술이해</a></li> 
            <li class="subjectli1"><a href="Bu_Enrolment_board_area4.html" class="subjectb">예술⦁체육이해</a></li>
            <li class="subjectli1"><a href="Bu_Enrolment_board_area5.html"  class="subjectb" >기초교양</a></li> 
            <li class="subjectli1"><a href="Bu_Enrolment_board_area6.html" class="subjectb" >창의융합교양</a></li>
            <li class="subjectli1"><a href="Bu_Enrolment_board_area7.html"  class="subjectb">소양교양</a></li>
            </ul>
        </div>  
        <div class="subject_list2">    
            <img src="bu_img/subject_need.jpg" class="subject_img">
            <ul>
            <li class="subjectli2"><a href="Bu_Enrolment_board_worship.html"  class="subjectc">대학예배</a></li> 
            <li class="subjectli2"><a href="Bu_Enrolment_board_tenacity.html"  class="subjectc">기독교인성</a></li> 
            <li class="subjectli2"><a href="Bu_Enrolment_board_globalization.html"  class="subjectc">세계화</a></li> 
            <li class="subjectli2"><a href="Bu_Enrolment_board_korean.html" class="subjectc">국어</a></li>
            <li class="subjectli2"><a href="Bu_Enrolment_board_informatization.html"  class="subjectc" >정보화</a></li> 
            <li class="subjectli2"><a href="Bu_Enrolment_board_Baekseok_Mentoring.html" class="subjectc" >백석멘토링</a></li>
            </ul>
        </div>
    </div>
</body>

</html>