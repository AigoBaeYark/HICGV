<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../common/header.jsp"></c:import>
<link rel="stylesheet" href="resources/css/main/style-starter.css" />
<link rel="stylesheet" href="resources/css/movies/moviesdetailview.css" />

<title>hicgv/moviesdetailview</title> 
</head>
<body>
<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
		<!-- Contents Area -->
		 <div id="contents" class="" >
         
            <!-- Contents Start -->

<!-- 실컨텐츠 시작 -->
<div class="wrap-movie-detail" id="select_main" >
<div class="w3l-ab-grids py-5" style="background-color: #E5E7F1;">
		<div class="container py-lg-4">
			<input type="hidden" name="movie_id" value="${moviesdv.movie_id }"/>
			<div class="row ab-grids-sec align-items-center">
				<div class="col-lg-6 ab-right">
					<img class="img-fluid" src="${moviesdv.image_url }" style="width: 100%">
				</div>
				<div class="col-lg-6 ab-left pl-lg-4 mt-lg-0 mt-5">
					<h3 class="hny-title">${moviesdv.title_kor }</h3>
					<h4 class="hny-title">${moviesdv.title_eng } </h4>
					<br><br>
					<p> 연령 : ${moviesdv.age_limit }, &nbsp; 러닝타임 : ${moviesdv.running_time }분 </p>
					<p> 장르 : ${moviesdv.genre}</p>
					<p> 개봉 : ${moviesdv.opening_date}</p>
					<p> 총관람객 : ${moviesdv.audience_total }명, &nbsp; 금일관람객 : ${moviesdv.audience_today }명 </p>
					
					
					
					<div class="ready-more mt-4">
						<a href="ticket" class="btn read-button">예매하기 <span class="fa fa-angle-double-right ml-2" aria-hidden="true"></span></a>
					</div>
				</div>
			</div>
			
			<div class="w3l-counter-stats-info text-center">
				<div class="stats_left">
					<div class="counter_grid">
						<div class="icon_info">
							<a href="#description">
							<p class="counter">줄거리</p>
							<h4>바로가기</h4>
							</a>		
						</div>
					</div>
				</div>
				
				<div class="stats_left">
					<div class="counter_grid">
						<div class="icon_info">
							<a href="#actor">
							<p class="counter">감독/배우</p>
							<h4>바로가기</h4>
							</a>		
						</div>
					</div>
				</div>
				
				<div class="stats_left">
					<div class="counter_grid">
						<div class="icon_info">
							<a href="#trailer">
							<p class="counter">트레일러</p>
							<h4>바로가기</h4>
							</a>		
						</div>
					</div>
				</div>
				<div class="stats_left">
					<div class="counter_grid">
						<div class="icon_info">
							<a href="#poster">
							<p class="counter">스틸컷</p>
							<h4>바로가기</h4>
							</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
 
 
<!-- 소개시작 -->
		<a id="description"></a> 
		<div class="sect-stillcut">
                <div class="heading">
                    <h4>줄거리</h4>
                </div> 
                <div class="slider-wrap">
                    <div class="" id="still_motion">
                        <div class="item-wrap">
                            <div class="item">
                               	${moviesdv.description }
                            </div>
                        </div>
                    </div>  
            	</div>
		</div>

	<a id="actor"></a> 
		<div class="sect-stillcut">
                <div class="heading">
                    <h4>감독/배우</h4>
                </div> 
                <div class="slider-wrap">
                    <div class="" id="still_motion">
                        <div class="item-wrap">
                            <div class="item">
                               	감독 : ${moviesdv.director } <br>
                               	배우 : ${moviesdv.actor }
                            </div>
                        </div>
                    </div>  
            	</div>
		</div>
	



	<a id="trailer"></a> 
	<div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer">
                <div class="heading">
                    <h4>트레일러</h4><span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count">${trailercnt }건</span><a class="link-more"></a>
                </div>
           <c:forEach items="${trailer }" var="tra">
                <ul>
                <!-- 사진 동영상 조회 -->
                    <li>
                        <div class="box-image">
                            <!-- TODO : 동영상 팝업 창 작업 후 링크 걸어야 함 //-->
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="200013">
                                <span class="thumb-image">
                                    <img src="${tra.trailer_image_url }" alt="${tra.trailer_title }" onerror="errorImage(this, {'type':'landscape'})"/>
                                    <span class="ico-play">영상보기</span>
                                </span>
                            </a>
                        </div>
                        <div class="box-contents">
                            <a href="#" title="새창" class="movie_player_popup" data-gallery-idx="200013">
                                <strong class="title">
                                    
                                    <span class="ico-trailer hd">HD</span>
                                    ${tra.trailer_title }
                                </strong>
                            </a>
                        </div>
                    </li>
				</ul>
	</c:forEach> 
	</div>
	
		<!-- 스틸컷 -->
		<a id="poster"></a> 
		<div class="sect-stillcut">
                <div class="heading">
                    <h4>스틸컷</h4><span class="count"><strong id="stillcut_current"></strong>${postercnt }건</span><a class="link-more"></a>
                </div>
                <div id="poster-wrap" style="overflow-x: scroll; display: flex;">
                
             <c:forEach items="${poster }" var="pos"> <!-- items="poster" 로 써서 오류남 -->
                <div  style="">
                    <div  id="still_motion">
                        <div >
                            <div class="item" style="">
                                <img src="${pos.movie_poster_url }" alt="${pos.movie_poster_id }" onerror="errorImage(this)" style="width: 100%"/>
            	&nbsp;
                            </div>
                        </div>
                    </div>  
            	</div>
			</c:forEach>
			</div>
		</div>
		
		
		

	</div>
	</div>
</div>	
<div style="clear: both;">
<c:import url="../common/footer.jsp"></c:import>
</div>
</body>
</html>