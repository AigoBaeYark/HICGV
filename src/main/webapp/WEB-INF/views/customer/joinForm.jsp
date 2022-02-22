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
<body>



	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
	<div align="center" style="width: 600px; position: relative;left: 600px;">
		<div>
			<div>

				<form action="join" class="row g-3" method="post">
				<!-- name을 dto의 필드명과 동일하게 -->
					<div class="wrap wd668">
						<div class="container">
							<div class="form_txtInput">
								<h2 class="sub_tit_txt">회원가입</h2>
								<p class="exTxt">
									회원정보 수정 시 아이디는 변경이 불가능합니다. <br />
								</p>
								<div class="join_form">
									<table>
										<colgroup>
											<col width="30%" />
											<col width="auto" />
										</colgroup>
										<tbody>
											<tr>
												<th><span>아이디</span></th>
												<td><input type="text" name="id"
													placeholder="사용할 아이디를 입력하세요."></td>
												<td><input type="button" value="중복확인" /></td>
											</tr>
											<tr>
												<th><span>비밀번호</span></th>
												<td><input type="password" name="password"
													placeholder="password 를 입력하세요."></td>
											</tr>
											<tr>
												<th><span>이릉</span></th>
												<td><input type="text" name="name" placeholder=""></td>
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
												<td><input type="text" name="gender"
													placeholder="남자/여자"></td>
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
												<td><input type="text" name="email" class="email"
													placeholder=""><span class="mar10">@</span> <input
													type="text" class="email email2" placeholder=""> <a
													href="javascript:;" class="btn_confirm">인증번호 발송</a></td>
											</tr>
											<tr>
												<th><span>인증번호 확인</span></th>
												<td><span><input type="text" class="send_number"
													placeholder="10:00"></span><a href="javascript:;"
													class="btn_confirm">인증번호 확인</a></td>
											</tr>
											<tr>
												<th><span>휴대폰 번호</span></th>
												<td><input type="text" name="phone_number"
													placeholder="휴대폰 번호를 입력하세요."></td>
											</tr>
										</tbody>
									</table>
									<div class="exform_txt">
										<span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span>
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
						<div
							style="width: 100px; height: 50px; border: 1px solid blue; border-radius: 10px; background: linear-gradient(45deg, aqua, #2041e3);">
							<button type="submit">
								<h5 style="color: white; font-size: 20px;">회원가입</h5>
							</button>
						</div>
					</div>
			</div>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>


</body>
</html>