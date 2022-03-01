<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<title>Insert title here</title>
</head>
<div style="height: 300px;">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
</div>
<body>

<div align="center">
	<div class="wrap-login">
		<div class="sect-login">
			<div class="login-top">
				<h2 align="center" class="login">회원탈퇴</h2>
			</div>
			<div class="box-login">
				<h3 class="hidden">회원탈퇴</h3>
				<h1>HICGV웹사이트의 회원탈퇴에 동의하시겠습니까?</h1>
				<div>${id }님 회원탈퇴를 원하시면 아이디와 비밀번호를 입력해주세요.</div>
				<form action="delete" method="post">
					<div style="margin-top: 10px; margin-bottom: 10px;">
						<h5 align="center" style="font-size: 20px;"></h5>
					</div>
					<div class="login">
						<div style="margin: 5px;">
							<input type="text" id="" name="id"
								style="height: 50px; width: 80%; border-radius: 15px; background-color: rgba(194, 240, 240);"
								placeholder="아이디를 입력해주세요" pattern="{3,19}">

						</div>
						<div style="margin: 5px;">
							<input type="password" id="" name="password"
								style="height: 50px; width: 80%; border-radius: 15px; background-color: rgba(194, 240, 240);"
								placeholder="패스워드를 입력해주세요">
						</div>
					</div>					
					<div class="loginbtn" align="center" style="margin-top: 10px;">
						<button type="submit" class="btn btn-primary" name="loginBtn"
							style="width: 30%;">회원탈퇴</button>
					</div>										
				</form>
				<form action="main">
				<div class="loginbtn" align="center" style="margin-top: 10px;">
						<button type="submit" class="btn btn-primary" name="loginBtn"
							style="width: 30%;">취소</button>
					</div>
					</form>
			</div>
		</div>
	</div>
</div>
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>


</body>
</html>