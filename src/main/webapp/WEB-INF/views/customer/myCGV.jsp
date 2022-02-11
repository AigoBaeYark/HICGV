<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
   <link rel="stylesheet" 
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>

<body>
<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
</div>
	
<h5>myCGV.jsp</h5>
이곳은 회원정보를 확인하고 수정할 수 있는 myCGVProc.jsp로 이동할 수 있습니다.
<div class="container">
<div class="mycgv-info-wrap">
<div class="sect-person-info">
<div class="">
</div>
</div>
</div>


</div>
<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>

</body>
</html>