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
					<div class="row" id="secSelect">
						<div class="col-3">
						<span>영화1</span>
						<c:forEach items="${moviesList }" var="tic">
					    <div class="row justify-content-around " id="MovieTab" role="tablist">
					      <!-- for (var i = 1; i < moviesList.options.length; i++) {
					      	console.log(moviesList.options[i].selected + "<br>");
						    } -->
					      <a class="list-group-item list-group-item-action list-group-item-movie" id="list-movie-list" data-bs-toggle="list" href="#list-movie" role="tab" aria-controls="list-movie">
					      <input type="hidden" value="${tic.movie_id }"/>
					      <span class="ico-grade grade-${tic.age_limit }">${tic.age_limit}</span> 
					      <span style="margin-left: 15px;" id="movieTitle">${tic.title_kor }</span></a>
					    </div>
					    </c:forEach>
					  </div>
					  
					 <%--  <span>영화1</span> --원본
						<c:forEach items="${moviesList }" var="tic">
					    <div class="row justify-content-around " id="MovieTab" role="tablist">
					      
					      <a class="list-group-item list-group-item-action list-group-item-movie" id="list-movie-list" data-bs-toggle="list" href="#list-movie" role="tab" aria-controls="list-movie">
					      <input type="hidden" value="${tic.movie_id }"/>
					      <span class="ico-grade grade-${tic.age_limit }">${tic.age_limit}</span> 
					      <span style="margin-left: 15px;" id="movieTitle">${tic.title_kor }</span></a>
					    </div>
					    </c:forEach>
					  </div> --%>
					  
					  
					<%--  위 안에 넣었는데 안 됨 
					 <c:if test="${tic.movie_id eq ${tic.movie_id } }">
					      <a class="list-group-item list-group-item-action list-group-item-movie" id="list-movie-list" data-bs-toggle="list" href="#list-movie" role="tab" aria-controls="list-movie">
					      <input type="hidden" value="${tic.movie_id }"/>
					      <span class="ico-grade grade-${tic.age_limit }">${tic.age_limit}</span> 
					      <span style="margin-left: 15px;" id="movieTitle">${tic.title_kor }</span></a>
					      </c:if> --%>
					  
					          
					  <div class="col-2">
					  <span>극장2</span>
					  <!-- 지역 -->
					  <div class="list-group" id="locTap" role="tablist">
					    <div class="row justify-content-around"> <!-- 이거 추가하면 검은색으로 바뀜 -->
					      <a class="list-group-item list-group-item-action list-group-item-local" id="list-seoul-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-seoul" >서울 <input type="hidden"  value="1"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-local" id="list-gyeonggi-list" data-bs-toggle="list" href="#list-gyeonggi" role="tab" aria-controls="list-gyeonggi" >경기<input type="hidden"  value="2"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-local" id="list-incheon-list" data-bs-toggle="list" href="#list-incheon" role="tab" aria-controls="list-incheon"  >인천<input type="hidden"  value="3"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-local" id="list-gangwon-list" data-bs-toggle="list" href="#list-gangwon" role="tab" aria-controls="list-gangwon"  >강원도<input type="hidden"  value="4"/></a>
					      <a class="list-group-item list-group-item-action list-group-item-local" id="list-chungcheong-list" data-bs-toggle="list" href="#list-chungcheong" role="tab" aria-controls="list-chungcheong"  >충청도<input type="hidden"  value="5"/></a>
					    </div>
					    </div>
					  </div>
					  <!-- 상영관 -->
					  
					 <div class="col-2">
					  <span>상영관</span>
						<c:forEach items="${theaterlocal }" var="theloc">
					    <div class="row justify-content-around " id="TheaterTab" role="tablist">
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-theater-list" data-bs-toggle="list" href="#list-theater" role="tab" aria-controls="list-theater">
					      <%-- <input type="hidden" value="${theloc.movie_id }"/> --%>
					      <input type="hidden" value="${theloc.theater_id }"/> 
					      <span id="movieTheater">${theloc.location_name }</span></a>
					    </div>
					    </c:forEach>
					  </div>
					 
					 
					 <%-- <div class="col-3">
						<span>영화1</span>
						<c:forEach items="${moviesList }" var="tic">
					    <div class="row justify-content-around " id="MovieTab" role="tablist">
					      <a class="list-group-item list-group-item-action list-group-item-movie" id="list-movie-list" data-bs-toggle="list" href="#list-movie" role="tab" aria-controls="list-movie">
					      <input type="hidden" value="${tic.movie_id }"/>
					      <span class="ico-grade grade-${tic.age_limit }">${tic.age_limit}</span> 
					      <span style="margin-left: 15px;" id="movieTitle">${tic.title_kor }</span></a>
					    </div>
					    </c:forEach>
					  </div> --%>

					 <%--  <div class="col-2">
					    <div class="tab-content" id="nav-tabContent listLoc"> 	
					      	<div class="tab-pane fade show active" id="list-seoul" role="tabpanel" aria-labelledby="list-seoul-list">
					         <c:forEach items="${theaterlocal }" var="theloc">	
					         <c:if test="${theloc.theater_id eq 1 }">
					            <ul>
					               <li><a href="ticket?theaterid=1&locid=${theloc.location_id }" >${theloc.location_name } </a></li>
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
					         <c:forEach items="${theaterlocal }" var="theloc">
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
					    </div>  --%>				  
					    
					  <div class="col-2">
					  <span>날짜선택3</span>
					  <p>2022년</p>
					  <p>2월</p>
					  <%-- <c:forEach items="${ticketday }" var="ticd"> --%>
					  <div class="list-group" id="dateTab" role="tablist">
					    <div class="row justify-content-around"> <!-- 이거 추가하면 검은색으로 바뀜 -->
					      <a class="list-group-item list-group-item-action  list-group-item-date" id="list-day15-list" data-bs-toggle="list" href="#list-day15" role="tab" aria-controls="list-day15"  >15(화)<input type="hidden"  value="15"/></a>
					      <a class="list-group-item list-group-item-action  list-group-item-date" id="list-day16-list" data-bs-toggle="list" href="#list-day16" role="tab" aria-controls="list-day16"  >16(수)<input type="hidden"  value="16"/></a>
					      <a class="list-group-item list-group-item-action  list-group-item-date" id="list-day17-list" data-bs-toggle="list" href="#list-day17" role="tab" aria-controls="list-day17"  >17(목)<input type="hidden"  value="17"/></a>
					    </div>			
					   </div>
					  </div>

						<div class="col-3"> 
						<span>시간선택4</span>
					    <div class="tab-content" id="nav-tabContent listLoc"> 	
							<div class="tab-pane fade show active" id="timeList" role="tabpanel" aria-labelledby="list-seoul-list">
							<c:forEach items="${ticketday}" var="tday">	
							<c:if test="${tday.day eq 15 }">
							<ul>
							<li><a href="getdate?theaterid=${tday.theater_id }&locid=${tday.location_id }&day=${tday.day}" >
								<span>
					            ${tday.room_name }
					            </span>
					            <span>
					            ${tday.location_name }
					            </span>
					            <span>
					            ${tday.starttime }
					            </span>
					            <span>
					            ${tday.max_seat }
					            </span>
					            <span>
					            ${tday.start_date }
					            </span>
							</a></li>
							</ul> 
							</c:if> 
							</c:forEach>
					      <hr>
					      <c:forEach items="${tickettime}" var="tday">
					      <span>종료시간</span> 
					      <a class="list-group-item list-group-item-action" id="list-time-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-time">
					      ${tday.endTime}
					      </a>
					     </c:forEach>
					    </div>
					    
					  </div>
					  </div>
					</div>
					  	
				
				</div>
				<a href="ticketseat">ticketseat</a>
		</section>   
		 	
		 	

		 	
		 	
		 	<script>
		 	var movieCd = "";	//영화코드
		 	var theaterId = ""; //지역코드
		 	var locId = "" 	//영화관 id
		 	var date = ""	//선택한 날짜
		 	
		 	/* $(document).one('ready',function () {
		 		$('#locTap').hide();	//페이지 처음 불러올때 지역만 보임 
			}) */
			
			//영화 누른 밸류 가져오기
			$('.list-group-item-movie').click(function() {
				$(this).addClass('active').siblings().removeClass('active');
				console.log($(this).children('#movieTitle').text());	//타이틀 가져오기
				console.log($(this).children('input').val());
				movieCd = $(this).children('input').val();
				console.log('값넣음 '+movieCd);
			})
			
			
			//지역 누른 밸류 가져오기
			$('.list-group-item-local').click(function() {
				if(movieCd == '' || movieCd == null){
					alert('영화를 선택하세요');
					$(this).removeClass('active');
				}else{
					$(this).addClass('active').siblings().removeClass('active');
					console.log($(this).text());
					console.log($(this).children().val());
				}
				
				
			})
			
			//상영관 누른 밸류 가져오기
			$('.list-group-item-theater').click(function() {
				if(movieCd == '' || movieCd == null){
					alert('지역을 선택하세요');
					$(this).removeClass('active');
				}else{
					$(this).addClass('active').siblings().removeClass('active');
					console.log($(this).text());
					console.log($(this).children().val());
				}
				
				
			})
			
			
		 	//날짜가져오기
			$('.list-group-item-date').click(function() {
				$(this).addClass('active').siblings().removeClass('active');
				console.log($(this).text());
				console.log($(this).children().val());
			})
		 	
			var triggerTabList = [].slice.call(document.querySelectorAll('#MovieTab'))
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
			
			
			$('#secSelect').on('click', function() {
				console.log('click!');
				
				
				
				/* $.ajax({
					type: "get",
					url: "",
					data:{
						
					},
					success: function (data) {
						$('#timeList').html(data);
					},
					error: function() {
						alert('시간선택 에러');
					}
					
				}) */
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