<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
<head>
<c:import url="../common/header.jsp"></c:import>
<title>ticket/ticketseat</title>
<!-- Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords"
	content="Movie Seat Selection a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //Meta-Tags -->
<!-- Index-Page-CSS -->
<!--     <link rel="stylesheet" href="css/style.css" type="text/css" media="all"> -->
<!-- //Custom-Stylesheet-Links -->
<!--fonts -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/theater/boot.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/ticket/jquery.seat-charts.css" />
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="resources/css/ticket/font-awesome.css" />
<link rel="stylesheet" href="resources/css/ticket/ticketseat.css" />
<!-- //fonts -->
</head>

<body onload="onLoaderFunc()">

	<form action="payTtest" method="get">
		<div id="bannerjsp">
			<h1>Movie Seat Selection</h1>
			<div class="container">

				<div class="w3ls-reg">
					<!-- input fields -->
					<div class="inputForm" style="display: flex;">

						<div class="mr_agilemain">
							<div class="Numseats">
								<label>인원선택 <span>*</span>
								</label> <input type="number" id="Numseats" required min="1">
							</div>
							<input type="hidden" name="movieid" value="무비아이디" />

							<div class="TicketPrice">
								<input type="hidden" id="TicketPrice" value="9000" required>
							</div>
						</div>

						<div class="col-6">
							<!-- 영화정보를 넘어오게 해야함 -->
							<c:forEach items="${ticketseat }" var="seat">
								<h2 style="color: #fff;">선택정보</h2>

								<p>
									${seat.title_kor } &nbsp; <br> ${seat.location_name }
									&nbsp; | &nbsp; ${seat.room_name } <br> ${seat.year }.${seat.month }.
									${seat.day } &nbsp; ${seat.hour }:${seat.minute } ~
									${seat.endHour }:${seat.endMinute }

									<!-- pay쪽으로 보낼 정보들 -->
									<input type="hidden" value="${seat.movie_id }" name="movie_id" />
									<input type="hidden" value="${seat.location_name }" name="location_name" /> 
									<input type="hidden" value="${seat.schedule_id }" name="schedule_id" /> 
									<input type="hidden" value="${seat.location_id }" name="location_id" />
									<input type="hidden" value="${seat.title_kor }" name="title_kor" /> 
									<input type="hidden" value="${seat.start_date }" name="start_date" /> 
									<input type="hidden" value="${seat.room_name }" name="room_name" />
								</p>
							</c:forEach>

							<input type="hidden" name="theater_schedule_id" />

						</div>
					</div>




					<!-- //input fields -->
					<!-- seat availabilty list -->
					<ul class="seat_w3ls">
						<li class="smallBox greenBox">현재선택좌석</li>

						<li class="smallBox redBox">예매완료좌석</li>

						<li class="smallBox emptyBox">선택가능좌석</li>

						<button type="button" onclick="takeData()"
							style="left: 650px; top: 165px;">확인</button>
					</ul>



					<!-- screen 화면 -->
					<div class="screen">
						<h2 class="wthree">Screen</h2>
					</div>

					<!-- seat availabilty list -->
					<!-- seat layout -->
					<div class="seatStructure txt-center" style="overflow-x: auto;">
						<table id="seatsBlock">
							<p id="notification"></p>
							<tr>
								<td></td>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td></td>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>10</td>
								<td>11</td>
								<td>12</td>
							</tr>

							<div id="seatSelect">
								<c:forEach begin="1" end="12" var="i">
									<tr>
										<td><c:if test="${i eq 1}">
												<c:set value="A" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 2}">
												<c:set value="B" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 3}">
												<c:set value="C" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 4}">
												<c:set value="D" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 5}">
												<c:set value="E" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 6}">
												<c:set value="F" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 7}">
												<c:set value="G" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 8}">
												<c:set value="H" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 9}">
												<c:set value="I" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 10}">
												<c:set value="J" var="seatInit">
												</c:set>
											</c:if> <c:if test="${i eq 11}">
												<c:set value="K" var="seatInit"></c:set>
											</c:if> <c:if test="${i eq 12}">
												<c:set value="L" var="seatInit"></c:set>
											</c:if> ${seatInit}</td>
										<c:forEach begin="1" end="12" var="j">
											<td class="bookable">
												<label for="seat${(i-1)*12 + j}">
														<!-- 좌석생성 --> 
												<input type="checkBox" class="seats"
														name="${seatInit}${j}" id="seat${(i-1)*12 + j}"
														value="${seatInit}${j}">
												</label>
											</td>
											<c:if test="${j eq 5}">
												<!-- 5번칸이 끝나면 한칸 띄우기 -->
												<td></td>
											</c:if>



										</c:forEach>
									</tr>
								</c:forEach>
							</div>
						</table>


						<button type="button" onclick="updateTextArea()">좌석지정</button>
						<br>
						<input type="submit" value="결제하기" />

					</div>
					
					<div class="displayerBoxes txt-center" style="overflow-x: auto;">
						<table class="Displaytable w3ls-table" width="100%">
							<tr>
								<th>선택좌석명</th>
								<th>선택좌석수</th>
								<th>결제예정금액</th>
							</tr>
							<tr>
								<td> <input type="hidden" name="seat" />  
									<textarea id="seatsDisplay" class="result"></textarea></td>
								<td><input type="hidden" name="person" /> 
									<textarea id="numberDisplay" class="result"></textarea></td>
								<td><input type="hidden" name="seat_price" /> 
									<textarea id="priceDisplay" class="result"></textarea></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>


	<!-- js -->
	<!-- //js -->
	<!-- script for seat selection -->
	<script>
		var seatCount = 0;
		var list = [];
		<c:forEach items="${soldoutseat }" var="soseat">
		list.push("${soseat }");
		console.log(list)
		</c:forEach>;

		function onLoaderFunc() {
			for (var i = 0; i < list.length; i++) {  
				for (var j = 1; j < $("input:checkbox[class='seats']").length + 1; j++) {
					if (list[i] == $("input:checkbox[id='seat" + j + "']")
							.val()) {
						$("input:checkbox[id='seat" + j + "']").parents("td")
								.attr("class", "selected"); 
						$("input:checkbox[id='seat" + j + "']").attr(
								'disabled', true);
						$("input:checkbox[id='seat" + j + "']").addClass(
								'selected');
					}
				}
			}

			$(".seatStructure *").prop("disabled", true);
			$(".result").each(function() {
				$(this).attr('readonly', 'readonly');
			}) 
		}

		function takeData() {
			if (($("#Numseats").val().length == 0)) {
				alert("인원수를 입력해주세요");
			} else {
				$(".inputForm *").prop("disabled", false);
				$(".seatStructure *").prop("disabled", false);

				document.getElementById("notification").innerHTML = "<b style='margin-bottom:0px;background:#ff9800;letter-spacing:1px;'>좌석을 선택해주세요 :)</b>";
			}

		}

		$("input[type=submit]").on('click', function() {
			alert('결제페이지로 이동합니다.');
		})

		function updateTextArea() {
			if ($("input:checked").length == ($("#Numseats").val())) {
				var allSeatsVals = [];
				var allNumberVals = [];
				var allPriceVals = [];

				//배열에 저장
				allPriceVals.push($("#TicketPrice").val());
				allNumberVals.push($("#Numseats").val());
				$('#seatsBlock :checked').each(function() {
					allSeatsVals.push($(this).val());
				});

				//Displaying 
				$('#seatsDisplay').val(allSeatsVals); 
				$('input[name=seat]').val(allSeatsVals);
				$('#numberDisplay').val(allNumberVals);
				$('input[name=person]').val(allNumberVals);
				$('#priceDisplay').val(allPriceVals * allNumberVals);
				$('input[name=seat_price]').val(allPriceVals * allNumberVals);
				$('input[type=submit]').attr('disabled', false);
			} else {
				alert(($("#Numseats").val()) + "명의 인원을 선택해주세요.")
			}
		}
		function myFunction() {
			alert($("input:checked").length);
		}

		$(":checkbox").click(function() {
			if ($("input:checked").length == ($("#Numseats").val())) {
				$(":checkbox").prop('disabled', true); //모든좌석
				$(':checked').prop('disabled', false); //선택된좌석(초록좌석)
			} else {
				$(":checkbox").prop('disabled', false);
			}
		});
	</script>
	<!-- //script for seat selection -->

	<div style="clear: both;">
		<c:import url="../common/footer.jsp"></c:import>
	</div>
</body>
</html>