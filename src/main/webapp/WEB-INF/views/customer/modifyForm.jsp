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
	<div style="margin: 30px;"><h1>이곳에서 회원정보를 수정할 수 있습니다.//로그인을 하지 않으면 화면 전환 X</h1></div>
	
	<div style="margin: 50px;"><!--화원정보 수정 폼 시작  -->
	<!-- joinProc 이라는 이름으로 xml의 쿼리문으로 이동 -->
<form action="modify" class="row g-3">
  <div class="col-md-6"> <!--아이디 / 이름은 변경불가  -->
    <label for="inputid" class="form-label">아이디: ${modify.id } </label>
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">변경할 비밀번호</label>
    <input type="password" class="form-control" id="inputPassword4">
  </div>
  <div class="col-md-6">
    <label for="inputid" class="form-label">이름: ${modifyForm.name }  </label>
  </div>
  <div class="col-md-6">
     <p>생년월일<input type="date"> <input type="button" value="저장">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">주소</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="OO특별시 OO구 OO대로 OO길 OO-OO 2층 506호">
  </div>
   <div class="col-md-6">
    <label for="inputPassword4" class="form-label">닉네임</label>
    <input type="text" class="form-control" id="">
  </div>
  <div class="col-md-6">
    <label for="inputid" class="form-label">전화번호  </label>
    <input type="text" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">성별</label>
    <select id="inputState" class="form-select">
      <option selected>남자</option>
      <option selected>여자</option>      
    </select>
    <br />
    <button style="border: solid; 1px;"><input type="submit" value="수정하고 저장하기" /></button>
    </div><!--화원정보 수정 폼 끝  -->
    </form>
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>

</body>
</html>