<%@page import="com.javaex.phone.dao.PhoneDaoOracleImpl"%>
<%@page import="com.javaex.phone.dao.PhoneDao"%>
<%@page import="com.javaex.phone.dao.PhoneVoDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//	요청 파라미터 받기
String Name = request.getParameter("name");
String handPhone = request.getParameter("hand_phone");
String Phone = request.getParameter("phone");

//	VO 객체
PhoneVoDB vo = new PhoneVoDB(Name, handPhone, Phone);
PhoneDao dao = new PhoneDaoOracleImpl();

dao.insert(vo);	//	저장 완료

//	리스트 페이지로 돌려보내기: 302 -> REDIRECT
//	요청하는 페이지의 context path는 서버 환경, 설정에 따라
//	유동적으로 변할 수 있다 -> 동적으로 context path를 확인해야 한다
response.sendRedirect(request.getContextPath() + "/phone/");
%>