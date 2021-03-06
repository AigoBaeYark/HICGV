<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="styleSheet" href="${path }/resources/css/main/daterangepicker.css"  media="all"  />
<link rel="styleSheet" href="${path }/resources/css/main/select2.min.css"  media="all" /> 
<link rel="styleSheet" href="${path }/resources/css/main/movieInput.css"  media="all" />
<link rel="styleSheet" href="${path }/resources/css/main/material-design-iconic-font.css"  media="all" />
<link rel="styleSheet" href="${path }/resources/css/hover.css"  media="all" />
<script src="${path }/resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8" ></script>
<script src="${path }/resources/js/main/movieDetail.js"  ></script>
<script src="${path }/resources/js/main/moment.min.js"  ></script>
<script src="${path }/resources/js/main/select2.min.js"  ></script>

<title>moviesAdminDetail</title>
</head>

<body>

	<style>
		div.contents input{margin-bottom: 5px; margin-top: 5px}
	</style>

		<script type="text/javascript">
		let oEditors = [] 
		
		smartEditor = function() { 
		
		console.log("Naver SmartEditor") 
		
		nhn.husky.EZCreator.createInIFrame({ 
			oAppRef: oEditors, 
			elPlaceHolder: "description", 
			sSkinURI: "${path }/resources/smartEditor/SmartEditor2Skin.html", 
			fCreator: "createSEditor2"
		 }) 
		} 
	

		
		var checkID=2;
		$('#submitBtn').click(function() {
			
			let param = decodeURI(decodeURIComponent(checkID));
			if(checkID == 1 ){
				alert('?????? ????????? ???????????????.');
			}else if (checkID == 0) {
				oEditors.getById['description'].exec("UPDATE_CONTENTS_FIELD", []);
				//validation ??????
				
				//??? submit
				
				$('#insertMovie').submit();
				alert('????????????');
				$(this).attr('type','submit');
			}else if(checkID != 0) {
				alert('???????????? ??????????????? ????????????');
			}
		})
		
	
		$(document).ready(function() {
			/* $('input[name="opening_date"]').daterangepicker(); */
			smartEditor()
			$("#smart_editor2_content").css("background-color","#eee");
			console.log($('input[id=age]').val() );
			console.log($('#age_limit').val());
			//alert($('input[id=age]').val());
			$('.card-heading').css('background',"url('${poster }') top /cover no-repeat")
			$('.card-heading').css('background-size',"260px")
			$('.card-heading').css('background-position-x',"center")
			$('.card-heading').css('background-position-y',"center")

			if ($('input[id=age]').val() === ('12??????????????????')) {
				
				$('#12').attr('selected','selected');
				$('#select2-age_limit-container').text($('#12').text())
			}else if ($('input[id=age]').val() === ('15??????????????????')) {
				$('#15').attr('selected','selected');
				$('#select2-age_limit-container').text($('#15').text())

			}else if ($('input[id=age]').val() === ('18??????????????????')) {
				$('#18').attr('selected','selected');
				$('#select2-age_limit-container').text($('#18').text())

			}else if ($('input[id=age]').val() === ('???????????????')) {
				$('#all').attr('selected','selected');
				$('#select2-age_limit-container').text($('#all').text())

			}
			
			console.log($('#age_limit').val());

		})
		
		$('#checkIdBtn').on('click', function () {
			console.log($('input[name=movie_id]').val());
			var movieId = $('input[name=movie_id]').val();
			$.ajax({
				type: "get",
				url: "checkDuplicationMovie",
				data: {
					'movie_id' : movieId
				},
				success: function (data) {
					console.log(data);
					checkID = data;
					if (data === 0) {
						console.log('?????????')
						alert('????????? ??????');
					}else if(data === 1){
						console.log('??????');
						alert('?????? ????????? ???????????????.')
					}
					
				},
				error: function(data) {
					checkID = data;
					console.log(data);
					alert('?????? DB??? ????????? ?????? || ??????')
				}
			})
		})
		
	
	</script>
	
	
	
	<div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
        <div class="wrapper ">
            <div class="card card-3" style="width: 1440px; margin: 0 auto;">
                <div class="card-heading" style="width: 20%"> <h2 style="text-align: center; color: #eee;">?????? ?????????</h2></div>
                 <form method="POST" action="insertMovie" id="insertMovie">
                 <input type="hidden" name="image_url" value="${poster }" />
                 <div class="card-body">
                 	<h2 class="title">?????? ????????????</h2>
                 	
                 	<div class="input-group">
                 		<label>?????? ?????? (??????)</label>
						<input type="text" name="actor" value="${actors }" placeholder="??????????????? (??????)" required />	
				
						<label>?????? ?????? (??????)</label>
						<input type="text" name="" value="${actorsEn }" placeholder="??????????????? (??????)" required />
					</div>
					<div class="input-group">
						<label>?????? (??????)</label>
						<input type="text" name="director" value="${director }" placeholder="????????? (??????)" required />
				
						<label>?????? (??????)</label>
						<input type="text" name="" value="${directorEn }" placeholder="????????? (??????)" required />
					</div>
                 	<div class="input-group">
                 		<label>?????? ????????????</label>
						<input type="number" name="running_time" value="${movieInfo.running_time }" placeholder="????????????(???)ex-2??????30??? - 150" required 
						style="background-color: #000;width: 20%; font-weight: 900;padding-bottom: 3px;" />
						<span style="color: #eee;">???</span>
					</div>
					
					
					<label for="description">?????????</label>
					<textarea name="description" id="description" >${movieInfo.description }</textarea>
                 	
                 </div>
                
                <div class="card-body" style="width: 40%">
                    
                        <div class="input-group">
                        	<label for="title_kor">?????? ??????(??????)</label>
							<input type="text" name="title_kor" value="${movieInfo.title_kor }" placeholder="?????? ??????(??????)" />
						</div>
						
                        <div class="input-group">
                        	<label for="title_eng">?????? ??????(??????)</label>
							<input type="text" name="title_eng" value="${movieInfo.title_eng }" placeholder="?????? ??????(??????)" />
						</div>
                        <div class="input-group">
                        	<label for="movie_id">????????????</label>
                            <input class="input--style-3" type="text" placeholder="????????????" name="movie_id" value="${movieInfo.movie_id }" readonly="readonly"  style="width: 40%; padding-bottom: 13px; background-color: #000; border: 0px;"> 
                            <span><button type="button" class="hvr-bubble-left" id="checkIdBtn" style="float: right;background-color: #e1e1e1;">????????????</button></span>
