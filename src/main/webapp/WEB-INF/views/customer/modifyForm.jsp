<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/customer/customer.css" />
<title>Insert title here</title>
</head>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
<body>
	<div>
		<!--회원정보 수정 시작  -->
		<div style="border: display; 1 px; margin: 10px;">

			<form action="modify" method="post">

				<div class="wrap wd668">
					<div class="container">
						<div class="form_txtInput">
							<h2 class="sub_tit_txt">회원정보수정</h2>
							<p class="exTxt">
								${id }님 이곳에서 회원님의 정보를 수정할 수 있습니다. <br /> 회원정보 수정 시 아이디는
								변경이 불가능합니다. <br />
							</p>
							<div class="join_form">
								<table>
									<colgroup>
										<col width="30%" />
										<col width="auto" />
									</colgroup>
									<tbody>
										<tr>
											<th><span>비밀번호</span></th>
											<td><input type="password" name="password"
												placeholder="password 를 입력하세요."></td>
										</tr>
										<tr>
											<th><span>닉네임</span></th>
											<td><input type="text" name="nickname"
												placeholder="최대 한글 8글자 영문 16글자"></td>
										</tr>
										<tr>
											<th><span>생년월일</span></th>
											<td><input type="text" name="date_birth"
												placeholder="생일을 입력해주세요.ex)2020.01.01"></td>
										</tr>
										<tr>
											<th><span>주소</span></th>
											<td><input type="text" name="location"
												placeholder="주소을 입력해주세요.ex)서울특별시 oo구 "></td>
										</tr>
										<tr>
											<th><span>성별</span></th>
											<td><input type="text" name="gender" placeholder="남자/여자"></td>
										</tr>
										<tr>
											<th><span>질문</span></th>
											<td><input type="text" name="question"
												placeholder="질문을 입력해주세요.ex)가장 좋아하는 색상은?"></td>
										</tr>
										<tr>
											<th><span>답</span></th>
											<td><input type="text" name="answer"
												placeholder="답을 입력해주세요.ex)파랑"></td>
										</tr>
										<tr class="email">
											<th><span>이메일</span></th>
											<td><input type="text" name="email" class=""
												placeholder=""></td>
										</tr>
										<tr>
											<th><span>휴대폰 번호</span></th>
											<td><input type="text" name="phone_number"
												placeholder="휴대폰 번호를 입력하세요."></td>
										</tr>
									</tbody>
								</table>
								<div class="exform_txt">
									<span>표시는 필수적으로 입력해주셔야 수정이 가능합니다.</span>
								</div>
							</div>
							<!-- join_form E  -->
							<div class="agree_wrap">
								<div class="checkbox_wrap">
									<input type="checkbox" id="news_letter" name="news_letter"
										class="agree_chk"> <label for="news_letter">[선택]뉴스레터
										수신동의</label>
								</div>
								<div class="checkbox_wrap mar27">
									<input type="checkbox" id="marketing" name="marketing"
										class="agree_chk"> <label for="marketing">[선택]마케팅
										목적 개인정보 수집 및 이용에 대한 동의</label>
									<ul class="explan_txt">
										<li><span class="red_txt">항목 : 성별, 생년월일</span></li>
										<li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br />
											대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br /> 다만 이때 회원 대상
											서비스가 제한될 수 있습니다.
										</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- form_txtInput E -->
					</div>
					<!-- content E-->
				</div>
				<!-- container E -->

				<div align="center" style="margin-top: 10px; margin-bottom: 10px;">				
					<div align="center" style="margin-top: 10px;">
						<button type="submit" class="btn btn-primary" name="loginBtn"
							style="width: 10%; height: 50px; font-size: 20px;">수정</button>
					</div>
				</div>
		</div>
		</form>

	</div>

</body>
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</html>