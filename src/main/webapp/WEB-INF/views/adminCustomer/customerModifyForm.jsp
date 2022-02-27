<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/customer/customer.css" />
<title>Insert title here</title>
</head>
<body>
	<div style="height: 300px;">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
<div> <!--회원정보 수정 시작  -->
<div style="border: solid; 1px; margin: 10px;">
	
	<form action="customerModify" method="post">		
		<div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">회원정보수정</h2>
          <p class="exTxt">회원정보 수정 시 아이디는 변경이 불가능합니다. <br />
          아이디를 변경하시더라도 수정되지 않습니다. 이 점 유의바랍니다.</p>
          <div class="join_form">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" name=""  value="${customerMotify.id }"></td>
                  <td><input type="hidden" name="id" value="${customerMotify.id }"></td>
                </tr>
                <tr>
                  <th><span>닉네임</span></th>
                  <td><input type="text" name="nickname"  value="${customerMotify.nickname }"></td>
                </tr>
                <tr>
                  <th><span>생년월일</span></th>
                  <td><input type="text" name="date_birth" value="${customerMotify.date_birth }"></td>
                </tr>
                <tr>
                  <th><span>주소</span></th>
                  <td><input type="text" name="location" value="${customerMotify.location }"></td>
                </tr>
                <tr>
                  <th><span>성별</span></th>
                  <td><input type="text" name="gender" value="${customerMotify.gender }"></td>
                </tr>
                <tr>
                  <th><span>질문</span></th>
                  <td><input type="text" name="question" value="${customerMotify.question }"></td>
                </tr>
                <tr>
                  <th><span>답</span></th>
                  <td><input type="text" name="answer" value="${customerMotify.answer }"></td>
                </tr>
                <tr class="email">
                  <th><span>이메일</span></th>
                  <td>
                    <input type="text" name="email" value="${customerMotify.email }">                 
                  </td>
                </tr>
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td><input type="text" name="phone_number" value="${customerMotify.phone_number }"></td>
                </tr>
              </tbody>
            </table>
            
          </div><!-- join_form E  -->
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
	
				<div align="center"  style="margin-top: 10px; margin-bottom: 10px;">
				<div style="width: 100px; height: 50px; border: 1px solid blue; border-radius: 10px; 
				background:linear-gradient(45deg,aqua,#2041e3);">
					<button type="submit">
						<h3 style="color: white;">수정</h3>
					</button>
				</div>
				</div>
	</div>
	</form>

</div>

	<div style="clear: both;">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</body>
</html>