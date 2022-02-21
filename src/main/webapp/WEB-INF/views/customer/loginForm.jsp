<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="resources/css/reset.css" />

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">

<title>Insert title here</title>



</head>
<body>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
	<style>
.wrap-login {
	width: 500px;
	position: relative;
	padding: 30px 30px 0;
	margin-left: 30%;
	margin-top: 10%;
	margin-bottom: 10%;
	border: solid;
	1
	px;
}

div {
	font-size: 100%;
	vertical-align: baseline;
	word-break: break-all;
	display: block;
}

body {
	font-size: 13px;
	line-height: 1.2;
	color: #666;
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum,
		sans-serif;
	font-weight: 400;
}

.login-top {
	border-bottom: solid 3px purple;
}

.login {
	margin: 5px;
	text-align: center;
}

.forgot_pw {
	margin: 5px;
	width: 200px;
	height: 30px;
	margin-left: 30%;
}

.logbtn {
	border: solid; 1 px;
	color: white;
	width: 165px;
	height: 30px;
	background-color: red;
}
</style>
	<script type="text/javascript">
		
	</script>


	<div class="wrap-login">
		<div class="sect-login">
			<div class="login-top">
				<h2 align="center">로그인</h2>

			</div>
			<div class="box-login">
				<h3 class="hidden">회원 로그인</h3>
				<form method="post" action="loginCheck">

					<h5 align="center">아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</h5>
					<div class="login">
						<div style="margin: 5px;">
							<input type="text" id="" name="loginid" required="required"
								placeholder="아이디를 입력해주세요" pattern="{3,19}">

						</div>
						<div>
							<input type="password" id="" name="loginpw" required="required"
								placeholder="패스워드를 입력해주세요">
						</div>
						<div class="loginbtn">
							<button type="submit" class="logbtn">
								<span>로그인</span>
							</button>
						</div>
					</div>
					<div class="save-id" align="center">
						<input type="checkbox" id="loginSet"><label for="save_id">
							아이디 저장</label>
					</div>
					<div class="forgot_pw">
						<a href="forgetIdForm">아이디 찾기</a> 
						<a href="forgetPwForm">비밀번호찾기</a>
					</div>

				</form>
				<div>
					<!--홈으로 옮길 메뉴  -->

					<br /> 홈으로 옮길 메뉴 <br />
					<button type="submit">
						<a href="myCGV?id=${id }">myCGV</a>
					</button>
					<br />
					<form action="logout" method="post">
						<button type="submit">로그아웃</button>
					</form>
				</div>
			</div>
		</div>
	</div>





</body>
<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>

</html>

