<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>


</head>
<body>
<div style="height: 300px;">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
</div>


<form action="resetPwForm" method="post">
  <div class="form-group">
    <label for="exampleInputPassword1">***질문에 맞는 답을 입력하세요***</label> <br /> 
    <label for="">************${question }*************</label>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">답을 입력해주세요</label>
    <input name="answer" type="text" class="form-control" id="exampleInputEmail1" placeholder="답을 입력해주세요">
  </div>
  <div class="form-group">

	<input type="hidden" name = "modelId" value="${modelId }"/> <!--히든값을 주면 화면이 안나옴  -->
  <button type="submit" class="btn btn-default">입력</button>
  <button type="button" class="btn btn-default"><a href="home"></a>취소</button>
  </div>
</form>




</body>
	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>



</html>