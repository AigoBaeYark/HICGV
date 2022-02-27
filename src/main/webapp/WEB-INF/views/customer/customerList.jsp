<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
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

	<h3>customerList.jsp || ${id }님 환영합니다.</h3>
		<div class="table-responsive">
  <table class="table">
   

	<tr>
		<th>user_id(가입순서)</th>
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
	<c:forEach begin="1" end="10">
	
	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
		<td>4</td>
		<td>5</td>
		<td>6</td>
		<td>7</td>
		<td>8</td>
		<td>9</td>
		<td>10</td>
		<td>11</td>
		<td>12</td>
		<td>13</td>
	
	</tr>
	</c:forEach>
	
	<%-- <c:forEach items="${list }" var="dto">
		<tr>
			<th>${dto.bid }</th>
			<th>${dto.bname }</th>
			<th>
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
			</th>
			<th>${dto.bdate }</th>
			<th>${dto.bhit }</th>
		</tr>
	</c:forEach> --%>
	<tr>
		<th colspan="3"> <a href="joinForm" >회원가입</a> </th>
		<th colspan="3"> <a href="modifyForm">회원정보수정</a> </th>
		<!-- <th colspan="3"> <a href="customerDelete">회원삭제</a> </th> -->
	</tr>


 </table>
</div>
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