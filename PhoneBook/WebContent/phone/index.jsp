<%@page import="com.javaex.phone.dao.PhoneVoDB"%>
<%@page import="java.util.List"%>
<%@page import="com.javaex.phone.dao.PhoneDao"%>
<%@page import="com.javaex.phone.dao.PhoneDaoOracleImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>주소록 Servlet</h1>
	
	<%	//	DAO 불러오기
	PhoneDao dao = new PhoneDaoOracleImpl();
	//	목록 받아오기
	List<PhoneVoDB> list = dao.getList();
	
	
		//	출력 %>
	<h2>목록</h2>
	<form action="search.jsp">
		<label>검색어</label>
		<input type="text" name="">
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
		<%
		for (PhoneVoDB vo: list) { 
		%>
		<tr>
			<td><%= vo.getName() %></td>
			<td><%= vo.getHp() %></td>
			<td><%= vo.getTel() %></td>
			<td colspan="2">
				<form action="delete.jsp">
					<!-- 게시물의 no(PK) -->
					<input type="hidden" name="no" value="<%= vo.getId() %>"/>
					<!-- 전송 버튼 -->
					<input type="submit" value="삭제" />
				</form>
				<!-- TODO: 수정 기능을 구현해보기 -->
			</td>
		</tr>
		<%
	}
	%>
	</table>		
		
	
	<p>
		<a href="form.jsp">새 주소 추가</a>
	</p>
</body>
</html>