<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<h2 align="center">회원정보</h2>
	<div align="center" style="width: 600px; position: relative; left: 600px;">
		<div>
			<div>
				<form action="customerModifyForm" class="row g-3" method="post">
				<input type="hidden" name="id" value="${customerView.id }" />
					
									<table>
										<colgroup>
											<col width="30%" />
											<col width="auto" />
										</colgroup>
										<tbody>
											<tr>
												<th><span>user_id</span></th>
												<td>${customerView.user_id }</td>					
											</tr>
											<th><span>아이디</span></th>
												<td>${customerView.id }</td>
											<tr>
											<th><span>이름</span></th>
												<td>${customerView.name }</td>
											</tr>
											<tr>
												<th><span>닉네임</span></th>
												<td>${customerView.nickname }</td>
											</tr>
											<tr>
											<th><span>핸드폰 번호</span></th>
												<td>${customerView.phone_number }</td>
											</tr>
											<tr>
											<th><span>성별</span></th>
												<td>${customerView.gender }</td>
											</tr>
											<tr>
											<th><span>생년월일</span></th>
												<td>${customerView.date_birth }</td>
											</tr>
											<tr>
											<th><span>주소</span></th>
												<td>${customerView.location }</td>
											</tr>
											<tr>
											<th><span>가입일</span></th>
												<td>${customerView.create_at }</td>
											</tr>
											<tr>
											<th><span>이메일 주소</span></th>
												<td>${customerView.email }</td>
											</tr>
											<tr>
											<th><span>회원등급</span></th>
												<td>${customerView.grade }</td>
											</tr>
											<tr>
											<th><span>질문</span></th>
												<td>${customerView.question }</td>
											</tr>
											<tr>
											<th><span>답</span></th>
												<td>${customerView.answer }</td>
											</tr>
										</tbody>
									</table>
									
							

					<div align="center" style="margin-top: 10px; margin-bottom: 10px;">
						<div>
							<button type="submit" class="btn btn-primary">회원정보수정</button>
						</div>
					</div>
			</form>
			<form action="customerDelete">
			<input type="hidden" name="id" value="${customerView.id }" />
			<button type="submit" class="btn btn-primary">회원정보삭제</button>
			</form>
			</div>
		</div>
	</div>
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</body>
</html>