<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="theaterList">
<div class="row g-3 align-items-center">
  <div class="col-auto">
    <label for="inputPassword6" class="col-form-label">movie_id</label>
  </div>
  <div class="col-auto">
    <input type="text" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
  </div>
  <div class="col-auto">
    <span id="passwordHelpInline" class="form-text">
      숫자 8자리를 정확하게 입력해주세요
    </span>
  </div>
</div>
theater_room_id 
<select class="form-select" aria-label="Default select example" style="width: 200px">
  <option>1</option>
  <option>2</option>
  <option>3</option>
  <option>4</option>
  <option>5</option>
  <option>6</option>
  <option>7</option>
  <option>8</option>
  <option>9</option>
</select>
location_id 
<select class="form-select" aria-label="Default select example" style="width: 200px">
  <option>101</option>
  <option>102</option>
  <option>103</option>
  <option>104</option>
  <option>105</option>
</select>
<input type="text" class="text mr5 ml10" style="width: 100px" name="startDatePicker" id="startDatePicker">
<input type="button" value="start_date" id="startDt" onclick=""/>
<script>
	//달력icon클릭시 datepicker실행 
$('#startDt').click(function(e){ 
	e.preventDefault(); 
	$("#startDatePicker").focus(); 
	}); 
	$('#endDt').click(function(e){ 
		e.preventDefault(); 
		$("#endDatePicker").focus(); 
		}); 
	//예약발행 달력_시작 
		$("#startDatePicker").datepicker({ 
			dateFormat:'yymmdd',
			showMonthAfterYear : true,
			changeMonth : true,
			changeYear : true,
			numberOfMonths:1,
			dayNamesMin : ['일','월','화','수','목','금','토'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			minDate : -0, //오늘날짜 이후부터만 설정되게 
			onClose:function(selectedDate){ 
				$('#endDatePicker').datepicker("option","minDate",selectedDate); },
				beforeShow : 
					function(input){ 
					var i_offset = $(input).offset(); 
				setTimeout(function(){ 
					$("#ui-datepicker-div").css({
						'top':i_offset.top - 215,
						'bottom' :'', 
						left : i_offset.left}) 
						}) 
					} 
				}); 
</script>
<input type="submit" value="입력"/> <br />
</form>
</body>
</html>