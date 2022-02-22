<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path }/resources/css/reset.css" />
<link rel="stylesheet" href="${path }/resources/css/main/main.css" />

<%-- <link href="${path }/resources/css/main/swiper-bundle.min.css">
<script src="${path }/resources/js/main/swiper.min.js"> --%>

<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


<title>main</title>
</head>
<body>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
	

	
	
	<a href="header">header</a>
	<a href="seatTest">seatTest</a>
	<a href="moviesAdmin">moviesAdmin</a>

	<!-- 메뉴 아래 신규영화 영상 -->
	<div id="ctl00_PlaceHolderContent_divMovieSelection_wrap"
		class="movieSelection_wrap">
			<div class="contents">
		<% if(session.getAttribute("id")!=null){ %>
		<p style="color: #fff;"><%=session.getAttribute("id") %> 님 안녕하세요</p>
		<%} %>
			<div class="video_wrap"
				style="overflow: hidden; position: relative; width: 100%; height: 100%;clear:both;">
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
			style="margin: 0 auto; width: 980px; height: 100%">
			<div class="movieChartBeScreen_btn_wrap">
				<div class="tapBtn_wrap" style="display: inline-flex;">
					<!-- 차트, 예정작 선택버튼 -->
					<h3>
						<a href="" class="active" id="btnMovie">무비차트</a>
					</h3>
					<h3>
						<a href="" id="btnReserMovie">상영예정작</a>
					</h3>
				</div>
				<a href="movies" class="btn_Allview" style="float: right;">전체보기</a>
			</div>

			<!-- 무비차트 스와이퍼 -->


			<div class="swiper-container swiper " id="movieChart_list"
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
										class="btn_movieChart_detail">상세보기</a>
									<!-- 영화테이블 참조 -->
									<a href="" class="btn_movieChart_ticketing">예매하기</a>
									<!-- 예매테이블 참조 -->
								</div>
							</div>
							<!-- img_wrap 끝 -->

							<!-- movie_info_wrap 시작 -->
							<div class="movie_info_wrap">
								<!-- 영화 이름, 에그(추천?), 예매율 -->
								<strong class="movieName">${mov.title_kor }</strong>
								<!-- 영화테이블 참조 -->
								<span><img src="" alt="골든에그/에그" />에그퍼센트</span> <span>예매율
									${mov.booking_rate }%</span>
							</div>
							<!-- movie_info_wrap 끝 -->

						</div>
					</c:forEach>
				</div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>
	</div>

	<%-- <c:forEach items="${movieList }" var="list">
		<div>
			<img src="${list.poster }" alt="" /> <span>${list.description }</span>
		</div>

	</c:forEach> --%>



	<script>
		var num;
		var movieChartSwiper = 	new Swiper("#movieChart_list",{
			slidesPerView: 5,	//한번에 5페이지
			spaceBetween: 35,	//각 영화포스터 사이간격
			slidesPerGroup: 1,	//버튼 누르면 바뀌는 갯수
			//슬라이드 버튼
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			}
		});
		
		function mover(rank) {
			//alert("hgi");
			//alert(rank);
			
			//마우스올려놓으면 그 포스터의 버튼 선택됨
			document.getElementsByClassName("movieChart_btn_wrap")[rank-1].style.display="inline";
		}
		
		function mout(rank) {
			//alert("hgi");
			//alert(rank);
			
			//마우스올려놓으면 그 포스터의 버튼 선택됨
			document.getElementsByClassName("movieChart_btn_wrap")[rank-1].style.display="none";
		}
		
		
	</script>


</body>
<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>
</html>