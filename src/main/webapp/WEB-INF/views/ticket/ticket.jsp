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
        <a href="ticketseat">ticketseat</a>
        <!-- SECTION -->
		<section>
			<div id="sec">
				<div id="secMain">
					<div class="row" id="secSelect">
						<div class="col-3">
						<p style="text-align: center;">영화1</p>
						<c:forEach items="${moviesList }" var="tic">
					    <div class="row justify-content-around " id="MovieTab" role="tablist">
					      <!-- for (var i = 1; i < moviesList.options.length; i++) {
					      	console.log(moviesList.options[i].selected + "<br>");
						    } -->
					      <a class="list-group-item list-group-item-action list-group-item-movie" id="list-movie" data-bs-toggle="list" href="#list-movie" role="tab" aria-controls="list-movie">
					      <input type="hidden" value="${tic.movie_id }"/>
					      <span class="ico-grade grade-${tic.age_limit }">${tic.age_limit}</span> 
					      <span style="margin-left: 15px;" id="movieTitle">${tic.title_kor }</span></a>
					    </div>
					    </c:forEach>
					  </div>
					 			          
					  <div class="col-2">
					  <p style="text-align: center;">지역2-1</p>
					  <!-- 지역 -->
					  <div class="list-group" id="locTap" role="tablist">
					    <div class="row justify-content-around"> <!-- 이거 추가하면 검은색으로 바뀜 -->
					      <c:forEach items="${local }" var="loc">
					      <a class="list-group-item list-group-item-action list-group-item-local" id="list-seoul" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="movieTitle">
					      	<input type="hidden"  value="${loc.theater_id }"/>${loc.theater_loc } </a>
					   	</c:forEach>
					    </div>
					    
					    </div>
					  </div>
					  
					  
					 <div class="col-2">
					 <p style="text-align: center;">상영관2-2</p>
					 <!-- 상영관 -->
					 <!-- 지역 클릭시 상영관 생성 -->
						<c:forEach items="${theaterlocal }" var="theloc">
					    <div class="row justify-content-around " id="TheaterTab" role="tablist" data-theaterId ="${theloc.theater_id} " > 
					    <%--  <c:if test="${theloc.theater_id eq 1 }"> --%>
					      <a class="list-group-item list-group-item-action list-group-item-theater" id="list-theater-list" data-bs-toggle="list" href="#list-theater" role="tab" aria-controls="list-theater">
					      <%-- <input type="hidden" value="${theloc.movie_id }"/> --%>
					      <input type="hidden" value="${theloc.theater_id }"/> 		 
					      <span id="movieTheater">
					      ${theloc.location_name }
					      </span>
					      </a>
					     <%--  </c:if>  --%>
					    </div>
					    </c:forEach>
					  </div>				  
					    
					  <div class="col-2">
					  <p style="text-align: center;">날짜선택3</p>
					  <p style="text-align: center;">2022년</p>
					  <p style="text-align: center;">2월</p>
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
						<p style="text-align: center;">시간선택4</p>
					    <div class="tab-content" id="nav-tabContent listLoc"> 	
							<div class="tab-pane fade show active" id="timeList" role="tabpanel" aria-labelledby="list-seoul-list">
							<c:forEach items="${ticketday}" var="tday">	
							<c:if test="${tday.day eq 15 }">
							<ul>
							<li><a href="getdate?theaterid=${tday.theater_id }&locid=${tday.location_id }&day=${tday.day}" >
								<!-- 에이태그 사용X 어떻게 수정할까..?
								1안. 겟데이트를 티켓에 붙여넣기..?
								2안. 훔.. 생각 더 해보기
								
								 -->
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
				console.log($(this).children('#movieTitle').text());//타이틀 가져오기
				console.log($(this).children('input').val()); //콘솔에 맞게 입력되었는지 확인 후 
				movieCd = $(this).children('input').val(); // 값 지정해주기
				console.log('값넣음 '+movieCd);
			})
			
			//지역 누른 밸류 가져오기
			$('.list-group-item-local').click(function() {
				//영화관 값 없음 -> 지역 선택 안 됨
				//영화관 값 없음  or 지역 값 없음 -> 영화관 선택 안 됨
				//영화관 값 없음  or 지역 값 없음 or 영화관 값 없음 -> 날짜 선택 안 됨
				
				if(movieCd == '' || movieCd == null){
					alert('영화를 선택하세요');
					$(this).removeClass('active');
				}else{
					$(this).addClass('active').siblings().removeClass('active');
					console.log($(this).text());
					console.log($(this).children().val()); 
					theaterId = $(this).children('input').val();
				}
			})
			
			//상영관 누른 밸류 가져오기
			$('.list-group-item-theater').click(function() {
				//상영관을 전부 히든 혹은 display =false
				//지역을 선택하면 안의 input에서 value를 가져옴
				//가져온 value에 해당하는  
				//data-theaterId ="${theloc.theater_id} 찾아서
				//data-theaterId ="1" 찾아서  $('[data-theaterId ="1" 찾아서  $('[]')
				//hidden 속성 없애기 or display = true 해야할 것 같음
				
				if((movieCd == '' || movieCd == null) || (theaterId == '' || theaterId == null)){
					alert('지역을 선택하세요');
					$(this).removeClass('active');
				}else{
					$(this).addClass('active').siblings().removeClass('active');
					console.log($(this).text());
					console.log($(this).children().val());
					locId = $(this).children('input').val()
				}
			})
			
			//상영관 해당하는 것만 나타내기 //임시
			$('.list-group-item-theater').click(function() {
				if ( theaterId==1 ) {
					alert('11');
					$( "div:visible" ).click(function() {
						  $( this ).show( "background", "yellow" );
						});
					$( "button" ).click(function() {
						 $( "div:hidden" ).show( "fast" );
						});
				} else if ( theaterId==2 ) {
					alert('22');
				} else if ( theaterId==3 ) {
					alert('33');
				} else if ( theaterId==4 ) {
					alert('44');
				} else if ( theaterId==5 ) {
					alert('55');
				} 
			})
		 	
			/* $(document).one('ready',function () {
		 		$('#dateTap').hide();	//페이지 처음 불러올때 지역만 보임 
			}) */
			
			
		 	//날짜가져오기
			$('.list-group-item-date').click(function() {
				if((movieCd == '' || movieCd == null)  || (theaterId == '' || theaterId == null) || (locId == '' || locId == null)){
					alert('상영관을 선택하세요');
					$(this).removeClass('active');
				}else{
				$(this).addClass('active').siblings().removeClass('active');
				console.log($(this).text());
				console.log($(this).children().val());
				}
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
			}) //영화를 선택해주세요랑 연결
			
			 /* triggerTabList2.forEach(function(triggerEl) {
				 var tabTrigger = new bootstrap.Tab(triggerEl)
				 
				 triggerEl.addEventListener('click', function (event) {
					 alert('click');
					
				})
			}) */  //'영화를 선택해주세요'가 뜨면  'click' 뜨게 
			
			
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