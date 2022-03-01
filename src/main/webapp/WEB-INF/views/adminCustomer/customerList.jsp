<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/customer/customer.css" />
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<div style="height: 220px;">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
</div>
<title>Insert title here</title>
</head>
<body>
	<h3 align="center">${id }님 환영합니다.</h3>
		<div class="" align="right" style="margin-top: 10px; margin-right: 5%; margin-bottom: 10px; ">
			<button type="submit" class="btn btn-primary" style="width: 20%; "><a style="color: white;" href="noticeList?=${id }">공지사항</a></button>
		</div>
		
	</form>
	<form action="getcustomerList">
		<div class="" align="right" style="margin-top: 10px; margin-right: 5%; margin-bottom: 10px; ">
			<button type="submit" class="btn btn-primary" style="width: 20%;">회원정보조회</button>
		</div>
		
	</form>

	<div class="table-responsive" style="margin-bottom: 10%;">
		<table class="table">
			<tr align="center">
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>닉네임</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>주소</th>
				<th>가입일</th>
				<th>이메일</th>
				<th>회원등급</th>
				<th>질문</th>
				<th>답</th>
			</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.user_id }</td>
					<td><a href="customerView?id=${dto.id }">${dto.id }</a></td>
					<td>${dto.name }</td>
					<td>${dto.phone_number }</td>
					<td>${dto.nickname }</td>
					<td>${dto.gender }</td>
					<td>${dto.gender }</td>
					<td>${dto.location }</td>
					<td>${dto.create_at }</td>
					<td>${dto.email }</td>
					<td>${dto.grade }</td>
					<td>${dto.question }</td>
					<td>${dto.answer }</td>
			</c:forEach>
			</tr>
		</table>
	</div>
	TotCnt : ${totRowCnt }
	<br />
	<form id="form1" name="form1" action="getcustomerList" method="post">
		<c:if test="${searchVO.totPage>1 }">
			<c:if test="${searchVO.page>1 }">
				<a href="customerList?page=1">[처음]</a>
				<a href="customerList?page=${searchVO.page-1 }">[이전]</a>
			</c:if>
			<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }"
				var="i">
				<c:choose>
					<c:when test="${i eq searchVO.page }">
						<span style="color: red; font-weight: bold;">${i } &nbsp;</span>
					</c:when>
					<c:otherwise>
						<a href="customerList?page=${i }">${i } </a>&nbsp;
			</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${searchVO.totPage>searchVO.page }">
				<a href="customerList?page=${searchVO.page+1 }">[다음]</a>
				<a href="customerList?page=${searchVO.totPage }">[마지막]</a>
			</c:if>
		</c:if>
		<div style="margin-bottom: 5%;">
			<c:choose>
				<c:when test="${name }">
					<input type="checkbox" name="searchType" value="btitle" checked />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="btitle" />
				</c:otherwise>
			</c:choose>
			<label>이름</label>
			<c:choose>
				<c:when test="${id }">
					<input type="checkbox" name="searchType" value="bcontent" checked />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="bcontent" />
				</c:otherwise>
			</c:choose>
			<label>아이디</label> <input type="text" name="sk" style="width: 150px;"
				maxlength="50" value="" /> <input type="submit" name="btn_search"
				value="검색" />
		</div>
	</form>


</body>
<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>
</html>