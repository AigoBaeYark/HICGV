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
<title>resetPwForm.jsp</title>
<style type="text/css">
.container {
	width: 600px;
	margin-top: 10%;
	margin-bottom: 10%;
}

.form-group {
	width: 600px;
}

.h1 {
	font-size: 15px;
}
</style>



</head>
<body>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>

	<div class="container">
		<!--container 시작  -->
		
		<form action="resetPw" method="post">
			<h1 class="h1" align="center"> ${id } 님 반갑습니니다. 비밀번호를 재설정해주세요.</h1>
			<input type="hidden" name = "id" value="${id }"/>
			<div class="form-group">
				<label for="exampleInputPassword1">비밀번호를 입력하세요.</label> <input
					name="newPw" type="password" class="form-control"
					id="exampleInputPassword1" placeholder="new password" onkeyup="onChangepw()" required>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">비밀번호를 다시 입력하세요.</label> <input
					name="newPwConfirm" type="password" class="form-control"
					id="exampleInputEmail1" placeholder="new password " onkeyup="onChangeCkpw()" required>
			</div>
			
			<input type="button" name = "submitBtn" class="btn btn-default" onclick="checkedd()" value="저장"/>
			<button type="button" class="btn btn-default">
				<a href="home"></a>취소
			</button>
		</form>
	</div>
	<!--container 끝  -->
	
	<script>
		var ckPw;
		function onChangepw() {
			console.log($('input[name=newPw]').val());
		}
		
		function onChangeCkpw() {
			console.log($('input[name=newPwConfirm]').val());
		}
		function checkedd() {
			
			if( $('input[name=newPw]').val() === $('input[name=newPwConfirm]').val() ){
				console.log('check');
				document.getElementsByName("submitBtn")[0].setAttribute("type", "submit"); 
			}else{
				document.getElementsByName("submitBtn")[0].setAttribute("type", "button"); 
			}
			
		}
		
	
	</script>


	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>



</body>


</html>