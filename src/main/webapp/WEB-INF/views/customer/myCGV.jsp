<%@page import="com.hicgv.customer.dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/customer/customer.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>

</head>
<body>
	<div style="height: 200px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
	<style>
div#s_left {
	width: 200px;
	height: 700px;
	background-color: yellow;
}

.person_info_top {
	font-size: 30px;
	background-image: linear-gradient(to bottom, rgb(239, 239, 233 ),
		rgba(239, 239, 233, 0.37));
	height: 80px;
	margin-top: 15px;
}

.person_info_down {
	height: 300px;
	/* border: solid 1px; */
	width: 80%;
	margin-left: 20%;
}

.name_info {
	position: static;
	width: 500px;
	height: 50px;
	margin-top: 50px;
	margin-left: 30px;
	float: left;
	border-bottom: 1px solid blue;
	font-size: 25px;
}

.grade_info {
	width: 500px;
	height: 30px;
	margin-top: 10px;
	margin-left: 30px;
	font-size: 20px;
}

.container-down-left {
	background-image: linear-gradient(to bottom, rgb(239, 239, 233 ),
		rgba(239, 239, 233, 0.37));
}
.person_info_down{
background-image: linear-gradient(to bottom, rgb(239, 239, 233 ),
		rgba(239, 239, 233, 0.37));
}
.downcontainer-wrap{
background-image: linear-gradient(to bottom, rgb(239, 239, 233 ),
		rgba(239, 239, 233, 0.37));
}
.container-down-center{
background-image: linear-gradient(to bottom, rgb(239, 239, 233 ),
		rgba(239, 239, 233, 0.37));
}
</style>
	<div style="width: 90%;margin-left: 80px;">
		<!--container 시작-->
		<div class="container-top" style="background-image: url(/cgv/resources/img/customer/popcon.jpg);">
			<!--myCGV container-top 시작  -->
			<div align="center" class="person_info_top">HICGV_myCGV에서 고객님의
				소중한 정보를 확인하고 수정할 수 있습니다.</div>

			<!--myCGV personinfo 시작  -->
			<div class="person_info_down">

				<div id="personinfo">
					<!--myCGV personinfo-img 시작  / 프로필 사진 고객이름 아이디 고객등급-->
					<div id="personinfo-img "
						style="width: 200px; height: 200px; float: left; margin-left: 100px; margin-top: 50px;'">
						<!--이미지div시작  -->
						<img src="..." alt="프로필" class="img-thumbnail">
					</div>
					<!--이미지div끝 -->
					<div>

						<div style="float: left;">
							<div align="left" class="name_info">
								<!--등급div시작  -->
								${myCGV.name }님 (아이디: ${id }) 닉네임:${myCGV.nickname }
							</div>

							<div align="left" class="grade_info">
								<!--등급div시작  -->
								고객님은 일반회원입니다.
							</div>
							<!--등급div끝  -->
						</div>
					</div>
					<!-아이디 고객등급 div 끝-->
				</div>
				<!--myCGV personinfo-sect 끝  -->
			</div>
			<!--myCGV personinfo 끝  -->
		</div>
		<!--myCGV container-top 끝  -->

		<div id="downcontainer-wrap">
			<!--myCGVcontainer-down 시작  -->
			<!--myCGVcontainer-down-left 시작  -->
			<div class="container-down-left"
				style="height: 350px; width: 250px; float: left;">
				<div>
					<div align="left" style="margin-left: 50px">
						<!--회원정보 수정 / 회원탈퇴 div 시작 -->
						<br />
						<form action="modifyForm" method="post">
							<button type="submit" class="btn btn-default">개인정보 변경</button>
						</form>
						<button type="submit" class="btn btn-default">
							<a href="customerDeleteForm?id=${id }">회원탈퇴</a>
						</button> <br />
						<button type="submit" class="btn btn-default">
							<a href="noticeList?=${id }">공지사항</a>
						</button>



					</div>
					<!--회원정보 수정 / 회원탈퇴 div 끝 -->


				</div>

			</div>
			<!--myCGVcontainer-down-left 끝  -->

			<!--myCGVcontainer-down-center 시작-->
			<div class="container-down-center"
				style="width: 800px; float: left; margin-left: 50px; background-image: url(/cgv/resources/img/customer/film.jpg);">

				<!--나의 예매내역/내가본영화 container 시작  -->
				<div style="margin: 30px;" >
					<!--나의예매확인 버튼div 시작 -->
					<div style="position:inherit;">
					<div style="float:left; width: 200px; height: 200px; margin-left: 20px;background-image: url(/cgv/resources/img/customer/movieicon.jpg);">	</div>
					<div style="float:left; width: 200px; height: 200px; margin-left: 100px;background-image: url(/cgv/resources/img/customer/watch.jpg); margin-left: 120px;">
						
					</div>
					</div>
				<!--나의예매확인 버튼div 끝 -->
				<div>
					<button class="btn btn-info" style="width: 150px; height: 50px; margin-left: 63px;">내가본영화</button>
					<button type="submit" class="btn btn-info" style="width: 150px; height: 50px; margin-left: 140px;">나의 예매내역</button>
					</div>	
				</div>
				<!--나의 예매내역/내가본영화 container 시작  -->


			</div>
			<!--myCGVcontainer-down-center 끝-->
		</div>
		<!--myCGVcontainer-down 끝  -->
	</div>
	<!--container 끝-->


	</div>
	<!--myCGV끝  -->
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>

</body>
</html>