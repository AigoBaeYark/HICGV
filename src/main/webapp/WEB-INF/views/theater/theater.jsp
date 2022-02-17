<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/theater/boot.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hicgv/theater</title>
<link rel="stylesheet" href="resources/css/reset.css" />
</head>

<body>
   <h2>theater.jsp</h2>
<div style="height: 300px;">
   <c:import url="/WEB-INF/views/common/header.jsp" />
</div>
<div class="row" id="theaterName">
  <div class="col-4">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action" id="list-seoul-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-seoul">서울</a>
      <a class="list-group-item list-group-item-action" id="list-gyeonggi-list" data-bs-toggle="list" href="#list-gyeonggi" role="tab" aria-controls="list-gyeonggi">경기</a>
      <a class="list-group-item list-group-item-action" id="list-incheon-list" data-bs-toggle="list" href="#list-incheon" role="tab" aria-controls="list-incheon">인천</a>
      <a class="list-group-item list-group-item-action" id="list-gangwon-list" data-bs-toggle="list" href="#list-gangwon" role="tab" aria-controls="list-gangwon">강원도</a>
      <a class="list-group-item list-group-item-action" id="list-chungcheong-list" data-bs-toggle="list" href="#list-chungcheong" role="tab" aria-controls="list-chungcheong">충청도</a>
    </div>
  </div>
  <div class="col-8">
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade show active" id="list-seoul" role="tabpanel" aria-labelledby="list-seoul-list">
      <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 1 }">
            <ul>
               <li><a href="theater?theaterid=1&locid=${dto.location_id }" >${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
     </div>
      <div class="tab-pane fade" id="list-gyeonggi" role="tabpanel" aria-labelledby="list-gyeonggi-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 2 }">
            <ul>
               <li><a href="theater?theaterid=2&locid=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-incheon" role="tabpanel" aria-labelledby="list-incheon-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 3 }">
            <ul>
               <li><a href="theater?theaterid=3&locid=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-gangwon" role="tabpanel" aria-labelledby="list-gangwon-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 4 }">
            <ul>
               <li><a href="theater?theaterid=4&locid=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-chungcheong" role="tabpanel" aria-labelledby="list-chungcheong-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 5 }">
            <ul>
               <li><a href="theater?theaterid=5&locid=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
    </div>
  </div>
</div>
<div>
   <img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif" alt="" />
      <h4>
         <span>${locinfo.location_name }</span>
      </h4>
<div id="theaterimg" style="background-image: url('${img }');background-repeat: no-repeat; width=980px; height=420px;">
   <div style="background: url('https://img.cgv.co.kr/R2014/images/common/bg/bg_dim80.png') 0 0 repeat; width: 980px; height: 420px;">
      <a href="#">
         <span style="padding: 0 14px;">단체/대관문의</span>
      </a>
      <div>
         <div>
            <div>
               <strong>
                  ${locinfo.location_add }
               </strong>
               <span>
                  <strong>
                     ${locinfo.location_tel }
                  </strong>
               </span>
            </div>
         </div>
      </div>
   </div>
</div>
</div>
   <div>
      <img src="https://adimg.cgv.co.kr/images//202201/Uncharted/0127_980x90.jpg" alt="" />
   </div>
   
  
   <div class="showtimes-wrap">
      <div class="sect-schedule">
         <div id="slider">
            <div class="item-wrap">
               <ul class="item" style="width: 800px; height: 108.002px;">
                  <li class="on">
                     <div class="day">
                     
                        <a href="timeSelect?locid=101" title="현재 선택"> 
	                        <span>02월</span> 
	                        <em>목</em> 
	                        <strong>10</strong>
                        </a>
	                        <c:forEach items="${timeList }" var="list">
	                        	<div>
	                        		<ul>
	                        			<li>
	                        				<a href="#">
	                        					<em>${list.tempTime }</em>
	                        				</a>
	                        			</li>
	                        		</ul>
	                        	</div>
	                        </c:forEach>
	                        <c:forEach items="${movieInfo }" var="dto">
	                        	<span>${dto.max_seat }</span>
	                        </c:forEach>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      </div>
      <div class="sect-guide">
         <div class="descri-timezone">
            <ul>
               <li><span class="early">조조</span></li>
               <li><span class="midnight">심야</span></li>
            </ul>
            <p>* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
         </div>
      </div>
      <div class="sect-showtimes">
         <ul>
            <li>
               <div class="col-times">
                  <c:forEach items="${movieinfo }" var="dto">
                  <div class="info-movie">
                     <span class="ico-grade grade-15"> ${dto.age_limit }</span> <a
                        href="" target="_parent"><strong>
                           ${dto.title_kor }</strong></a> <span class="round lightblue"> 
                     </span><span class=""> <em> </em>
                     </span><i>${dto.genre }</i>/ <i> ${dto.running_time }분</i>/ <i> ${dto.opening_date } 개봉</i>
                  </div>

                  <div class="type-hall">
                     <div class="info-hall">
                        <ul>
                           <li>${dto.room_name }</li>
                           <li>총 ${dto.max_seat }석</li>
                        </ul>
                     </div>
                  </div>
                  </c:forEach>
               </div>
            </li>
         </ul>
      </div>
      <p class="info-noti"></p>
      <p>ㆍ입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
      <p></p>
   </div>
 
   <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>