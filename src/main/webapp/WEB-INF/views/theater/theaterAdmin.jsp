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
    <input type="text" name="movie_id" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline" required maxlength="8" minlength ="8">
  </div>
  <div class="col-auto">
    <span id="passwordHelpInline" class="form-text">
      숫자 8자리를 정확하게 입력해주세요
    </span>
  </div>
</div>
location_name
<select class="form-select" name="location_id" aria-label="Default select example" style="width: 200px">
  <option>HICGV강남</option>
  <option>HICGV명동</option>
  <option>HICGV구로</option>
  <option>HICGV홍대</option>
  <option>HICGV송파</option>
  <option>HICGV김포</option>
  <option>HICGV이천</option>
  <option>HICGV용인</option>
  <option>HICGV평촌</option>
  <option>HICGV계양</option>
  <option>HICGV주안</option>
  <option>HICGV연수</option>
  <option>HICGV강릉</option>
  <option>HICGV원주</option>
  <option>HICGV춘천</option>
  <option>HICGV대전</option>
  <option>HICGV세종</option>
  <option>HICGV청주</option>
</select>

room_name 
<select class="form-select" name="theater_room_id" aria-label="Default select example" style="width: 200px">
  <option>강남1관</option>
  <option>강남2관</option>
  <option>강남3관</option>
  <option>명동1관</option>
  <option>명동2관</option>
  <option>명동3관</option>
  <option>구로1관</option>
  <option>구로2관</option>
  <option>구로3관</option>
</select>

start_date
<input type="datetime-local" name="start_date" required/>
<input type="submit" id="submitBtn" value="입력"/>

</form>

<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>

</body>
</html>