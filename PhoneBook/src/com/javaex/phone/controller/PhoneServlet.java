package com.javaex.phone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.phone.dao.PhoneDao;
import com.javaex.phone.dao.PhoneDaoOracleImpl;
import com.javaex.phone.dao.PhoneVoDB;

@WebServlet(name="PhoneBook", urlPatterns="/ph")
public class PhoneServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("a");
		if ("form".equals(action)) {	//	a=form이면 
			//	등록 폼: 파라미터에서 a를 확인 form이면 분기
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/WEB-INF/views/phone/form.jsp");
			rd.forward(req, resp);
		}else if ("delete".equals(action)) {
			//	파라미터 no를 이용, 삭제
			Long no = Long.valueOf(req.getParameter("no"));
			
			PhoneDao dao = new PhoneDaoOracleImpl();
			dao.delete(no);
			
			//	리스트로 리다이렉트
			resp.sendRedirect(req.getContextPath() + "/ph");
		} else if("search".equals(action)) {
			String keyword = req.getParameter("keyword");
			
			PhoneDao dao = new PhoneDaoOracleImpl();
			
			List<PhoneVoDB> list = dao.search(keyword);
			
			req.setAttribute("list", list);
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/WEB-INF/views/phone/index.jsp");
			rd.forward(req, resp);
		} else {
			//	리스트를 불러와 req에 attribute로 추가
			PhoneDao dao = new PhoneDaoOracleImpl();
			//	전달해줄 객체 생성
			List<PhoneVoDB> list = dao.getList();
			
			req.setAttribute("list", list);
			
			//	Dispatcher 확보
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/WEB-INF/views/phone/index.jsp");
			//	요청과 응답 객체 전달
			rd.forward(req, resp);
		}
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");	//	히든 필드
		
		if ("insert".equals(action)) {	//	action이 insert -> 삽입
			String Name = req.getParameter("name");
			String handPhone = req.getParameter("hand_phone");
			String Phone = req.getParameter("phone");
			
			PhoneVoDB vo = new PhoneVoDB();
			vo.setName(Name);
			vo.setHp(handPhone);
			vo.setTel(Phone);
			
			
			PhoneDao dao = new PhoneDaoOracleImpl();
			
			dao.insert(vo);
			
			//	리스트 페이지로 리다이렉트
			resp.sendRedirect(req.getContextPath() + "/ph");
		}  else {
			doGet(req, resp);
		}

	}

}


