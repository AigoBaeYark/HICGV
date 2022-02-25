package com.hicgv.customer.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.apache.tiles.template.AddAttributeModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.hicgv.customer.dao.CustomerDao;
import com.hicgv.customer.dto.CustomerDto;
import com.hicgv.customer.service.CustomerService;

//import com.HICGV.dao.customerDao;

@Controller
public class CustomerController {
	// DB접속
	@Autowired
	private SqlSession sqlSession;
	// 서비스 연결
	@Autowired
	CustomerService cusomerService;

	@Autowired
	private HttpSession session; // 세션을 주입받을 수 있도록 세팅1

	@RequestMapping("/loginForm")
	public String loginForm() {
		System.out.println("=========pass by loginForm()=============");
		session.invalidate();
		return "/customer/loginForm";
		// 로그인 후 main.jsp로 돌아가야함 리턴 값수정하기

	}

	// 로그인페이지
	@RequestMapping(method = RequestMethod.POST, value = "/loginCheck")
	public String loginCheck(HttpServletRequest request, Model model, @ModelAttribute CustomerDto customerDto,
			HttpSession session, HttpServletResponse response) throws Exception {
		System.out.println("=========pass by loginCheck11111()=============");

		String id = request.getParameter("loginid");
		String password = request.getParameter("loginpw");
		System.out.println("id:" + id);
		System.out.println("password:" + password);

		// 아이디 패스워드 체크
		cusomerService.loginCheck(id, password);
		if (cusomerService.loginCheck(id, password).equals("아이디없음")) {
			System.out.println("없는 아이디이거나 회원이 아닙니다.");
			return "/customer/loginForm";
		} else if (cusomerService.loginCheck(id, password).equals("비밀번호 틀림")) {
			System.out.println("비밀번호를 확인해주세요");
			return "/customer/loginForm";
		} else {
			System.out.println("정상적으로 로그인이 되었습니다.");
			// 로그인할 때 id password 세션에 세팅
			session.setAttribute("id", id);
			System.out.println("Sid :" + id);
			System.out.println("id : " + id);
		}
		return "main";
		// 로그인이 성공하면 메인 또는 홈.jsp로 이동하게 수정
		// 아이디 비번이 다르거나 없으면 발생하는 이벤트 코딩하기
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("=========pass by logout()=============");
		System.out.println("id : " + session.getAttribute("id"));
		HttpSession session = request.getSession();
		System.out.println("id");
		// 세션초기화
		session.invalidate();
		return "main";
	}

	// 로그인을 클릭하면 로그인 페이지로 이동
	@RequestMapping("/joinForm")
	public String joinForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by joinForm()=============");

