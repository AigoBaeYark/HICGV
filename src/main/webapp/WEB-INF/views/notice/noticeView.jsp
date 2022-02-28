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
	<h3 align="center">
		noticeView.jsp에서는 관리자로 로그인 시 공지작성/수정/삭제 가능 <br /> 일반회원일 경우 수정삭제글쓰기 기능
		제한
	</h3>

	<div align="center">
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
</html>