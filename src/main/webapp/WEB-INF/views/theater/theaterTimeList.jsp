<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>theaterTimeList.jsp</h2>

<div class="showtimes-wrap">
      <div class="sect-schedule">
         <div id="slider">
            <div class="item-wrap">
               <ul class="item" style="width: 800px; height: 108.002px;">
                  <li class="on">
                     <div class="day">
                     	<c:choose>
                     		<c:when test="${movieInfo[0].age_limit eq '전체 관람가'}">
	                        	<img src="/cgv/resources/img/theater/전체관람가.png" width="21" height="21" alt="" />
                     		</c:when>
                     		<c:when test="${movieInfo[0].age_limit eq '12세 관람가'}">
	                        	<img src="/cgv/resources/img/theater/12세관람가.png" width="21" height="21" alt="" />
                     		</c:when>
                     		<c:when test="${movieInfo[0].age_limit eq '15세 관람가'}">
	                        	<img src="/cgv/resources/img/theater/15세관람가.png" width="21" height="21" alt="" />
                     		</c:when>
                     		<c:when test="${movieInfo[0].age_limit eq '18세 관람가'}">
	                        	<img src="/cgv/resources/img/theater/18세관람가.png" width="21" height="21" alt="" />
                     		</c:when>
                     	</c:choose>
                        <a href="theaterTimeList?" class="selTime"> 
	                        <span>02월</span> 
	                        <em>화</em> 
	                        <strong>15</strong>
	                        <input type="hidden" class="hiddenDate" value="20220215"/>
                        </a>
                        <a href="theaterTimeList?" class="selTime"> 
	                        <span>02월</span> 
	                        <em>수</em> 
	                        <strong>16</strong>
	                        <input type="hidden" class="hiddenDate" value="20220216"/>
                        </a>
                        <a href="theaterTimeList?" class="selTime"> 
	                        <span>02월</span> 
	                        <em>목</em> 
	                        <strong>17</strong>
	                        <input type="hidden" class="hiddenDate" value="20220217"/>
	                        
                        </a>
                        	<span>${movieInfo[0].title_kor } 
                        		<span class="badge bg-primary">상영중</span>
                        	</span>
                        	<span>${movieInfo[0].genre }/</span>
                        	<span>${movieInfo[0].running_time }분/</span>
                        	<span>${movieInfo[0].opening_date }</span>
                        	<span>| ${movieInfo[0].room_name }</span>
                        	<span>| 총 ${movieInfo[0].max_seat }석</span>
                        
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      </div>
      <div class="sect-guide">
         <div class="descri-timezone">
            <p>* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
         </div>
      </div>
      <div class="sect-showtimes">
         <ul>
            <li>
               <div class="col-times">
                  <c:forEach items="${movieInfo }" var="dto">
                  <div class="info-movie">
                     <span class="ico-grade grade-15"> ${dto.age_limit }</span> 
                     <a href="" target="_parent">
                     <strong>${dto.title_kor }</strong></a> 
                     <span class="round lightblue"></span>
                     <i>${dto.genre }</i>/ 
                     <i> ${dto.running_time }분</i>/ 
                     <i> ${dto.opening_date } 개봉</i>
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
   </div>

   <div id="dataArea">
   <c:forEach items="${timeList }" var="list">
    	<div>
    		<ul>
    			<li>
    				<a href="#">
    				상영
    					<em>시작 : ${list.time }</em>
    					<em>종료 : ${list.endTime }</em>
    				</a>
    			</li>
    		</ul>
    	</div>
    </c:forEach>
   </div>
   
   
	<script>
		$('a.selTime').click(function(e) {
			e.preventDefault(); // 해당태그의 원래 기능을 사용하지 않겠다는 의미	//이거 안넣으면 a태그 페이지 바뀜
	
		})
		$(function() {
			$('a.selTime').on('click', change);
		});
	
		function change() {
			var param = $(this).children('input.hiddenDate').val();
			alert(param);
			
			$.ajax({
				type : "GET",
				url : "theaterTimeList",
				contentType: "application/json; charset=UTF-8",
				data : {
					'date' : param
				},
				success : function(data) {
					alert(data);
					$("#dataArea").html(data);
				}
			})
		}
	</script>

</body>
</html>