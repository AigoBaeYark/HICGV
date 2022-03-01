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


</head>
<body>
	<div align="center">
		<form action="resetPwForm" method="post">
			<div align="center" style="width: 50%; margin-top: 30px;">
				<div class="form-group" style="font-size: 30px; margin-top: 50px;">
					${id }님 질문에 알맞은 답을 입력하세요.
				</div>
				<div align="center" style="font-size: 20px; margin: 30px;">${question }</div>

				<div style="margin: 5px;">
					<input type="text" id="" name="answer"
						style="height: 50px; width: 80%; border-radius: 15px; background-color: rgba(194, 240, 240);"
						placeholder="답을 입력해주세요">
				</div>
				<div class="form-group" style="margin-bottom: 50px">

					<input type="hidden" name="id" value="${id }" />
					<!--히든값을 주면 화면에서 표시되지 않음  -->
					<button type="submit" class="btn btn-default" name="loginBtn">입력</button>
					<button type="button" class="btn btn-default" name="loginBtn">
						<a href="home"></a>취소
					</button>
				</div>
			</div>
		</form>
	</div>



</body>
<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>



</html>