<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path }/resources/css/reset.css" />
<link rel="stylesheet" href="${path }/resources/css/main/layout.css" />
<link rel="stylesheet" href="${path }/resources/css/main/jquery-ui-1.10.4.custom.min.css" />
<link rel="styleSheet" href="${path }/resources/css/font-awesome.min.css" crossorigin="anonymous" />
<link rel="styleSheet" href="${path }/resources/css/hoverEffectComp.css" crossorigin="anonymous" />
<link rel="styleSheet" href="${path }/resources/css/hoverEffectDefault.css" crossorigin="anonymous" />
<script src="${path }/resources/js/main/jquery-1.10.2.min.js" ></script>
<script src="${path }/resources/js/main/jquery-ui-1.10.4.custom.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7bb79fa442.js" crossorigin="anonymous"></script>
<script src="${path }/resources/js/hoverEffect.js" ></script>

<script src="${path }/resources/js/main/movieDetail.js"  ></script>
<script src="${path }/resources/js/main/daterangepicker.js"  ></script>
<script src="${path }/resources/js/main/moment.min.js"  ></script>
<script src="${path }/resources/js/main/select2.min.js"  ></script>

</head>
<body>

<style>
		a {
			text-decoration: none;
		}
</style>
<div class="header">
	<div class="skipnaiv" tabindex="0">
		<a href="https://www.cgv.co.kr/#contents" id="skipHeader">?????? ????????? ????????????</a>
	</div>

	<div class="header_content">
	    <div class="contents">
	        <h1><a href="main"><img src="${path }/resources/img/main/logoRed.png" alt="CGV"></a><span>CULTUREPLEX</span></h1>
	        <ul class="memberInfo_wrap"> 
				
				<!-- ????????? ????????? ???????????? ????????? ????????? -->
				<%if(session.getAttribute("id")==null) {%>                  
	            <li><a href="loginForm"><img src="${path }/resources/img/main/loginPassword.png" alt="?????????"><span>?????????</span></a></li>
	            <li><a href="joinForm"><img src="${path }/resources/img/main/loginJoin.png" alt="????????????"><span>????????????</span></a></li>
	            <%} else {%>  
	              <li><a href="logout"><img src="${path }/resources/img/main/loginPassword.png" alt="?????????"><span>????????????</span></a></li>
	            <%} %>
	            
	            <li><a href="myCGV"><img src="${path }/resources/img/main/loginMember.png" alt="MY CGV"><span>MY CGV</span></a></li>
	            <li><a href="noticeList"><img src="${path }/resources/img/main/loginCustomer.png" alt="????????????"><span>????????????</span></a></li>
	        </ul>
	    </div>
	</div>
	
		<div class="nav">
	    <div class="contents">
	        <h1><a href="main" tabindex="-1"><img src="${path }/resources/img/main/logoWhite.png" alt="CGV"></a></h1>
	        <ul class="nav_menu" style="margin-bottom: 0rem; padding-left: 0;">
	            <li>
	                <h2><a href="movies">??????</a></h2>
	                <dl class="nav_overMenu" style="">
	                    <dt><h2><a href="movies" tabindex="-1">??????</a></h2></dt>
	                    <dd><h3><a href="movies">????????????</a></h3></dd>
	                    <dd><h3><a href="https://www.cgv.co.kr/arthouse/">???????????????</a></h3></dd>
	                </dl>
	            </li>
	            <li>
	                <h2><a href="theater">??????</a></h2>
	                <dl class="nav_overMenu" style="">
	                    <dt><h2><a href="theaters" tabindex="-1">??????</a></h2></dt>
	                    <dd><h3><a href="theater">CGV ??????</a></h3></dd>
	                    <dd><h3><a href="https://www.cgv.co.kr/theaters/special/">?????????</a></h3></dd>
	                </dl>
	            </li>
	            <li>
	                <h2><a href="ticket"><strong>??????</strong></a></h2>
	                <dl class="nav_overMenu" style="">
	                    <dt><h2><a href="https://www.cgv.co.kr/ticket/" tabindex="-1">??????</a></h2></dt>
	                    <dd><h3><a href="https://www.cgv.co.kr/ticket/">????????????</a></h3></dd>
	                    <dd><h3><a href="https://www.cgv.co.kr/reserve/show-times/">???????????????</a></h3></dd>
	                </dl>
	            </li>
	            <li>
	                <h2><a href="store">?????????</a></h2>
	                <dl class="nav_overMenu" style="">
	                    <dt><h2><a href="https://www.cgv.co.kr/culture-event/popcorn-store/" tabindex="-1">?????????</a></h2></dt>
	                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=4">??????</a></h3></dd>
	                        
	                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=5">??????</a></h3></dd>
	                        
	                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=6">??????</a></h3></dd>
	                        
	                            <dd><h3><a href="https://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=7">??????</a></h3></dd>
	                                                
	                   
	                </dl>
	  			</li>
	  			<% if(session.getAttribute("grade") != null) { %>
	  			<li>
	  				<h2><a href="adminMenuView" style="font-weight: 700;">????????? ??????</a></h2>
	  				<dl class="nav_overMenu">
	  					<dt><h2><a href="" style="color: #df0e62; ">????????? ??????</a></h2></dt>
	  					 <dd><h3><a href="getcustomerList">?????? ??????</a></h3></dd>
	  					 <dd><h3><a href="theaterAdmin">?????? ??? ????????????</a></h3></dd>
	  					 <dd><h3><a href="moviesAdmin">??????</a></h3></dd>
	  					 <dd><h3><a href="storeAdmin">?????????</a></h3></dd>
	  				</dl>
	  			</li>
	  			<%} %> 
	        </ul>
	        <div class="totalSearch_wrap">
	            <label for="totalSearch">
	                <input type="text" id="header_keyword" value="" placeholder="????????????">
	                <input type="hidden" id="header_ad_keyword" name="header_ad_keyword" value="">
	            </label>
	            <button type="button" class="btn_totalSearch" id="btn_header_search">??????</button>
	            <iframe src="" width="0" height="0" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe>
	           
	        </div>
	    </div>
	</div>
	
		<div class="fixedBtn_wrap">
	        <a href="ticket" class="btn_fixedTicketing">????????????</a>
	        
	        <a class="btn_gotoTop" style="cursor: pointer;"><img src="${path }/resources/img/main/gotoTop.png" alt="??????????????? ??????" ></a>
	    </div>	
	
	
