<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.UserDAO" %>
<%@ page import ="user.User" %>
<%@ page import ="subinfo.subinfo" %>
<%@ page import ="subinfo.subinfoDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="schedule.schedule" %>
<%@ page import="schedule.scheduleDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>수강신청 시간표</title>
    <link rel="shortcut icon" href="favicon/bu.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/Bu_Enrolment_time.css">
    <link rel="stylesheet" href="css/highbar.css">
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

scheduleDAO scdao = new scheduleDAO();
schedule mon = scdao.getMon(userID);
schedule tue = scdao.gettue(userID);
schedule wed = scdao.getwed(userID);
schedule thu = scdao.getthu(userID);
schedule fir = scdao.getfir(userID);

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
    </div>
    <div class="print_form">

        <div class="schedules">
                <table class="time_list" id="none1">
                    <caption>시간표</caption>
                    <tr>
                        <th class="schedule_th"></th>
                        <th class="schedule_td">월</th>
                        <th class="schedule_td">화</th>
                        <th class="schedule_td">수</th>
                        <th class="schedule_td">목</th>
                        <th class="schedule_td">금</th>
                    </tr>
                    <tr>
                        <th class="schedule_th">1교시<br>09:00~09:50</th>
                        <td class="schedule_td"><%=mon.getTime1() %></td>
						<td class="schedule_td"><%=tue.getTime1() %></td>
						<td class="schedule_td"><%=wed.getTime1() %></td>
						<td class="schedule_td"><%=thu.getTime1() %></td>
						<td class="schedule_td"><%=fir.getTime1() %></td>
                    </tr> 
                    <tr>   
                        <th class="schedule_th">2교시<br>10:00~10:50</th>
                        <td class="schedule_td"><%=mon.getTime2() %></td>
						<td class="schedule_td"><%=tue.getTime2() %></td>
						<td class="schedule_td"><%=wed.getTime2() %></td>
						<td class="schedule_td"><%=thu.getTime2() %></td>
						<td class="schedule_td"><%=fir.getTime2() %></td>
                    </tr>  
                    <tr>   
                        <th class="schedule_th">3교시<br>11:00~11:50</th>
                        <td class="schedule_td"><%=mon.getTime3() %></td>
						<td class="schedule_td"><%=tue.getTime3() %></td>
						<td class="schedule_td"><%=wed.getTime3() %></td>
						<td class="schedule_td"><%=thu.getTime3() %></td>
						<td class="schedule_td"><%=fir.getTime3() %></td>
                    </tr>
                    <tr>    
                        <th class="schedule_th">4교시<br>12:00~12:50</th>
                        <td class="schedule_td"> <%=mon.getTime4() %></td>
						<td class="schedule_td"><%=tue.getTime4() %></td>
						<td class="schedule_td"><%=wed.getTime4() %></td>
						<td class="schedule_td"><%=thu.getTime4() %></td>
						<td class="schedule_td"><%=fir.getTime4() %></td>
                    </tr>  
                    <tr>   
                        <th class="schedule_th">5교시<br>13:00~13:50</th>
                        <td class="schedule_td"> <%=mon.getTime5() %></td>
						<td class="schedule_td"><%=tue.getTime5() %></td>
						<td class="schedule_td"><%=wed.getTime5() %></td>
						<td class="schedule_td"><%=thu.getTime5() %></td>
						<td class="schedule_td"><%=fir.getTime5() %></td>
                    </tr>  
                    <tr>    
                        <th class="schedule_th">6교시<br>14:00~14:50</th>
                        <td class="schedule_td"> <%=mon.getTime6() %></td>
						<td class="schedule_td"><%=tue.getTime6() %></td>
						<td class="schedule_td"><%=wed.getTime6() %></td>
						<td class="schedule_td"><%=thu.getTime6() %></td>
						<td class="schedule_td"><%=fir.getTime6() %></td>
                    </tr>   
                    <tr>    
                        <th class="schedule_th">7교시<br>15:00~15:50</th>
                        <td class="schedule_td"> <%=mon.getTime7() %></td>
						<td class="schedule_td"><%=tue.getTime7() %></td>
						<td class="schedule_td"><%=wed.getTime7() %></td>
						<td class="schedule_td"><%=thu.getTime7() %></td>
						<td class="schedule_td"><%=fir.getTime7() %></td>
                    </tr>
                    <tr>
                        <th class="schedule_th">8교시<br>16:00~16:50</th>
                       <td class="schedule_td"><%=mon.getTime8() %></td>
						<td class="schedule_td"><%=tue.getTime8() %></td>
						<td class="schedule_td"><%=wed.getTime8() %></td>
						<td class="schedule_td"><%=thu.getTime8() %></td>
						<td class="schedule_td"><%=fir.getTime8() %></td>
                    </tr>
                    <tr>
                        <th class="schedule_th">9교시<br>17:00~17:50</th>
                        <td class="schedule_td"><%=mon.getTime9() %></td>
						<td class="schedule_td"><%=tue.getTime9() %></td>
						<td class="schedule_td"><%=wed.getTime9() %></td>
						<td class="schedule_td"><%=thu.getTime9() %></td>
						<td class="schedule_td"><%=fir.getTime9() %></td>
                    </tr>
                </table>
        </div>
        <div class="sub_info_table">
            <table class="sub_infotable">
                <caption>수강하는 강좌 정보</caption>
                <tr>
                    <td class="sub_info_td">코드</td>
                    <td class="sub_info_td">제목</td>
                    <td class="sub_info_td">학점</td>
                    <td class="sub_info_td">인원</td>
                    <td class="sub_info_td">교수명</td>
                    <td class="sub_info_td">시간</td>
                    <td class="sub_info_td">장소</td>
                </tr>
                 <%
                subinfoDAO sdao = new subinfoDAO();
                subinfo sum = sdao.getSum(userID);
                ArrayList<subinfo> list = sdao.getList(userID);
                for (int i = 0; i < list.size(); i++) {
                %>
                <tr>
                     <td class="sub_info_td"><%=list.get(i).getSubCode()%></td>
                    <td class="sub_info_td"><%=list.get(i).getSubName()%></td>
                    <td class="sub_info_td"><%=list.get(i).getSubGrade()%></td>
                    <td class="sub_info_td"><%=list.get(i).getSubPeople()%></td>
                    <td class="sub_info_td"><%=list.get(i).getSubPro()%></td>
                    <td class="sub_info_td"><%=list.get(i).getSubTime()%></td>
                    <td class="sub_info_td"><%=list.get(i).getSubWhere()%></td>
                </tr>
                <%
                };
                %>
            </table>      
        </div>
    </div>
    <div class="total_point">
        <p class="total_text">내가 신청한 총 학점</p>
        <input type="text" placeholder="내가 신청한 학점이 출력되는 공간" class="total" readonly value=<%=sum.getSubSum()%>>
    </div>    
</body>
</html>