<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/theater/boot.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hicgv/theater</title>
<link rel="stylesheet" href="resources/css/reset.css" />


</head>
<body>



	<h2>theater.jsp</h2>
<div style="height: 300px;">
	<c:import url="/WEB-INF/views/common/header.jsp" />
</div>
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
		<c:forEach items="${theater }" var="dto">
			<c:if test="${dto.theater_id eq 1}">
				<ul>
					<li><a href="theater?movieid=1&locid=${dto.location_id }" >${dto.location_name } </a></li>
				</ul>
			 </c:if> 
		</c:forEach>
	  </div>
      <div class="tab-pane fade" id="list-gyeonggi" role="tabpanel" aria-labelledby="list-gyeonggi-list">
      	<c:forEach items="${theater }" var="dto">
			<c:if test="${dto.theater_id eq 2}">
				<ul>
					<li><a href="theater?movieid=2&locid=${dto.location_id }">${dto.location_name } </a></li>
				</ul>
			 </c:if> 
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-incheon" role="tabpanel" aria-labelledby="list-incheon-list">
      	<c:forEach items="${theater }" var="dto">
			<c:if test="${dto.theater_id eq 3}">
				<ul>
					<li><a href="theater?movieid=3&locid=${dto.location_id }">${dto.location_name } </a></li>
				</ul>
			 </c:if> 
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-gangwon" role="tabpanel" aria-labelledby="list-gangwon-list">
      	<c:forEach items="${theater }" var="dto">
			<c:if test="${dto.theater_id eq 4}">
				<ul>
					<li><a href="theater?movieid=4&locid=${dto.location_id }">${dto.location_name } </a></li>
				</ul>
			 </c:if> 
		</c:forEach>
      </div>
      <div class="tab-pane fade" id="list-chungcheong" role="tabpanel" aria-labelledby="list-chungcheong-list">
      	<c:forEach items="${theater }" var="dto">
			<c:if test="${dto.theater_id eq 5}">
				<ul>
					<li><a href="theater?movieid=5&locid=${dto.location_id }">${dto.location_name } </a></li>
				</ul>
			 </c:if> 
		</c:forEach>
      </div>
    </div>
  </div>
</div>
<div>
	<h3>
		<img src="${img }" alt="" width="980" height="420"/>
	</h3>
	<div>
		<h4>
			<span>${dto.location_name }</span>
		</h4>
		<a href="#">
			<span style="padding: 0 14px;">단체/대관문의</span>
		</a>
		<div>
			<div>
				<div>
					<strong>
						${dto.location_add }
					</strong>
					<span>
						<strong>
							${dto.location_tel }
							<br />
							6관 / 874석
						</strong>
					</span>
				</div>
			</div>
		</div>
	</div>
	<div>
		<img src="https://adimg.cgv.co.kr/images//202201/Uncharted/0127_980x90.jpg" alt="" />
	</div>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>