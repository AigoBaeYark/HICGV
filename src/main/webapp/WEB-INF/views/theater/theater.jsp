<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<c:import url="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="resources/css/theater/boot.css" />
<link rel="stylesheet" href="resources/css/font-awesome.min.css" />
<script src="https://kit.fontawesome.com/7bb79fa442.js" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hicgv/theater</title>
</head>
<body>
<div id="contents"> 
<a href="theaterAdmin" style="border: 2px solid red;">theaterAdmin</a>
<i class="fa-solid fa-heart"></i>
<a href="pay?userId=1&theater_schedule_id=1000" style="border: 2px solid red;">pay</a>

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
            <ul style="float: left; position: relative; left: 100px;">
               <li><a href="theater?theaterId=1&locId=${dto.location_id }" >${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
     </div>
      <div class="tab-pane fade" id="list-gyeonggi" role="tabpanel" aria-labelledby="list-gyeonggi-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 2 }">
            <ul style="float: left; position: relative; left: 150px;">
               <li><a href="theater?theaterId=2&locId=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-incheon" role="tabpanel" aria-labelledby="list-incheon-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 3 }">
            <ul style="float: left; position: relative; left: 100px;">
               <li><a href="theater?theaterId=3&locId=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-gangwon" role="tabpanel" aria-labelledby="list-gangwon-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 4 }">
            <ul style="float: left; position: relative; left: 100px;">
               <li><a href="theater?theaterId=4&locId=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-chungcheong" role="tabpanel" aria-labelledby="list-chungcheong-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 5 }">
            <ul style="float: left; position: relative; left: 100px;">
               <li><a href="theater?theaterId=5&locId=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
    </div>
  </div>
</div>
<div>

<c:forEach var="i" begin="0" end="10">
	<i class="fa-solid fa-grip-lines fa-2x" style="margin-top: 20px;"></i>
</c:forEach>
   <img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif" alt="Theater" />
<c:forEach var="i" begin="0" end="10">
	<i class="fa-solid fa-grip-lines fa-2x"></i>
</c:forEach>
      <h4>
         <span><strong>${locInfo.location_name }</strong></span>
      </h4>
<div style="background-image:linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url('${img }');background-repeat: no-repeat; width=980px; height=420px;">
   <div style="background: url('https://img.cgv.co.kr/R2014/images/common/bg/bg_dim80.png') 0 0 repeat; width: 980px; height: 420px;">
      <div>
         <div>
            <div>
               <strong style="color: #eee; position: relative; top: 300px; left: 50px;">
                  ${locInfo.location_add } <br />
                  ${locInfo.location_tel }
               </strong>
            </div>
         </div>
      </div>
   </div>
</div>
</div>
   <div>
      <img style="margin-top: 20px;" src="https://adimg.cgv.co.kr/images/202203/Morbius/980x90.jpg" alt="" />
   </div>
    <div class="day" style="margin-top: 60px;">
	   	 <c:forEach items="${scheduleDate2 }" var="sch2" varStatus="i">
   	 <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> &nbsp;&nbsp;
	       <i class="fa-regular fa-calendar"></i>
	        <strong>${sch2.schdto[i.index ].start_date }&nbsp;${sch2.day_kor }</strong>
	        <input type="hidden" class="hiddenDate" value="${sch2.schdto[i.index ].start_date }"/>
     </a>
	     </c:forEach>
     </div>
     
   <div id="schTest">
   
   </div>
   
 <div class="sect-guide">
	    <ul style="margin-top: 40px;">
	       <li>* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다. <br />
		   	   * 입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</li>
	    </ul>
    </div>
 </div>
   
   <script>
      
      $('a.selTime').click(function(e) {
         e.preventDefault(); // 해당태그의 원래 기능을 사용하지 않겠다는 의미   //이거 안넣으면 a태그 페이지 바뀜
   
      })
   
      $(function() {
         $('a.selTime').on('click', schTest);
      });
      
      function schTest() {
         var date = $(this).children('input.hiddenDate').val();
         var url_href=window.location.href;
         var url=new URL(url_href);
         var locId=url.searchParams.get('locId');
         var theaterId=url.searchParams.get('theaterId');
         
         if(locId == null)
            locId = '101';
          
         $.ajax({
            type : "GET",
            url : "theaterTimeList?date="+date+"&theaterId="+theaterId+"&locId="+locId,
            contentType: "application/json; charset=UTF-8",
            success : function(data) { // 가로 안에 있는 data는 컨트롤러에서 return받은 값
               console.log(data);
               $("#schTest").html(data);
            },
            error : function (data) {
               console.log(data);
               alert('error');
            }
         })
      }
      
   </script>

   <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>