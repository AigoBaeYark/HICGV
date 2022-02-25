<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="/WEB-INF/views/common/header.jsp"></c:import>


<link rel="stylesheet" href="적용할 css 나 script" />

<title>Movies Admin</title>
</head>
<body>




	<div id="contents" style="margin: 0 auto;">
		<!-- 네이버와 영화진흥위원회 두번 거쳐서 검색해서 중복되는 내용만 나옴 (모든영화는 안나올 듯?) -->
		<!-- 모든 영화 나오게하려면 힘들수도 -->
		<!-- 02_23 문자열 순수 한글, 영어, 숫자만 비교(띄어쓰기도 제거) 검색내용 올라감 -->
		<label for="searchTitle">API 검색할 영화</label> 
		<input type="text" name="searchTitle" id="searchTitle" onkeydown="searchEnterKey()"/> 
			<span> <input type="button" name="searchBtn" id="searchBtn" value="검색" /></span>
			<span> <a href="moviesAdminInputDetail"><input type="button" value="직접입력하기"/></a></span>
	 	<br />
		<strong>검색결과</strong> <br />

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
		$(function() {
			$('#searchBtn').click(searchTitle);
			//$('#searchTitle').keydown(searchEnterKey);
			
		});
		
		function searchEnterKey() {
			
			if(event.keyCode == 13){
				searchTitle();
			}
				
		}
				
			
		

		function searchTitle() {
			alert($('#searchTitle').val());
			var sendTitle = $('#searchTitle').val();
			$('#resultTbody').empty();
			$.ajax({
						type : "get",
						url : "moviesResult",
						contentType : "application/json; charset=UTF-8",
						dataType : "json",
						data : {
							'searchTitle' : sendTitle
						},
						success : function(param) {

							console.log(param[0].title_kor);
							{
								for ( var i = 0 in param) {
									//resultTbody 밑에 검색된 영화 목록 띄우기
									$('#resultTbody')
											.append(
													"<tr> <td>"
															+ param[i].title_kor
															+ "</td> <td>"
															+ "<img src="+param[i].poster+" />"
															+ "</td> <td>"
															+ param[i].description
															+ "</td> <td>"
															+ "<a href=moviesAdminDetail?movie_id="
															+ param[i].movie_id
															+ " > 자세히보기 </a> </td> </tr>");
								}
							}
						},
						error : function() {
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