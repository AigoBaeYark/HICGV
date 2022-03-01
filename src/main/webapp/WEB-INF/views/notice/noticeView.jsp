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
</style>
</head>
<body>
	
	<div align="center" style= "margin-top: 100px; font-size: 50px; margin-bottom: 30px;">
			공지사항
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
					<tr>						
						<th>NO.${noticeView.no}</th>
						<td colspan="2"><text>${noticeView.title}</text></td>
						<th>작성시간</th>
						<td><text>${noticeView.ncreate_at}</text></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td colspan="2"><text>${noticeView.writer}</text></td>
						<th>조회수</th>
						<td><text>${noticeView.hit}</text></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="4"><br /><text>${noticeView.title}</text><br /><br />
						<text>${noticeView.content}</text></td>
					</tr>
				</tbody>
			</table>
			<div style="margin-top: 20px;">
			<button type="button" class="btn btn-primary"><a href="noticeList">목록으로</a></button>
			<button type="button" class="btn btn-primary"><a href="noticeModifyForm?no=${noticeView.no }">수정하기</a></button>
			<button type="button" class="btn btn-primary"><a href="noticeDelete?no=${noticeView.no }">삭제하기</a></button>
			</div>
		</div>
	</div>
	</table>
</body>
<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</html>