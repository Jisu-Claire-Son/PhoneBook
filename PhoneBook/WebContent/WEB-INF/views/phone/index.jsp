<%@page import="com.javaex.phone.dao.PhoneVoDB"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 Servlet</title>
<style>
table, tr, th, td{border:1px solid #000;border-collapse:collapse;text-align:center;}
table{margin-top:10px;}
th,td{padding:5px 10px;}
th{background:#eee;}
</style>
</head>
<body>
	<h1>주소록 Servlet(Model 2)</h1>
	
	<h2>목록</h2>
	<form action="<c:url value="/ph"/>" method="get">
		<label>검색어</label>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
		<!-- 정보 테이블 -->
	<table>
		<tr>
			<th>이름</th>			
			<th>휴대전화</th>			
			<th>전화번호</th>
			<th>삭제</th>			
		</tr>
		<c:forEach items="${ list }" var="vo">
		<tr>
			<td>${ vo.name }</td>
			<td>${ vo.hp }</td>
			<td>${ vo.tel }</td>
			<td colspan="2">
				<form action="<c:url value="/ph"/>">
					<input type="hidden" name="a" value="delete" />
					<!-- 게시물의 no(PK) -->
					<input type="hidden" name="no" value="${ vo.id }"/>
					<!-- 전송 버튼 -->
					<input type="submit" value="삭제" />
				</form>
				<!-- TODO: 수정 기능을 구현해보기 -->
			</td>
		</tr>
		</c:forEach>
	</table>		
		
	
	<p>
		<a href="<c:url value="/ph?a=form" />">새 주소 추가</a>
	</p>
</body>
</html>