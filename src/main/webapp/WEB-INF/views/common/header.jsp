<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>       

<link rel="stylesheet" href="${path }/resources/css/main/reset.css" />
<link rel="stylesheet" href="${path }/resources/css/main/jquery-ui-1.10.4.custom.min.css" />

<script src="${path }/resources/js/main/jquery-1.10.2.min.js" ></script>
<script src="${path }/resources/js/main/jquery-ui-1.10.4.custom.min.js" ></script>

</head>
<body>

<div class="skipnaiv" tabindex="0">
	<a href="https://www.cgv.co.kr/#contents" id="skipHeader">메인 컨텐츠 바로가기</a>
</div>
<div id="cgvwrap">
<!-- 광고 -->
    <%-- <div class="cgv-ad-wrap" id="cgv_main_ad">
        <div id="TopBarWrapper" class="sect-head-ad">
            <div class="top_extend_ad_wrap">
                <div class="adreduce" id="adReduce">                    
                    <iframe src="${path }/resources/img/main/main@TopBar_EX.html" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe>
                </div> 
                <div class="adextend" id="adExtend"></div>
            </div><!-- //.top_extend_ad_wrap -->
        </div>    
    </div>     --%>
      <!-- S Header
        Description
        - class 'nav' 에 class 'active' 추가시 서브메뉴노출
        - class 'nav' 에 class 'fixed' 추가시 상단고정되며 스타일 변경됨
     -->
	<div class="header">			
            <!-- 서비스 메뉴 --> 
            
<div class="header_content">
    <div class="contents">
        <h1><a href="main"><img src="${path }/resources/img/main/logoRed.png" alt="CGV"></a><span>CULTUREPLEX</span></h1>
        <ul class="memberInfo_wrap">
            <!-- Advertisement -->
            
			<div class="ad-partner">
                <a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=31426&amp;menu=006">
                    <img src="${path }/resources/img/main/16417749747880.png" alt="현대M포인트">
                </a>					
			</div>
            
            <!-- /Advertisement -->

            
            <li><a href="loginForm"><img src="${path }/resources/img/main/loginPassword.png" alt="로그인"><span>로그인</span></a></li>
            <li><a href="https://www.cgv.co.kr/user/join/"><img src="${path }/resources/img/main/loginJoin.png" alt="회원가입"><span>회원가입</span></a></li>
            
            
            <li><a href="https://www.cgv.co.kr/user/mycgv/"><img src="${path }/resources/img/main/loginMember.png" alt="MY CGV"><span>MY CGV</span></a></li>
            <li><a href="https://www.cgv.co.kr/support/default.aspx"><img src="${path }/resources/img/main/loginCustomer.png" alt="고객센터"><span>고객센터</span></a></li>
        </ul>
    </div>
</div>
            
			
<script type="text/javascript">
    $(document).ready(function () {
    	//alert("hi");
        $('.nav_menu > li > h2 > a').on({
            mouseenter: function (e) {
                var target = e.target;
                $(target).parents('.nav_menu').find('.nav_overMenu').slideDown(function () {
                    $('.nav').addClass('active');
                });
            },
            click: function (e) {
                var target = e.target;
                if (!$('.nav').hasClass('active')) {
                    $(this).trigger('mouseenter');
                } else {
                    $('.nav').trigger('mouseleave');
                }
            }
        });

        $('.nav').on({
            mouseleave: function (e) {
                $(this).find('.nav_overMenu').slideUp(200, function () {
                    $('.nav').removeClass('active');
                });
            }
        });

        $('.totalSearch_wrap input[type=text]').on({
            focusin: function () {
                $('.totalSearch_wrap').addClass("active");
            }
        });

        $('.btn_totalSearchAutocomplete_close').on({
            click: function () {
                $('.totalSearch_wrap').removeClass("active");
            },
            focusout: function (e) {
                //     $('.totalSearch_wrap').removeClass("active");

            }
        });

        $(this).on({
            scroll: function (e) {
                /* S GNB fixed */
                var headerOffsetT = $('.header').offset().top;
                var headerOuterH = $('.header').outerHeight(true);
                var fixedHeaderPosY = headerOffsetT + headerOuterH;
                var scrollT = $(this).scrollTop();
                var scrollL = $(this).scrollLeft();

                if (scrollT >= fixedHeaderPosY) {
                    $('.nav').addClass('fixed');
                    $('.fixedBtn_wrap').addClass('topBtn');
                } else {
                    $('.nav').removeClass('fixed');
                    $('.fixedBtn_wrap').removeClass('topBtn');
                }

                /* S > GNB fixed 좌우 스크롤
                Description
                - GNB가 fixed 되었을때 좌우 스크롤 되게 처리
                */
                if ($('.nav').hasClass('fixed')) {
                    $('.nav').css({ 'left': -1 * scrollL })
                } else {
                    $('.nav').css({ 'left': 0 })
                }
                /* E > GNB fixed 좌우 스크롤 */
                /* S GNB fixed */
            }
        });

        $('.btn_gotoTop').on({
            click: function () {
                $('html, body').stop().animate({
                    scrollTop: '0'
                }, 400);
            }
        });

        //통합검색 상단 검색 버튼
        $('#btn_header_search').on('click', function () {
            if ($('#header_ad_keyword').val() != "")
                goSearch($('#header_ad_keyword'));      //광고
            else
                goSearch($('#header_keyword'));

            return false;
        });

        //통합검색 검색어 입력창
        $('#header_keyword').keyup(function (e) {
            if (e.keyCode == 13) goSearch($('#header_keyword'));
        });

    });

    //통합검색
    function goSearch($objKeyword) {

        if ($objKeyword.val() == "") {
            alert("검색어를 입력해 주세요");
            $objKeyword.focus();
            return false;
        }

        location = "/search/?query=" + escape($objKeyword.val());
    }

    //검색 입력창 클릭 시 광고값 reset
    $('#header_keyword').on('click', function () {
        $(this).attr('placeholder', '');
        $('#header_ad_keyword').val('');
    });

    //상단 키워드 광고 (S)
    function AdSearchExt(txt, SearchText) {
        $('#header_keyword').attr('placeholder', txt);
        $('#header_ad_keyword').val(SearchText);
    }

    function hdIcoSet(left, sh) { }
    //상단 키워드 광고 (E)

    //상단광고닫기
    function hideCgvTopAd() {
        $(".cgv-ad-wrap").hide();
        $('#wrap_main_notice').parent('div').css('top', 280);
    }

    //비즈스프링 클릭로그
    function setClickLog(title) {
        // eval("try{trk_clickTrace('EVT', '" + title + "')}catch(_e){}");
    }
