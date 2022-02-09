<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<title>hicgv/moviesdetailview</title>
</head>
<body>

<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        
		<!-- Contents Area -->
		 <div id="contents" class="">
         
            <!-- Contents Start -->

<!-- 실컨텐츠 시작 -->
<div class="wrap-movie-detail" id="select_main">

<h3>영화상세</h3>
<div class="sect-base-movie">
    <h3><strong>극장판 주술회전 0</strong>기본정보</h3>
    <div class="box-image">
        <a href="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85603/85603_1000.jpg" title="포스터 크게 보기 새창" target="_blank">
            <span class="thumb-image"> 
                <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85603/85603_320.jpg" alt="극장판 주술회전 0 포스터 새창" onerror="errorImage(this)"/>
                <span class="ico-posterdetail">포스터 크게 보기</span>
                <span class="ico-grade grade-15"> 15세 이상</span>
            </span> 
        </a> 
    </div>
    <div class="box-contents">
        <div class="title"> 
            <strong>극장판 주술회전 0</strong>
            
            <em class="round brown"><span>예매중</span></em>
            <em class="round red"><span>D-8</span></em>
            <p>Jujutsu Kaisen: Zero</p>
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>20.0%</span></strong>
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
                <dd><a href="/movies/persons/?pidx=122739">박성후</a></dd>
                
                <dd></dd>

                <dt>&nbsp;/ 배우 :&nbsp;</dt>
                <dd class="on">
                        <a href="/movies/persons/?pidx=111157">오가타 메구미</a>                    
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=115800">하나자와 카나</a>                    
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=122742">코마츠 미카코</a>                    
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=116316">우치야마 코우키</a>                    
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=54378">세키 토모카즈</a>                    
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=112152">나카무라 유이치</a>                    
                        ,&nbsp;
                        <a href="/movies/persons/?pidx=85870">사쿠라이 타카히로</a>                    
                </dd>

                <dt>장르 :&nbsp;애니메이션</dt> 
                <dd></dd>
                <dt>&nbsp;/ 기본 :&nbsp;</dt>
                <dd class="on">15세 이상,&nbsp;105분,&nbsp;일본</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on">2022.02.17</dd>
            </dl>
        </div>
        <span class="screentype">
                <a href="#" class="imax" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a>
                <a href="#" class="forDX" title="4DX 상세정보 바로가기" data-regioncode="4D14">4DX</a>  
        </span>

        <span class="like">
            <!-- 2020.05.07 영화찜하기 -> 프리에그 선택 변경(조회하여 노출) -->
            <a class="link-count" href="javascript:void (0);"><i class="sprite_preegg btn_md default"></i>프리에그</a>
            <a class="link-reservation" href="/ticket/?MOVIE_CD=20028797&MOVIE_CD_GROUP=20028797">예매</a> 
        </span>
    </div>
</div><!-- .sect-base -->

 </div>
</div>
</div>
</body>
</html>