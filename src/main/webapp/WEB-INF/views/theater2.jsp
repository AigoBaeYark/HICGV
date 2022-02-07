<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="resources/css/theater/boot.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hicgv/theater</title>
<link rel="stylesheet" href="resources/css/reset.css" />


</head>
<body>
	<h2>theater.jsp</h2>
<div class="row" id="theaterName">
  <div class="col-4">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action active" id="list-seoul-list" data-bs-toggle="list" href="#list-seoul" role="tab" aria-controls="list-seoul">서울</a>
      <a class="list-group-item list-group-item-action" id="list-gyeonggi-list" data-bs-toggle="list" href="#list-gyeonggi" role="tab" aria-controls="list-gyeonggi">경기</a>
      <a class="list-group-item list-group-item-action" id="list-incheon-list" data-bs-toggle="list" href="#list-incheon" role="tab" aria-controls="list-incheon">인천</a>
      <a class="list-group-item list-group-item-action" id="list-gangwon-list" data-bs-toggle="list" href="#list-gangwon" role="tab" aria-controls="list-gangwon">강원도</a>
      <a class="list-group-item list-group-item-action" id="list-chungcheong-list" data-bs-toggle="list" href="#list-chungcheong" role="tab" aria-controls="list-chungcheong">충청도</a>
    </div>
  </div>
  <div class="col-8">
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade show active" id="list-seoul" role="tabpanel" aria-labelledby="list-seoul-list">
		<ul>
			<li><a href="#">HICGV강남 |</a></li>
			<li><a href="#">HICGV명동 |</a></li>
			<li><a href="#">HICGV여의도 |</a></li>
			<li><a href="#">HICGV홍대 |</a></li>
			<li><a href="#">HICGV강남</a></li>
		</ul>
	  </div>
      <div class="tab-pane fade" id="list-gyeonggi" role="tabpanel" aria-labelledby="list-gyeonggi-list">
      	<ul>
			<li><a href="#">HICGV김포 |</a></li>
			<li><a href="#">HICGV이천 |</a></li>
			<li><a href="#">HICGV용인 |</a></li>
			<li><a href="#">HICGV평촌</a></li>
		</ul>
      </div>
      <div class="tab-pane fade" id="list-incheon" role="tabpanel" aria-labelledby="list-incheon-list">
      	<ul>
			<li><a href="#">HICGV계양 |</a></li>
			<li><a href="#">HICGV주안 |</a></li>
			<li><a href="#">HICGV연수</a></li>
		</ul>
      </div>
      <div class="tab-pane fade" id="list-gangwon" role="tabpanel" aria-labelledby="list-gangwon-list">
      	<ul>
			<li><a href="#">HICGV강릉 |</a></li>
			<li><a href="#">HICGV원주 |</a></li>
			<li><a href="#">HICGV춘천</a></li>
		</ul>
      </div>
      <div class="tab-pane fade" id="list-chungcheong" role="tabpanel" aria-labelledby="list-chungcheong-list">
      	<ul>
			<li><a href="#">HICGV대전 |</a></li>
			<li><a href="#">HICGV세종 |</a></li>
			<li><a href="#">HICGV청주</a></li>
		</ul>
      </div>
    </div>
  </div>
</div>
</body>
</html>