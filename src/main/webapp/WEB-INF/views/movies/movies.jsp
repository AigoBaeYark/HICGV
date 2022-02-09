<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/movies/movies.css" />
<title>hicgv/movies</title>
</head>
<body>

<div style="height: 300px;">
<c:import url="../common/header.jsp"></c:import>
</div> 
<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        
        <!-- Contents Area -->
		 <div id="contents" class="">
		 
		 <!-- Contents Start -->
		 
<!-- 실컨텐츠 시작 -->
    <div class="wrap-movie-chart">
        <!-- Heading Map Multi -->
        <div class="tit-heading-wrap">
            <h3>무비차트</h3>
        	<div class="submenu">
            	 <ul>
              	  <li class="on"><a href="/movies/" title="선택">무비차트</a></li>
               	  <li><a href="/movies/pre-movies.aspx">상영예정작</a></li>
             	</ul>
       		</div>
        </div>
         <!-- //Heading Map Multi -->
        <!-- Sorting -->
        <div class="sect-sorting">
             <div class="nowshow">
                  <input type="checkbox" id="chk_nowshow" />
                <label for="chk_nowshow">현재 상영작만 보기</label>                
            </div>
            <label for="order_type" class="hidden">정렬</label>
            <select id="order_type" name="order-type">
				<option title="현재 선택됨" selected value="1">예매율순</option>
                <option value="2">평점순</option>
                <option value="3">관람객순</option>
            </select>
            <button type="button" class="round gray"><span>GO</span></button>
        </div>
        <!-- //Sorting -->    
        <div class="sect-movie-chart">
            <h4 class="hidden">
                무비차트 - 예매율순
            </h4>       
            <ol>
            	 <c:forEach items="${movies }" var="mov">
                <li>
                    <div class="box-image" >
                        <strong class="rank">No.${mov.ranking }</strong>	
                        <%-- <a href="http://www.cgv.co.kr/movies/detail-view/?midx=${mov.movie_id }"> --%>
                        <a href="moviesdetailview?movie_id=${mov.movie_id }">
                            <span class="thumb-image">
                                <img src="${mov.image_url}" alt="포스터" onerror="errorImage(this)"/>
                                <span class="ico-grade grade-${mov.age_limit }">${mov.age_limit}</span>
                            </span>
                        </a>
                    <div class="box-contents">
                        <a href="moviesdetailview?movie_id=${mov.movie_id }">
                            <strong class="title">${mov.title_kor }</strong>
                        </a>
                        <div class="score">
                            <strong class="percent">예매율<span>${mov.booking_rate }</span></strong>
                            <div class='egg-gage small'>
                                <span class='egg great'></span>
                                <span class='percent'>92%</span>
                            </div>
                        </div>
					</div>
                    <div class="txt-info">
                         <strong> ${mov.opening_date } <span>재개봉</span>
                        	 <em class="dday">D-2</em>
                         </strong>
                     </div>
            
                     <div class="like"> 
                        <a class="link-reservation" href="#">예매</a>
                     </div>  
                   </div>  
                   
                </li>
                
            </ol>
            </c:forEach> 
                 
       </div>
   </div>         
 </div> 
  </div> 
<c:import url="../common/footer.jsp"></c:import>

</body>
</html>