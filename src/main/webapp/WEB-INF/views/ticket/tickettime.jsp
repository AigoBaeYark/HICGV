<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
a.btn{
    display:block;
    width:80px;
    line-height:10px;
    text-align:center;
    background-color:navy;
    color:white;
    font-size: 1em;
}

.starttime {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.starttime .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color:#18BAF8;
  color: white;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;
  top: -5px;
  left: 105%;
}

.starttime:hover .tooltiptext {
  visibility: visible;
}

</style>



<c:choose>

<c:when test="${fn:length(ticketday) == 0 }">
<img ismap>

</c:when>

<c:otherwise>
<div class="tickettimes-select">
	<ul>
      <li>
      	<div class="sel-times">
      		<c:forEach items="${ticketday }" var="tday">	
				<c:if test="${tday.day eq 15 }">
					<ul>
						<li>
							<span> 
					           ${tday.room_name } 
					           </span>
					           | 
					           <span>
					           ${tday.location_name } 
					           </span>
					           |
					           <span>
					           ${tday.max_seat } 석
					           </span>
					           <br>
					           | 러닝타임 :
					           <span>
					          	${tday.running_time } 분
					           </span>
					           <br>
					           <a href="ticketseat?movieid=${tday.movie_id }&theaterid=${tday.theater_id }&locid=${tday.location_id }&tday=${tday.day }&hour=${tday.hour }&minute=${tday.minute }" class="btn"> 
					           <span>
					           <div class="starttime">
					           <em> ${tday.hour } : ${tday.minute }</em>
					            <span class="tooltiptext">예매하기이동</span>
					           </div>
					        </span></a>
						</li>
					</ul> 
				</c:if> 
				<!-- 
				머릿속 정리해보기!
				: 영화 -> 지역 -> 상영관 -> 날짜를 클릭 하면 위에 값들이 
				4번 시간선택란에 떠야함
				 -->	
	
				<c:if test="${tday.day eq 16 }">
					<ul>
						<li>
							<span> 
					           ${tday.room_name } 
					           </span>
					           | <span>
					           ${tday.location_name }
					           </span>
					           |
					           <span>
					           ${tday.max_seat } 석
					           </span>  
					           <br>
					           | 러닝타임 :
					           <span>
					          	${tday.running_time } 분
					           </span>
					           <br>
					           <a href="ticketseat?movieid=${tday.movie_id }&theaterid=${tday.theater_id }&locid=${tday.location_id }&tday=${tday.day }&hour=${tday.hour }&minute=${tday.minute }" class="btn"> 
					           <span>
					           <div class="starttime">
					           <em> ${tday.hour } : ${tday.minute }</em>
					           <span class="tooltiptext">예매하기이동</span>
					           </div>
					        </span></a>
						</li>
					</ul> 
				</c:if> 

				<c:if test="${tday.day eq 17 }">
					<ul>
						<li>
							<span> 
					           ${tday.room_name } 
					           </span>
					           | <span>
					           ${tday.location_name }
					           </span>
					           |
					           <span>
					           ${tday.max_seat } 석 
					           </span>
					           <br>
					           | 러닝타임 :
					           <span>
					          	${tday.running_time } 분
					           </span>
					           <br>
					          <a href="ticketseat?movieid=${tday.movie_id }&theaterid=${tday.theater_id }&locid=${tday.location_id }&tday=${tday.day }&hour=${tday.hour }&minute=${tday.minute }" class="btn"> 
					           <span>
					           <div class="starttime">
					           <em> ${tday.hour } : ${tday.minute }</em>
					           <span class="tooltiptext">예매하기이동</span>
					           </div>
					        </span></a>
						</li>
					</ul> 
				</c:if> 
				
				<c:if test="${tday.day eq null }">
					<ul>
						<li>
							<span> 
					           	해당 상영관이 없습니다. <!-- 시간 나면 구현하기 -->
					        </span>
						</li>
					</ul> 
				</c:if> 
				
			</c:forEach>
      	</div>
      </li>
     </ul>
 
 
</div>
</c:otherwise>
</c:choose>


<script>
$(document).click(function () {
	var movid=movieCd; //값이 잘 넘어오는지 test용!
	console.log('tickettime'+movid);
	console.log('tickettime theaterId'+theaterId);

})


var sTime = "";	//영화시작시간


$('.starttime').mouseover(function() { 
	console.log($(this).children('em').text());//상영시작시간 가져오기
	console.log($(this).children('input').val()); //콘솔에 맞게 입력되었는지 확인 후 
	sTime = $(this).children('em').text(); //값 지정해주기
	console.log('sTime '+ sTime);
})





</script>

