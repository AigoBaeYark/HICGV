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
<div> <!--회원정보 수정 시작  -->
<div style="border: solid; 1px; margin: 30px;">
	
	<form action="modify" method="post">
	${myCGV.id }님의 정보를 수정 할 수 있습니다. <br />
		
	비밀번호 <input type="password" name="password"/> <br />
	전화번호 <input type="text" name="phone_number"/> <br />
	닉네임 <input type="text" name="nickname"/> <br />
	성별 <input type="text" name="gender"/> <br />
	생일 <input type="text" name="date_birth"/> <br />
	주소 <input type="text" name="location"/> <br />
	이메일 <input type="text" name="email"/> <br />
	질문 <input type="text" name="question"/> <br />
	답 <input type="text" name="answer"/> <br />
	<div>
<input type="submit" value="수정"/ style="border: solid; 1px; margin: 10px;">
	</div>
	
	
	
	</form>


</div>


</div> <!--회원정보 수정 시작  -->



	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>

</body>
</html>