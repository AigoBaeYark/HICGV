<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/theater/boot.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/ticket/ticket.css" />

<title>ticket/ticket</title>
</head>
<body>
<div style="height: 300px;">
<c:import url="../common/header.jsp"></c:import>
</div> 
<!-- 아래 JSTL추가수정  -->
<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 배경이미지가 없을 경우 class 삭제  -->
        

		<!-- Contents Area -->
		 <div id="contents" class="">
        
        <!-- SECTION -->
		<section>
			<div id="sec">
				
				
				<div id="secMain">
					<div class="row">
						<div class="col-3">
						<span>영화1</span>
						<c:forEach items="${ticketmovie }" var="tic">
					    <div class="row justify-content-around" id="list-tab" role="tablist">
					      <a class="list-group-item list-group-item-action" id="list-movie-list" data-bs-toggle="list" href="#list-movie" role="tab" aria-controls="list-movie">
					      <span class="ico-grade grade-${tic.age_limit }">${tic.age_limit}</span> 
					      ${tic.title_kor }</a>
					    </div>
					    </c:forEach>
					  </div>
					  
					          
					  <div class="col-2">
					  <span>극장2</span>
					  <!-- 지역 -->
					  <div class="list-group" id="list-tab" role="tablist">
					    <div class="row justify-content-around"> <!-- 이거 추가하면 검은색으로 바뀜 -->
					      <a class="list-group-item list-group-item-action" id="list-seoul-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-seoul">서울</a>
					      <a class="list-group-item list-group-item-action" id="list-gyeonggi-list" data-bs-toggle="list" href="#list-gyeonggi" role="tab" aria-controls="list-gyeonggi">경기</a>
					      <a class="list-group-item list-group-item-action" id="list-incheon-list" data-bs-toggle="list" href="#list-incheon" role="tab" aria-controls="list-incheon">인천</a>
					      <a class="list-group-item list-group-item-action" id="list-gangwon-list" data-bs-toggle="list" href="#list-gangwon" role="tab" aria-controls="list-gangwon">강원도</a>
					      <a class="list-group-item list-group-item-action" id="list-chungcheong-list" data-bs-toggle="list" href="#list-chungcheong" role="tab" aria-controls="list-chungcheong">충청도</a>
					    </div>
					    </div>
					  </div>
					  <!-- 상영관 -->
					  <div class="col-2">
					    <div class="tab-content" id="nav-tabContent"> 	
					      	<div class="tab-pane fade show active" id="list-seoul" role="tabpanel" aria-labelledby="list-seoul-list">
					         <c:forEach items="${tickettheater1 }" var="loc">	
					         <c:if test="${loc.theater_id eq 1 }">
					            <ul>
					               <li><a href="ticket?theaterid=1&locid=${loc.location_id }" >${loc.location_name } </a></li>
					            </ul>
					          </c:if> 
					          </c:forEach>
					    	 </div>
					    	 <div class="tab-pane fade" id="list-gyeonggi" role="tabpanel" aria-labelledby="list-gyeonggi-list">
					         <c:forEach items="${tickettheater1 }" var="loc">
					         <c:if test="${loc.theater_id eq 2 }">
					            <ul>
					               <li><a href="ticket?theaterid=2&locid=${loc.location_id }" >${loc.location_name } </a></li>
					            </ul>
					          </c:if> 
					          </c:forEach>
					    	 </div>
					    	 <div class="tab-pane fade" id="list-incheon" role="tabpanel" aria-labelledby="list-incheon-list">
					         <c:forEach items="${tickettheater1 }" var="loc">
					         <c:if test="${loc.theater_id eq 3 }">
					            <ul>
					               <li><a href="ticket?theaterid=3&locid=${loc.location_id }" >${loc.location_name } </a></li>
					            </ul>
					          </c:if> 
					          </c:forEach>
					    	 </div>
					    	 <div class="tab-pane fade" id="list-gangwon" role="tabpanel" aria-labelledby="list-gangwon-list">
					         <c:forEach items="${tickettheater1 }" var="loc">
					         <c:if test="${loc.theater_id eq 4 }">
					            <ul>
					               <li><a href="ticket?theaterid=4&locid=${loc.location_id }" >${loc.location_name } </a></li>
					            </ul>
					          </c:if> 
					          </c:forEach>
					    	 </div>
					    	 <div class="tab-pane fade" id="list-chungcheong" role="tabpanel" aria-labelledby="list-chungcheong-list">
					        <c:forEach items="${tickettheater1 }" var="loc"> 
					        <c:if test="${loc.theater_id eq 5 }">
					            <ul>
					               <li><a href="ticket?theaterid=5&locid=${loc.location_id }" >${loc.location_name } </a></li>
					            </ul>
					          </c:if>
					          </c:forEach> 
					          </div>
					    	 </div>
					    </div>					  
					  <div class="col-2">
					  <span>날짜선택3</span>
					  <c:forEach items="${ticketday }" var="ticd">
					  <div class="list-group" id="list-tab" role="tablist">
					    <div class="row justify-content-around"> <!-- 이거 추가하면 검은색으로 바뀜 -->
					      <a class="list-group-item list-group-item-action" id="list-date-list" data-bs-toggle="list" href="#list-date" role="tab" aria-controls="list-seoul">아직공란쓰</a>
					    </div>
					    
					   </div>
					   </c:forEach>
					  </div>

						<div class="col-3"> 
						<span>시간선택4</span>
						<c:forEach items="${tickettime}" var="tict">
					    <div class="row justify-content-around" id="list-tab" role="tablist">
					      <a class="list-group-item list-group-item-action" id="list-time-list" data-bs-toggle="list" href="#list-time" role="tab" aria-controls="list-time">
					      ${tict.room_name}
					      </a>
					      <a class="list-group-item list-group-item-action" id="list-time-list" data-bs-toggle="list" href="#list-time" role="tab" aria-controls="list-time">
					      ${tict.max_seat}
					      </a>
					      <a class="list-group-item list-group-item-action" id="list-time-list" data-bs-toggle="list" href="#list-time" role="tab" aria-controls="list-time">
					      ${tict.start_date}
					      </a>
					      
					      <a href="timeSelect?locid=101" title="현재 선택"> 
	                        <span>종료시간</span> 
                       		 </a>
					      <a class="list-group-item list-group-item-action" id="list-time-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-time">
					      ${tict.endTime}
					      </a>
					     
					    </div>
					    </c:forEach>
					  </div>
					  </div>
					</div>
					  	
				
				</div>
				<a href="ticketseat">ticketseat</a>
		</section>   
		 	
		</div>
		
			<div style="clear: both;">
				<c:import url="../ticket/ticketbuy.jsp"></c:import>
			</div>
           	
			
			<div class="banner" id="ticket_bottom_banner" style="padding-top: 0px;">
			<!-- 흰 배경 -->
			</div>
			
	</div>		
								
							
<div style="clear: both;">
<c:import url="../common/footer.jsp"></c:import>
</div>
</body>
</html>