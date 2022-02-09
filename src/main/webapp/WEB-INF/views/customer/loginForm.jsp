<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
	
	<h1>로그인을 해주세요</h1>
	
	<form action="loginCheck">
	<div class="login_sns">
            </div>
		아이디 : <input type="text" name="id"/>
		비밀번호 : <input type="password" name="password"/>
		<input type="submit" value="로그인"/>
	 <div class="login_etc">
                <div class="checkbox">
                <input type="checkbox" name="" id=""> 아이디 저장
                </div>
                <div class="forgot_id">
                <a href="">아이디 찾기</a>
                <div class="forgot_pw">
                <a href="">비밀번호 찾기</a>
            </div>
           

    </form>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>


</body>
</html>