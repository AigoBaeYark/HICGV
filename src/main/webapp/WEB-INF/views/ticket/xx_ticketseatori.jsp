<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/theater/boot.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/ticket/ticket.css" />

<title>ticket/ticketseat</title>
</head>
<body>
<div style="height: 300px;">
<c:import url="../common/header.jsp"></c:import>
</div> 

<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 배경이미지가 없을 경우 class 삭제  -->
        
		<!-- Contents Area -->
		 <div id="contents" class="">
    
    <div class="container">
	  <div class="row">
	    <div class="col-6">
			<span>인원수</span>
		   <select class="form-select" aria-label="Default select example">
		  	<option selected>인원수를 선택해주세요 (명)</option>
		  	<option value="1">1</option>
		 	 <option value="2">2</option>
		  	<option value="3">3</option>
		  	<option value="4">4</option>
		 	 <option value="5">5</option>
		  	<option value="6">6</option>
			</select> 
		</div>
	    <div class="col-6">
			<span>선택정보</span>
			<p>ex) CGV강남 | 4관 <br/>
			  2022. 02. 21 (월) 17:50 ~ 19:56(종료날짜받기) </p>
			  <br>
			  <span>종료시간</span>
			  <c:forEach items="${tickettime }" var="tday">
				 <a class="list-group-item list-group-item-action" id="list-time-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-time">
				  ${tday.endTime}
				 </a>
			</c:forEach>
		</div>
	  </div>
	</div>
    
     
	
	   
	  
	  
	   
	   
        <!-- SECTION -->
		<section>
			<div id="sec">

			
<p class="screen">SCREEN</p>


<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
  <div class="arow">
  &nbsp;&nbsp; <span> A열   </span> &nbsp;&nbsp; 
  <input type="checkbox" class="btn-check" id="btncheckA1" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckA1">1</label>
  <input type="checkbox" class="btn-check" id="btncheckA2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckA2">2</label>
  <input type="checkbox" class="btn-check" id="btncheckA3" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckA3">3</label>
  <input type="checkbox" class="btn-check" id="btncheckA4" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckA4">4</label>
  <input type="checkbox" class="btn-check" id="btncheckA5" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckA5">5</label>
  </div>
 </div>
 <br>
<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div class="brow">
	&nbsp;&nbsp; <span> B열   </span> &nbsp;&nbsp; 
  <input type="checkbox" class="btn-check" id="btncheckB1" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckB1">1</label>
  <input type="checkbox" class="btn-check" id="btncheckB2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckB2">2</label>
  <input type="checkbox" class="btn-check" id="btncheckB3" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckB3">3</label>
  <input type="checkbox" class="btn-check" id="btncheckB4" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckB4">4</label>
  <input type="checkbox" class="btn-check" id="btncheckB5" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckB5">5</label>
  </div>
</div>
<br>
<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div class="crow">
	&nbsp;&nbsp; <span> C열   </span> &nbsp;&nbsp; 
  <input type="checkbox" class="btn-check" id="btncheckC1" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckC1">1</label>
  <input type="checkbox" class="btn-check" id="btncheckC2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckC2">2</label>
  <input type="checkbox" class="btn-check" id="btncheckC3" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckC3">3</label>
  <input type="checkbox" class="btn-check" id="btncheckC4" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckC4">4</label>
  <input type="checkbox" class="btn-check" id="btncheckC5" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckC5">5</label>
  </div>
</div>
<br>
<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div class="drow">
	&nbsp;&nbsp; <span> D열   </span> &nbsp;&nbsp; 
  <input type="checkbox" class="btn-check" id="btncheckD1" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckD1">1</label>
  <input type="checkbox" class="btn-check" id="btncheckD2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckD2">2</label>
  <input type="checkbox" class="btn-check" id="btncheckD3" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckD3">3</label>
  <input type="checkbox" class="btn-check" id="btncheckD4" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckD4">4</label>
  <input type="checkbox" class="btn-check" id="btncheckD5" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckD5">5</label>
  </div>
</div>
<br>
<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
	<div class="erow">
	&nbsp;&nbsp; <span> E열   </span> &nbsp;&nbsp; 
  <input type="checkbox" class="btn-check" id="btncheckE1" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckE1">1</label>
  <input type="checkbox" class="btn-check" id="btncheckE2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckE2">2</label>
  <input type="checkbox" class="btn-check" id="btncheckE3" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckE3">3</label>
  <input type="checkbox" class="btn-check" id="btncheckE4" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckE4">4</label>
  <input type="checkbox" class="btn-check" id="btncheckE5" autocomplete="off">
  <label class="btn btn-outline-primary" for="btncheckE5">5</label>
  </div>
</div>



<br>
<br>
<br>
<!-- PayDao 테스트용 -->

<a href="pay?userid=1&movieid=20210087">pay</a>

			</div>
		</section>
	</div>
	
	<div style="clear: both;">
		<c:import url="../ticket/ticketbuy.jsp"></c:import>
	</div>
           	
			
	<div class="banner" id="ticket_bottom_banner" style="padding-top: 0px;">
		<!-- 흰 배경 -->
	</div>
	
</div>




<div style="clear: both;">
<c:import url="../common/footer.jsp"></c:import>
</div>
</body>
</html>