</div>


	

      <!-- S Header
        Description
        - class 'nav' ??? class 'active' ????????? ??????????????????
        - class 'nav' ??? class 'fixed' ????????? ?????????????????? ????????? ?????????
     -->
                 <!-- ????????? ?????? --> 
            

            
			
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

                /* S > GNB fixed ?????? ?????????
                Description
                - GNB??? fixed ???????????? ?????? ????????? ?????? ??????
                */
                if ($('.nav').hasClass('fixed')) {
                    $('.nav').css({ 'left': -1 * scrollL })
                } else {
                    $('.nav').css({ 'left': 0 })
                }
                /* E > GNB fixed ?????? ????????? */
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

        //???????????? ?????? ?????? ??????
        $('#btn_header_search').on('click', function () {
            if ($('#header_ad_keyword').val() != "")
                goSearch($('#header_ad_keyword'));      //??????
            else
                goSearch($('#header_keyword'));

            return false;
        });

        //???????????? ????????? ?????????
        $('#header_keyword').keyup(function (e) {
            if (e.keyCode == 13) goSearch($('#header_keyword'));
        });

    });

    //????????????
    function goSearch($objKeyword) {
		
        if ($objKeyword.val() == "") {
            alert("???????????? ????????? ?????????");
            $objKeyword.focus();
            return false;
        }
		alert($objKeyword.val());
		var keyword=$objKeyword.val();
        location.href = "searchMovieName?query=" + keyword;
    }

  

</script>

 <!-- ????????????, ????????? ????????? ????????? ????????? ?????? -->




</body>
</html>