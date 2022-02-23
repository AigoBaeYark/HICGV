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
						<c:forEach items="${moviesList }" var="tic">
					    <div class="row justify-content-around" id="myTab" role="tablist">
					      <a class="list-group-item list-group-item-action" id="list-movie-list" data-bs-toggle="list" href="#list-movie" role="tab" aria-controls="list-movie">
					      <span class="ico-grade grade-${tic.age_limit }">${tic.age_limit}</span> 
					      <span style="margin-left: 15px;">${tic.title_kor }</span></a>
					    </div>
					    </c:forEach>
					  </div>
					  
					          
					  <div class="col-2">
					  <span>극장2</span>
					  <!-- 지역 -->
					  <div class="list-group" id="locTap" role="tablist">
					    <div class="row justify-content-around"> <!-- 이거 추가하면 검은색으로 바뀜 -->
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-seoul-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-seoul" >서울 <input type="hidden"  value="1"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-gyeonggi-list" data-bs-toggle="list" href="#list-gyeonggi" role="tab" aria-controls="list-gyeonggi" >경기<input type="hidden"  value="2"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-incheon-list" data-bs-toggle="list" href="#list-incheon" role="tab" aria-controls="list-incheon"  >인천<input type="hidden"  value="3"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-gangwon-list" data-bs-toggle="list" href="#list-gangwon" role="tab" aria-controls="list-gangwon"  >강원도<input type="hidden"  value="4"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-chungcheong-list" data-bs-toggle="list" href="#list-chungcheong" role="tab" aria-controls="list-chungcheong"  >충청도<input type="hidden"  value="5"/></a>
					    </div>
					    </div>
					  </div>
					  <!-- 상영관 -->
					  <div class="col-2">
					    <div class="tab-content" id="nav-tabContent listLoc"> 	
					      	<div class="tab-pane fade show active" id="list-seoul" role="tabpanel" aria-labelledby="list-seoul-list">
					         <c:forEach items="${theaterlocal }" var="loc">	
					         <c:if test="${loc.theater_id eq 1 }">
					            <ul>
					               <li><a href="ticket?theaterid=1&locid=${loc.location_id }" >${loc.location_name } </a></li>
					            </ul> 
					          </c:if> 
					          </c:forEach>
					    	 </div>
					    	 <div class="tab-pane fade " id="list-gyeonggi" role="tabpanel" aria-labelledby="list-gyeonggi-list">
					         <c:forEach items="${theaterlocal }" var="theloc">
					         <c:if test="${theloc.theater_id eq 2 }">
					            <ul>
					               <li><a href="ticket?theaterid=2&locid=${theloc.location_id }" >${theloc.location_name } </a></li>
					            </ul>
					          </c:if> 
					          </c:forEach>
					    	 </div>
					    	 <div class="tab-pane fade" id="list-incheon" role="tabpanel" aria-labelledby="list-incheon-list">
					         <c:forEach items="${theaterlocal }" var="theloc">
					         <c:if test="${theloc.theater_id eq 3 }">
					            <ul>
					               <li><a href="ticket?theaterid=3&locid=${theloc.location_id }" >${theloc.location_name } </a></li>
					            </ul>
					          </c:if> 
					          </c:forEach>
					    	 </div>
					    	 <div class="tab-pane fade" id="list-gangwon" role="tabpanel" aria-labelledby="list-gangwon-list">
					         <c:forEach items="${theaterlocal }" var="loc">
					         <c:if test="${theloc.theater_id eq 4 }">
					            <ul>
					               <li><a href="ticket?theaterid=4&locid=${theloc.location_id }" >${theloc.location_name } </a></li>
					            </ul>
					          </c:if> 
					          </c:forEach>
					    	 </div>
					    	 <div class="tab-pane fade" id="list-chungcheong" role="tabpanel" aria-labelledby="list-chungcheong-list">
					        <c:forEach items="${theaterlocal }" var="theloc"> 
					        <c:if test="${theloc.theater_id eq 5 }">
					            <ul>
					               <li><a href="ticket?theaterid=5&locid=${theloc.location_id }" >${theloc.location_name } </a></li>
					            </ul>
					          </c:if>
					          </c:forEach>
					          </div>
					    	 </div>
					    </div>					  
					  <div class="col-2">
					  <span>날짜선택3</span>
					  <p>2022년</p>
					  <p>2월</p>
					  <%-- <c:forEach items="${ticketday }" var="ticd"> --%>
					  <div class="list-group" id="dateTab" role="tablist">
					    <div class="row justify-content-around"> <!-- 이거 추가하면 검은색으로 바뀜 -->
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-day15-list" data-bs-toggle="list" href="#list-day15" role="tab" aria-controls="list-day15"  >15(화) <input type="hidden"  value="15"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-day16-list" data-bs-toggle="list" href="#list-day16" role="tab" aria-controls="list-day16"  >16(수)<input type="hidden"  value="16"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-day17-list" data-bs-toggle="list" href="#list-day17" role="tab" aria-controls="list-day17"  >17(목)<input type="hidden"  value="17"/></a>
					    </div>

					    <%-- <div class="row justify-content-around"> <!-- 이거 추가하면 검은색으로 바뀜 -->
					      <a class="list-group-item list-group-item-action" id="list-date-list" data-bs-toggle="list" href="#list-date" role="tab" aria-controls="list-seoul">아직공란쓰</a>
					      <ul>
					        <li><a href="tictimeSelect1?locid=${ticd.location_id }" >${ticd.day } test<input type="hidden"  value="15일"/></a></li>
					      </ul>
					      <ul>
					      	<li>
					      </ul>
					    </div> --%>				
					   </div>
					   <%-- </c:forEach> --%>
					  </div>

						<div class="col-3"> 
						<span>시간선택4</span>
						<c:forEach items="${ticketday}" var="ticday">
					    <div class="row justify-content-around" id="list-tab" role="tablist">
					      <a class="list-group-item list-group-item-action" id="list-time-list" data-bs-toggle="list" href="#list-time" role="tab" aria-controls="list-time">
					         <c:if test="${ticday.day eq 15 }">
					            <ul>
					               <li><a href="ticket?=${ticday.theater_id }&locid=${ticday.location_id }&day=${ticday.day}" >
					               	<span>
					               	${ticday.room_name }
					               	</span>
					               	<span>
					               	${ticday.location_name }
					               	</span>
					               	<span>
					               	${ticday.starttime }
					               	</span>
					               	<span>
					               	${ticday.max_seat }
					               	</span>
					               	<span>
					               	${ticday.start_date }
					               	</span>
									</a></li>
					            </ul>
					          </c:if> 
					          </c:forEach>
					      </a>
					      
					      <c:forEach items="${tickettime}" var="ticday">
					      <span>종료시간</span> 
					      <a class="list-group-item list-group-item-action" id="list-time-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-time">
					      ${ticday.endTime}
					      </a>
					     
					    </div>
					    </c:forEach>
					  </div>
					  </div>
					</div>
					  	
				
				</div>
				<a href="ticketseat">ticketseat</a>
		</section>   
		 	
		 	<script>
		 	
		 	
		 	$(document).one('ready',function () {
		 		/* $('#locTap').hide(); */
			})
			
			//지역 누른 밸류 가져오기
			$('.list-group-item-theater').click(function() {
				$(this).addClass('active').siblings().removeClass('active');
				console.log($(this).text());
				console.log($(this).children().val());
			})
		 		
			
		 	
			var triggerTabList = [].slice.call(document.querySelectorAll('#myTab'))
			var triggerTabList2 = [].slice.call(document.querySelectorAll('#locTap'))
			var triggerTabList3 = [].slice.call(document.querySelectorAll('#dateTap'))
			
			triggerTabList.forEach(function (triggerEl) {
				
			  var tabTrigger = new bootstrap.Tab(triggerEl)
			  
			  
			  triggerEl.addEventListener('click', function (event) {
				  alert('click');
				
				  $('#locTap').show();
			    event.preventDefault()
			    tabTrigger.show()
			    
			  })
			})
			
			triggerTabList2.forEach(function(triggerEl) {
				 var tabTrigger = new bootstrap.Tab(triggerEl)
				 
				 triggerEl.addEventListener('click', function (event) {
					 alert('click');
					
				})
			})
	
	</script>
		 	
		 	
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