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
  <div class="col-2">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action active" id="list-home-list" data-bs-toggle="list" href="#list-home" role="tab" aria-controls="list-home">HICGV 할인쿠폰</a>
      <a class="list-group-item list-group-item-action" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">VIP 할인쿠폰</a>
    </div>
  </div>
  <div class="col-10">
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">...</div>
      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">...</div>
    </div>
  </div>
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
				<span>495</span>원
			</dd>
			<dt>
				<label for="">사용할 포인트</label>
			</dt>
			<dd>
				<input type="text" />원
			</dd>
			<dt>
				<input type="checkbox" />
			</dt>
			<dd>
				<label for="">모두사용</label>
			</dd>
			<div class="form_guide"><dl><dt>이용안내</dt><dd class="split">HICGV 포인트는 <em>1,000P</em> 이상부터 <em>10P</em> 단위로 사용 가능합니다.</dd></dl></div>
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
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="pay1" checked>
  <label class="form-check-label" for="flexRadioDefault1">
    신용카드
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="pay2" value="">
  <label class="form-check-label" for="flexRadioDefault2">
    휴대폰 결제
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="pay3">
  <label class="form-check-label" for="flexRadioDefault2">
    계좌이체
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="pay4">
  <label class="form-check-label" for="flexRadioDefault2">
    카카오페이
  </label>
</div>
      </div>
    </div>
    <div id="payInfo1">
		하이
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
                        <tr class="movie_name">
                            <th scope="row">영화명</th>
                            <td>언차티드</td>
                        </tr>
                        <tr class="theater">
                            <th scope="row">극장</th>
                            <td>CGV 강변</td>
                        </tr>
                        <tr class="screen">
                            <th scope="row">상영관</th>
                            <td>씨네앤포레</td>
                        </tr>
                        <tr class="movie_date">
                            <th scope="row">일시</th>
                            <td>2022년 2월 16일(수) 17:40~19:46</td>
                        </tr>
                        <tr class="people">
                            <th scope="row">인원</th>
                            <td>일반 1명</td>
                        </tr>
                        <tr class="seat">
                            <th scope="row">좌석</th>
                            <td>C1</td>
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
                    <tr class="payment_price">
                        <th scope="row">결제금액</th>
                        <td><span class="price">17,000</span>원</td>
                    </tr>
                    <tr class="payment_method">
                        <th scope="row">결제수단</th>
                        <td><span>휴대폰결제</span></td>
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
        <button type="button" class="btn btn-primary">결제하기</button>
      </div>
    </div>
  </div>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
<script>
	if($('input:radio[id=pay1]')).is('checked')){
		$('#pay1Info')}.show();
	} else {
		$('#pay1Info')}.hide();
	}
</script>
</body>
</html>