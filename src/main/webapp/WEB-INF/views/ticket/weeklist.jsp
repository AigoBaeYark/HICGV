<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<c:choose>
	<c:when test="${fn:length(week) == 0  }">
		<span><img src="resources/img/ticket/no_movie2.png" alt="해당정보없음2" width="30" height="30" /> 상영하는 날짜가 없습니다<img src="resources/img/ticket/no_movie2.png" alt="찡그린이모지2" width="30" height="30" /></span>
	</c:when>
	
	<c:otherwise>
		<div class="list-group" id="dateTab" role="tablist">
			<div class="row justify-content-around">
				<c:forEach items="${week }" var="day">
					 <a href="getdate" class="list-group-item list-group-item-action  list-group-item-date" id="list-day${day.day }" data-bs-toggle="list" href="#list-day" role="tab" aria-controls="list-day${day.day }"  >
					 	${day.month }월 ${day.day }  ${day.day_kor } <input type="hidden" class="hiddenDate" value="${day.day }"/>
		 			</a>
				</c:forEach>
			</div>
		</div>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
var m = movieCd;
//날짜가져오기 
	$('.list-group-item-date').click(function() {
		console.log(movieCd);
		 //(날짜 선택 중복 방지)
		 $('.list-group-item-date').each( function(i) {
			 	
	          $(this).removeClass('active');
	       })
	       $(this).addClass('active');
		 
		if((movieCd == '' || movieCd == null)  || (theaterId == '' || theaterId == null) || (locId == '' || locId == null)){
			alert('상영관을 선택하세요');
			$(this).removeClass('active');
		}else{
		$(this).addClass('active').siblings().removeClass('active');
		console.log($(this).text());
		console.log($(this).children().val());
		}
	})
	$(function() {
		$('.list-group-item-date').on('click', tickettime);	
	});

	function tickettime() {
	
	
		var getdate = $(this).children('input.hiddenDate').val();  //hiddenDate 닐짜값 가져오기
		console.log("getdate : " + getdate);
		$.ajax({
	        type : "GET",
	        url : "getdate",
	        contentType: "application/json; charset=UTF-8",
	        data : {
	        	'movieCd' : movieCd,
	        	'theaterId' : theaterId,
	        	'locId' : locId,
	        	'date' : getdate
	        },
	        success : function(mv) {
	        	$("#tickettime").html(mv);
			},
	        error : function(mv) {
	        	
	        	for ( var i = 0 in mv){
	        		console.log(mv[i].day); 
	        	}
				
				alert('에러');
			}
	    }); 
	}


</script>




