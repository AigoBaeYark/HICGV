<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Store</title>
</head>
<body>

	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
	
	<a href="storeAdmin">goStoreAdmin</a>
	<div id="contents">
			<!-- 탭 메뉴 -->
		<ul class="nav nav-tabs" id="myTab" role="tablist" style="position: static;">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
					data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
					aria-selected="true">영화관람권</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
					data-bs-target="#myreview" type="button" role="tab"
					aria-controls="myreview" aria-selected="false">콜라</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="wishlist-tab" data-bs-toggle="tab"
					data-bs-target="#wishlist" type="button" role="tab"
					aria-controls="wishlist" aria-selected="false">팝콘</button>
			</li>
		</ul>
		
		<!-- 내용 -->
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="userinfo" role="tabpanel"
				aria-labelledby="userinfo-tab">
				<c:forEach items="${list }" var="store">
					<c:if test="${store.product_categori eq  2}">
						<div>
							<a href="">${store.product_name } </a>
						</div>
					
					</c:if>	
				</c:forEach>
				
				</div>
			<div class="tab-pane fade" id="myreview" role="tabpanel"
				aria-labelledby="myreview-tab">
				<c:forEach items="${list }" var="store">
					<c:if test="${store.product_categori eq  4}">
						<div>
							<div>
								<a href="">${store.product_name } </a>
							</div>
						</div>
					
					</c:if>	
				</c:forEach>
			</div>
			<div class="tab-pane fade" id="wishlist" role="tabpanel"
				aria-labelledby="wishlist-tab">
				<c:forEach items="${list }" var="store">
					<c:if test="${store.product_categori eq  5}">
						<div>
							<div>
								<a href="">${store.product_name } </a>
							</div>
						</div>
					
					</c:if>	
				</c:forEach>
				
				</div>
		</div>
	</div>
		
	
	<script>

		let key = "${param.key}";
		console.log(key);
		if (key === "userinfo") {

			$("#myreview-tab").removeClass("active");
			$("#wishlist-tab").removeClass("active");
			$("#userinfo-tab").addClass("active");

			$("#myreview").removeClass("show active");
			$("#wishlist").removeClass("show active");
			$("#userinfo").addClass("show active");

		} else if (key === "myreview") {

			$("#wishlist-tab").removeClass("active");
			$("#userinfo-tab").removeClass("active");
			$("#myreview-tab").addClass("active");

			$("#userinfo").removeClass("show active");
			$("#wishlist").removeClass("show active");
			$("#myreview").addClass("show active");

		} else if (key === "wishlist") {

			$("#userinfo-tab").removeClass("active");
			$("#myreview-tab").removeClass("active");
			$("#wishlist-tab").addClass("active");

			$("#myreview").removeClass("show active");
			$("#userinfo").removeClass("show active");
			$("#wishlist").addClass("show active");

		}
	</script>
	

</body>

<div style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</div>
</html>