<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="resources/css/reset.css" />
<title>Insert title here</title>

</head>

<body>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
<div style="margin-top: 100px;"><!--myCGV시작  -->
	<h5>myCGV.jsp</h5>
	이곳은 회원정보를 확인하고 수정할 수 있는 myCGVProc.jsp로 이동할 수 있습니다.
	<div class="container" style="border: solid 1px;">
		<!--myCGV container 시작  -->
		myCGV container
	
		<div style="margin: 50px; border: solid 1px;">
			<!--myCGV personinfo 시작  -->
			<div>
				<!--myCGV personinfo-sect 시작  / 프로필 사진 고객이름 아이디 고객등급-->
				<div style="width: 100px; height: 100px; position: relative; border: solid 1px;">
					<!--이미지div시작  -->
					<img src="" alt="프로필img" />
				</div>
				<!--이미지div끝 -->
				<div>
					<!-아이디 고객등급 div 시작-->
					<div style="width: 500px;border: solid 1px;">
						<!--아이디 시작  -->
						${myCGV.id }님 HICGV에 오신것을 환영합니다.
					</div>
					<!--이름 닉네임 끝  -->
					<hr />
					<div style="border: solid; 1px; margin-top: 10px;">
						<!--등급div시작  -->
						${myCGV.id }고객님의 등급은 OOO입니다. //테이블 따로??
					</div>
					<!--등급div끝  -->
				</div>
				<!-아이디 고객등급 div 끝-->
			</div>
			<!--myCGV personinfo-sect 끝  -->


		</div>
		<!--myCGV personinfo 끝  -->
	

	</div>
	<!--myCGV container 끝  -->
	<div style="border: solid; 1px; margin: 10px;height: 100px  vertical-align: baseline;" ><!--나의 예매내역 시작  -->
	<div style="margin: 30px;"><!--나의예매확인 버튼div  -->
	<button type="submit" style="border: solid; 1px;">나의 예매내역</button>
	<div>이곳에는 내가 본영화 / 예매내역/ 문의내역을  표현할 곳임</div>
	</div><!--나의예매확인 버튼div 끝 -->
	<div style="border: solid; 1px;"><!--회원정보 수정 / 회원탈퇴 div 시작 -->
	<button type="submit"><a href="modifyForm?id=${myCGV.id }">회원정보수정</a></button> <br />
	<button type="submit"><a href="myCGV?id=">회원탈퇴</a></button>
	</div><!--회원정보 수정 / 회원탈퇴 div 끝 -->
		</div><!--나의 예매내역 끝  -->
	
</div><!--myCGV끝  -->
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
	
</body>
</html>