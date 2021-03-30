<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 주소 등록</title>
</head>
<body>
	<h1>새 주소 등록(Model 2)</h1>

	<form action="<c:url value="/ph"/>"
		method="POST">
		<input type="hidden" name="action" value="insert" />
		<label for="name">이름</label>
		<input type="text" name="name" id="name" />
		<br/>
		<label for="hand_phone">휴대전화</label>
		<input type="text" name="hand_phone" id="hand_phone" />
		<br/>
		<label for="phone">집전화</label>
		<input type="text" name="phone" id="phone" />
		
		<input type="submit" value="등록" />
	</form>
	
	<p>
		<a href="<c:url value="/ph"/>">목록 보기</a>
	</p>
</body>
</html>