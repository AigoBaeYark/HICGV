<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<%-- <link href="${path }/resources/css/main/swiper-bundle.min.css">
<script src="${path }/resources/js/main/swiper.min.js"> --%>

<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<link rel="stylesheet" href="${path }/resources/css/main/main.css" />
<link rel="stylesheet"
	href="${path }/resources/css/main/style-starter.css" />

<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${path }/resources/js/main/easyResponsiveTabs.js"></script>
<script src="${path }/resources/js/main/owl.carousel.js"></script>
<script src="${path }/resources/js/main/main.js"></script>
<script src="https://kit.fontawesome.com/7bb79fa442.js" crossorigin="anonymous"></script>


<title>main</title>
</head>
<body>

	<!-- 메뉴 아래 신규영화 영상 -->
	<div id="ctl00_PlaceHolderContent_divMovieSelection_wrap"
		class="movieSelection_wrap">
		<div class="contents">
			<%
				if (session.getAttribute("id") != null) {
			%>
			<p style="color: #fff;"><%=session.getAttribute("id")%>
				님 안녕하세요
			</p>
			<%
				}
			%>
			<div class="video_wrap"
				style="overflow: hidden; position: relative; width: 100%; height: 100%; clear: both;">
				<video autoplay="" muted=""
					style=" position: relative;width: 100%;height: 100%;z-index: 0;">
				<source src="${trailer.video }" type="video/mp4"></video>

				${trailer.title } ${trailer.script }

				<div class="movieSelection_video_controller_wrap">
					<a
						href="http://ad.cgv.co.kr/click/CGV/CGV_201401/main@MovieSelection2021?ads_id%3d46468%26creative_id%3d66008%26click_id%3d86299%26maid%3D%26event%3d"
						id="ctl00_PlaceHolderContent_AD_CLIP_DETAIL_URL"
						class="btn_movieSelection_detailView">상세보기</a> <a
						href="https://www.cgv.co.kr/#none"
						id="ctl00_PlaceHolderContent_playStop"
						class="btn_movieSelection_playStop">Stop</a> <a
						href="https://www.cgv.co.kr/#none"
						id="ctl00_PlaceHolderContent_soundOnOff"
						class="btn_movieSelection_soundOnOff">Sound On</a> <input
						name="ctl00$PlaceHolderContent$AD_CNT_URL" type="hidden"
						id="ctl00_PlaceHolderContent_AD_CNT_URL"
						value="http://ad.cgv.co.kr/NetInsight/imp/CGV/CGV_201401/main@MovieSelection2021?ads_id%3d46468%26creative_id%3d66008">
				</div>
			</div>
		</div>
	</div>
	<!-- 메뉴 아래 신규영화 영상 끝-->




	<!-- 무비차트 & 상영예정작 -->



	<div class="movieChartBeScreen_wrap"
		style="clear: none; float: none; position: relative; background-image: linear-gradient(to bottom, rgba(95 211 255), rgba(232, 232, 232, 0.37));">
		<div class="contents"
			style="margin: 0 auto; width: 100%; height: 50%">

			<!-- 무비차트 스와이퍼 -->

			<!-- 기존 스와이퍼 -->
			<%-- <div class="swiper-container swiper " id="movieChart_list"
				style="position: relative; clear: none; float: none; margin: 0 auto;">
				<div class="swiper-wrapper"
					style="tranform: translate3d(0px, 0px, 0px); height: 295px;">
					<c:forEach items="${movie }" var="mov">

						<div class="swiper-slide"
							style="width: 170px; margin-right: 32px; float: left;">

							<div class="img_wrap" data-scale="false"
								onmouseover="mover(${mov.ranking})"
								onmouseout="mout(${mov.ranking})">
								<!-- 영화 포스터 (포스터이미지, 나이, 특수상영관, 버튼)-->
								<img id="poster" src="${mov.image_url }" alt="영화포스터"
									style="width: 100%; height: 234px;" />
								<div class="movieAgeLimit_wrap">
									<img src="" alt="${mov.age_limit }" />
								</div>

								<div class="screenType_wrap">
									<i class="screenType"><img src="" alt="특수상영관" /></i>
									<!-- 특수상영관 갯수만큼 반복 4dx, imax 등 -->
								</div>

								<div class="movieChart_btn_wrap btn_${mov.ranking }"
									style="display: none;">
									<!-- 포스터 위에 마우스 올리면 상새보기 및 예매하기버튼 나옴 -->
									<a href="moviesdetailview?movie_id=${mov.movie_id }"
										class="btn_movieChart_detail" >상세보기</a>
									<!-- 영화테이블 참조 -->
									<a href="" class="btn_movieChart_ticketing" >예매하기</a>
									<!-- 예매테이블 참조 -->
								</div>
							</div>
							<!-- img_wrap 끝 -->

							<!-- movie_info_wrap 시작 -->
							<div class="movie_info_wrap">
								<!-- 영화 이름, 에그(추천?), 예매율 -->
								<strong class="movieName">${mov.title_kor }</strong>
								<!-- 영화테이블 참조 -->
								<span>예매율 ${mov.booking_rate }%</span>
							</div>
							<!-- movie_info_wrap 끝 -->

						</div>
					</c:forEach>
				</div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div> --%>
			
			
			
	<section class="w3l-grids">
		<div class="grids-main py-5">
			<div class="container py-lg-3">
				<div class="headerhny-title">
					<div class="w3l-title-grids">
						<div class="headerhny-left">
							<h3 class="hny-title">예매 순위</h3>
						</div>
						<div class="headerhny-right text-lg-right">
							<h4><a class="show-title" href="movies">전체 보기</a></h4>
						</div>
					</div>
				</div>
				<div class="owl-one owl-carousel owl-theme">
				<c:forEach items="${movie }" var="mov">
					<div class="item vhny-grid">
						<div class="box16 mb-0" onmouseover="onDetail(this)">
							<a href="moviesdetailview?movie_id=${mov.movie_id }">
								<figure>
									<img class="img-fluid" src="${mov.image_url }" >
								</figure>
								
								<div id="age">
									<img src="${path }/resources/img/theater/${mov.age_limit }.png"  style="position: absolute; top: 7px; right: 7px; width: 35px; height: 35px;"/>
								</div>
								<div class="box-content">
									<h1 class="post" style="color: #eee;">${mov.ranking } </h1>
									<span class="post" style="width: 30%"><span class="fa-regular fa-clock" >${mov.running_time } 분 $ </span> </span>
									<span class="post" >상세보기</span>
									
								</div>
							</a>
						</div>
						<h3> <a class="title-gd" href="moviesdetailview?movie_id=${movie_id }">${mov.title_kor }</a></h3>
						<p id="description">${mov.description }</p>
						<div class="button-center text-center mt-4">
							<a href="ticket?movie_id=${mov.movie_id }" class="btn watch-button">예매하기</a>
						</div>

					</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</section>
			
			
			
			
		
		<!-- 영상 슬라이더 -->
	<%-- <section class="w3l-main-slider position-relative" id="home">
		<div class="companies20-content">
			<div class="owl-one owl-carousel owl-theme">
			
				<c:forEach items="${movie }" var="mov">
				<div class="item">
					<li>
						<div class="slider-info banner-view bg bg2" style="background: url('${mov.image_url }')no-repeat center;">
							<div class="banner-info">
								<h3>${mov.title_kor }</h3>
								<!-- <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<span class="over-para"> Consequuntur hic odio
									voluptatem tenetur consequatur.</span></p> --> <!-- 여기에 대충 줄거리 -->
								<a href="#small-dialog1" class="popup-with-zoom-anim play-view1">
									<span class="video-play-icon">
										<span class="fa-solid fa-ticket fa-2x"></span>
									</span>
									<a href="moviesdetailview?movie_id=${mov.movie_id }" style="margin-left: 10px ">상세정보</a>
								</a>
								<!-- dialog itself, mfp-hide class is required to make dialog hidden -->
								<div id="small-dialog1" class="zoom-anim-dialog mfp-hide">
									<img src="${mov.image_url }"></img>
								</div>
							</div>
						</div>
					</li>
				</div>
				</c:forEach>
				
			</div>
		</div>
	</section>  --%>




		</div>
	</div>

	<%-- <c:forEach items="${movieList }" var="list">
		<div>
			<img src="${list.poster }" alt="" /> <span>${list.description }</span>
		</div>

	</c:forEach> --%>



	<script>
	
	
	
	//슬라이더 스크립트
	$(document).ready(function () {
		$('.owl-one').owlCarousel({
			stagePadding:430,
			loop: true,
			margin: 20,
			nav: true,
			responsiveClass: true,
			autoplay: true,
			autoplayTimeout: 5000,
			autoplaySpeed: 1000,
			autoplayHoverPause: false,
			responsive: {
				0: {
					items: 1,
					stagePadding:20,
					nav: false
				},
				480: {
					items: 1,
					stagePadding:40,
					nav: true
				},
				667: {
					items: 1,
					stagePadding:60,
					nav: true
				},
				1000: {
					items: 1,
					nav: true
				}
			}
		})
	})
