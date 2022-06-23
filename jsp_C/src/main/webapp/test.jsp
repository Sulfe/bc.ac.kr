<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	int userID = ((Integer) (session.getAttribute("userID"))).intValue();
	%>

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
			<th class="schedule_th">1교시<br>09:00~09:50
			</th>
			<td class="schedule_td"><%=mon.getTime1()%></td>
			<td class="schedule_td"><%=tue.getTime1()%></td>
			<td class="schedule_td"><%=wed.getTime1()%></td>
			<td class="schedule_td"><%=thu.getTime1()%></td>
			<td class="schedule_td"><%=fir.getTime1()%></td>
		</tr>

	</table>

</body>
</html>