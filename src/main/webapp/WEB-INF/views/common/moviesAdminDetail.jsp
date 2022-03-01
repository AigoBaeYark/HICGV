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
				alert('이미 등록된 영화입니다.');
			}else if (checkID == 0) {
				oEditors.getById['description'].exec("UPDATE_CONTENTS_FIELD", []);
				//validation 검증
				
				//폼 submit
				
				$('#insertMovie').submit();
				alert('등록완료');
				$(this).attr('type','submit');
			}else if(checkID != 0) {
				alert('영화코드 중복확인을 해주세요');
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

			if ($('input[id=age]').val() === ('12세이상관람가')) {
				
				$('#12').attr('selected','selected');
				$('#select2-age_limit-container').text($('#12').text())
			}else if ($('input[id=age]').val() === ('15세이상관람가')) {
				$('#15').attr('selected','selected');
				$('#select2-age_limit-container').text($('#15').text())

			}else if ($('input[id=age]').val() === ('18세이상관람가')) {
				$('#18').attr('selected','selected');
				$('#select2-age_limit-container').text($('#18').text())

			}else if ($('input[id=age]').val() === ('전체관람가')) {
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
						console.log('미등록')
						alert('미등록 영화');
					}else if(data === 1){
						console.log('등록');
						alert('이미 등록된 영화입니다.')
					}
					
				},
				error: function(data) {
					checkID = data;
					console.log(data);
					alert('이미 DB에 등록된 영화 || 에러')
				}
			})
		})
		
	
	</script>
	
	
	
	<div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
        <div class="wrapper ">
            <div class="card card-3" style="width: 1440px; margin: 0 auto;">
                <div class="card-heading" style="width: 20%"> <h2 style="text-align: center; color: #eee;">영화 포스터</h2></div>
                 <form method="POST" action="insertMovie" id="insertMovie">
                 <input type="hidden" name="image_url" value="${poster }" />
                 <div class="card-body">
                 	<h2 class="title">영화 상세정보</h2>
                 	
                 	<div class="input-group">
                 		<label>영화 배우 (국문)</label>
						<input type="text" name="actor" value="${actors }" placeholder="영화배우명 (국문)" required />	
				
						<label>영화 배우 (영문)</label>
						<input type="text" name="" value="${actorsEn }" placeholder="영화배우명 (영문)" required />
					</div>
					<div class="input-group">
						<label>감독 (국문)</label>
						<input type="text" name="director" value="${director }" placeholder="감독명 (국문)" required />
				
						<label>감독 (영문)</label>
						<input type="text" name="" value="${directorEn }" placeholder="감독명 (국문)" required />
					</div>
                 	<div class="input-group">
                 		<label>영화 상영시간</label>
						<input type="number" name="running_time" value="${movieInfo.running_time }" placeholder="상영시간(분)ex-2시간30분 - 150" required 
						style="background-color: #000;width: 20%; font-weight: 900;padding-bottom: 3px;" />
						<span style="color: #eee;">분</span>
					</div>
					
					
					<label for="description">줄거리</label>
					<textarea name="description" id="description" >${movieInfo.description }</textarea>
                 	
                 </div>
                
                <div class="card-body" style="width: 40%">
                    
                        <div class="input-group">
                        	<label for="title_kor">영화 제목(국문)</label>
							<input type="text" name="title_kor" value="${movieInfo.title_kor }" placeholder="영화 제목(국문)" />
						</div>
						
                        <div class="input-group">
                        	<label for="title_eng">영화 제목(영문)</label>
							<input type="text" name="title_eng" value="${movieInfo.title_eng }" placeholder="영화 제목(영문)" />
						</div>
                        <div class="input-group">
                        	<label for="movie_id">영화코드</label>
                            <input class="input--style-3" type="text" placeholder="영화코드" name="movie_id" value="${movieInfo.movie_id }" readonly="readonly"  style="width: 40%; padding-bottom: 13px; background-color: #000; border: 0px;"> 
                            <span><button type="button" class="hvr-bubble-left" id="checkIdBtn" style="float: right;background-color: #e1e1e1;">중복확인</button></span>
<!--                             <input type="button" id="insertBtn" value="DB에  영화정보 등록" style="border: 1px solid #eee;margin: 0 auto;background-color: #000;color: #eee;"> -->                        </div>
                        <div class="input-group">
                        	<label for="opening_date">개봉일</label>
                            <input type="text" placeholder="YYYYDDMM 형식으로 입력" name="opening_date" value="${movieInfo.opening_date }">
                            <i class="fa-solid fa-calendar-check input-icon js-btn-calendar" style="top: 70%"></i>                     
						</div>
                        <div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                              	<label for="age_limit">관람 등급</label>
								<select id="age_limit" name = "age_limit">
									<option id="all" value="전체관람가">전체 관람가</option>
									<option id="12" value="12세관람가">12세 관람가 </option>
									<option id="15" value="15세관람가">15세 관람가</option>
									<option id="18" value="18세관람가">청소년 관람불가</option>
								</select>
						<input type="hidden" id="age" value="${movieInfo.age_limit }"/>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        
                        <div class="input-group">
							<label for="">장르</label>
							<input type="text" name="genre" value="${genre }"/>
						</div>
                        
                        <div class="p-t-10">
                            <button class="btn btn--pill btn--green" type="button" id="submitBtn">영화등록</button>
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
