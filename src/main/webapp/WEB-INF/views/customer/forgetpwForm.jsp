<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>

<style>
<!--
.container {
	width: 600px;
	margin-top: 10%;
	margin-bottom: 10%;
}

.h1 {
	font-size: 15px;
}

.h1-top {
	border-bottom: solid; 1 px;
	border-bottom-color: blue;
}

.form-group {
	margin-top: 5px;
}
-->
</style>

</head>

<body>
<div style="height: 300px;">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
</div>
	<!--  -->
	<div class="container">
		<div class="h1-top">
			<h2 class="h1" align="center">
				비밀번호가 기억나지 않으세요? <br /> 회원님의 아이디와 이메일 주소를 입력해주세요.
			</h2>
		</div>
		<form action="forgetPw">
			<div class="form-group">
				<label for="exampleInputPassword1">아이디</label> <input name="id"
					type="text" class="form-control" id="exampleInputPassword1"
					placeholder="아이디">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">이메일 주소</label> <input name="email"
					type="email" class="form-control" id="exampleInputEmail1"
					placeholder="이메일을 입력하세요">
			</div>

			<button type="submit" class="btn btn-default">입력</button>
			<button type="button" class="btn btn-default"><a href="loginForm">취소</a></button>
		</form>
	</div>

<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>

</body>



</html>