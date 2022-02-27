<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/reset.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 부트 스트랩 --> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hicgv/pay</title>
</head>
<body>
<h2>pay.jsp</h2>
<div style="height: 300px;">
   <c:import url="/WEB-INF/views/common/header.jsp" />
</div>

<div class="accordion" id="accordionPanelsStayOpenExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        STEP 1. 할인쿠폰
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
      	<div class="row">
      	<select class="form-select" aria-label="Default select example" style="height: 100%">
		  <option selected>사용하실 쿠폰을 선택해주세요.</option>
		  <option value="${payInfo.hicgv_coupon }">HICGV 할인쿠폰 ${payInfo.hicgv_coupon }장</option>
		  <option value="${payInfo.vip_coupon }">VIP 할인쿠폰 ${payInfo.vip_coupon }장</option>
		</select>
</div>
      </div>
    </div>
    
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
		STEP 2. 포인트 사용
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
		<h5>HICGV 포인트</h5>
		<div>
			<dt>
				<label>보유포인트</label>
			</dt>
			<dd>
				<span id="userPoint" >${payInfo.point }</span>원
			</dd>
			<dt>
				<label>사용할 포인트</label>
			</dt>
			<dd>
				<input type="number" id="selPoint" readonly="readonly"/>원
				<input type="checkbox" id="pointAllCheck" onclick="chkPoint()"/>
				<label>모두사용</label>
			</dd>
			<div class="form_guide"><dl><dt>이용안내</dt><dd class="split">HICGV 포인트는 <em>1,000P</em> 이상부터 사용 가능합니다.</dd></dl></div>
		</div>      
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
        STEP 3. 최종결제 수단
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
      <div class="accordion-body">
        <div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="pay1" onclick="setDisplay();setPayMethod(event);" value="신용카드">
  <label class="form-check-label" for="flexRadioDefault1">
    신용카드
  </label>
  <div class="form_wrap select card_type form_bg" id="payInfo1" style="display: none;">
  		카드종류
		<select id="lp_card_type">
			<option selected="selected">카드를 선택하세요</option>
			<option card_code="BCC" card_type="1" card_digit="14" card_cd="N0002">BC카드</option>
			<option card_code="DIN" card_type="1" card_digit="14" card_cd="N0005">현대카드</option>
			<option card_code="KEB" card_type="1" card_digit="14" card_cd="N0012">KEB하나카드(구,외환)</option>
			<option card_code="WIN" card_type="1" card_digit="15" card_cd="N0023">삼성카드</option>
			<option card_code="SHB" card_type="1" card_digit="15" card_cd="N0021">신한카드</option>
			<option card_code="CNB" card_type="1" card_digit="16" card_cd="N0004">KB국민카드</option>
			<option card_code="KKB" card_type="1" card_digit="16" card_cd="N0024">카카오뱅크카드</option>
			<option card_code="NLC" card_type="1" card_digit="16" card_cd="N0017">NH카드</option>
			<option card_code="SCB" card_type="1" card_digit="16" card_cd="N0020">스탠다드차타드은행카드</option>
			<option card_code="CIT" card_type="1" card_digit="16" card_cd="N0003">씨티카드</option>
			<option card_code="AMX" card_type="1" card_digit="15" card_cd="N0001">롯데/아멕스카드</option>
			<option card_code="KBK" card_type="1" card_digit="16" card_cd="N0025">K뱅크</option>
			<option card_code="PHB" card_type="1" card_digit="16" card_cd="N0018">우리카드</option>
			<option card_code="SIN" card_type="1" card_digit="16" card_cd="N0022">신세계카드</option>
			<option card_code="HNB" card_type="1" card_digit="14" card_cd="N0006">하나카드(구,하나SK)</option>
			<option card_code="KJB" card_type="1" card_digit="16" card_cd="N0014">광주은행카드</option>
			<option card_code="SAN" card_type="1" card_digit="16" card_cd="N0019">산은캐피탈</option>
			<option card_code="NFF" card_type="1" card_digit="16" card_cd="N0016">수협카드</option>
			<option card_code="KDB" card_type="1" card_digit="16" card_cd="N0011">KDB산업은행카드</option>
			<option card_code="JBB" card_type="1" card_digit="16" card_cd="N0009">전북은행카드</option>
			<option card_code="JJB" card_type="1" card_digit="16" card_cd="N0010">제주은행카드</option>
			<option card_code="KEP" card_type="1" card_digit="16" card_cd="N0013">우체국카드</option>
			<option card_code="MGC" card_type="1" card_digit="16" card_cd="N0015">MG체크카드</option>
			<option card_code="HSC" card_type="1" card_digit="16" card_cd="N0007">KB증권카드(구,현대증권)</option>
			<option card_code="IBK" card_type="1" card_digit="16" card_cd="N0008">기업은행카드</option>
			<option card_code="SSG" card_type="1" card_digit="16" card_cd="N0026">SSG카드</option>
		</select>
	</div>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="pay2" onclick="setDisplay();setPayMethod(event);" value="휴대폰결제">
  <label class="form-check-label" for="flexRadioDefault2">
    휴대폰 결제
  </label>
  <div class="table_wrap transfer_wrap" id="payInfo2" style="display: none;">
		<h6>휴대폰 결제 순서</h6>
		<div class="paymentNotice">
			1. 우측 하단에 있는 "결제하기" 버튼 클릭해주세요.<br>
			2. 예매내역 확인 후 결제하기 버튼 클릭 시 결제 팝업창이 뜹니다.<br>
			3. 해당 팝업에서 통신사 선택 후 정보를 입력해주세요.
			<br><br>
			<b style="color:red">※ 휴대폰 결제 진행시 원할한 사용을 위하여 다음 사항을 꼭 확인하세요.</b><br>
			 * 팝업 차단 설정을 꼭 해제하셔야 합니다. (도구→팝업 차단 끄기)<br>
			 * 팝업 차단 해제 시, 웹 브라우저 새로고침으로 인하여 최대 10분 동안 동일 좌석 선택이 제한 될 수 있습니다.<br>
		</div>
	</div>
		</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="pay3" onclick="setDisplay();setPayMethod(event);" value="계좌이체">
  <label class="form-check-label" for="flexRadioDefault2">
    계좌이체
  </label>
  <div class="table_wrap transfer_wrap" id="payInfo3" style="display: none;">
		<h6>계좌이체 순서</h6>
		<div>1. 아래 결제하기 버튼 클릭 후 다음 단계로 이동<br>
		2. 결제내역 확인 후 결제하기 버튼 클릭 시 팝업창이 뜸<br>
		3. 해당 팝업에서 원하는 은행을 선택 후 계좌이체 정보를 입력하시면 됩니다.</div>
	<div class="payment_input_exp">
		<span>※ 계좌이체 취소 시 다음 사항을 꼭 확인해주세요.<br>
			1) 예매일 이후 7일 이내 취소 시 - 자동환불은행 : 취소 후 즉시 처리 가능<br>
			2) 예매일 7일 이후 취소 시 - 환불 요청일로부터 7일 이상 소요됨<br>
			※ 계좌이체 진행 도중 취소 시, 선택하신 좌석의 재선택이 일시 제한될 수 있습니다.(약10분간)
		</span>
	</div>
	</div>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="pay4" onclick="setDisplay();setPayMethod(event);" value="카카오페이">
  <label class="form-check-label" for="flexRadioDefault2">
    카카오페이
  </label>
  <div class="payment_input" id="payInfo4" style="display: none;">
			 <div class="table_wrap transfer_wrap">
			 	<h6>카카오페이 결제 순서</h6>
				 <div style="width: 600px;">
				 1. 우측 하단에 있는 '결제하기' 버튼을 클릭해주세요. <br>
				 2. 예매내역 확인 후 결제하기 버튼 클릭 시 '카카오페이' 결제 인증창이 뜹니다. <br>
				 3. '카카오페이' 결제 인증창에서 정보를 입력하신 후 결제해주세요.
				 </div>
			 </div>
			 <div class="payment_input_exp">
				 <span class="alert">
				 * '카카오페이' 는 신용카드 선할인과 카드사 포인트는 이용이 불가능하며, 신용카드별 청구할인은 이용이 가능합니다.</span>
			 </div>
		 </div>
		</div>
      </div>
    </div>
  </div>
