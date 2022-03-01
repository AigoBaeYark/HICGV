<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="contents" style="height: 250px; margin: auto">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
</div>

<div style="margin-bottom: 200px; margin-top: 60px; position: relative; left: 120px; top: 20px;">
<form action="theaterAdmin" class="container">
<div class="row g-3 align-items-center">
  <div class="col-auto">
    <label for="inputPassword6" class="col-form-label" >movieId</label>
  </div>
  <div class="col-auto">
    <input type="text" name="movie_id" id="movie_id" class="form-control" aria-describedby="passwordHelpInline" required maxlength="8" minlength ="8">
  </div>
  <div class="col-auto">
    <span id="passwordHelpInline" class="form-text">
      숫자 8자리를 정확하게 입력해주세요
    </span>
  </div>
</div>
<div style="margin-top: 10px;">
locationName
<select id="location_id" class="form-select" name="location_id" aria-label="Default select example" style="width: 200px; height: 4%">
  <c:forEach items="${selLoc }" var="selLoc">
  <option value="${selLoc.location_id }">${selLoc.location_name }</option>
  </c:forEach>
</select>
</div>
<div style="margin-top: 10px;">
theaterRoomName 
<select id="theater_room_id" class="form-select" name="theater_room_id" aria-label="Default select example" style="width: 200px; height: 5%;" >
  <c:forEach items="${selRoom }" var="selRoom">
  <option key="default-empty" hidden>상영관을 선택해주세요.</option>
  <option class="theater_room_id-option"  value="${selRoom.location_id }" value2="${selRoom.theater_room_id }" hidden=true >${selRoom.room_name }  </option>
  </c:forEach>
</select>
</div>
<div style="margin-top: 10px;">
startDate <br />
<input id="start_date" name="start_date" type="datetime-local" required/>
<input type="button" id="insertBtn" value="입력" />
</div>
</form>
</div>

<!-- 해당 날짜에 상영되는 영화리스트 ajax로 가져오기 위한 div -->
<div id="moviesList" style="float: right; position: relative; bottom: 430px; right: 550px;"></div>

<script>

	$(function() {
		$('#insertBtn').click(function() {
			var movieId=document.getElementById('movie_id').value;
			var locationId=$("#location_id option:selected").val();
			var roomId=$("#theater_room_id option:selected").val();
			var startDate=document.getElementById('start_date').value;
			var theater_room_id = $("#theater_room_id option:selected").attr('value2');
	
			if (locationId!=null && roomId!=null && movieId!=null && startDate!=null) {
		
			location.href="theaterInsertAdmin?movie_id="+movieId
					+"&location_id="+locationId+"&theater_room_id="+theater_room_id+"&start_date="+startDate;
				
				return true;
			} else {
				
				return false; 
			}
		})
	})	
	
	$('#location_id').on('click', function (){
		var selectedId1 = $("#location_id").val();		
			$('.theater_room_id-option').each( function() {
				console.log($(this).val());
				$(this).attr("hidden",true);
				if($(this).val()== selectedId1 ){
					$(this).attr("hidden",false);
					console.log($(this).children("input[type=hidden]").val())
				}
			})
	})
	
	$(document).ready( function() {
			
			$("input").keyup(function() {
				var movieId=document.getElementById('movie_id').value;
				if (movieId.length>=8) {
				$('#moviesList').empty();
				$(this).css("background-color","#9BC3FF");
				alert('최대 8자리입니다.');
				$.ajax({
					type : "GET",
					url : "moviesList?movie_id="+movieId,
					contentType: "application/json; charset=UTF-8",
					success : function(movieInfo) {
						$('#moviesList').append(
							"<ul><li><img src='"+movieInfo.image_url 
							+"' style='width: 200px; height: 270px' /></li><li>MOVIE_ID :"
							+movieInfo.movie_id 
							+"</li><li>TITLE_KOR : "+movieInfo.title_kor 
							+"</li><li>OPENING_DATE : "+movieInfo.opening_date 
							+"</li><li>GENRE : "+movieInfo.genre 
							+"</li><li>RUNNING_TIME : "+movieInfo.running_time 
							+"</li><li>AGE_LIMIT : "
							+movieInfo.age_limit +"</li></ul>");
					},
					error : function () {
						
						$('#moviesList').append("검색 결과가 없습니다.");
						alert('에러');
					}
				})
					
			}else if (movieId.length < 8) {
					$(this).css("background-color","#fff");
					
				}
			})
		}		
	)
	
	
</script>

<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>

</body>
</html>