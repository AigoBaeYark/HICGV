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
<title>Insert title here</title>
</head>
<body>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>

	<h3 align="center">noticeList.jsp || 공지사항</h3>
<form action="noticelist"><h2><button type="submit">공지사항</button></h2></form>

	<div class="table-responsive">
		<table class="table" style="text-align: center;">


			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성시간</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.no }</td>					
					<td>${dto.writer }</td>
					<td><a href="noticeView?no=${dto.no }">${dto.title }</a></td>
					<td>${dto.ncreate_at }</td>
					<td>${dto.hit }</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
	TotCnt : ${totRowCnt }
	<br />
	<form id="form1" name="form1" action="" method="post">
		<c:if test="${searchVO.totPage>1 }">
			<c:if test="${searchVO.page>1 }">
				<a href="noticeList?page=1">[처음]</a>
				<a href="noticeList?page=${searchVO.page-1 }">[이전]</a>
			</c:if>
			<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }"
				var="i">
				<c:choose>
					<c:when test="${i eq searchVO.page }">
						<span style="color: red; font-weight: bold;">${i } &nbsp;</span>
					</c:when>
					<c:otherwise>
						<a href="noticeList?page=${i }">${i } </a>&nbsp;
			</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${searchVO.totPage>searchVO.page }">
				<a href="noticeList?page=${searchVO.page+1 }">[다음]</a>
				<a href="noticeList?page=${searchVO.totPage }">[마지막]</a>
			</c:if>
		</c:if>
		<div>
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


	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</body>
</html>