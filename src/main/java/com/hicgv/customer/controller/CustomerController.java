package com.hicgv.customer.controller;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.customer.dao.CustomerDao;
import com.hicgv.customer.dto.CustomerDto;

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
	//로그인페이지
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request, Model model) throws Exception {
		System.out.println("=========pass by loginCheck()=============");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		System.out.println("id :" + id);
		System.out.println("password :" + password);

		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);

		model.addAttribute("login", dao.loginCheck(id, password));
		return "/customer/loginForm";
		// 로그인이 성공하면 메인 또는 홈.jsp로 이동하게 수정
		// 아이디 비번이 다르거나 없으면 발생하는 이벤트 코딩하기
	}
	//로그인을 클릭하면 로그인 페이지로 이동
	@RequestMapping("/joinForm")
	public String joinForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by joinForm()=============");

		return "/customer/joinForm";
	}
	//myCGV를 클릭하면 회원정보를 볼 수 있는 myCGV.jsp로 이동 //myCGV는추상메소드 xml id에 동일하게 사용해야함
	@RequestMapping("/myCGV")
	public String myCGV(HttpServletRequest request, Model model) {
		System.out.println("=========pass by myCGV()=============");
		String id = request.getParameter("id");
		CustomerDao dao=sqlSession.getMapper(CustomerDao.class);
		
//		dao.myCGV(); 어떤 방식을 사용해도 무방함
//		CustomerDto myCGV(String id)에서 리턴받아옴
		CustomerDto myCGV=dao.myCGV(id);
//		모델에  "myCGV"이름으로 myCGV담기
		model.addAttribute("myCGV",myCGV);
		
		/*String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone_number = request.getParameter("phone_number");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");
		String date_birth = request.getParameter("date_birth");
		String location = request.getParameter("location");
		String create_at = request.getParameter("create_at");
		*/
		
		System.out.println(myCGV.getId());
		System.out.println(myCGV.getName());
		System.out.println(myCGV.getNickname());
		System.out.println(myCGV.getPhone_number());
		System.out.println(myCGV.getGender());
		System.out.println(myCGV.getDate_birth());
		System.out.println(myCGV.getLocation());
		
		
		return "/customer/myCGV";
	}
}
