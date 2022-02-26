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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>

</head>
<style>
</style>
<body>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
	
	<%-- <%CustomerDto dto = (CustomerDto) session.getAttribute("dto");%>
	
	<%=dto.getId() %> 님 안녕하세요 --%>
	
	<div><!--container 시작--> 
	<div class="container-top">
		<!--myCGV container-top 시작  -->
		<div align="center"  style="margin-top: 50px;">
		<h1 align="center" style="font-size: 50px;">HICGV_myCGV!!</h1>
		<!-아이디 고객등급 div 시작-->
					<div style="width: 500px; border: solid 1px;margin-top: 10px; font-size: 20px;">
						<!--아이디 시작  -->
						HICGV에 오신것을 환영합니다.
					</div>
					<!--이름 닉네임 끝  -->
		</div>
		
		<!--myCGV personinfo 시작  -->
		<div style="height:300px; margin: 50px; border: solid 1px;">
			
			<div id="personinfo" >
				<!--myCGV personinfo-img 시작  / 프로필 사진 고객이름 아이디 고객등급-->
				<div id="personinfo-img "
						style="width: 200px; height: 200px; border: solid 1px; float: left; margin-left: 100px; margin-top: 50px;'">
					<!--이미지div시작  -->
					<img src="" alt="프로필.img" class="img-circle">
				</div>
				<!--이미지div끝 -->
				<div>
					
					<div style="float: left;">
					<div align="left" style="position:static; width: 500px; height:30px; margin-top: 50px; margin-left:30px ;float: left; border-bottom: 1px solid blue;">
						<!--등급div시작  -->
						${myCGV.name }님 (아이디: ${id }) 닉네임:${myCGV.nickname }
					</div>
		
					<div align="left" style="width: 500px; height:30px; margin-top: 10px; margin-left:30px ;">
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
			style="border: 1px solid; height: 350px; width: 250px;float: left;">
			<div>
			<div align="left" style="margin-left: 50px">
				<!--회원정보 수정 / 회원탈퇴 div 시작 -->
				<br />
				<form action="modifyForm" method="post">
				<button type="submit">개인정보 변경</button>
				</form>				
				<button type="submit">
					<a href="customerDeleteForm?id=${id }">회원탈퇴</a>
				</button>
				<form action="logout">
					<button type="submit">로그아웃</button>
				</form>
				<a href="">Q&A</a>
				<br />
				<a href="">공지사항</a>
				
			</div>
			<!--회원정보 수정 / 회원탈퇴 div 끝 -->
			
			
			</div>

		</div>
		<!--myCGVcontainer-down-left 끝  -->

		<!--myCGVcontainer-down-center 시작-->
		<div class="container-down-center"
			style="border: solid; 1 px; width:800px; float: left; margin-left: 50px;">

			<!--나의 예매내역/내가본영화 container 시작  -->
			<div style="margin: 30px;">
				<!--나의예매확인 버튼div 시작 -->
				<div style="float: left; width: 200px; height: 200px;margin-left: 50px;">
				<button type="submit" style="border: 1px solid; width: 150px; height: 150px">나의 예매내역</button>
				</div><!--나의예매확인 버튼div 끝 -->
				<div style="float: left;width: 200px; height: 200px;margin-left: 100px;">
				<button style="border: 1px solid; width: 150px; height: 150px">내가본영화</button>
				</div>
			</div>
			<!--나의 예매내역/내가본영화 container 시작  -->
			
			
		</div>
		<!--myCGVcontainer-down-center 끝-->
	</div>
	<!--myCGVcontainer-down 끝  -->
</div><!--container 끝-->


	</div>
	<!--myCGV끝  -->
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>

</body>
</html>