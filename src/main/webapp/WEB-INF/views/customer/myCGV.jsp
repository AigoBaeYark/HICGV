<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" href="resources/css/reset.css" />
<title>Insert title here</title>

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
${myCGV.id }
<div class="">

</div>
</div>
</div>


</div>
<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</body>
</html>