<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sect-showtimes" >
   <ul style="margin-top: 20px;">
      <li>
         <div class="col-times">
            <c:forEach items="${movieInfo }" var="dto">
            <div class="info-movie" style="border: 2px solid blue; padding-left: 120px;
    			padding-top: 20px; width: 90%;">
            	<c:if test="${dto.age_limit eq '전체관람가'}">
			   		<img src="/cgv/resources/img/theater/전체관람가.PNG" width="21" height="21" />
            	</c:if>
            	<c:if test="${dto.age_limit eq '12세관람가'}">
            		<img src="/cgv/resources/img/theater/12세관람가.PNG" width="21" height="21" />
            	</c:if>
            	<c:if test="${dto.age_limit eq '15세관람가'}">
            		<img src="/cgv/resources/img/theater/15세관람가.PNG" width="21" height="21" />
            	</c:if>
            	<c:if test="${dto.age_limit eq '18세관람가'}">
            		<img src="/cgv/resources/img/theater/18세관람가.PNG" width="21" height="21" />
            	</c:if>
	            
                <a href="moviesdetailview?movie_id=${dto.movie_id }" target="_parent">
                <strong>${dto.title_kor }</strong></a> 
             <span class="badge bg-primary">상영중</span>
                <span class="round lightblue"></span>
                <i>${dto.genre }</i>/ 
                <i> ${dto.running_time } 분</i>/ 
                <i> ${dto.opening_date } 개봉</i>
                  <div class="type-hall">
                     <div class="info-hall">
                        <ul>
                           <li>${dto.room_name }</li>
                           <li>총 ${dto.max_seat }석</li>
                           <a href="#">
	   					<em> ${dto.hour } : ${dto.minute } ~</em>
	   					<em> ${dto.endHour } : ${dto.endMinute }</em>
	   				</a>
                        </ul>
                        <br />
                     </div>
                  </div>
                  </div>
                  </c:forEach>
          </div>
       </li>
    </ul>
 </div>