<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="../common/header.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/theater/boot.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/ticket/ticket.css" />

<title>ticket/ticket</title>
</head>
<body>

	<!-- 아래 JSTL추가수정  -->
	<!-- Contaniner -->
	<div id="contaniner" class="">
		<!-- 배경이미지가 없을 경우 class 삭제  -->

		<!-- Contents Area -->
		<div id="contents" class="">
			<a href="ticketseat">ticketseat</a> <a href="getdate">getdate </a>

			<!-- SECTION -->
			<section>
			<div id="sec">
				<div id="secMain">
					<div class="row" id="secSelect">
						<div class="col-3 movie-category">
							<p style="text-align: center;">영화1</p>
							<c:forEach items="${moviesList }" var="tic">
								<div class="row justify-content-around " id="MovieTab"
									role="tablist">
								
									<a
										class="list-group-item list-group-item-action list-group-item-movie"
										id="list-movie" data-bs-toggle="list" href="#list-movie"
										role="tab" aria-controls="list-movie"> <input
										type="hidden" value="${tic.movie_id}" /> <span
										class="ico-grade grade-${tic.age_limit}">${tic.age_limit}</span>
										<span style="margin-left: 15px;" id="movieTitle">${tic.title_kor}</span></a>
								</div>
							</c:forEach> 
						</div>

						<div class="col-2">
							<p style="text-align: center;">지역2-1</p>
							<!-- 지역 -->
							<div class="list-group" id="locTap" role="tablist">
								<div class="row justify-content-around">
									<!-- 이거 추가하면 검은색으로 바뀜 -->
									<c:forEach items="${local}" var="loc">
										<a
											class="list-group-item list-group-item-action list-group-item-local"
											id="list-seoul" data-bs-toggle="list" href="#list-seoul"
											role="tab" aria-controls="movieTitle"> <input
											type="hidden" value="${loc.theater_id}" />${loc.theater_loc}
										</a>
									</c:forEach> 
								</div>

							</div>
						</div>


						<div class="col-2">
							<p style="text-align: center;">상영관2-2</p>
							<!-- 상영관 -->
							<!-- 지역 클릭시 상영관 생성 -->
							<c:forEach items="${theaterlocal }" var="theloc">
								<div
									class="row justify-content-around theaterId-${theloc.theater_id }"
									id="theaterId-${theloc.theater_id }" role="tablist"
									style="display: none;">
									<c:if test="${theloc.theater_id eq 1 }">
										<div id="loc-${theloc.theater_id }">
											<a
												class="list-group-item list-group-item-action list-group-item-theater"
												id="list-theater" data-bs-toggle="list" href="#list-theater"
												role="tab" aria-controls="list-theater"> <input
												type="hidden" value="${theloc.theater_id }" /> <span
												id="movieTheater"> ${theloc.location_name } </span>
											</a>
										</div>
									</c:if>
									<c:if test="${theloc.theater_id eq 2 }">
										<div id="loc-${theloc.theater_id }">
											<a
												class="list-group-item list-group-item-action list-group-item-theater"
												id="list-theater" data-bs-toggle="list" href="#list-theater"
												role="tab" aria-controls="list-theater"> <input
												type="hidden" value="${theloc.theater_id }" /> <span
												id="movieTheater"> ${theloc.location_name } </span>
											</a>
										</div>
									</c:if>
									<c:if test="${theloc.theater_id eq 3 }">
										<div id="loc-${theloc.theater_id }">
											<a
												class="list-group-item list-group-item-action list-group-item-theater"
												id="list-theater" data-bs-toggle="list" href="#list-theater"
												role="tab" aria-controls="list-theater"> <input
												type="hidden" value="${theloc.theater_id }" /> <span
												id="movieTheater"> ${theloc.location_name } </span>
											</a>
										</div>
									</c:if>
									<c:if test="${theloc.theater_id eq 4 }">
										<div id="loc-${theloc.theater_id }">
											<a
												class="list-group-item list-group-item-action list-group-item-theater"
												id="list-theater" data-bs-toggle="list" href="#list-theater"
												role="tab" aria-controls="list-theater"> <input
												type="hidden" value="${theloc.theater_id }" /> <span
												id="movieTheater"> ${theloc.location_name } </span>
											</a>
										</div>
									</c:if>
									<c:if test="${theloc.theater_id eq 5 }">
										<div id="loc-${theloc.theater_id }">
											<a
												class="list-group-item list-group-item-action list-group-item-theater"
												id="list-theater" data-bs-toggle="list" href="#list-theater"
												role="tab" aria-controls="list-theater"> <input
												type="hidden" value="${theloc.theater_id }" /> <span
												id="movieTheater"> ${theloc.location_name } </span>
											</a>
										</div>
									</c:if>
								</div>
							</c:forEach>
						</div>

						<div class="col-2">
							<p style="text-align: center;">날짜선택3</p>
							<p style="text-align: center;">2022년</p>
							<p style="text-align: center;">2월</p>
							<%-- <c:forEach items="${ticketday }" var="ticd"> --%>
							<div class="list-group" id="dateTab" role="tablist">
								<div class="row justify-content-around">
									<!-- 이거 추가하면 검은색으로 바뀜 -->
									<a
										class="list-group-item list-group-item-action  list-group-item-date"
										id="list-day15-list" data-bs-toggle="list" href="#list-day15"
										role="tab" aria-controls="list-day15">15(화)<input
										type="hidden" value="15" /></a> <a
										class="list-group-item list-group-item-action  list-group-item-date"
										id="list-day16-list" data-bs-toggle="list" href="#list-day16"
										role="tab" aria-controls="list-day16">16(수)<input
										type="hidden" value="16" /></a> <a
										class="list-group-item list-group-item-action  list-group-item-date"
										id="list-day17-list" data-bs-toggle="list" href="#list-day17"
										role="tab" aria-controls="list-day17">17(목)<input
										type="hidden" value="17" /></a>
								</div>
							</div>
						</div>


						<div class="col-3">
							<p style="text-align: center;">시간선택4</p>
							<div class="tab-content" id="nav-tabContent listLoc">
								<div class="tab-pane fade show active" id="timeList"
									role="tabpanel" aria-labelledby="list-time">
									<c:forEach items="${ticketday}" var="tday">
										<c:if test="${tday.day eq 15 }">
											<ul>
												<li><a
													href="getdate?movieid=${tday.movie_id }&theaterid=${tday.theater_id }&locid=${tday.location_id }&day=15">
														<!-- 에이태그 사용X 어떻게 수정할까..?
								1안. 겟데이트를 티켓jsp에 추가로 넣어서 붙여넣기..? 
								2안. 모든데이터 한꺼번에
								 --> <span> ${tday.room_name } </span> <span>
															${tday.location_name } </span> <span> ${tday.starttime }
													</span> <span> ${tday.max_seat } </span> <span>
															${tday.start_date } </span>
												</a></li>
											</ul>
										</c:if>
									</c:forEach>
									<hr>

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<script>
			/* $(document).on('ready',function () {
				// 기존 html 주석 처리된 부분 대체 이며, 
				// c:foreach 로 그리기 위해 가져오던 데이터 부분
				var getMovieFullData = function () {
					var result;
					$.ajax({
						type : "GET",
						url : "findTicketInformation",
						async: false,
						data : {
						},
						success : function(data) {
							result = data;
						},
						error : function(err) {
							console.log(err)
						}
					});
					
					return result;
				}
				
				var fullData = getMovieFullData();
				console.log(fullData);
				
				var movies = fullData.moviesList;
				
				movies.forEach(function(row, index){
					var html = getMovieRowHtml(row);
					
					$('.movie-category').append(html);
				});
				
				
				function getMovieRowHtml(row){
					return '<div class="row justify-content-around " id="MovieTab" role="tablist">' +
								'<a class="list-group-item list-group-item-action list-group-item-movie" id="list-movie"' +  
									'data-bs-toggle="list" href="#list-movie" role="tab" aria-controls="list-movie">' +
									'<input type="hidden" value="' + row.movie_id + '" />' +
									'<span class="ico-grade grade-' + row.age_limit + '">' + row.age_limit + '</span>' +
									'<span style="margin-left: 15px;" id="movieTitle">' + row.title_kor + '</span>' +
								'</a>' +
							'</div>';
				}
				
			}) */
				
				var movieCd = ""; //영화코드
				var theaterId = ""; //지역코드
				var locId = "" //영화관 id
				var date = "" //선택한 날짜

				/* $(document).one('ready',function () {
					$('#locTap').hide();	//페이지 처음 불러올때 지역만 보임 
				}) */

				$('.movie-category').find('.movie').click(function() {
					// 영화의 종류에 따라 지역이 달라지기에 초기화 시켜줌.
					clearAreaHtml();

					// ajax 를 통해 서버에서 영화에 맞는 지역을 불러옴.

					var areaList = [];

					// 영화에 맞는 지역을 불러와 노드 구현.
					areaList.forEach(function(item, index) {
						// 지역의 id 를 부여하여줌.
						var id = 1; // << 지역의 id pk 값

						var area = getAreaHtml(id);

						$('.movie-area').append(area);
					});

				});

				function clearAreaHtml() {
					$('.movie-area').html('');
				}

				function getAreaHtml(id) {
					return '<a class="list-group-item list-group-item-action list-group-item-local" id="area-' + id + '"' + 
		 		'data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="movieTitle">지역</a>';
				}

				//영화 누른 밸류 가져오기  (영화 선택 중복 방지)
				$('.list-group-item-movie').click(function() {

					$('.list-group-item-movie').each(function(i) {
						$(this).removeClass('active');
					})
					$(this).addClass('active');

					$(this).siblings().append('hihihihi');
					//$(this).addClass('active');
					console.log($(this).children('#movieTitle').text());//타이틀 가져오기
					console.log($(this).children('input').val()); //콘솔에 맞게 입력되었는지 확인 후 
					movieCd = $(this).children('input').val(); // 값 지정해주기
					console.log('값넣음 ' + movieCd);
				})

				//지역 누른 밸류 가져오기 (지역 선택 중복 방지)
				$('.list-group-item-local')
						.click(
								function() {
									//영화관 값 없음 -> 지역 선택 안 됨
									//영화관 값 없음  or 지역 값 없음 -> 영화관 선택 안 됨
									//영화관 값 없음  or 지역 값 없음 or 영화관 값 없음 -> 날짜 선택 안 됨

									//상영관을 전부 히든 혹은 display=none
									//지역을 선택하면 안의 input에서 value를 가져옴
									//가져온 value에 해당하는  
									//hidden 속성 없애기 or display = true 해야할 것 같음
									// +) hidden으로 하면 공간은 그대론데 사라지는거라 display:none  <-> block로 구현해보기

									if (movieCd == '' || movieCd == null) {
										alert('영화를 선택하세요');
										$(this).removeClass('active');
									} else {
										$(this).addClass('active').siblings()
												.removeClass('active');
										console.log($(this).text());
										console.log($(this).children().val());
										theaterId = $(this).children('input')
												.val();
									}

									if (theaterId == 1) {
										$('.theaterId-1')
												.each(
														function(i) {
															$('.theaterId-1')[i].style.display = 'block';
														})
										$('.theaterId-2')
												.each(
														function(i) {
															$('.theaterId-2')[i].style.display = 'none';
														})

										$('.theaterId-3')
												.each(
														function(i) {
															$('.theaterId-3')[i].style.display = 'none';
														})

										$('.theaterId-4')
												.each(
														function(i) {
															$('.theaterId-4')[i].style.display = 'none';
														})

										$('.theaterId-5')
												.each(
														function(i) {
															$('.theaterId-5')[i].style.display = 'none';
														})

									}

									if (theaterId == 2) {
										$('.theaterId-1')
												.each(
														function(i) {
															$('.theaterId-1')[i].style.display = 'none';
														})
										$('.theaterId-2')
												.each(
														function(i) {
															$('.theaterId-2')[i].style.display = 'block';
														})

										$('.theaterId-3')
												.each(
														function(i) {
															$('.theaterId-3')[i].style.display = 'none';
														})

										$('.theaterId-4')
												.each(
														function(i) {
															$('.theaterId-4')[i].style.display = 'none';
														})

										$('.theaterId-5')
												.each(
														function(i) {
															$('.theaterId-5')[i].style.display = 'none';
														})

									}

									if (theaterId == 3) {
										$('.theaterId-1')
												.each(
														function(i) {
															$('.theaterId-1')[i].style.display = 'none';
														})
										$('.theaterId-2')
												.each(
														function(i) {
															$('.theaterId-2')[i].style.display = 'none';
														})

										$('.theaterId-3')
												.each(
														function(i) {
															$('.theaterId-3')[i].style.display = 'block';
														})

										$('.theaterId-4')
												.each(
														function(i) {
															$('.theaterId-4')[i].style.display = 'none';
														})

										$('.theaterId-5')
												.each(
														function(i) {
															$('.theaterId-5')[i].style.display = 'none';
														})

									}

									if (theaterId == 4) {
										$('.theaterId-1')
												.each(
														function(i) {
															$('.theaterId-1')[i].style.display = 'none';
														})
										$('.theaterId-2')
												.each(
														function(i) {
															$('.theaterId-2')[i].style.display = 'none';
														})

										$('.theaterId-3')
												.each(
														function(i) {
															$('.theaterId-3')[i].style.display = 'none';
														})

										$('.theaterId-4')
												.each(
														function(i) {
															$('.theaterId-4')[i].style.display = 'block';
														})

										$('.theaterId-5')
												.each(
														function(i) {
															$('.theaterId-5')[i].style.display = 'none';
														})

									}

									if (theaterId == 5) {
										$('.theaterId-1')
												.each(
														function(i) {
															$('.theaterId-1')[i].style.display = 'none';
														})
										$('.theaterId-2')
												.each(
														function(i) {
															$('.theaterId-2')[i].style.display = 'none';
														})

										$('.theaterId-3')
												.each(
														function(i) {
															$('.theaterId-3')[i].style.display = 'none';
														})

										$('.theaterId-4')
												.each(
														function(i) {
															$('.theaterId-4')[i].style.display = 'none';
														})

										$('.theaterId-5')
												.each(
														function(i) {
															$('.theaterId-5')[i].style.display = 'block';
														})

									}

								})

				//상영관 누른 밸류 가져오기  (상영관 선택 중복 방지)
				$('.list-group-item-theater').click(
						function() {

							if ((movieCd == '' || movieCd == null)
									|| (theaterId == '' || theaterId == null)) {
								alert('지역을 선택하세요');
								$(this).removeClass('active');
							} else {
								$(this).addClass('active').siblings()
										.removeClass('active');
								console.log($(this).text());
								console.log($(this).children().val());
								locId = $(this).children('input').val()
							}
						})

				/* $(document).one('ready',function () {
					$('#dateTap').hide();	//페이지 처음 불러올때 지역만 보임 
				}) */

				//날짜가져오기 (날짜 선택 중복 방지)
				$('.list-group-item-date').click(
						function() {

							$('.list-group-item-date').each(function(i) {
								$(this).removeClass('active');
							})
							$(this).addClass('active');

							if ((movieCd == '' || movieCd == null)
									|| (theaterId == '' || theaterId == null)
									|| (locId == '' || locId == null)) {
								alert('상영관을 선택하세요');
								$(this).removeClass('active');
							} else {
								$(this).addClass('active').siblings()
										.removeClass('active');
								console.log($(this).text());
								console.log($(this).children().val());
							}
						})

				/*
				var triggerTabList = [].slice.call(document.querySelectorAll('#MovieTab'))
				var triggerTabList2 = [].slice.call(document.querySelectorAll('#locTap'))
				var triggerTabList3 = [].slice.call(document.querySelectorAll('#dateTap'))
				
				triggerTabList.forEach(function (triggerEl) {
				
				 var tabTrigger = new bootstrap.Tab(triggerEl)
				 
				 
				   triggerEl.addEventListener('click', function (event) {
				  alert('click');
				
				  $('#locTap').show();
				   event.preventDefault()
				   tabTrigger.show()
				   
				 })
				})  */
			</script>
		</div>
		<div style="clear: both;">
			<c:import url="../ticket/ticketbuy.jsp"></c:import>
		</div>

		<div class="banner" id="ticket_bottom_banner"
			style="padding-top: 0px;">
			<!-- 흰 배경 -->
		</div>
	</div>


	<div style="clear: both;">
		<c:import url="../common/footer.jsp"></c:import>
	</div>
</body>
</html>