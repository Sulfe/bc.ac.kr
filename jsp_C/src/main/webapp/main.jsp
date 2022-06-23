<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import ="user.UserDAO" %>
<%@ page import ="user.User" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
    <title>수강신청 메인화면</title>
    <link rel="shortcut icon" href="favicon/bu.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/Bu_Enrolment_main.css">
    <link rel="stylesheet" href="css/highbar.css">
    <script src="js/Bu_Enrolment_main.js"></script>

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
        <div class="logo">                           <!--버튼형식의 로고를 생성하였습니다.-->
            <a href="main.jsp">
               <button class="logobtn">백석대학교</button>
            </a>
        </div>
        <input type="checkbox" id="menuicon">
            <label for="menuicon">
	            <span></span>
            	<span></span>
	            <span></span>
            </label>
            <div class="sidebar">
                <div class="side_list">
                    <p class="p">백석대학교 메인 홈페이지 이동</p>
                    <a href="https://www.bu.ac.kr/sites/web/intro/intro.html"><img src="bu_img/bu_logo.png" alt="" class="logoimg"></a>
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
                    <li><a href="http://ardownload.adobe.com/pub/adobe/reader/win/7x/7.0/kor/AdbeRdr70_kor_full.exe" download class="category">PDF 파일 리더기 다운</a></li>
                    <hr class="hr_bar1">
                    <div class="student_info">
                    </div>
                </div>
            </div>
        </div>        
    </div>
    
   <div class="info">
    <p class="p1">내 정보</p>
    <div class="logout">
        <a href="logoutAction.jsp" ><img src="bu_img/logout.png" alt="로그아웃" class="logout_btn"></a>
    </div>

       <table class="student_info">
            <tr>
                <th class="stinfo">학번</th>
                <th><%=us.getUserNum() %></th>
            </tr> 
            <tr>
                <th class="stinfo">이름</th>
                <th><%=us.getUserName() %></th>
            </tr>
            <tr>
                <th class="stinfo">학부</th>
                <th><%=us.getUserDep() %></th>
            </tr>
            <tr>
                <th class="stinfo">학과</th>
                <th><%=us.getUserMajor() %></th>
            </tr>
            <tr>
                <th class="stinfo">학년</th>
                <th><%=us.getUserYear() %></th>
            </tr>
            <tr>
                <th class="stinfo">수강 학기</th>
                <th><%=us.getUserLevel() %></th>
            </tr>
            <tr>
                <th class="stinfo">영어트랙</th>
                <th><%=us.getUserEng() %></th>
            </tr>
            <tr>
                <th class="stinfo">신청가능학점</th>
                <th><%=us.getUserCredit() %></th>
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
         <h1>Notice</h1>
         <hr class="notice_text_hr">
<pre class="notice_text">
    <span class="redtext">◈ 공지사항</span>
    <span class="bluetext">(수강신청 로그인이 안될 경우 조치 안내)
    ※ 수강신청화면은 한개의 화면으로만 실행이 제한되었습니다.
       (한사람당 여러개의 화면을 띄워서 사용할 경우 과도한 트래픽 발생으로 인하여 다른 학생들에게 피해가 갈 수 있는 점을 방지하기 위함.)
    ※ 수강신청내 버튼은 한번 클릭 후 3초간 실행 할 수 없습니다.
       (중복 실행으로 인하여 발생한 트래픽으로 수강신청 지연 방지하기 위함.)</span>   
    <!--띄어쓰기-->     
    <span class="redtext">◈ 사용자 아이디</span>
    ※ 학부생 : 학번
    ※ 신,편입생 : 학번(아이디/비밀번호찾기를 이용하여 학번검색가능)
    <span class="redtext">(백석대학교에 다시 입학하시는 학생은 반드시 학번으로 로그인해야 합니다.)</span>           
    <span class="redtext">◈ 비밀번호</span>
    <span class="redtext">※ 패스워드를 수시로 변경하여 보안에 만전을 기하여 주십시요.</span> 
    ※ 사용자 id나 password를 분실하였을 경우에는 로그인 밑에 있는
    '아이디/비밀번호찾기' 를 이용해 주십시요.
    ※ 수강신청관련 문의는 소속학부사무실로 연락하여 주십시요.
    <span class="redtext"><비밀번호 노출로 인한 피해 사례></span>
    <span class="bluetext">1. 친구에게 아이디, 비밀번호를 가르쳐 주고 수강신청을 부탁한 경우</span>
    - 친구 수강신청 과목(인원제한 과목)을 삭제하고 본인이 수강신청을 한 경우
    <span class="bluetext">2. 신입생에게 부여되는 최초 비밀번호가 노출된 경우.</span>
    - 비밀번호를 주기적으로 변경하지 않아 해외 연수시 알게된 정보를 이용하여 수강신청과목을 삭제한 경우
    <span class="bluetext">3. 공용으로 사용하는 자유열람실, PC방, 검색대에서 사용하는 경우</span> 
    - 불특정다수가 사용하는 PC에서 사용자 와 암호를 저장할 경우,
      다음 사용자가 쉽게 리스트만 확인하여 자동 로그인 하여 수강신청 과목을 변경한 경우
    - 공용 PC를 사용하는 경우 사용자와 암호를 저장하지 말고, 수강신청 후 반드시 로그아웃 하시기 바랍니다.
    <span class="redtext"><해킹관련 법규 및 처벌사례></span>
    ◈ 본 프로그램은 EXPLORER 8.0이상 최적화 되었습니다.
    <span class="redtext">◈ 위 사항을 지키지 않을 시 수강신청에 대한 불이익을 얻을 수 있으며, 불법 프로그램을 사용시 법적 처리할 수 있습니다.</span>
</pre>
<hr>
<h1>수강신청이 어려운 사람들을 위한 백석대학교 유튜브</h1>
<input type="button" class="Enrolment_Tip1" onClick="youtubeFullscreen('https://www.youtube.com/embed/7nt-yOeRaqM?t=15s')" value="  ">
<input type="button" class="Enrolment_Tip2" onClick="youtubeFullscreen('https://www.youtube.com/embed/JBEBN9cJ7FQ?t=15s')" value="  ">
    </div>    

</body>
</html>