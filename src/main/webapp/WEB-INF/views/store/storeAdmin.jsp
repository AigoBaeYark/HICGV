<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>storeAdmin</title>
</head>
<body>

	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>

	<h1>storeAdmin</h1>
	
	<!-- 
	storeCategori
	//2=영화관람권
	//3=기프티콘
	//4=콤보
	//5=팝콘
	//6=음료 
	//7=스낵 
	-->
	
	<div id="contents" style="margin: 0 auto;">
		<form action="insertStoreData" method="post">
			<label for="name">상품이름</label>
			<input type="text" name="name" id="name"/>
		
			<label for="price">상품가격</label>
			<!-- 숫자만 입력되게 -->
			<input type="text" name="price" id="price" onkeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
		
			<label for="img">상품이미지</label>
			<input type="file" name="img" id="img" value="임시"/>
			<br />
			<textarea name="script" id="" cols="30" rows="10" placeholder="상품설명" style="position:relative; float: left; margin-top: 10px;"></textarea>
		
			<label for="categoriList">상품카테고리</label>
			
			<select id="categoriList" name = "categoriList">
				<option  value="2">영화관람권</option>
				<option  value="3">기프티콘</option>
				<option  value="4">콤보</option>
				<option  value="5">팝콘</option>
				<option  value="6">음료</option>
				<option  value="7">스낵</option>
			</select>
			
			<input type="submit" id = "submitBtn"value="입력"/>
			<input type="hidden" name="categoriVal" id="categoriVal"/>
			<input type="hidden" name="categoriName" id="categoriName"/>
		</form>
	</div>
	
	
 	<script type="text/javascript">
 	
 		//카테고리 옵션에서 선택한 value랑 카테고리 이름만 넘어감
 		var categoriVal;
		$(document).on('click','#submitBtn', function(e) {
			categoriVal  = document.getElementById("categoriList").options[document.getElementById("categoriList").selectedIndex].value;
			$('#categoriVal').val(categoriVal);
			$('#categoriName').val($("#categoriList option:selected").text());

			console.log(categoriVal);
		});
		
	</script> 

	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>

</body>
</html>