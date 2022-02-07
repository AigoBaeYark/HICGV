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
<h1>loginForm.jsp</h1>

<c:import url="../home.jsp"></c:import>


<div class="sect-login">
	<ul class="top-menu-round">
	<li class="on">로그인</li>
	<li class="on">비회원 예매</li>
	<li class="on">비회원 예매확인</li>
	</ul>
	<div class="box-login">
            <h3 class="hidden">회원 로그인</h3>
            <form id="form1" method="post" action="#" novalidate="novalidate" onsubmit="return false">
            <fieldset>
                <legend>회원 로그인</legend>
                <p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</p>
                <div class="login">
                 아이디:   <input type="text" title="아이디" id="txtUserId" name="txtUserId" required="required"> <br />
              비밀번호:     <input type="password" title="패스워드" id="txtPassword" name="txtPassword"required="required">
                </div>
                <div class="save-id"> <input type="checkbox" id="loginSet"><label for="save_id">아이디 저장</label></div>

              
                <button type="submit" id="submit" title="로그인"><span>로그인</span></button>
                <div class="login-option">
                    <a href="">아이디 찾기</a>
                    <a href="">비밀번호 찾기</a>
                </div>
            </fieldset>
            </form>  
			
        </div>
</div>

<c:import url="../home.jsp"></c:import>


</body>
</html>