<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Menu</title>
</head>
<body>



<div id="contents" style="margin: 0 auto;">

	<ul id="admin-menu-list">
		<li>
			<a href="getcustomerList">유저 관리</a>
		</li>
		
		<li> 
			<a href="theaterAdmin">극장 및 상영관리</a>
		</li>
		
		<li>
			<a href="moviesAdmin">영화</a>		
		</li>
		
		<li>
			<a href="storeAdmin">스토어</a>
		</li>
	
	</ul>
</div>





<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>