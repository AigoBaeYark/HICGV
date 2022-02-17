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
<body>

	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
	<div style="margin: 50px">
		<!-customerDelete 시작-->
		<div style="border: solid; 1 px; margin: 10px;">
			<div>
				<h1>ICGV웹사이트의 회원탈퇴에 동의하시겠습니까?</h1>
				<div>
					<h3>HICGV 회원 탈퇴하시면 해당 웹사이트의 이용이 중지됩니다.</h3>
					<div>HICGV 아이디 : ${myCGV.id }</div>
					<div>
						<form action="delete">
						<div>
						회원탈퇴를 원하시면 아이디와 비밀번호를 입력해주세요.
						</div>
						<div>
						아이디 <input type="text" name="id" /> <br />
						비밀번호 <input type="password" name="password" /> <br />
						</div>
							<input type="submit" value="회원탈퇴"/>
						</form>
						<form action="home" method="post">
							<button type="submit">취소</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-customerDelete 끝-->


	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>


</body>
</html>