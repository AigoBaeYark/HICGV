<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<title>ticket/ticket</title>
</head>
<body>
<div style="height: 300px;">
<c:import url="../common/header.jsp"></c:import>
</div> 
<!-- 아래 JSTL추가수정  -->
<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
        

		<!-- Contents Area -->
		 <div id="contents" class="">
        
        <!-- SECTION -->
		<section>
			<div id="sec">

				<!-- date -->
			
				<div>
					<div class="swiper-container">
						<div class="swiper-wrapper">
						</div>
						<!-- Add Pagination -->
						<div class="swiper-pagination"></div>
					</div>
				</div>
				<!-- date 끝 -->


				<div id="secMidTitle">
					<div class="dname">
						<img alt="" src="../resources/images/movieSelect/ms1.png">
					</div>
					<div class="divc">
						<img alt="" src="../resources/images/movieSelect/ms2.png">
					</div>
					<div class="divT">
						<img alt="" src="../resources/images/movieSelect/ms3.png">
					</div>
					<div class="divT2">
						<img alt="" src="../resources/images/movieSelect/ms4.png">
					</div>
				</div>

				
				<div id="secMain">
				<c:forEach items="${ticket }" var="tic">
					<!-- 받아온 영화제목 -->
					<c:if test="${not empty tic.title_kor }">
						<input type="hidden" value="${tic.title_kor }" id="selectMovieName">
					</c:if>

					<!-- 영화제목 선택 -->
					<div class="sname s">
						<table class="sul">

								<tr class="movietitle">
									<td class="mtd1">
										<span class="ico-grade grade-${tic.age_limit }">${tic.age_limit}</span> 
									</td>
									<td class="mtitle mtd" title="${tic.title_kor }">${tic.title_kor }</td>
								</tr>	
						</table>
					</div>
				</c:forEach>

					<!-- 영화 지역선택 -->
					<div class="s s1">
						<table class="sul" id="theaterNameSelect">
							<c:forEach items="${biglocal}" var="bigloc">
								<tr class="loc">
									<td class="mtd">${bigloc.theater_loc}</td>
								<tr>
							</c:forEach>
						</table>
					</div>



					<!-- 영화 지역에 따른 영화관 선택 -->
					<div class="s3 s2">
						<table class="sul" id="cinemaNameSelect">
							<c:forEach items="${local}" var="loc">
								<tr class="loc">
									<td class="mtd">${loc.location_name}</td>
								<tr>
							</c:forEach>
						</table>
					</div>


					<!-- 날짜선택  -->
					<div class="s s4">
					<img class="corn3" alt="" src="../resources/images/movieSelect/pop_cornT.png">
						<table class="sul" id="movieDateSelect">
						</table>
					</div>


					<!-- 시간선택  -->
					<div class="s s5">
					<img class="corn4" alt="" src="../resources/images/movieSelect/pop_corn_D.png">
						<table class="sul" id="movieTimeSelect">
							<c:forEach items="${time}" var="ti">
								<tr class="loc">
									<td class="mtd">${ti.room_name}</td>
									<td class="mtd">${ti.max_seat}</td>
									<td class="mtd">${ti.start_date}</td>
								<tr>
							</c:forEach>
						</table>
					</div>

					<form action="../member/movieLogin" id="frm" method="post">
						 <img id="btn" alt="" src="../resources/images/movieSelect/seat.png"> 
					</form>


				</div>
			</div>
		</section>    
           	
		</div>
	</div>		
								
							
<div style="clear: both;">
<c:import url="../common/footer.jsp"></c:import>
</div>
</body>
</html>