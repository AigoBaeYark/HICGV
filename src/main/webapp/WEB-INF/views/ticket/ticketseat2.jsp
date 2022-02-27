<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<c:import url="../common/header.jsp"></c:import>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/theater/boot.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/ticket/ticket.css" />

<title>ticket/ticketseat</title>

</head>
<body>

<style> 
      .seat {
          width: 30px;
          height: 30px;
        }
        
      .clicked {
          background-color: red;
          color: white;
        }
</style>
    

<!-- Contaniner -->
	<div id="contaniner"  class=""><!-- 배경이미지가 없을 경우 class 삭제  -->
        
		<!-- Contents Area -->
		 <div id="contents" class="">
    
    <div class="container">
	  <div class="row">
	    <div class="col-6">
			<span>인원수</span>
			<form name="headcountForm" method="post">
		   <select id="headcount" name="headcount" onchange="onheadcount(this)">
		  	<option selected>인원수를 선택해주세요 (명)</option>
		  	<option value="1명">1</option>
		 	 <option value="2명">2</option>
		  	<option value="3명">3</option>
		  	<option value="4명">4</option>
		 	 <option value="5명">5</option>
		  	<option value="6명">6</option>
			</select> 
			<div id='result'></div>
			</form>
		</div>
	    <div class="col-6">
	    <!-- 영화정보를 넘어오게 해야함 -->
	    <c:forEach items="${ticketseat }" var="seat">
			<span>선택정보</span>
			<p> ${seat.location_name } | ${seat.room_name } <br/>
			  ${seat.year }. ${seat.month }. ${seat.day } <br/> 
			  ${seat.hour }:${seat.minute } ~ ${seat.endHour }:${seat.endMinute } </p>
			</c:forEach>
			 
		</div>
	  </div>
	</div>
    
    
	   
 <!-- SECTION -->
<section>
<div id="sec">
		
<p class="screen">SCREEN</p>


<body>
    <div class="seat-wrapper"></div>
</body>
<script>
    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";

    for (let i = 0; i < 7; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 0; j < 7; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            //3중포문을 사용하지 않기위해 
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                }
                console.log(selectedSeats);
            })
        }
    }

    function mapping(input, i, j) {
        if (i === 0) {
            input.value = "A" + j;
        } else if (i === 1) {
            input.value = "B" + j;
        } else if (i === 2) {
            input.value = "C" + j;
        } else if (i === 3) {
            input.value = "D" + j;
        } else if (i === 4) {
            input.value = "E" + j;
        } else if (i === 5) {
            input.value = "F" + j;
        } else if (i === 6) {
            input.value = "G" + j;
        }
    }
</script>



<br>
<br>
<br>
<!-- PayDao 테스트용 -->

<a href="pay?userId=1&movieId=20210087">pay</a>

			</div>
		</section>
	</div>
	
	<div style="clear: both;">
		<c:import url="../ticket/tickettab.jsp"></c:import>
	</div>
           	
			
	<div class="banner" id="ticket_bottom_banner" style="padding-top: 0px;">
		<!-- 흰 배경 -->
	</div>
	
</div>

<script type="text/javascript">

function onheadcount(e) {
	  // 선택된 데이터 가져오기
	  var value = e.value;
	  
	 /* //선택인원 확인 알림창
	  alert(selected_value + '을 선택하였습니다.'); */
	   
	  // 데이터 출력
	  document.getElementById('result').innerText = value;
	  
	  console.log(e.options);
	  
	//선택인원 확인 알림창 	// @@alert를 괄호 밖에다가 빼서 실행하기도 전에 alert창이 뜨는 오류가 났음
	  var target = document.getElementById("headcount");
	 	/* alert( target.options[target.selectedIndex].text + '명을 선택합니다.');     // 옵션 text 값 */
	   	alert( target.options[target.selectedIndex].value + '을 선택합니다.');     // 옵션 value 값 */
	}
	
	
	
 

	

</script>


<div style="clear: both;">
<c:import url="../common/footer.jsp"></c:import>
</div>
</body>
</html>