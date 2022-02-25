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

	<div class="container" >
		<form action="" method="post">
		
			<table>
				<tr>
					<td>
						<label for="movie_title_kor">영화 제목(국문)</label>
						<input type="text" name="movie_title_kor" value="${movieInfo.title_kor }" placeholder="영화 제목(국문)" />
					</td>
					<td>
						<label for="movie_title_eng">영화 제목(영문)</label>
						<input type="text" name="movie_title_kor" value="${movieInfo.title_eng }" placeholder="영화 제목(영문)" />
					</td>
					<td>
						<label>영화 상영시간</label>
						<input type="number" name="running_time" value="${movieInfo.running_time }" placeholder="상영시간(분)ex-2시간30분 - 150" required/>
					</td>
				</tr>
				
				<tr>
					<td colspan="3">
						<label>영화 배우 (국문)</label>
						<input type="text" name="actors" value="${actors }" placeholder="영화배우명 (국문)" required style="width: 70%"/>	
					</td>
				</tr>
				
				<tr>
					<td colspan="3">
						<label>영화 배우 (영문)</label>
						<input type="text" name="actorsEn" value="${actorsEn }" placeholder="영화배우명 (영문)" required style="width: 70%"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="1">
						<label>감독 (국문)</label>
						<input type="text" name="director" value="${director }" placeholder="감독명 (국문)" required/>
					</td>
					
					<td colspan="1">
						<label>감독 (영문)</label>
						<input type="text" name="directorEn " value="${directorEn }" placeholder="감독명 (국문)" required/>
					</td>
				</tr>
				
				<tr>
					<td>
						<label for="age_limit">관람 등급</label>
						<select id="age_limit" name = "age_limit">
							<option id="all" value="전체 관람가">전체 관람가</option>
							<option id="12" value="12세 관람가">12세 관람가 </option>
							<option id="15" value="15세 관람가">15세 관람가</option>
							<option id="18" value="청소년 관람불가">청소년 관람불가</option>
						</select>
						<input type="hidden" name="age" value="${movieInfo.age_limit }"/>
					</td>
					
					<td>
						<label for="opening_date">영화 개봉일자</label>
						<input type="date" name="opening_date" required value="${movieInfo.opening_date }"/>
					</td>
				</tr>
				<tr>
					<td colspan="1">
						<label for="movie_id">영화코드</label>
						<input type="text" name="movie_id" value="${movieInfo.movie_id }" readonly="readonly" /> <input type="button" id="checkIdBtn" value="중복검사"/>
					</td>
					
					<td>
						<input type="button" value="DB에  영화정보 등록" style="border: 1px solid #aaa;"/>
					</td>
				</tr>
				
			</table>
		
			
			<div id="posterWrap" style="float: right;">
				영화 포스터 <img src="${poster }" name="poster"> 
			</div>
			
			
 		</form>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			console.log($('input[name=age]').val() );
			console.log($('#age_limit').val());
			
			if ($('input[name=age]').val() === ('12세이상관람가')) {
				$('#12').attr('selected','selected');
			}else if ($('input[name=age]').val() === ('15세이상관람가')) {
				$('#15').attr('selected','selected');
			}else if ($('input[name=age]').val() === ('18세이상관람가')) {
				$('#18').attr('selected','selected');
			}else if ($('input[name=age]').val() === ('전체관람가')) {
				$('#all').attr('selected','selected');
			}
			
			console.log($('#age_limit').val());

		})
		
		$('#checkIdBtn').on('click', function () {
			console.log($('input[name=movie_id]').val());
			var movieId = $('input[name=movie_id]').val();
			$.ajax({
				type: "get",
				url: "checkDuplicationMovie",
				data: {
					'movie_id' : movieId
				},
				success: function (data) {
					console.log(data);
					if (data === '미등록 영화') {
						
					}
					alert('미등록 영화');
				},
				error: function(data) {
					console.log(data);
					alert('이미 DB에 등록된 영화입니다.')
				}
			})
		})
	
	</script>


	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</body>
</html>