<!--                             <input type="button" id="insertBtn" value="DB???  ???????????? ??????" style="border: 1px solid #eee;margin: 0 auto;background-color: #000;color: #eee;"> -->                        </div>
                        <div class="input-group">
                        	<label for="opening_date">?????????</label>
                            <input type="text" placeholder="YYYYDDMM ???????????? ??????" name="opening_date" value="${movieInfo.opening_date }">
                            <i class="fa-solid fa-calendar-check input-icon js-btn-calendar" style="top: 70%"></i>                     
						</div>
                        <div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                              	<label for="age_limit">?????? ??????</label>
								<select id="age_limit" name = "age_limit">
									<option id="all" value="???????????????">?????? ?????????</option>
									<option id="12" value="12????????????">12??? ????????? </option>
									<option id="15" value="15????????????">15??? ?????????</option>
									<option id="18" value="18????????????">????????? ????????????</option>
								</select>
						<input type="hidden" id="age" value="${movieInfo.age_limit }"/>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        
                        <div class="input-group">
							<label for="">??????</label>
							<input type="text" name="genre" value="${genre }"/>
						</div>
                        
                        <div class="p-t-10">
                            <button class="btn btn--pill btn--green" type="button" id="submitBtn">????????????</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	
	
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
	
	
</body>

</html>