</div>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  결제하기
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">예매내역 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="bd">
        <div class="article reservation_info">
        	
            <h5>예매정보<span class="desc">결제하시기 전 예매내역을 다시 한번 확인해 주세요.</span></h5>
			
            <div class="content">
                <div class="poster"><img src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85624/85624_185.JPG" alt="" style="visibility: visible;"></div>
                <table>
                    <caption>예매정보</caption>
                    <thead></thead>
                    <tbody>
                        <tr id="movie_name">
                            <th scope="row">영화명</th>
                            <td>${payInfo.title_kor }</td>
                        </tr>
                        <tr id="theater">
                            <th scope="row">극장</th>
                            <td id="theater">${payInfo.location_name }</td>
                        </tr>
                        <tr id="screen">
                            <th scope="row">상영관</th>
                            <td>${payInfo.room_name }</td>
                        </tr>
                        <tr id="movie_date">
                            <th scope="row">일시</th>
                            <td>${payInfo.start_date }</td>
                        </tr>
                        <tr id="people">
                            <th scope="row">인원</th>
                            <td>일반 ${payInfo.person }명</td>
                        </tr>
                        <tr id="seat">
                            <th scope="row">좌석</th>
                            <td>${payInfo.seat }</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="article payment_info">
        	
            <h5>결제정보<span class="desc">결제하기 버튼을 클릭하시면 결제가 완료됩니다.</span></h5>
			
            <table>
                <caption>결제정보</caption>
                <thead></thead>
                <tbody>
                    <tr id="payment_price">
                        <th scope="row">결제금액</th>
                        <td><span class="price">${payInfo.tot_price }</span>원</td>
                    </tr>
                    <tr id="payment_method">
                        <th scope="row">결제수단</th>
                        <td><span id="payMethod"></span></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="article desc" style="border-bottom: none; background: none;">
        	
            <ul>
                <li>영화상영 시간 기준 30분 전까지 온라인 예매 취소가 가능하며, 이후에는 현장에서 취소 하셔야 합니다. (영화 상영 후 취소 불가)</li>
                <li>현장 취소를 하는 경우 상영시간 이전까지만 가능하며 영화 상영 시작 시간 이후 취소나 환불은 되지 않습니다.</li>
                <li>입장 지연에 따른 관람 불편을 최소화 하기 위해 본 영화는 10분 후 상영이 시작됩니다.
					씨네앤포레관은 영화 상영 시작 20분 전 입장 가능하며 자연 컨셉의 라운지와 상영관에서 자유롭게 휴식을 즐기실 수 있습니다.</li>
            </ul>
        </div>
    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="kakaoPay();">결제하기</button>
      </div>
      <ul class="list-group">
      	 <li class="list-group-item list-group-item-primary">A simple primary list group item</li>
      </ul>
    </div>
  </div>
