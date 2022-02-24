<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>moviesAdminDetail</title>
</head>
<body>
	<style>
		div.contents input{margin-bottom: 5px; margin-top: 5px}
	</style>

	<div class="contents" style="margin: 0 auto; width: 980px ;">
		<form action="">
			<label for="movie_id">영화코드</label>
			<input type="number" name="movie_id" value="" placeholder="숫자만 입력 (최대 8자리)" maxlength="8" readonly/>
			<br /> 
			<label for="movie_title_kor">영화 제목(국문)</label>
			<input type="text" name="movie_title_kor" value="" placeholder="영화 제목(국문)" />
			<br />
			<label for="movie_title_eng">영화 제목(영문)</label>
			<input type="text" name="movie_title_kor" value="" placeholder="영화 제목(영문)" />
			<br />
			<label>영화 상영시간</label>
			<input type="number" name="running_time" value="" placeholder="상영시간(분)ex-2시간30분 - 150" required/>
			<br />
			
			<label for="age_limit">관람 등급</label>
			<select id="age_limit" name = "age_limit">
				<option  value="1">전체 관람가</option>
				<option  value="2">12세 관람가 </option>
				<option  value="3">15세 관람가</option>
				<option  value="4">청소년 관람불가</option>
			</select>
			<br />
			<label for="opening_date">영화 개봉일자</label>
			<input type="date" name="opening_date" required/>

			
			
		</form>
	</div>


<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</body>
</html>