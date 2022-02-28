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



/* table {
   border-top: solid;
   2
   px;
}

th, td {
   height: 100px;
   border-bottom: solid; 1px;
}

th, text {
   font-size: 20px;
}

button {
   height: 50px;
   width: 150px;
}
a {
   color: white;
} */
</style>
</head>
<body>
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
                  <th>NO.1</th>
                  <td colspan="2"><text>안녕하세요</text></td>
                  <th>작성시간</th>
                  <td><text>2/28 7:28</text></td>
               </tr>
               <tr>
                  <th>작성자</th>
                  <td colspan="2"><text>배미</text></td>
                  <th>조회수</th>
                  <td><text>12</text></td>
               </tr>
               <tr>
                  <th>내용</th>
                  <td colspan="4"><br /><text>aaa</text><br /><br />
                  <text>aaaaaaaaaa</text></td>
               </tr>
            </tbody>
         </table>
         <div style="margin-top: 20px;">
         <button type="button" class="btn btn-primary"><a href="#">목록으로</a></button>
         <button type="button" class="btn btn-primary"><a href="#">수정하기</a></button>
         <button type="button" class="btn btn-primary"><a href="#">삭제하기</a></button>
         </div>
      </div>
   </div>
</body>
</html>