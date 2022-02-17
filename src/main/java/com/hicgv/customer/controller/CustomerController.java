package com.hicgv.customer.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hicgv.customer.dao.CustomerDao;
import com.hicgv.customer.dto.CustomerDto;


//import com.HICGV.dao.customerDao;

@Controller
public class CustomerController {
	// DB접속
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HttpSession session; //세션을 주입받을 수 있도록 세팅1

	@RequestMapping("/loginForm")
	public String loginForm() {
		System.out.println("=========pass by loginForm()=============");

		return "/customer/loginForm";
		// 로그인 후 main.jsp로 돌아가야함 리턴 값수정하기

	}
	// 로그인페이지
	//method=RequestMethod.POST,value=
	@RequestMapping( method=RequestMethod.POST,value="/loginCheck")/*method=RequestMethod.POST,value=*/
	public String loginCheck(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		System.out.println("=========pass by loginCheck()=============");
		
		
		String id = request.getParameter("loginid");
		String password = request.getParameter("loginpw");
		System.out.println("id :" + id);
		System.out.println("password :" + password);
		
		//CustomerDto dto = new CustomerDto();
		//dto.setId(id);
		//dto.setPassword(password);
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		CustomerDto dto = dao.loginCheck(id, password);
		if(dto == null){	//로그인했을때 ID나 비밀번호가 달라서 아무값도 넘겨받지 못함
			System.out.println("로그인 실패");
		}else{
			session.setAttribute("id", id);
		}
		
		//id와 password를 세션에 저장 세션에 담아두면 jsp를 이동해도 세션을 통해 아이디를 받아서 사용할 수 있다.
		//로그인할 때 id password 세션에 세팅2
		System.out.println("Sid :" + id);
		
		
/*		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		model.addAttribute("login", dao.loginCheck(id, password));*/

		return "/customer/loginForm";
		// 로그인이 성공하면 메인 또는 홈.jsp로 이동하게 수정
		// 아이디 비번이 다르거나 없으면 발생하는 이벤트 코딩하기
	}@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("=========pass by logout()=============");
		//새션 변수 개별 삭제
		//HttpSession s = request.getSession();
		//System.out.println("id : " + s.getAttribute("id"));
		//session.getAttribute("id") 지정된 세션값만 불러옴
		//HttpSession session = request.getSession(); 모든 세션값을 불러옴
		System.out.println("id : " + session.getAttribute("id"));
		//s.removeAttribute("id");
		HttpSession session = request.getSession();
		System.out.println("id");
		//새션 변수 개별 삭제
		//session.removeAttribute("id");
		//세션초기화
		session.invalidate();
		return "home";
		}

	// 로그인을 클릭하면 로그인 페이지로 이동
	@RequestMapping("/joinForm")
	public String joinForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by joinForm()=============");

		return "/customer/joinForm";
	}// 회원가입 
	@RequestMapping(method=RequestMethod.POST,value="/join")
	public String join(HttpServletRequest request, Model model) throws Exception {{
		System.out.println("=========pass by join()=============");
	
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone_number = request.getParameter("phone_number");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");
		String date_birth = request.getParameter("date_birth");
		String location = request.getParameter("location");
		String email = request.getParameter("email");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		System.out.println(id);
		System.out.println(password);
		System.out.println(name);
		System.out.println(phone_number);
		System.out.println(nickname);
		System.out.println(gender);
		System.out.println(date_birth);
		System.out.println(location);
		System.out.println(email);
		System.out.println(question);
		System.out.println(answer);

		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		dao.join(id, password, name, phone_number,
				nickname, gender, date_birth, location, email,
				question, answer);
		//model.addAttribute("id", id);
		
		
		
		return "/customer/loginForm";
		}
	}

	// myCGV를 클릭하면 회원정보를 볼 수 있는 myCGV.jsp로 이동 //myCGV는추상메소드 xml id에 동일하게 사용해야함
	@RequestMapping("/myCGV")
	public String myCGV(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("=========pass by myCGV()=============");
		session.getAttribute("id");
		//String id = request.getParameter("id");
		/*Object id = session.getAttribute("id");*/
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);

		// dao.myCGV(); 어떤 방식을 사용해도 무방함
		// CustomerDto myCGV(String id)에서 리턴받아옴
		//CustomerDto myCGV = dao.myCGV(id);
		// 모델에 "myCGV"이름으로 myCGV담아서 myCGV.id로 jsp에 뿌려주기
		//세션에 담아서 모델로 보내지 않아도 됨
		/*model.addAttribute("myCGV", myCGV);
		System.out.println(myCGV.getId());
		System.out.println(myCGV.getName());
		System.out.println(myCGV.getNickname());
		System.out.println(myCGV.getPhone_number());
		System.out.println(myCGV.getGender());
		System.out.println(myCGV.getDate_birth());
		System.out.println(myCGV.getLocation());*/

		return "/customer/myCGV";
	}

	@RequestMapping("/modifyForm")
	public String modifyForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by modifyForm()=============");
		/*String id = request.getParameter("id");
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		CustomerDto myCGV = dao.myCGV(id);
		model.addAttribute("myCGV", myCGV);*/

		return "/customer/modifyForm";
	}

	@RequestMapping(method=RequestMethod.POST,value="/modify")
	public String modify(HttpServletRequest request, Model model) throws Exception {{
		System.out.println("=========pass by modify()=============");
		// xml에 있는 쿼리문을 다시 사용해도 됨. 모든 필드값을 새로 가져오는 것이라니라 기존의 id로 다른 모든 필드를 가져왔던
		// 쿼리문을 사용하여 주소값으로 넘김
		HttpSession session = request.getSession();		
		
		//세션에 담긴 아이디를 가져옴 // 아이디와 비교해서 로그인한 아이디의 필드를 수정해야하니까
		String id =(String) session.getAttribute("id");
		String password = request.getParameter("password");
		String phone_number = request.getParameter("phone_number");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");
		String date_birth = request.getParameter("date_birth");
		String location = request.getParameter("location");
		String email = request.getParameter("email");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		System.out.println(id);
		System.out.println(password);
		System.out.println(phone_number);
		System.out.println(nickname);
		System.out.println(gender);
		System.out.println(date_birth);
		System.out.println(location);
		System.out.println(email);
		System.out.println(question);
		System.out.println(answer);
		
		//id 세션처리해야 함
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		dao.modify(id, password, phone_number, nickname, gender, date_birth, location, email,
				question, answer);

		return "/customer/myCGV";
		}
	}//회원탈퇴 화면으로 이동
	@RequestMapping("/customerDelete")
	public String customerDelete(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerDelete()=============");
		
		
		String id=request.getParameter("id");
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		CustomerDto myCGV = dao.myCGV(id);
		model.addAttribute("myCGV", myCGV);
		
		return "/customer/customerDelete";
	}//회원탈퇴 화면에서 탈퇴 진행
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("=========pass by delete()=============");
		//비밀번호를 한 번 더 입력하고 일치하면 탈퇴진행할 수 있게 하기
		
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		System.out.println("id :" + id);
		System.out.println("password :" + password);
		
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		dao.delete(id, password);
		HttpSession session = request.getSession();
		System.out.println("id");
		//새션 변수 개별 삭제
		//session.removeAttribute("id");
		//세션초기화
		session.invalidate();
		return "home";
	}
}
