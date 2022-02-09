package com.hicgv.customer.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.customer.dao.CustomerDao;

//import com.HICGV.dao.customerDao;

@Controller
public class CustomerController {
	// DB접속
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/loginForm")
	public String loginForm() {
		System.out.println("=========pass by loginForm()=============");

		// String id=request.getParameter("id");
		// String password=request.getParameter("password");
		// System.out.println("id :"+id);
		// System.out.println("password :"+password);

		// CustomerDao dao=sqlSession.getMapper(CustomerDao.class);

		// dao.loginCheck(id, password);
		return "/customer/loginForm";
		// 로그인 후 main.jsp로 돌아가야함 리턴 값수정하기

	}

	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request, Model model) throws Exception {
		System.out.println("=========pass by loginCheck()=============");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		System.out.println("id :" + id);
		System.out.println("password :" + password);

		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);

		dao.loginCheck(id, password);

		return "../home";
		// 로그인이 성공하면 메인 또는 홈.jsp로 이동
	}

	@RequestMapping("/joinForm")
	public String joinForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by joinForm()=============");

		return "/customer/joinForm";
	}
}
