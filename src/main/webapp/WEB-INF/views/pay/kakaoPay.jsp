<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<h2>kakaoPay</h2>

	movie_name : ${movieName }
	theater :${theater }
	screen :${screen }
	movie_date :${movieDate }
	people :${people }
	seat :${seat }
	payment_price :${paymentPrice }


	<script>
	$(document).ready( function(){
    var IMP = window.IMP; 
    IMP.init('imp68424991'); 
    IMP.request_pay({
    	pg : "kakaopay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '결제',
        amount : 주문개수,
        buyer_email : '구매자 이메일',
        buyer_name : '구매자 이름',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            location.href='결제완료후 갈 url';
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });
	
    /* $(document).ready( function(){
    	
        var IMP = window.IMP; // 생략가능
        IMP.init('imp68424991'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
            name : '주문명:결제테스트',
            amount : 14000,
            buyer_email : 'iamport@siot.do',
            buyer_name : '구매자이름',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456'
            alert('hah');
        }, function(rsp) {
        	alert('check function');
            if ( rsp.success ) {
            	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            	jQuery.ajax({
            		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
            		type: 'POST',
            		dataType: 'json',
            		data: {
        	    		imp_uid : 'uid'
        	    		//기타 필요한 데이터가 있으면 추가 전달
            		}
            	}).done(function(data) {
            		alert('check done');
            		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
            		if ( everythings_fine ) {
            			var msg = '결제가 완료되었습니다.';
            			msg += '\n고유ID : ' + 'id';
            			msg += '\n상점 거래ID : ' + 'uid';
            			msg += '\결제 금액 : ' + '100';
            			msg += '카드 승인번호 : ' + '192939';
            			
            			alert(msg);
            		} else {
            			alert('check done else');
            			//[3] 아직 제대로 결제가 되지 않았습니다.
            			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
            		}
            	});
            } else {
            	alert('check functio else');
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                
                alert(msg);
            }
        });
        
    });
     */
    </script>
 
</body>
</html>
