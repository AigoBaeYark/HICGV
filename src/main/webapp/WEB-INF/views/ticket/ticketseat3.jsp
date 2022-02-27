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
                        <label> 가격(이 이부분 히든처리하면 될듯)
                            <span>*</span>
                        </label>
                        <input type="text" id="Username" required>
                    </div>
                    <div class="agileits-right">
                        <label> 인원수
                            <span>*</span>
                        </label>
                        <input type="number" id="Numseats" required min="1">
                    </div>
                </div>
                <button onclick="takeData()">Start Selecting</button>
                
                
                <div class="col-6">
			    <!-- 영화정보를 넘어오게 해야함 -->
			    <%-- <c:forEach items="${ticketseat }" var="seat">
					<span > 선택정보 </span>
					<p> ${seat.title_kor } &nbsp; | &nbsp; ${seat.location_name } &nbsp; | &nbsp; ${seat.room_name }  <br>
					  ${seat.year }. ${seat.month }. ${seat.day }  &nbsp;  ${seat.hour }:${seat.minute } ~ ${seat.endHour }:${seat.endMinute } </p>
					</c:forEach> 
				</div> --%>
            </div>
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
                    
                    
                    <div id="seatSelect">
								<strong id="screen">Screen</strong>
								
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
													<c:set value="J" var="seatInit"></c:set>
												</c:if> <c:if test="${i eq 11}">
													<c:set value="K" var="seatInit"></c:set>
												</c:if> <c:if test="${i eq 12}">
													<c:set value="L" var="seatInit"></c:set>
												</c:if> ${seatInit}</td>
											<c:forEach begin="1" end="12" var="j">
												<td class="bookable"><label for="seat${(i-1)*15 + j}">
														<input type="checkBox" class="seats" name="${seatInit}${j}"
														id="seat${(i-1)*15 + j}" value="${seatInit}${j}">
												</label></td>
												<c:if test="${j eq 5}">
													<td></td>
												</c:if>
												
											</c:forEach>
										</tr>
									</c:forEach>
								
							</div>
                   
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
                        <th>결제예정금액</th>
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
	    var seatCount = 0; // 선택 좌석 수
		var list = [];
		<c:forEach items="${seat }" var="seats">
		list.push("${seats }");
		console.log(list)
		</c:forEach>
		
		
	 /* 인원 , 좌석넘버, 금액(단가), 총금액 기재 */
      	var audience="";
        var seatName="";
        var unitPrice="";
        var totalPrice="";
	        
	        $('.seatStructure txt-center').mouseover(function() {
	        	
	        })
	    
        function onLoaderFunc() {
            $(".seatStructure *").prop("disabled", true);
            $(".displayerBoxes *").prop("disabled", true);
        } 

       function takeData() {
            if (($("#Username").val().length == 0) || ($("#Numseats").val().length == 0)) {
                alert("Please Enter your Name and Number of Seats");
            } else {
                $(".inputForm *").prop("disabled", true);
                $(".seatStructure *").prop("disabled", false);
                document.getElementById("notification").innerHTML =
                    "<b style='margin-bottom:0px;background:#ff9800;letter-spacing:1px;'>Please Select your Seats NOW!</b>";
            }
            
            for (var i = 0; i < list.length; i++) { // 이미 예매된 좌석 선택 불가
    			for (var j = 1; j < $("input:checkbox[class='seats']").length + 1; j++) {
    				if (list[i] == $("input:checkbox[id='seat" + j + "']").val()) {
    					alert(list[i]);
    					$("input:checkbox[id='seat" + j + "']").parents("td").attr(
    							"class", "selected");
    					$("input:checkbox[id='seat" + j + "']").attr('disabled',true);
    					$("input:checkbox[id='seat" + j + "']").addClass('selected');
    				}
    			}
    		}
        } 
    	


        function updateTextArea() {

            if ($("input:checked").length == ($("#Numseats").val())) {
                $(".seatStructure *").prop("disabled", true);

                var allNameVals = [];
                var allNumberVals = [];
                var allSeatsVals = [];

                //Storing in Array
                allNameVals.push($("#Username").val());
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

        //원래 이 단락만 주석 되어 있음
        function getCookie(cname) {
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
        


       $(":checkbox").click(function () {
            if ($("input:checked").length == ($("#Numseats").val())) {
                $(":checkbox").prop('disabled', true);
                $(':checked').prop('disabled', false);
            } else {
                $(this).attr('disabled', false);
            }
        }); 
        
          
      
      
        
       
        
		
        
        
    </script>
    <!-- //script for seat selection -->
    
<div style="clear: both;">
<c:import url="../common/footer.jsp"></c:import>
</div>
</body>
</html>