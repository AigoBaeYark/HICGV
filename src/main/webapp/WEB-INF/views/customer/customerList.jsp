<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/customer/customer.css" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
	
	<h3>customerList.jsp 이곳에서 모든 회원정보를 볼 수 있음</h3>

<table width="500" border="1">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>이름</td>
		<td>연락처</td>
		<td>닉네임</td>
		<td>성별</td>
		<td>생년월일</td>
		<td>주소</td>
		<td>가입일</td>
		<td>이메일</td>
		<td>회원등급</td>
		<td>질문</td>
		<td>답</td>
	</tr>
	
	<%-- <c:forEach items="${list }" var="dto">
		<tr>
			<td>${dto.bid }</td>
			<td>${dto.bname }</td>
			<td>
			<!-- 	들여쓰기가 되도록 -->
			<c:set value="${dto.bindent }" var="endindent" />
			<c:forEach begin="1" end="${dto.bindent }" var="cnt">
				&nbsp;
				<c:if test="${cnt eq  endindent}">
				<img src="resources/img/reply.gif" alt="" />
				[re]
				</c:if>	
			</c:forEach>
				<a href="content_view?bid=${dto.bid }">${dto.btitle }</a> 
			</td>
			<td>${dto.bdate }</td>
			<td>${dto.bhit }</td>
		</tr>
	</c:forEach> --%>
	<tr>
		<td colspan="3"> <a href="joinForm" >회원가입</a> </td>
		<td colspan="3"> <a href="modifyForm">회원정보수정</a> </td>
		<!-- <td colspan="3"> <a href="customerDelete">회원삭제</a> </td> -->
	</tr>

</table>
TotCnt : ${totRowCnt }
<br />
<c:if test="${searchVO.totPage>1 }">
	<c:if test="${searchVO.page>1 }">
		<a href="list?page=1">[처음]</a>
		<a href="list?page=${searchVO.page-1 }">[이전]</a>
	</c:if>
	<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
		<c:choose>
			<c:when test="${i eq searchVO.page }">
				<span style="color:red; font-weight: bold;">${i } &nbsp;</span> 
			</c:when>
			<c:otherwise>
				<a href="list?page=${i }">${i } </a>&nbsp;
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${searchVO.totPage>searchVO.page }">
		<a href="list?page=${searchVO.page+1 }">[다음]</a>
		<a href="list?page=${searchVO.totPage }">[마지막]</a>
	</c:if>
</c:if>
	
	
	
	<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>
</body>
</html>