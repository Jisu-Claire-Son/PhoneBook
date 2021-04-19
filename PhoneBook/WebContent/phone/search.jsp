<%@page import="com.javaex.phone.dao.PhoneDaoOracleImpl"%>
<%@page import="com.javaex.phone.dao.PhoneDao"%>
<%@page import="com.javaex.phone.dao.PhoneVoDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String keyword = request.getParameter("keyword");


PhoneVoDB vo = new PhoneVoDB();
PhoneDao dao = new PhoneDaoOracleImpl();

dao.search(keyword);

response.sendRedirect(request.getContextPath() + "/phone/");
%>