</script>

 <!-- 서브메뉴, 메뉴에 마우스 올리면 나오는 메뉴 -->
<div class="nav">
    <div class="contents">
        <h1><a href="https://www.cgv.co.kr/" tabindex="-1"><img src="" alt="CGV"></a></h1>
        <ul class="nav_menu">
            <li>
                <h2><a href="movies">영화</a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="https://www.cgv.co.kr/movies/?lt=1&amp;ft=0" tabindex="-1">영화</a></h2></dt>
                    <dd><h3><a href="https://www.cgv.co.kr/movies/?lt=1&amp;ft=0">무비차트</a></h3></dd>
                    <dd><h3><a href="https://www.cgv.co.kr/arthouse/">아트하우스</a></h3></dd>
                    <dd><h3><a href="https://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=30717">ICECON</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2><a href="theater">극장</a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="https://www.cgv.co.kr/theaters/" tabindex="-1">극장</a></h2></dt>
                    <dd><h3><a href="https://www.cgv.co.kr/theaters/">CGV 극장</a></h3></dd>
                    <dd><h3><a href="https://www.cgv.co.kr/theaters/special/">특별관</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2><a href="https://www.cgv.co.kr/ticket/"><strong>예매</strong></a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="https://www.cgv.co.kr/ticket/" tabindex="-1">예매</a></h2></dt>
                    <dd><h3><a href="https://www.cgv.co.kr/ticket/">빠른예매</a></h3></dd>
                    <dd><h3><a href="https://www.cgv.co.kr/reserve/show-times/">상영스케줄</a></h3></dd>
                    <dd><h3><a href="https://www.cgv.co.kr/ticket/eng/newdefault.aspx">English Ticketing</a></h3></dd>
                    <dd><h3><a href="https://www.cgv.co.kr/reserve/show-times/eng/">English Schedule</a></h3></dd>
                </dl>
            </li>
            <li>
                <h2><a href="https://www.cgv.co.kr/culture-event/popcorn-store/">스토어</a></h2>
                <dl class="nav_overMenu" style="">
                    <dt><h2><a href="https://www.cgv.co.kr/culture-event/popcorn-store/" tabindex="-1">스토어</a></h2></dt>
                    
                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=2">영화관람권</a></h3></dd>
                        
                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=3">기프트카드</a></h3></dd>
                        
                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=4">콤보</a></h3></dd>
                        
                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=5">팝콘</a></h3></dd>
                        
                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=6">음료</a></h3></dd>
                        
                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=7">스낵</a></h3></dd>
                        
                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=10">플레이존</a></h3></dd>
                        
                    <dd><h3><a href="https://brand.naver.com/cgv" class="arrowR" target="_blank">씨네샵</a></h3></dd>
                </dl>
  			</li>
        </ul>
        <div class="totalSearch_wrap">
            <label for="totalSearch">
                <input type="text" id="header_keyword" value="" placeholder="더 배트맨">
                <input type="hidden" id="header_ad_keyword" name="header_ad_keyword" value="더 배트맨">
            </label>
            <button type="button" class="btn_totalSearch" id="btn_header_search">검색</button>
            <iframe src="./영화 그 이상의 감동. CGV_files/main@Search_txt.html" width="0" height="0" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe>
           
        </div>
    </div>
</div>

	<div class="fixedBtn_wrap">
        <a href="" class="btn_fixedTicketing">예매하기</a>
        
        <a class="btn_gotoTop"><img src="${path }/resources/img/main/gotoTop.png" alt="최상단으로 이동"></a>
    </div>



</body>
</html>