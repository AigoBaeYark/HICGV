<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />

<c:import url="../common/header.jsp"></c:import>

<link rel="stylesheet" href="resources/css/movies/moviesdetailview.css" />
<title>hicgv/moviesdetailview</title> 
</head>
<body>
<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        $ 안에 이름 들 부터 수정해야함, css꾸미기, 내용이 별로 없어서 API내 정보들 끌어올예정
		<!-- Contents Area -->
		 <div id="contents" class="">
         
            <!-- Contents Start -->

<!-- 실컨텐츠 시작 -->
<div class="wrap-movie-detail" id="select_main">

<h3>영화상세</h3>
<input type="hidden" name="movie_id" value="${moviesdv.movie_id }"/>
<div class="sect-base-movie">
    <h3><strong>${moviesdv.title_kor }</strong>기본정보</h3>
    <div class="box-image">
         <span class="thumb-image"> 
             <img src="${moviesdv.image_url }" alt="포스터 새창" onerror="errorImage(this)"/>
             <span class="ico-grade grade-${moviesdv.age_limit }"> ${moviesdv.age_limit }</span>
         </span>  
    </div>
    <div class="box-contents">
        <div class="title"> 
            <strong>${moviesdv.title_kor }</strong>
            
            <!-- 영화신규내역적기 -->
            <em class="round brown"><span>예매중</span></em>
            <em class="round red"><span>D-8</span></em>
            <p>${moviesdv.title_eng }</p>
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>${moviesdv.booking_rate }</span></strong>
        </div>
        <!-- 떨어지는 얘 이전 요소에 class=on을 넣는다 -->
        <div class="spec">
            <dl>
                <dt>감독 :&nbsp;</dt>
                <!-- <dd><a href="/movies/persons/?pidx=122739">박성후</a></dd> -->
                	<dd>${director.name_kor }</dd> 
                <dd></dd>
				
                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                <c:forEach items="${actor }" var="actor">
                <dd>${actor.name_kor }</dd> 
				</c:forEach>

                <dt>장르 :&nbsp;${moviesdv.genre }</dt> 
                <dd></dd>
                <dt>&nbsp;/ 기본 :&nbsp;</dt>
                <dd class="on">${moviesdv.age_limit },&nbsp;${moviesdv.running_time },&nbsp;${moviesdv.nation }</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on">${moviesdv.opening_date}</dd>
            </dl>
        </div>

	
        <span class="like">
            <a class="link-reservation" href="ticket">예매</a> 
        </span>
    </div>
</div><!-- .sect-base -->
 <div class="cols-content" id="menu">
        <div class="col-detail">
            <!-- 메뉴 클릭시 해당라인으로 이동 -->
            <ul class="tab-menu">
                <li class="on"><a href="#intro"><p>줄거리 </p></a></li>             
                <li><a href="#trailer"><p>트레일러 </p></a> </li>
                <li> <a href="#poster"><p>스틸컷</p></a></li>
            </ul>
            
            <a id="intro"></a>
            <br><br><br>
            <p>줄거리</p>
			<div class="sect-story-movie">
               ${moviesdv.description }
            </div>
 		</div>
 </div>
<!-- 트레일러시작 -->
	<a id="trailer"></a> 
	<div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer">
                <div class="heading">
                    <h4>트레일러</h4><span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count">${trailercnt }건</span><a class="link-more" href="trailer.aspx?midx=85603">더보기</a>
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
                    <h4>스틸컷</h4><span class="count"><strong id="stillcut_current"></strong>${postercnt }건</span><a class="link-more" href="still-cut.aspx?midx=85603">더보기</a>
                </div>
             <c:forEach items="${poster }" var="pos"> <!-- items="poster" 로 써서 오류남 -->
                <div class="slider-wrap">
                    <div class="" id="still_motion">
                        <div class="item-wrap">
                            <div class="item">
                                <img src="${pos.movie_poster_url }" alt="${pos.movie_poster_id }" onerror="errorImage(this)" />
                            </div>
                        </div>
                    </div>  
            	</div><!-- .sect-stillcut -->
			</c:forEach>
	</div>

	</div>
	</div>
</div>	
<div style="clear: both;">
<c:import url="../common/footer.jsp"></c:import>
</div>
</body>
</html>