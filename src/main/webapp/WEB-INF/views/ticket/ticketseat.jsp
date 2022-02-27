<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
<head>
<c:import url="../common/header.jsp"></c:import>
    <title>ticket/ticketseat</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Movie Seat Selection a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
    <script>
        addEventListener("load", function () {
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" /> 
<link rel="stylesheet" href="resources/css/ticket/ticketseat.css" />
<link rel="stylesheet" href="resources/css/ticket/jquery.seat-charts.css" />
<link rel="stylesheet" href="resources/css/ticket/font-awesome.css" />
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <!-- //fonts -->
</head>


<body onload="onLoaderFunc()">
    <h1>Movie Seat Selection</h1>
    <div class="container">
<!-- <img src="/cgv/resources/img/ticket/banner.jpg" alt="좌석뒷배경" > -->
        <div class="w3ls-reg">
            <!-- input fields -->
            <div class="inputForm">
                <h2>인원/좌석선택</h2>
                <div class="mr_agilemain">
                    <div class="agileits-left">
                        <label> 가격(이 이부분 히든처리하고 9천원 고정할까 생각중)
                            <span>*</span>
                        </label>
                        <input type="text" id="TicketPrice" required>
                    </div>
                    <div class="agileits-right">
                        <label> 인원수
                            <span>*</span>
                        </label>
                        <input type="number" id="Numseats" required min="1">
                    </div>
                </div>
                
                <div class="col-6">
			    <!-- 영화정보를 넘어오게 해야함 -->
			    <c:forEach items="${ticketseat }" var="seat">
					<h2> 선택정보 </h2>
					<p> ${seat.title_kor } &nbsp; | &nbsp; ${seat.location_name } &nbsp; | &nbsp; ${seat.room_name }  <br>
					  ${seat.year }. ${seat.month }. ${seat.day }  &nbsp;  ${seat.hour }:${seat.minute } ~ ${seat.endHour }:${seat.endMinute } </p>
					</c:forEach> 
				</div>
            </div>
           
            <button onclick="takeData()">Start Selecting</button>
            
            
            <!-- //input fields -->
            <!-- seat availabilty list -->
            <ul class="seat_w3ls">
                <li class="smallBox greenBox">현재선택좌석</li>

                <li class="smallBox redBox">예매완료좌석</li>

                <li class="smallBox emptyBox">선택가능좌석</li>
            </ul>
            
            
            <!-- screen 화면 -->
             <div class="screen">
                    <h2 class="wthree">Screen</h2>
              </div>
                
             <!-- seat availabilty list -->
            <!-- seat layout -->   
            <div class="seatStructure txt-center" style="overflow-x:auto;">
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
                    <tr>
                        <td>A</td>
                        <td>
                            <input type="checkbox" class="seats" value="A1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A5">
                        </td>
                        <td class="seatGap"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="A12">
                        </td>
                    </tr>

                    <tr>
                        <td>B</td>
                        <td>
                            <input type="checkbox" class="seats" value="B1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="B6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="B12">
                        </td>
                    </tr>

                    <tr>
                        <td>C</td>
                        <td>
                            <input type="checkbox" class="seats" value="C1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="C6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="C12">
                        </td>
                    </tr>

                    <tr>
                        <td>D</td>
                        <td>
                            <input type="checkbox" class="seats" value="D1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="D6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="D12">
                        </td>
                    </tr>

                    <tr>
                        <td>E</td>
                        <td>
                            <input type="checkbox" class="seats" value="E1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="E6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="E12">
                        </td>
                    </tr>

                    <tr class="seatVGap"></tr>

                    <tr>
                        <td>F</td>
                        <td>
                            <input type="checkbox" class="seats" value="F1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="F6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="F12">
                        </td>
                    </tr>

                    <tr>
                        <td>G</td>
                        <td>
                            <input type="checkbox" class="seats" value="G1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="G6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="G12">
                        </td>
                    </tr>

                    <tr>
                        <td>H</td>
                        <td>
                            <input type="checkbox" class="seats" value="H1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="H6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="H12">
                        </td>
                    </tr>

                    <tr>
                        <td>I</td>
                        <td>
                            <input type="checkbox" class="seats" value="I1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="I6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="I12">
                        </td>
                    </tr>

                    <tr>
                        <td>J</td>
                        <td>
                            <input type="checkbox" class="seats" value="J1">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J2">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J3">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J4">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J5">
                        </td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="J6">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J7">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J8">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J9">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J10">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J11">
                        </td>
                        <td>
                            <input type="checkbox" class="seats" value="J12">
                        </td>
                    </tr>
                </table>

               
                <button onclick="updateTextArea()">Confirm Selection</button>
                <a href="pay"> *결제하기(임시로 만듦)* </a>
                 
                
            </div>
            <!-- //seat layout -->
            <!-- details after booking displayed here -->
            <div class="displayerBoxes txt-center" style="overflow-x:auto;">
                <table class="Displaytable w3ls-table" width="100%">
                    <tr>
                        <th>선택좌석명</th>
                        <th>선택좌석수</th>
                        <th>결제예정금액(단가*인원 식 넣을까 생각중)</th>
                    </tr>
                    <tr>
                       <td>
                            <textarea id="seatsDisplay"></textarea>
                        </td>
                        <td>
                            <textarea id="NumberDisplay"></textarea>
                        </td>
                         <td>
                            <textarea id="nameDisplay"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- //details after booking displayed here -->
        </div>
    </div>

    <!-- js -->
    <script src="js/ticket/jquery-2.2.3.min.js"></script>
    <!-- //js -->
    <!-- script for seat selection -->
    <script>
        function onLoaderFunc() {
            $(".seatStructure *").prop("disabled", true);
            $(".displayerBoxes *").prop("disabled", true);
        }
	
        function takeData() {
            if (($("#TicketPrice").val().length == 0) || ($("#Numseats").val().length == 0)) {
                alert("Please Enter your Name and Number of Seats");
            } else {
                $(".inputForm *").prop("disabled", true);
                $(".seatStructure *").prop("disabled", false);
                document.getElementById("notification").innerHTML =
                    "<b style='margin-bottom:0px;background:#ff9800;letter-spacing:1px;'>좌석을 선택해주세요 :)</b>";
            }
        }


        function updateTextArea() {

            if ($("input:checked").length == ($("#Numseats").val())) {
                $(".seatStructure *").prop("disabled", true);

                var allNameVals = [];
                var allNumberVals = [];
                var allSeatsVals = [];

                //Storing in Array
                allNameVals.push($("#TicketPrice").val());
                allNumberVals.push($("#Numseats").val());
                $('#seatsBlock :checked').each(function () {
                    allSeatsVals.push($(this).val());
                });

                //Displaying 
                $('#nameDisplay').val(allNameVals);
                $('#NumberDisplay').val(allNumberVals);
                $('#seatsDisplay').val(allSeatsVals);
            } else {
                alert("Please select " + ($("#Numseats").val()) + " seats")
            }
        }


        function myFunction() {
            alert($("input:checked").length);
        }

        
       /*  function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }
         */

         

        $(":checkbox").click(function () {
            if ($("input:checked").length == ($("#Numseats").val())) {
                $(":checkbox").prop('disabled', true);
                $(':checked').prop('disabled', false);
            } else {
                $(":checkbox").prop('disabled', false);
            }
        });
        
         
         
        /* 인원 , 좌석넘버, 금액(단가), 총금액 기재하깅 */
       var audience="";
        var seatName="";
        var unitPrice="";
        var totalPrice="";
        
        /* 좌석 하나하나 맞춘거 */
        $('.seatStructure txt-center').mouseover(function() {
        	console.log($(this).children('#seatsBlock').text()); //좌석명 가져오기
        	//console.log($(this).children('td').text()); //좌석명 가져오기
        	console.log($(this).children('input').val()); //좌석명 가져오기
        	seatName = $(this).children('input').val(); //값 지정해주기
        	console.log('seatName :  '+seatName); //콘솔값 넣음
        })
        
        
        
        
 
        
        
    </script>
    <!-- //script for seat selection -->
    
<div style="clear: both;">
<c:import url="../common/footer.jsp"></c:import>
</div>
</body>
</html>