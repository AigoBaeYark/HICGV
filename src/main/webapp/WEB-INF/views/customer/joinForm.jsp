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

	<div align="center">
		<h3>회원가입</h3>
		<div>

			<form action="join" class="row g-3" method="post">
				<div class="col-md-6">
					<label for="inputid" class="form-label">아이디 </label> <input
						type="text" name="id" class="form-control" id="inputEmail4">
					<input type="button" value="중복확인" />
				</div>
				<div class="col-md-6">
					<label for="inputPassword4" class="form-label">비밀번호</label> <input
						type="password" name="password" class="form-control"
						id="inputPassword4">
				</div>
				<div class="col-md-6">
					<label for="" class="form-label">이메일</label> <input type="text"
						name="email" class="form-control" id="inputPassword4">
				</div>
				<div class="col-md-6">
					<label for="inputid" class="form-label">이름 </label> <input
						type="text" name="name" class="form-control" id="inputEmail4">
				</div>
				<div class="col-md-6">
					<p>
						생년월일<input type="text" name="date_birth"
							placeholder="ex)2020.01.01">
				</div>
				<div class="col-12">
					<label for="inputAddress" class="form-label">주소</label> <input
						type="text" name="location" class="form-control" id="inputAddress"
						placeholder="OO특별시 OO구 OO대로 OO길 OO-OO 2층 506호">
				</div>
				<div class="col-md-6">
					<label for="inputPassword4" class="form-label">닉네임</label> <input
						type="text" name="nickname" class="form-control"
						id="inputPassword4">
				</div>
				<div class="col-md-6">
					<label for="inputid" class="form-label">전화번호 </label> <input
						type="text" name="phone_number" class="form-control"
						id="inputEmail4">
				</div>
				<div class="col-md-4">
					<label for="inputState" class="form-label">성별</label> <input
						type="text" name="gender" placeholder="ex/남자">
					<!-- <select id="inputState"  name="genselect" class="form-select">
      <option selected="selected" value="1">남자</option>
      <option value="2">여자</option>
    </select> -->
					<div>
						질문. <input type="text" name="question" value="" />
					</div>
					<div>
						답. <input type="text" name="answer" value="" />
					</div>
					<div class="col-12">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck"> 회원가입 동의
							</label>
						</div>
					</div>
					<div class="col-12">
						<button type="submit" class="btn btn-primary">Sign in</button>
					</div>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>


</body>
</html>