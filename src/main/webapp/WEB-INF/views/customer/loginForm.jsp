<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />

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
	color: #3c763d;
	background-color: #fff;
	border-color: #d6e9c6;
	border-bottom-color: transparent;
}



</style>


</head>
<body>
	 <%-- <div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>  --%>
	
	<div class="container" style="width: px;">
		<div class="row">
			<div class="col-md-6">
				<div class="panel with-nav-tabs panel-success">
					<div class="panel-heading">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1success" data-toggle="tab">로그인</a></li>
							<li><a href="#tab2success" data-toggle="tab">비회원예매</a></li>
							<li><a href="#tab3success" data-toggle="tab">비회원예매 확인</a></li>
						</ul>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1success">
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
													<br /> ${login.id }님 환영합니다. <br /> <br />
													</form>
												</div>
											</div>
										</div>

									</div>
							</div>
							<!--로그인 끝  -->
							<div class="tab-pane fade" id="tab2success">이곳은 비회원 예매
							<div class="box-security">
							<h3>STEP 1 개인정보 수집 및 이용동의</h3>
							비회원 예매 고객께서는 먼저 개인정보 수집 및 이용 동의 정책에 동의해 주셔야 합니다.
							<div class="non-customer-agreement">
							<table style="width: 100%" summary="개인정보 수집 및 활용 동의 표">
							<caption>개인정보 수집 및 활용동의</caption>
							<thead>
							<tr>
							<th>항목</th>
							<th>이용목적</th>
							<th>보유기간</th>
							<th>동의여부</th>
							</tr>
							</thead>
							<tbody>
							<tr>
							<th>법정생년월일, <br />휴대폰번호,<br /> 비밀번호</th>
							<td>· 비회원 예매서비스 제공<br />· 이용자식별, 요금정산, 추심, <br />신규서비스 개발, 접속빈도 파악 등</td>
							</tr>
							
							</tbody>
							
							</table>
							
							</div>
							</div>
							</div>
							<div class="tab-pane fade" id="tab3success">Success 3</div>
						</div>
					</div>
				</div>
			</div>

			
			 <%-- <c:import url="/WEB-INF/views/common/footer.jsp"></c:import> --%>
</body>


</html>