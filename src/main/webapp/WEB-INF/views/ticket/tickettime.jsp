<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
a.btn{
    display:block;
    width:70px;
    line-height:10px;
    text-align:center;
    background-color:navy;
    color:white;
    font-size: 1em;
}
</style>


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
					           <a href="ticketseat" class="btn">
					           <span>
					           <em> ${tday.hour } : ${tday.minute }</em>
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
					           <a href="ticketseat"  class="btn">
					           <span>
					          <em> ${tday.hour } : ${tday.minute }</em>
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
					           <a href="ticketseat"  class="btn">
					           <span> 
					          <em> ${tday.hour } : ${tday.minute }</em>
					        </span></a>
						</li>
					</ul> 
				</c:if> 
				
				<c:if test="${tday.day eq null }">
					<ul>
						<li>
							<span> 
					           	해당 상영관이 없습니다.
					        </span>
						</li>
					</ul> 
				</c:if> 
				
			</c:forEach>
      	</div>
      </li>
     </ul>

</div>
