<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<title>검색결과</title>
</head>
<body>

<c:forEach items="${searchResult }" var="result">
	${result.movie_id }
</c:forEach>



<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
</html>