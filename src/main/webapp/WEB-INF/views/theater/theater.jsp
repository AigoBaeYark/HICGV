<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="resources/css/theater/boot.css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hicgv/theater</title>
</head>
<body>
<div> 
<a href="theaterAdmin" style="border: 2px solid red;">theaterAdmin</a>

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
               <li><a href="theater?theaterId=1&locId=${dto.location_id }" >${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
     </div>
      <div class="tab-pane fade" id="list-gyeonggi" role="tabpanel" aria-labelledby="list-gyeonggi-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 2 }">
            <ul>
               <li><a href="theater?theaterId=2&locId=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-incheon" role="tabpanel" aria-labelledby="list-incheon-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 3 }">
            <ul>
               <li><a href="theater?theaterId=3&locId=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-gangwon" role="tabpanel" aria-labelledby="list-gangwon-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 4 }">
            <ul>
               <li><a href="theater?theaterId=4&locId=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
      <div class="tab-pane fade" id="list-chungcheong" role="tabpanel" aria-labelledby="list-chungcheong-list">
         <c:forEach items="${theater }" var="dto">
         <c:if test="${dto.theater_id eq 5 }">
            <ul>
               <li><a href="theater?theaterId=5&locId=${dto.location_id }">${dto.location_name } </a></li>
            </ul>
          </c:if> 
      </c:forEach>
      </div>
    </div>
  </div>
</div>
<div>
   <img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif" alt="Theater" />
      <h4>
         <span>${locInfo.location_name }</span>
      </h4>
<div style="background-image: url('${img }');background-repeat: no-repeat; width=980px; height=420px;">
   <div style="background: url('https://img.cgv.co.kr/R2014/images/common/bg/bg_dim80.png') 0 0 repeat; width: 980px; height: 420px;">
      <div>
         <div>
            <div>
               <strong style="color: #eee;">
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
      <img src="https://adimg.cgv.co.kr/images//202201/Uncharted/0127_980x90.jpg" alt="" />
   </div>
    <div class="day">
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 15일 화</strong>
         <input type="hidden" class="hiddenDate" value="20220215"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 16일 수</strong>
         <input type="hidden" class="hiddenDate" value="20220216"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 17일 목</strong>
         <input type="hidden" class="hiddenDate" value="20220217"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 18일 금</strong>
         <input type="hidden" class="hiddenDate" value="20220218"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 19일 토</strong>
         <input type="hidden" class="hiddenDate" value="20220219"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 20일 일</strong>
         <input type="hidden" class="hiddenDate" value="20220220"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 21일 월</strong>
         <input type="hidden" class="hiddenDate" value="20220221"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 22일 화</strong>
         <input type="hidden" class="hiddenDate" value="20220222"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 23일 수</strong>
         <input type="hidden" class="hiddenDate" value="20220223"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 24일 목</strong>
         <input type="hidden" class="hiddenDate" value="20220224"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 25일 금</strong>
         <input type="hidden" class="hiddenDate" value="20220225"/>
        </a>
        <a href="theaterTimeList?locId=${locInfo.location_id }" class="selTime"> 
         <strong>02월 26일 토</strong>
         <input type="hidden" class="hiddenDate" value="20220226"/>
        </a>
     </div>
     
   <div id="schTest">
   
   </div>
   
      <div class="showtimes-wrap">
 <div class="sect-guide">
    <div class="descri-timezone">
       <p>* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
    </div>
 </div>
    <p class="info-noti"></p>
    <p>ㆍ입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
   </div>
   </div>
	
	<script>
		
		$('a.selTime').click(function(e) {
			e.preventDefault(); // 해당태그의 원래 기능을 사용하지 않겠다는 의미	//이거 안넣으면 a태그 페이지 바뀜
	
		})
	
		$(function() {
			$('a.selTime').on('click', schTest);
		});
		
		function schTest() {
			var date = $(this).children('input.hiddenDate').val();
			var url_href=window.location.href;
			var url=new URL(url_href);
			var locId=url.searchParams.get('locId');
			
			if(locId == null)
				locId = '101';
			 
			$.ajax({
				type : "GET",
				url : "theaterTimeList?date="+date+"&locId="+locId,
				contentType: "application/json; charset=UTF-8",
				success : function(data) { // 가로 안에 있는 data는 컨트롤러에서 return받은 값
					console.log(data);
					$("#schTest").html(data);
				},
				error : function (data) {
					console.log(data);
					alert('에  러');
				}
			})
		}
		
	</script>

   <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>