</script>
<!-- //script -->
<script>
	$(document).ready(function () {
		$('.owl-three').owlCarousel({
			loop: true,
			margin: 20,
			nav: false,
			responsiveClass: true,
			autoplay: true,
			autoplayTimeout: 5000,
			autoplaySpeed: 1000,
			autoplayHoverPause: false,
			responsive: {
				0: {
					items: 2,
					nav: false
				},
				480: {
					items: 2,
					nav: true
				},
				667: {
					items: 3,
					nav: true
				},
				1000: {
					items: 5,
					nav: true
				}
			}
		})
	})
	
	
	
	
		$(document)
				.ready(
						function() {
							$('.movieAgeLimit_wrap')
									.each(
											function(i) {
												if ($(this).children('img')
														.attr('alt') === '12세 관람가') {
													$(this)
															.children('img')
															.attr('src',
																	'resources/img/theater/12세관람가.png');
													$(this).children('img')
															.css('width',
																	'30px');
												}
												if ($(this).children('img')
														.attr('alt') === '15세 관람가') {
													$(this)
															.children('img')
															.attr('src',
																	'resources/img/theater/15세관람가.png');
													$(this).children('img')
															.css('width',
																	'30px');
												}
												if ($(this).children('img')
														.attr('alt') === '18세 관람가') {
													$(this)
															.children('img')
															.attr('src',
																	'resources/img/theater/18세관람가.png');
													$(this).children('img')
															.css('width',
																	'30px');
												}
												if ($(this).children('img')
														.attr('alt') === '전체 관람가') {
													$(this)
															.children('img')
															.attr('src',
																	'resources/img/theater/전체관람가.png');
													$(this).children('img')
															.css('width',
																	'30px');
												}

											})
						})

		var num;
		var movieChartSwiper = new Swiper("#movieChart_list", {
			slidesPerView : 5, //한번에 5페이지
			spaceBetween : 35, //각 영화포스터 사이간격
			slidesPerGroup : 1, //버튼 누르면 바뀌는 갯수
			//슬라이드 버튼
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			}
		});

		$('.img_wrap').on('mouseenter', function() {
			$(this).children('.movieAgeLimit_wrap').css("margin", "10px 0");
			$(this).children('#poster').css("margin", "10px 0");
			//console.log($(this).children('.movieAgeLimit_wrap').children('img[alt]'));
		})

		$('.img_wrap').on('mouseleave', function() {
			console.log();
			$(this).children('.movieAgeLimit_wrap').css("margin", "0 auto");
			$(this).children('#poster').css("margin", "0 auto");
		});

		function mover(rank) {

			document.getElementsByClassName("movieChart_btn_wrap")[rank - 1].style.display = "inline-grid";
		}

		function mout(rank) {

			document.getElementsByClassName("movieChart_btn_wrap")[rank - 1].style.display = "none";

		}
	</script>


</body>
<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>
</html>