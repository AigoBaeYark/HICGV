<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>moviesAdminDeatil</title>
</head>
<body>

	<div class="contents">
		<form action="">
			<label>영화코드 </label>
			<input type="text" name="movie_id"/> <span><input type="button" value="중복확인" /></span>
			<br />
			<label>영화제목(국문) </label>
			<input type="text" name="title_kor"/>
			<br />
			<label>영화제목(영문) </label>
			<input type="text" name="title_eng"/>
			<br />
			<div>
				<label for="description" style="">영화 줄거리</label>
				<textarea name="description" id="" cols="30" rows="10"></textarea>
			</div>
		
		</form>
	</div>
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
	
	

</body>
</html>