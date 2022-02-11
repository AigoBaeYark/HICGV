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
      <a class="list-group-item list-group-item-action active" id="list-seoul-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-seoul">서울</a>
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
         <c:if test="${dto.theater_id eq 1}">
            <ul>
               <li><a href="theater?theaterid=1&locid=${dto.location_id }" >${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
     </div>
      <div class="tab-pane fade" id="list-gyeonggi" role="tabpanel" aria-labelledby="list-gyeonggi-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 2}">
            <ul>
               <li><a href="theater?theaterid=2&locid=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-incheon" role="tabpanel" aria-labelledby="list-incheon-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 3}">
            <ul>
               <li><a href="theater?theaterid=3&locid=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-gangwon" role="tabpanel" aria-labelledby="list-gangwon-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 4}">
            <ul>
               <li><a href="theater?theaterid=4&locid=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-chungcheong" role="tabpanel" aria-labelledby="list-chungcheong-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 5}">
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
         <span>HICGV강남 ${dto.location_name }</span>
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
                  ${dto.location_add }
               </strong>
               <span>
                  <strong>
                     ${dto.location_tel }
                     <br />
                     6관 / 874석
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
         <div id="slider" class="slider">
            <div class="item-wrap">
               <ul class="item" style="width: 800px; height: 108.002px;">
                  <li class="on">
                     <div class="day">
                        <a
                           href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20220210&amp;screencodes=&amp;screenratingcode=&amp;regioncode="
                           title="현재 선택"> <span> 02월</span> <em> 목</em> <strong>
                              10</strong>
                        </a>
                     </div>
                  </li>

                  <li>
                     <div class="day">
                        <a
                           href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20220211&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
                           <span> 02월</span> <em> 금</em> <strong> 11</strong>
                        </a>
                     </div>
                  </li>
                  <li>
                     <div class="day">
                        <a
                           href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20220212&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
                           <span> 02월</span> <em> 토</em> <strong> 12</strong>
                        </a>
                     </div>
                  </li>
                  <li>
                     <div class="day">
                        <a
                           href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20220213&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
                           <span> 02월</span> <em> 일</em> <strong> 13</strong>
                        </a>
                     </div>
                  </li>
                  <li>
                     <div class="day">
                        <a
                           href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20220214&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
                           <span> 02월</span> <em> 월</em> <strong> 14</strong>
                        </a>
                     </div>
                  </li>
                  <li>
                     <div class="day">
                        <a
                           href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20220215&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
                           <span> 02월</span> <em> 화</em> <strong> 15</strong>
                        </a>
                     </div>
                  </li>
                  <li>
                     <div class="day">
                        <a
                           href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20220216&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
                           <span> 02월</span> <em> 수</em> <strong> 16</strong>
                        </a>
                     </div>
                  </li>
                  <li>
                     <div class="day">
                        <a
                           href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20220217&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
                           <span> 02월</span> <em> 목</em> <strong> 17</strong>
                        </a>
                     </div>
                  </li>
               </ul>
            </div>

            <div class="item-wrap">
               <ul class="item"
                  style="width: 800px; height: 108.002px; display: none;">
                  <li>
                     <div class="day">
                        <a
                           href="./iframeTheater.aspx?areacode=01&amp;theatercode=0056&amp;date=20220218&amp;screencodes=&amp;screenratingcode=&amp;regioncode=">
                           <span>02월</span> <em> 금</em> <strong> 18</strong>
                        </a>
                     </div>
                  </li>
               </ul>
            </div>
            <button type="button" class="btn-prev">이전 날자보기</button>
            <button type="button" class="btn-next">다음 날자보기</button>
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
                        href="/movies/detail-view/?midx=85595" target="_parent"><strong>
                           355</strong></a> <span class="round lightblue"> <em> 상영중</em>
                     </span><span class=""> <em> </em>
                     </span><i> 액션</i>/ <i> ${dto.running_time }분</i>/ <i> 2022.02.09 개봉</i>
                  </div>

                  <div class="type-hall">
                     <div class="info-hall">
                        <ul>
                           <li>5관(Laser) 10층</li>
                           <li>총 172석</li>
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
   
   <div>
   	<c:forEach items="time" var="timedto">
   		if(timedto.movieid = (듄의 무비코드))
   		<div>${timedto.시간 }</div>
   		
   		if(timedto.movieid = (주술회전의 무비코드))
   		<div>${timedto.시간 }</div>
   	
   	</c:forEach>
   </div>

   <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>