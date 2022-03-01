<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<link rel="stylesheet" href="resources/css/customer/notify.css" />
<link rel="stylesheet" href="resources/css/customer/notify.min.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="resources/js/customer/notify.js"></script>
<script src="resources/js/customer/notify.min.js"></script>
<link rel="stylesheet" href="resources/css/customer/customer.css" />
<title>Insert title here</title>
<style>
table.board_view {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;

}
table.board_view th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #369;
  border-bottom: 3px solid #036;
}
table.board_view tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
table.board_view td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
a {
	color: white;
}
input{
height: 100px;
width: 80%;
}
th{
font-size: 20px;
text-align: center;
}
</style>
</head>
<body>
<div align="center" style= "margin-top: 100px; font-size: 50px; margin-bottom: 30px;">
			<공지사항 수정>
			</div>
	<div align="center" style="margin-bottom: 50px;">

		<div style="width: 800px;">
			<table class="board_view">
				<caption>상세보기</caption>
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="*">
				</colgroup>

				<tbody>
				<form action="noticeModify" method="post">
					<tr>
						<th>NO.${noticeMotify.no} <input type="hidden" name="no" value="${noticeMotify.no}"/></th>
						<td colspan="2"><input type="text" name="title" value="${noticeMotify.title}" /></td>
						<th>작성시간</th>
						<td>${noticeMotify.ncreate_at}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td colspan="2"><input type="text" name="writer" value="${noticeMotify.writer}" /></td>
						<th>조회수</th>
						<td>${noticeMotify.hit}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="4"><br />
						<input type="text" name="content" value="${noticeMotify.content}" /></td>
					</tr>
				</tbody>
			</table>
			<div style="margin-top: 20px;">
			<button type="submit" class="btn btn-primary">저장</button>
			<button type="button" class="btn btn-primary"><a href="noticeList">취소</a></button>
			</div>
		</div>
	</div>
	</form>
	</table>
</body>
<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</html>