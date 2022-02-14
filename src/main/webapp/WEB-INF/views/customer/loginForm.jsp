<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="resources/css/reset.css" />

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>




<title>Insert title here</title>
<style>
<!--
.panel.with-nav-tabs .panel-heading {
	padding: 5px 5px 0 5px;
}

.panel.with-nav-tabs .nav-tabs {
	border-bottom: none;
}

.panel.with-nav-tabs .nav-justified {
	margin-bottom: -1px;
}

/*** PANEL SUCCESS ***/
.with-nav-tabs.panel-success .nav-tabs>li>a, .with-nav-tabs.panel-success .nav-tabs>li>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li>a:focus {
	color: #3c763d;
}

.with-nav-tabs.panel-success .nav-tabs>.open>a, .with-nav-tabs.panel-success .nav-tabs>.open>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>.open>a:focus, .with-nav-tabs.panel-success .nav-tabs>li>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li>a:focus {
	color: #3c763d;
	background-color: #d6e9c6;
	border-color: transparent;
}

.with-nav-tabs.panel-success .nav-tabs>li.active>a, .with-nav-tabs.panel-success .nav-tabs>li.active>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li.active>a:focus {
	background-color: #fff;
	border-color: #d6e9c6;
	border-bottom-color: transparent;
	color: #3c763d;
}
</style>


</head>
<body>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>


	<div class="container">

		<div class="row">
			<div class="col-md-6">
				<div class="panel with-nav-tabs panel-success">
					<div class="panel-heading">
						<ul class="nav nav-tabs" style="position: static;">
							<li class="active"><a href="#tab1success" data-toggle="tab">로그인</a></li>
							<li><a href="#tab2success" data-toggle="tab">비회원예매</a></li>
							<li><a href="#tab3success" data-toggle="tab">비회원예매 확인</a></li>
						</ul>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1success"
								style="float: left;">
								<!--로그인 시작  -->
								<form action="myCGV?id=${login.id }"></form>
								아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해주세요. <br />

								<button type="submit" class="btn btn-primary">
									<a href="myCGV?id=${login.id }">myCGV</a>
								</button>
								에서 ${login.id }님의 정보를 확인하고 수정할 수 있습니다.

								<form action="loginCheck">
									<div class="login-group">
										<label for="id">아이디 </label><input type="text" name="id" /> <label
											for="id">비밀번호 </label> <input type="password" name="password" />
										<button type="submit" class="btn btn-primary">로그인</button>

										<div class="login_etc">
											<div class="checkbox">
												<input type="checkbox" name="" id=""> 아이디 저장
											</div>
											<div class="forgot_id">
												<a href="">아이디 찾기</a>
												<div class="forgot_pw">
													<a href="">비밀번호 찾기</a>
												</div>
												<div><a href="joinForm">회원가입</a></div>
											</div>

										</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--로그인 끝  -->
			<div class="tab-pane fade" id="tab2success">
				<div class="box-security">
					<div style="margin-bottom: 25px;">
						<h3>STEP 1 개인정보 수집 및 이용동의</h3>
						<br /> 비회원 예매 고객께서는 먼저 개인정보 수집 및 이용 동의 정책에 동의해 주셔야 합니다.
					</div>
					<div class="non-customer-agreement">
						<table style="width: 100%" summary="개인정보 수집 및 활용 동의 표">
							<caption>개인정보 수집 및 활용동의</caption>
							<thead>
								<tr style="background-color: lightgrey">
									<th>항목</th>
									<th>이용목적</th>
									<th>보유기간</th>
									<th>동의여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>법정생년월일, <br />휴대폰번호,<br /> 비밀번호
									</td>
									<td>·비회원 예매서비스 제공<br />· 이용자식별, 요금정산, 추심, <br />신규서비스
										개발, 접속빈도 파악 등
									</td>
									<td>관람 또는 취소 후 1주일 까지</td>
									<td><input type="radio" value="Y" name="agree_check"
										id="agree_check1" /> <label for="agree_check1">동의함</label> <input
										type="radio" value="N" checked="checked" name="agree_check"
										id="agree_check2" /> <label for="agree_check2"></label>동의안함</td>
								</tr>
							</tbody>
						</table>
						<div style="margin-top: 20px;">※ CGV 비회원 예매서비스 제공을 위해 필요한
							최소한의 개인정보이므로 입력(수집)에 동의하시지 않을 경우 서비스를 이용하실 수 없습니다.</div>

						<div style="margin-top: 100px;">
							<h3>STEP 2 개인정보(휴대폰번호,법정생년월일,비밀번호) 입력</h3>
							개인정보를 잘못 입력하시면 예매내역 확인/취소 및 티켓 발권이 어려울 수 있으니, 입력하신 정보를 다시 한번
							확인해주시기 바랍니다.
						</div>
						<!--비회원 정보 입력시작  -->
						<div>
							<table class="type04">
								<tr>
									<p>모든 항목은 필수 입력사항입니다.</p>
									<td scope="row" style="background-color: lightgrey">개인정보
										입력</td>
									<td scope="row" style="background-color: lightgrey"></td>
								</tr>
								<tr>
									<td scope="row">법정생년월일(8자리)</td>
									<td><input type="text" /></td>
								</tr>
								<tr>
									<!--이메일 인증을 다루어봐서 넣었음. 원해는 휴대폰인증임//인증주고 받는 코드는 수정해야함 지금은 화면 구현만  -->
									<td scope="row">이메일</td>
									<td><input type="text" />
										<button type="submit">인증번호받기</button></td>
								</tr>
								<tr>
									<td scope="row">인증번호 4자리</td>
									<td><input type="text" />
										<button type="submit">인증확인</button></td>
								</tr>
								<tr>
									<td scope="row">비밀번호</td>
									<td><input type="password" /></td>
								</tr>

							</table>
						</div>
						<!--비회원 정보 입력꿑  -->
						<div style="margin-top: 30px; margin-left: 200px; border: solid;">
							<!--예매하기버튼 시작  -->
							<button style="position: relative;">
								<a href="">예매하기</a>
							</button>
						</div>
						<!--예매하기버튼 끝  -->
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="tab3success">비회원 예매확인</div>
			<div>
				<!--비회원 예매확인 wrap시작  -->
				<h3>비회원 예매확인</h3>
				<br /> 비회원으로 예매하신 고객님은 개인정보(법정생년월일, 휴대폰 번호, 비밀번호(4자리)를 입력해주세요)
				<div>
					<!--비회원 예매확인 sect 시작-->
					모든항목은 필수 입력사항입니다. <br /> 법정생년월일(8자리) <input type="text" /> <br />
					휴대폰번호 <input type="text" /> <br /> 비밀번호(4자리) <input type="text" />

				</div>
				<!--비회원 예매확인 sect 끝 -->
				<div>
					<!--  버튼 스타일 한번에 적용됨..ㄷㄷㄷ -->
					<button type="submit" style="border: solid; 1 px; color: red;">비회원
						예매확인</button>
				</div>
			</div>
			<!--비회원 예매확인 wrap끝 -->
		</div>
	</div>


	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>

</body>


</html>

