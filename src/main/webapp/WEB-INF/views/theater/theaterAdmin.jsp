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


<div style="height: 300px;">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
</div>

<form action="theaterAdmin" style="border: 2px solid blue; width: 500px; height: 400px; margin: 0;">
<div class="row g-3 align-items-center">
  <div class="col-auto">
    <label for="inputPassword6" class="col-form-label"  >movie_id</label>
  </div>
  <div class="col-auto">
    <input type="text" id="movieid" class="form-control" aria-describedby="passwordHelpInline" required maxlength="8" minlength ="8">
  </div>
  <div class="col-auto">
    <span id="passwordHelpInline" class="form-text">
      숫자 8자리를 정확하게 입력해주세요
    </span>
  </div>
</div>
location_name
<select id="locid" class="form-select" name="location_id" aria-label="Default select example" style="width: 200px">
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

room_name 
<select id="roomid" class="form-select" name="theater_room_id" aria-label="Default select example" style="width: 200px">
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

start_date
<input id="startdate" type="datetime-local" required/>
<input type="submit" id="submitBtn" value="입력"/>

</form>

<script>
	$(function() {
		$('#submitBtn').click(function() {
			var locid=$("#locid option:selected").val();
			var roomid=$("#roomid option:selected").val();
			var movieid=document.getElementById('movieid').value;
			var startdate=document.getElementById('startdate').value;
			alert(movieid);
			alert(locid);
			alert(roomid);
			alert(startdate);
			location.href="theaterAdmin?movieid="+movieid+"&locid="+locid+"&roomid="+roomid+"&startdate="+startdate;
		})
	})	
</script>

<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>

</body>
</html>