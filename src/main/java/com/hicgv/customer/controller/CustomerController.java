package com.hicgv.customer.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
<<<<<<< HEAD
=======
import java.util.HashMap;
import java.util.Map;
>>>>>>> d9d896faa2f6d79d5d098e5afb4f1d793f971fb3

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.ibatis.session.SqlSession;
import org.apache.tiles.template.AddAttributeModel;
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

	@RequestMapping("/loginForm")
	public String loginForm() {
		System.out.println("=========pass by loginForm()=============");

		return "/customer/loginForm";
		// 로그인 후 main.jsp로 돌아가야함 리턴 값수정하기

	}

	// 로그인페이지
<<<<<<< HEAD
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
=======
	//method=RequestMethod.POST,value=
	@RequestMapping( method=RequestMethod.POST,value="/loginCheck")/*method=RequestMethod.POST,value=*/
	public String loginCheck(HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		System.out.println("=========pass by loginCheck()=============");
		//Map<String, Object> rs = new HashMap<String, Object>();
		/*response.setCharacterEncoding("EUC-KR");*/
		
		String id = request.getParameter("loginid");
		String password = request.getParameter("loginpw");
		System.out.println("id :" + id);
		System.out.println("password :" + password);
		
		//CustomerDto dto = new CustomerDto();
		//dto.setId(id);
		//dto.setPassword(password);
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		CustomerDto dto_id = dao.loginCheckId(id);
		CustomerDto dto_pw = dao.loginCheckPw(id, password);
		
		//PrintWriter writer = response.getWriter();

		//로그인 성공 1
		if(dto_id == null){	//로그인했을때 ID나 비밀번호가 달라서 아무값도 넘겨받지 못함
			System.out.println("없는 아이디이거나 회원이 아닙니다.");
			return "/customer/loginForm";
		}else if(dto_pw == null){
			System.out.println("비밀번호를 확인해주세요");
			return "/customer/loginForm";
		}else{
			System.out.println("정상적으로 로그인이 되었습니다.");
		//로그인할 때 id password 세션에 세팅
			session.setAttribute("id", id);
			System.out.println("Sid :" + id);
			model.addAttribute("id", id);
			model.addAttribute("msg","정상적으로 로그인이 되었습니다.");
		}
		/*로그인 성공2
		if (dto == null) {
			rs.put("rs1", "F1");
			rs.put("msg", "아이디와 비밀번호를 확인해주세요");
			model.addAttribute("alertms", rs.get("msg"));
		}else{
			rs.put("rs2", "S2");
			rs.put("msg", "HICGV에 오신것을 환영합니다.");
			model.addAttribute("alertms", rs.get("msg"));
		}*/
		//id와 password를 세션에 저장 세션에 담아두면 jsp를 이동해도 세션을 통해 아이디를 받아서 사용할 수 있다.
		
		
/*		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		model.addAttribute("login", dao.loginCheck(id, password));*/

		return "home";
>>>>>>> d9d896faa2f6d79d5d098e5afb4f1d793f971fb3
		// 로그인이 성공하면 메인 또는 홈.jsp로 이동하게 수정
		// 아이디 비번이 다르거나 없으면 발생하는 이벤트 코딩하기
	}

	// 로그인을 클릭하면 로그인 페이지로 이동
	@RequestMapping("/joinForm")
	public String joinForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by joinForm()=============");

		return "/customer/joinForm";
	}// 회원가입
	@RequestMapping("/join")
	public String join(HttpServletRequest request, Model model) {
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
		//model.addAttribute("join", join);

		
		
		return "/customer/myCGV";
	}

	// myCGV를 클릭하면 회원정보를 볼 수 있는 myCGV.jsp로 이동 //myCGV는추상메소드 xml id에 동일하게 사용해야함
	@RequestMapping("/myCGV")
	public String myCGV(HttpServletRequest request, Model model) {
		System.out.println("=========pass by myCGV()=============");
		String id = request.getParameter("id");
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);

		// dao.myCGV(); 어떤 방식을 사용해도 무방함
		// CustomerDto myCGV(String id)에서 리턴받아옴
		CustomerDto myCGV = dao.myCGV(id);
		// 모델에 "myCGV"이름으로 myCGV담아서 myCGV.id로 jsp에 뿌려주기
		model.addAttribute("myCGV", myCGV);
		System.out.println(myCGV.getId());
		System.out.println(myCGV.getName());
		System.out.println(myCGV.getNickname());
		System.out.println(myCGV.getPhone_number());
		System.out.println(myCGV.getGender());
		System.out.println(myCGV.getDate_birth());
		System.out.println(myCGV.getLocation());

		return "/customer/myCGV";
	}

	@RequestMapping("/modifyForm")
	public String modifyForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by modifyForm()=============");
		String id = request.getParameter("id");
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		CustomerDto myCGV = dao.myCGV(id);
		model.addAttribute("myCGV", myCGV);

		return "/customer/modifyForm";
	}

	@RequestMapping(method=RequestMethod.POST,value="/modify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("=========pass by modify()=============");
		// xml에 있는 쿼리문을 다시 사용해도 됨. 모든 필드값을 새로 가져오는 것이라니라 기존의 id로 다른 모든 필드를 가져왔던
		// 쿼리문을 사용하여 주소값으로 넘김
		
				
		String id = request.getParameter("id");
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
		dao.modify("test01", password, phone_number, nickname, gender, date_birth, location, email,
				question, answer);

		return "/customer/myCGV";
	}
	@RequestMapping("/customerDelete")
	public String customerDelete(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerDelete()=============");

		
		String id=request.getParameter("id");
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		dao.delete(id);
		
		return "customerDelete";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("=========pass by delete()=============");

		
		String id=request.getParameter("id");
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
<<<<<<< HEAD
		dao.delete(id);
		
		return "redirect:login";
=======
		dao.delete(id, password);
		HttpSession session = request.getSession();
		System.out.println("id");
		//새션 변수 개별 삭제
		//session.removeAttribute("id");
		//세션초기화
		session.invalidate();
		return "home"; 
	} //비밀번호 찾기 폼으로 이동
	@RequestMapping("/forgetpwForm")
	public String forgetPwForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by forgetPw()=============");
		return "/customer/forgetpwForm";
		} // 회원정보 입력 후 질문jsp로 이동
	@RequestMapping("/forgetPw")
	public String forgetPw(HttpServletRequest request, Model model) {
		System.out.println("=========pass by forgetPw()=============");
		
// 비밀번호는 아이디를 기억하고 있다는 전제하에 진행 > 아이디와 이메일 입력후 일치하는  질문 뿌려주기
		//아이디와 이메일 입력받기
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		System.out.println("id :" + id);
		System.out.println("email :" + email);
		
		//디비에 접속과 동시에 비교
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		//위의 아이디체크 Dao 재활용
		CustomerDto dto_id = dao.loginCheckId(id);
		String question = dao.forgetPw(id, email);
		if ( dto_id == null) {
			System.out.println("아이디가 없습니다. 아이디 찾기를 먼저 진행해주세요.");
			return "/customer/loginForm";
		}else if (question == null) {
			System.out.println("회원정보가 없습니다.");
			return "/customer/loginForm";
		}
		System.out.println("회원정보가 일치합니다. 질문으로 이동합니다.");
		//세션에 불러올 질문을 담아서 가지고 질문확인 폼으로 이동(질문폼에서 사용해야하니까 세션사용)
		session.setAttribute("question", question);
		//HttpSession session = request.getSession(); // 여기서 세션을 꺼낼일은 없음  생성만하면 됨
		System.out.println("answer : " + session.getAttribute("question"));
		return "/customer/confirmQuestion";
	}
	@RequestMapping(method=RequestMethod.POST,value="/confirmQuestion")
	public String confirmQuestion(HttpServletRequest request, Model model) {
		System.out.println("=========pass by confirm question()=============");
		
		HttpSession session = request.getSession();
		String question =(String) session.getAttribute("question");
		System.out.println("question : " + session.getAttribute("question"));
		//답을입력받음
		String answer = request.getParameter("answer");
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		///==========수정중
		return "/customer/loginForm";
	} //비밀번호 재설정 폼으로 이동
	@RequestMapping(method=RequestMethod.POST,value="/resetPwForm")
	public String resetPwForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by resetPwForm()=============");
		//디비에 있는 질문
		String question =(String) session.getAttribute("question");
		
		
		return "/customer/resetPwForm";
>>>>>>> d9d896faa2f6d79d5d098e5afb4f1d793f971fb3
	}
}
