<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../common/header.jsp"></c:import>
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/main/style-starter.css" />
<link rel="stylesheet" href="resources/css/movies/movies.css" />
<script src="resources/js/main/easyResponsiveTabs.js"></script>
<script src="resources/js/main/owl.carousel.js"></script>
<script src="resources/js/main/main.js"></script>
<script src="https://kit.fontawesome.com/7bb79fa442.js" crossorigin="anonymous"></script>

<title>hicgv/movies</title>
</head>
<body>




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
        </div>

         
 <section class="w3l-albums py-5" id="projects">
	<div class="container py-lg-4">
		<div class="row">
			<div class="col-lg-12 mx-auto">
				<!--Horizontal Tab-->
				<div id="parentHorizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list hor_1">
						
						<div class="clear"></div>
					</ul>
					<div class="resp-tabs-container hor_1" style="border-color: rgb(193, 193, 193);">
						<h2 class="resp-accordion hor_1 resp-tab-active" role="tab" aria-controls="hor_1_tab_item-0" style="background: none; border-color: rgb(193, 193, 193);"><span class="resp-arrow"></span>Recent Movies</h2><div class="albums-content resp-tab-content hor_1 resp-tab-content-active" aria-labelledby="hor_1_tab_item-0" style="display:block">
							<div class="row">
							<c:forEach items="${movies }" var="mov">
								<div class="col-lg-4 new-relise-gd mt-lg-0 mt-0">
									<div class="slider-info">		
										<div class="img-circle">
											<a href="moviesdetailview?movie_id=${mov.movie_id }">
												<img src="resources/img/theater/${mov.age_limit }.png" style="position: absolute; width: 25px; height: 25px;">
												<img src="${mov.image_url }" class="img-fluid" alt="author image">
											</a>
										</div>
										<div class="message">
										<c:if test="${mov.ranking <= 10  && mov.ranking != 0 }">
											<strong class="rank">No.${mov.ranking }</strong>
										</c:if>
											
											<a class="author-book-title">${mov.title_kor }</a>
											
											
											<h4> <span class="post">
												
													<div class="box-contents">
														<a href="moviesdetailview?movie_id=${mov.movie_id }">
															<strong class="title">상세보기</strong>
														</a>
													</div>
													<div class="txt-info">
														 <strong>open : ${mov.opening_date } </strong>
													</div>
													 <div class="like"> 
														<a class="link-reservation" href="ticket">예매</a>
													 </div> 
													 
												</span>

												<span class="post fa fa-heart text-right"></span>
											</h4>
											</div>
										</div>
										 
										</div>
										</c:forEach>	
											
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>
       
       
    
   </div>         
 </div> 
 </div> 
 
 
<c:import url="../common/footer.jsp"></c:import>

</body>
</html>