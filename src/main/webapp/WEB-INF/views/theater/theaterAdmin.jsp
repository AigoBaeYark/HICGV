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
<h2>theaterAdmin.jsp</h2>

<div class="contents" style="height: 300px; margin: auto">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
</div>

<form action="theaterAdmin" style="border: 2px solid blue; width: 500px; height: 400px; margin: 0;">
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
locationName
<select id="location_id" class="form-select" name="location_id" aria-label="Default select example" style="width: 200px">
  <option value="101">HICGV강남</option>
  <option value="102">HICGV명동</option>
  <option value="103">HICGV구로</option>
  <option value="104">HICGV홍대</option>
  <option value="105">HICGV송파</option>
  <option value="106">HICGV김포</option>
  <option value="107">HICGV이천</option>
  <option value="108">HICGV용인</option>
  <option value="109">HICGV평촌</option>
  <option value="110">HICGV계양</option>
  <option value="111">HICGV주안</option>
  <option value="112">HICGV연수</option>
  <option value="113">HICGV강릉</option>
  <option value="114">HICGV원주</option>
  <option value="115">HICGV춘천</option>
  <option value="116">HICGV대전</option>
  <option value="117">HICGV세종</option>
  <option value="118">HICGV청주</option>
</select>

theaterRoomName 
<select id="theaterRoom_id" class="form-select" name="theaterRoom_id" aria-label="Default select example" style="width: 200px">
  <option value="1">강남1관</option>
  <option value="2">강남2관</option>
  <option value="3">강남3관</option>
  <option value="4">명동1관</option>
  <option value="5">명동2관</option>
  <option value="6">명동3관</option>
  <option value="7">구로1관</option>
  <option value="8">구로2관</option>
  <option value="9">구로3관</option>
</select>

startDate
<input id="start_date" name="start_date" type="datetime-local" required/>
<input type="submit" id="submitBtn" value="입력" />

</form>



<div id="moviesList" style="float: right;">

</div>

<script>

	$(function() {
		$('#submitBtn').click(function() {
			var locationId=$("#location_id option:selected").val();
			var roomId=$("#theaterRoom_id option:selected").val();
			var movieId=document.getElementById('movie_id').value;
			var startDate=document.getElementById('start_date').value;
			if (locationId!=null && roomId!=null && movieId!=null && startDate!=null) {
			alert(movieId);
			alert(locationId);
			alert(roomId);
			alert(startDate);
			location.href="theaterInsertAdmin?movie_id="+movieId
					+"&location_id="+locationId+"&theaterRoom_id="+roomId+"&start_date="+startDate;
				
				return true;
				
			} else {
				return false; 
			}
		})
	})	
	
	$(document).ready(
		function() {
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
							"<ul><li><img src="+movieInfo.image_url 
							+" style='width: 200px; height: 270px' /></li><li>MOVIE_ID :"
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