</div>

<div id="payPage"></div>

<script>

function kakaoPay() {
	var movie_name=$('tr#movie_name:first-child > td').text();
	var theater=$('td#theater').text()
	var screen=$('tr:nth-child(3) > td').text();
	var movie_date=$('tr:nth-child(4) > td').text();
	var people=$('tr:nth-child(5) > td').text();
	var seat=$('tr:nth-child(6) > td').text();
	var payment_price=$('tr#payment_price:first-child > td').text();
	
	$.ajax({
		type: "GET",
		url: "kakaoPay",
		contentType: "application/json; charset=UTF-8",
		data: {
			'movie_name' : movie_name,
			'theater' : theater,
			'screen' : screen,
			'moviedate' : movie_date,
			'people' : people,
			'seat' : seat,
			'payment_price' : payment_price
		},
		async: false,
		success: function(data) {
			alert("성공");
			$('html').html(data);
			
		}
	})
}

function chkPoint() { 
		var point=$('span#userPoint').text();
		console.log( $('span#userPoint').text() );
		
	if ($('input:checkbox[id=pointAllCheck]').is(':checked')) {
		alert(point);
		if (point<1000) {
			alert("1,000P 이상부터 사용 가능합니다.");
			$('input:checkbox[id=pointAllCheck]').prop("checked", false); //checkbox 체크(true), 체크해제(false)

		}
		if(point>=1000){
			$('input[id=selPoint]').val(point);
		}
	} else {
		$('input[id=selPoint]').val(null); // checkbox 체크해제시 input내용 지우기
	}
}


function setDisplay(){
	     if($('input:radio[id=pay1]').is(':checked')){
	    	 $('#payInfo1').css('display', 'block');
	    	 $('#payInfo2').css('display', 'none');
	    	 $('#payInfo3').css('display', 'none');
	    	 $('#payInfo4').css('display', 'none');
	    } else if($('input:radio[id=pay2]').is(':checked')){
	    	 $('#payInfo1').css('display', 'none');
	    	 $('#payInfo2').css('display', 'block');
	    	 $('#payInfo3').css('display', 'none');
	    	 $('#payInfo4').css('display', 'none');
	    } else if($('input:radio[id=pay3]').is(':checked')){
	    	 $('#payInfo1').css('display', 'none');
	    	 $('#payInfo2').css('display', 'none');
	    	 $('#payInfo3').css('display', 'block');
	    	 $('#payInfo4').css('display', 'none');
	    } else if($('input:radio[id=pay4]').is(':checked')){
	    	 $('#payInfo1').css('display', 'none');
	    	 $('#payInfo2').css('display', 'none');
	    	 $('#payInfo3').css('display', 'none');
	    	 $('#payInfo4').css('display', 'block');
	    }

	}
	
function setPayMethod(event){
	document.getElementById('payMethod').innerText=event.target.value;
}



</script>


<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>

</body>
</html>