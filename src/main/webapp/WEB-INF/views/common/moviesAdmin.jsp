<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movies Admin</title>
</head>
<body>

	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>

	
	<div id="contents" style="margin: 0 auto;">
		<label for="searchTitle">검색할 영화</label>
		<input type="text" name="searchTitle" id="searchTitle"/> <span><input type="button" name="searchBtn" id="searchBtn" value="검색"/></span>
		<br />
		<strong>검색결과</strong>
		<br />
		
	</div>
	
	<div id="searchResult" style="display: inline; margin: 0 auto;">
			<div class="result_Wrap">
				<table class="table">
						<tr style="text-align: center;">
							<th>제목</th>
							<th>포스터</th>
							<th>줄거리</th>
							<th>DB등록</th>
						</tr>
					<tbody id="resultTbody">
					
					</tbody>
					
				</table>
			</div>
		</div>
	
	
	

	
	<script type="text/javascript">
	
		
		$(function () {
				$('#searchBtn').click(searchTitle);
		});
		
		function searchTitle() {
			alert($('#searchTitle').val());
			var sendTitle = $('#searchTitle').val();
			$('#resultTbody').empty();
			$.ajax({
				type: "get",
				url: "moviesResult",
				contentType: "application/json; charset=UTF-8",
				dataType: "json",
				data: {
					'searchTitle' : sendTitle
				},
				success: function (param) {

					console.log(param[0].title_kor);
					 {for (var i = 0 in param) {
							$('#resultTbody').append("<tr> <td>"+param[i].title_kor +"</td> <td>"+"<img src="+param[i].poster+" />" +"</td> <td>"+param[i].description +"</td>"+"</tr>");
						}
					}
				},
				error: function () {
					$('#resultTbody').append("검색 결과가 없습니다.");

				}
			});
			
		};
			
	
	</script>
	

	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>


</body>
</html>