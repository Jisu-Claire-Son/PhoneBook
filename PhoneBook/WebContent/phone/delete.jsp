<%@page import="com.javaex.phone.dao.PhoneDao"%>
<%@page import="com.javaex.phone.dao.PhoneDaoOracleImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 파라미터 받아오기 , Parameter의 값은 항상 String
Long no = Long.valueOf(request.getParameter("no"));	//	converting
PhoneDao dao = new PhoneDaoOracleImpl();

dao.delete(no);

//	리스트 페이지로 리다이렉트
response.sendRedirect(request.getContextPath() + "/phone");
%>
