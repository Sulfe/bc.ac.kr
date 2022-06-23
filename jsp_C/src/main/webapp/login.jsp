<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백석대학교 수강신청 로그인</title>
<link rel="shortcut icon" href="favicon/bu.ico" type="image/x-icon">
<link rel="stylesheet" href="css/BU_Enrolment_login.css">
</head>

<body>

	<section class="login-form">
		<div class="box1">
			<div id="logo">
				<img src="bu_img/sugane_logo.png" title="백석대학교">
			</div>

			<!--아이디와 비밀번호를 입력하는 칸-->
			<form action="loginAction.jsp" method="post">
				<div class="int-area">
					<input type="text" name="userID" id="userID" autocomplete="off"
						required maxlength="20"> <label for="id">학번</label>
				</div>
				<div class="int-area">
					<input type="password" name="userPassword" id="userPassword"
						autocomplete="off" required maxlength="20"> <label
						for="pw">비밀번호</label>
				</div>
				<!--로그인 확인 버튼-->
				<div class="btn-area">
					<button type="submit">로그인</button>
				</div>
			</form>

			<!--아이디찾기와 비밀번호찾기를 누르면 해당 페이지로 이동하도록-->
			<div class="caption">
				<br>학번을 잊으셨나요? <a
					href="https://www.bu.ac.kr/web/3514/subview.do?enc=Zm5jdDF8QEB8JTJGdXNlckluZm9TZWFyY2glMkZ3ZWIlMkZpZFNlYXJjaFZpZXcuZG8lM0Y%3D"
					class="find_id">학번 찾기</a><br> <br>비밀번호를 잊으셨나요? <a
					href="https://www.bu.ac.kr/web/3514/subview.do?enc=Zm5jdDF8QEB8JTJGdXNlckluZm9TZWFyY2glMkZ3ZWIlMkZwd2RTZWFyY2hWaWV3LmRvJTNG"
					class="find_pw">비밀번호 찾기</a><br> <br>
			</div>
		</div>
	</section>

</body>

</html>