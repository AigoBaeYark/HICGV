<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<link rel="stylesheet" href="resources/css/customer/notify.css" />
<link rel="stylesheet" href="resources/css/customer/notify.min.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="resources/js/customer/notify.js"></script>
<script src="resources/js/customer/notify.min.js"></script>
<link rel="stylesheet" href="resources/css/customer/customer.css" />

<title>Insert title here</title>
<style>
.login {
	font-size: 30px;
}
</style>

</head>
<body>
	<div class="flex_container"><!--flex_container 시작  -->
	<div class="flex_item"></div>
	<div class="wrap-login">
		<div class="sect-login">
			<div class="login-top">
				<h2 align="center" class="login">로그인</h2>
			</div>
			<div class="box-login">
				<h3 class="hidden">회원 로그인</h3>

				<form action="loginCheck" method="post">
					<div style="margin-top: 10px; margin-bottom: 10px;">
						<h5 align="center" style="font-size: 20px;">
							로그인 후 이용 가능합니다.
						</h5>
					</div>
					<div class="login">
						<div style="margin: 5px;">
							<input type="text" id="" name="loginid"
								style="height: 50px; width: 80%; border-radius: 15px; background-color: rgba(194, 240, 240);"
								placeholder="아이디를 입력해주세요" pattern="{3,19}">

						</div>
						<div style="margin: 5px;">
							<input type="password" id="" name="loginpw"
								style="height: 50px; width: 80%; border-radius: 15px; background-color: rgba(194, 240, 240);"
								placeholder="패스워드를 입력해주세요">
						</div>
					</div>
					<div align="center">
					<div class="forgot_pw">
						<a href="forgetIdForm">아이디 찾기</a> 
						<a href="forgetPwForm">비밀번호찾기</a>
					</div>
					</div>
					<div class="loginbtn" align="center" style="margin-top: 10px;">
						<button type="button" class="btn btn-primary" name="loginBtn"
							onclick="loginbtn()" style="width: 80%;">로그인</button>
					</div>
					<div class="save-id" align="center">
						<input type="checkbox" id="loginSet"><label for="save_id">
							아이디 저장</label>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="flex_advertise"></div>
	<div class="flex_item"></div>
 </div><!--flex_container 끝  -->
	<script>
		function loginbtn() {
			var loginid = $('input[name=loginid]').val();
			//console.log(loginid);
			var password = $('input[name=loginpw]').val();
			//console.log(password);
			if (loginid == "" || password == "") {
				console.log(loginid);
				console.log(password);
				//alert('d');
				notify('warning', '', '아이디와 비밀번호를 확인해주세요');

			} else {
				console.log('else');
				$('button[name=loginBtn]').attr('type', 'submit');
			}
		}
	</script>


</body>
<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>

</html>