		return "/customer/joinForm";
	}// 회원가입

	@RequestMapping(method = RequestMethod.POST, value = "/joinCustomer")
	public String joinCustomer(HttpServletRequest request, Model model, @ModelAttribute CustomerDto customerDto)
			throws Exception {
		{
			System.out.println("=========pass by joinCustomer()=============");

			System.out.println(customerDto.getId());
			System.out.println(customerDto.getPassword());
			System.out.println(customerDto.getGender());
			System.out.println(customerDto.getName());
			System.out.println(customerDto.getPhone_number());
			System.out.println(customerDto.getNickname());
			System.out.println(customerDto.getDate_birth());
			System.out.println(customerDto.getLocation());
			System.out.println(customerDto.getEmail());
			System.out.println(customerDto.getGrade());

			cusomerService.joinCustomer(customerDto);

			return "/customer/loginForm";
		}
	}

	// myCGV를 클릭하면 회원정보를 볼 수 있는 myCGV.jsp로 이동 //myCGV는추상메소드 xml id에 동일하게 사용해야함
	@RequestMapping("/myCGV")
	public String myCGV(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("=========pass by myCGV()=============");
		// 로그인 후 생성된 세션 id값을 가지고 서비스로 이동

		if (session.getAttribute("id") == null) {
			System.out.println("로그인 후 이용해주세요");
			return "/customer/loginForm";
		} else { // 로그인 했을경우

			String id = (String) session.getAttribute("id");
			System.out.println("id : " + id);
			CustomerDto dto = new CustomerDto();
			System.out.println("myCGV로 이동합니다.");

			// customerDaoImpl 에서 값을 받아옴...
			dto = cusomerService.myCGV(id);

			System.out.println("controller11111 :" + dto.getId());
			model.addAttribute("myCGV", dto);

		}
		return "/customer/myCGV";

	}

	@RequestMapping("/modifyForm")
	public String modifyForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by modifyForm()=============");

		return "/customer/modifyForm";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request, Model model, @ModelAttribute CustomerDto customerDto)
			throws Exception {
		{
			System.out.println("=========pass by modify()=============");

			
			customerDto.setId((String) session.getAttribute("id"));
			
			
			System.out.println(customerDto.getId());
			System.out.println(customerDto.getPassword());
			System.out.println(customerDto.getGender());
			System.out.println(customerDto.getPhone_number());
			System.out.println(customerDto.getNickname());
			System.out.println(customerDto.getDate_birth());
			System.out.println(customerDto.getLocation());
			System.out.println(customerDto.getEmail());
			System.out.println(customerDto.getQuestion());
			System.out.println(customerDto.getAnswer());

			cusomerService.modify(customerDto);
			
	}
			return "/customer/myCGV";
		
	}// 회원탈퇴 화면으로 이동
	@RequestMapping("/customerDeleteForm")
	public String customerDelete(HttpServletRequest request, Model model,HttpSession httpSession) {
		System.out.println("=========pass by customerDeleteForm()=============");
		
		session.getAttribute("id");
		System.out.println("session id :"+session.getAttribute("id"));
		/*String id = request.getParameter("id");
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		CustomerDto myCGV = dao.myCGV(id);*/
		model.addAttribute("sessionId", session.getAttribute("id"));

		return "/customer/customerDeleteForm";
	}// 회원탈퇴 화면에서 탈퇴 진행

	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("=========pass by delete()=============");
		// 비밀번호를 한 번 더 입력하고 일치하면 탈퇴진행할 수 있게 하기

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		System.out.println("id :" + id);
		System.out.println("password :" + password);
		
		cusomerService.delete(id, password);
		/*CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		dao.delete(id, password);
		HttpSession session = request.getSession();
		System.out.println("id");
		// 새션 변수 개별 삭제
		// session.removeAttribute("id");
		// 세션초기화*/
		/*session.invalidate();
		System.out.println("정상적으로 탈퇴되었습니다.");*/
		return "home";
	} // 비밀번호 찾기 폼으로 이동

	@RequestMapping("/forgetPwForm")
	public String forgetPwForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by forgetPwForm()=============");
		return "/customer/forgetPwForm";
	}

	// 회원정보 입력으로 이동
	@RequestMapping("/forgetPw")
	public String forgetPw(HttpServletRequest request, Model model) {
		System.out.println("=========pass by forgetPw()=============");

		// 비밀번호는 아이디를 기억하고 있다는 전제하에 진행 > 아이디와 이메일 입력후 일치하는 질문 뿌려주기
		// 아이디와 이메일 입력받기
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		System.out.println("id :" + id);
		System.out.println("email :" + email);

		// 디비에 접속과 동시에 비교
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		// 위의 아이디체크 Dao 재활용 / 이메일꺼내오기 / 질문꺼내오기
		// dto_getId 쿼리문의결과 값
		String dto_getId = dao.loginCheckId(id);
		String dto_getEmail = dao.getEmail(id);
		// xml에서 받아오는 question 값 = dao.dao.forgetPw(쿼리에 사용하는 필드명으로 보내줌)
		String dto_getQuestion = dao.getQuestion(id, email);
		System.out.println("getid :" + dto_getId);
		System.out.println("getemail :" + dto_getEmail);
		System.out.println("getQuestion :" + dto_getQuestion);
		if (email.equals(dto_getEmail) && id.equals(dto_getId)) {
			System.out.println("회원정보가 일치합니다. 질문으로 이동합니다.");
			model.addAttribute("getQuestion", dto_getQuestion);
			// request.getSession().setAttribute("question",dto_getQuestion);
			// 아이디와 질문비교를 위해 confirmAnswerForm 으로 넘기려고 모델에 담아줌
			model.addAttribute("getId", dto_getId);
			model.addAttribute("getQuestion", dto_getQuestion);
			System.out.println("getId :" + dto_getId);
			System.out.println("getgetQuestion :" + dto_getQuestion);
			return "/customer/confirmAnswerForm";
		}
		System.out.println("회원정보가 일치하지 않습니다.");
		return "/customer/loginForm";
		// 집에서 연습용으로 다른 코드로 짜보기

		/*
		 * if (dto_getId == null) {
		 * System.out.println("아이디가 없습니다. 아이디 찾기를 먼저 진행해주세요."); return
		 * "/customer/loginForm"; } else if (dto_getEmail == null) {
		 * System.out.println("이메일 정보가 다릅니다. 다시 입력해주세요"); return
		 * "/customer/forgetPwForm"; } else {
		 * System.out.println("회원정보가 일치합니다. 질문으로 이동합니다."); }
		 */
		// 세션에 불러올 질문을 담아서 가지고 질문확인 폼으로 이동(질문폼에서 사용해야하니까 세션사용)
		/* request.getSession().setAttribute("question",dto_getQuestion); */
		/* return "/customer/confirmAnswerForm"; */
		// session.setAttribute("question", session);
		// String question = (String) session.getAttribute("question");
		// System.out.println("question : " + session.getAttribute("question"));
	}

	//
	@RequestMapping(method = RequestMethod.POST, value = "/resetPwForm")
	public String confirmAnswerForm(HttpServletRequest request, Model model) throws Exception {
		System.out.println("=========pass by confirmAnswerForm(질문에 답을 입력하세요)=============");
		// 답을 입력받음(jsp에서 'answer'이름으로 입력한 값을 받아 getAnswer의 변수 생성)
		String getAnswer = request.getParameter("answer");
		// forgetPw에서 히든값으로 보내준 getId를 getId라는 이름으로 input
		String getId = request.getParameter("getId");
		System.out.println("answer :" + getAnswer);
		System.out.println("getId :" + getId);

		// 디비에 접속과 동시에 비교
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		// 위의 아이디체크 Dao 재활용 / 이메일꺼내오기 / 질문꺼내오기
		String dto_getAnswer = dao.getAnswer(getAnswer);
		// xml에서 받아오는 question 값 = dao.dao.forgetPw(쿼리에 사용하는 필드명으로 보내줌)
		System.out.println("dto_getAnswer :" + dto_getAnswer);
		if (getAnswer.equals(dto_getAnswer)) {
			System.out.println("정답입니다. 비밀번호 재설정으로 이동합니다.");
			// request.getSession().setAttribute("getAnswer",dto_getAnswer);
			model.addAttribute("getId", getId);
			// request.getSession().setAttribute("id",);
			return "/customer/resetPwForm";
		}
		System.out.println("정답이 아닙니다.");
		return "/customer/confirmAnswerForm";
	}
	// 비밀번호 재설정 폼으로 이동}

	/*
	 * @RequestMapping(method = RequestMethod.POST, value = "/resetPwForm")
	 * public String resetPwForm(HttpServletRequest request, Model model) throws
	 * Exception {
	 * System.out.println("=========pass by resetPwForm()=============");
	 * System.out.println("=========질문에 답을 입력하고 비밀번호 재설정으로 이동해주세요============="
	 * ); // 디비에 있는 질문 String question = (String)
	 * session.getAttribute("question");
	 * 
	 * return "/customer/resetPwForm"; }// 새비밀번호 저장하면 로그인페이지로 돌아감 / 재설정하지 않으면
	 * 세션지워지고 홈으로..
	 */

	@RequestMapping(method = RequestMethod.POST, value = "resetPw")
	public String resetPw(HttpServletRequest request, Model model) {
		System.out.println("=========pass by resetPw()=============");
		// 세션을 가져오고 그중에서 id세션을 통해 비밀번호 업데이트
		/*
		 * HttpSession session = request.getSession(); // id세션을 불러옴 String id =
		 * (String) session.getAttribute("id"); // jsp에서 입력한 값을 받음
		 * request.getAttribute(id);
		 */

		String getId = request.getParameter("getId");
		String newPw = request.getParameter("newPw");
		String newPwConfirm = request.getParameter("newPwConfirm");
		System.out.println("newPw :" + newPw);
		System.out.println("newPwConfirm :" + newPwConfirm);

		if (newPw == newPwConfirm) {
			System.out.println("비밀번호가 일치하지 않습니다.");
			return "/customer/resetPwForm";
		} else {
			System.out.println("비밀번호가 일치합니다. 비밀번호를 재설정합니다.");

		}
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		dao.resetPw(getId, newPw);
		System.out.println("성공적으로 비밀번호를 재설정하였습니다. 다시 로그인해주세요.");
		session.invalidate();
		return "/customer/loginForm";
	}

	@RequestMapping("/forgetIdForm")
	public String forgetIdForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by forgetIdForm()=============");
		return "/customer/forgetIdForm";
	}

	// 아이디 찾기
	@RequestMapping("/forgetId")
	public String forgetId(HttpServletRequest request, Model model) {
		System.out.println("=========pass by forgetId()=============");

		String phone_number = request.getParameter("phone_number");
		String date_birth = request.getParameter("date_birth");

		System.out.println("getphone_number :" + phone_number);
		System.out.println("getdate_birth :" + date_birth);

		// 디비에 접속과 동시에 비교
		CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
		// getId로 아이디를 찾는 쿼리의 결과 값을 담는다. dao.에는 위에서 입력한 값을 임력해서 쿼리를 실행
		String getPhone_number = dao.getPhone_number(phone_number);
		String getId = dao.forgetId(phone_number, date_birth);
		System.out.println("id :" + getId);

		if (getPhone_number != null && getId != null) {
			System.out.println("회원정보가 일치합니다.");
			model.addAttribute("getId", getId);
			System.out.println("회원님의 아이디는 " + getId + "입니다.");
			return "home";
			// 아이디만 뿌려주기 위해서 모델에 담음
		} else {
			System.out.println("입력한 회원정보가 다릅니다.");
		}
		return "/customer/loginForm";
	}

	@RequestMapping("/customerList")
	public String customerList(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerList()=============");
		return "/customer/customerList";
	}
}