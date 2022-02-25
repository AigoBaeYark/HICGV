<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/theater/boot.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/ticket/ticket.css" />

<title>ticket/ticketseat</title>
<div style="height: 300px;">
<c:import url="../common/header.jsp"></c:import>
</div> 
</head>
<body>

<style> /* css로 보내줄예정 */
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