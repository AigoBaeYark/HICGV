<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/movies/moviesdetailview.css" />
<title>hicgv/moviesdetailview</title> 
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        
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
            
            <em class="round brown"><span>예매중</span></em>
            <em class="round red"><span>D-8</span></em>
            <p>${moviesdv.title_eng }</p>
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>${moviesdv.booking_rate }</span></strong>
            <!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->            
            <div class='egg-gage small'>
               <span class='sprite_preegg default'></span>
               <span class='percent'>99%</span>
            </div>
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
      <!--   <span class="screentype">
                <a href="#" class="imax" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a>
                <a href="#" class="forDX" title="4DX 상세정보 바로가기" data-regioncode="4D14">4DX</a>  
        </span> -->

	
        <span class="like">
            <!-- 2020.05.07 영화찜하기 -> 프리에그 선택 변경(조회하여 노출) -->
            <a class="link-count" href="javascript:void (0);"><i class="sprite_preegg btn_md default"></i>프리에그</a>
            <a class="link-reservation" href="/ticket/?MOVIE_CD=20028797&MOVIE_CD_GROUP=20028797">예매</a> 
        </span>
    </div>
</div><!-- .sect-base -->
 <div class="cols-content" id="menu">
        <div class="col-detail">
            <!-- 메뉴가 선택되면 a 에 title="선택" 이라고 넣는다 -->
            <ul class="tab-menu">
                <li class="on"><a title="현재 선택됨" href="/movies/detail-view/?midx=85603#menu">주요정보 </a></li>             
                <li><a href="/movies/detail-view/trailer.aspx?midx=85603#menu">트레일러</a></li>
                <li><a href="/movies/detail-view/still-cut.aspx?midx=85603#menu">스틸컷</a></li>
                <li><a href="/movies/detail-view/?midx=85603#commentReg">평점/리뷰</a></li>               
                <li class="last"><a href="/movies/detail-view/show-times.aspx?midx=85603#menu">상영시간표</a></li>
            </ul>
			<div class="sect-story-movie">
               ${moviesdv.description }
            </div>
 		</div>
 </div>
<!-- 트레일러시작 -->

	<div id="ctl00_PlaceHolderContent_Section_Trailer" class="sect-trailer">
                <div class="heading">
                    <h4>트레일러</h4><span id="ctl00_PlaceHolderContent_TrailerTotalCount" class="count">3건</span><a class="link-more" href="trailer.aspx?midx=85603">더보기</a>
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
                            <span class="txt-info">2022.02.03</span>
                        </div>
                    </li>
				</ul>
	</c:forEach> 
	</div>
	
		<!-- 스틸컷 -->
		<div id="ctl00_PlaceHolderContent_Section_Still_Cut" class="sect-stillcut">
                <div class="heading">
                    <h4>스틸컷</h4><span class="count"><strong id="stillcut_current">1</strong>/25건</span><a class="link-more" href="still-cut.aspx?midx=85603">더보기</a>
                </div>
             <c:forEach items="${poster }" var="pos"> <!-- items="poster" 로 써서 오류남 -->
                <div class="slider-wrap">
                    <div class="slider" id="still_motion">
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