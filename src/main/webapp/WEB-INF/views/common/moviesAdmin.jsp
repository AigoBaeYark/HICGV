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
		<label for="searchTitle">API 검색할 영화</label> <input type="text"
			name="searchTitle" id="searchTitle" /> <span> <input
			type="button" name="searchBtn" id="searchBtn" value="검색"
			onclick="searchTitle()" />
		</span> <span> <a href="moviesAdminInputDetail"><input
				type="button" value="직접입력하기" /></a></span> <span><a href="insertAllActor" ><input type="button" value="영화배우 전부갱신" /> </a></span>
				<span><a href="updateDailyRank"><input type="button" value="최신랭크 갱신 1~10위" /></a></span>
				<br /> <strong>검색결과</strong> <br />

	</div>

	<div id="searchResult" style="display: inline; margin: 0 auto;">
		<div class="result_Wrap">


			<table class="table">
				<tr style="text-align: center;">
					<th style="width: 15%;">제목</th>
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
			$('#searchTitle').keydown(searchEnterKey);

		});
		
		function searchEnterKey() {
			//엔터키 누르면 검색
			if (event.keyCode == 13) {
				console.log('keydown');
				searchTitle();
			}
		};
		
		function searchTitle() {
			//searchTitle 시작
			alert($('#searchTitle').val());
			var sendTitle = $('#searchTitle').val();
			$('#resultTbody').empty();

			$.ajax({	//ajax 시작
						type : "get",
						url : "moviesResult",
						contentType : "application/json; charset=UTF-8",
						dataType : "json",
						data : {
							'searchTitle' : sendTitle
						},
						success : function(param) {
									//success 시작
							for (var i = 0 in param) {
								$('#resultTbody').append(
										"<tr> <td>"
												+ param[i].title_kor
												+ "</td> <td>"
												+ "<img src="+param[i].poster+" />"
												+ "</td> <td name = 'poster' >"
												+ param[i].description
												+ "</td> <td>"
												+ "<input type='submit' value='자세히보기' onclick='goAdminDetail("+i+")' />  <input type='hidden' name='movie_id' value = '"+ param[i].movie_id +"' id = 'mov-"+i+"' />"
												+ "<input type='hidden' name='poster' value = '"+ param[i].poster +"' id = 'pos-"+i+"' /></td> </tr>");
								}
								
							//success 끝
							},
						error : function() {
							$('#resultTbody').append("검색 결과가 없습니다.");
						}
					//ajax끝
					})
			//searchTitle()끝
		};
		
		
		

		
		//goAdminDetail("+i+")
		function goAdminDetail(num) {
			var movieId = $('#mov-' + num).val();
			var poster = $('#pos-' + num).val();
			var description;
			$('.con_tx').each(function(i) {
				if(i == num){
					description = $(this).html();
				}
				
			})
			console.log(movieId);
			console.log(poster);
			console.log(description);
			
			$.ajax({
			type: "post",
			url: "moviesAdminDetail",
			data: {
				'movieId' : movieId,
				'poster' : poster,
				'description' : description
			},
			async : false,
			success: function (param) {
				$('body').html(param);
			},
			error: function() {
				alert('에러');
			}
			
			})
		}; 
	</script>


	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>


</body>
</html>