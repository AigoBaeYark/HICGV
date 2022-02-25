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
import com.hicgv.customer.service.CustomerServicempl;

import oracle.net.ns.DataDescriptorPacket;

//import com.HICGV.dao.customerDao;

@Controller
public class CustomerController {
	// DB접속
	@Autowired
	private SqlSession sqlSession;
	// 서비스 연결
	@Autowired
	CustomerService customerService;

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
		customerService.loginCheck(id, password);
		if (customerService.loginCheck(id, password).equals("아이디없음")) {
			System.out.println("없는 아이디이거나 회원이 아닙니다.");
			return "/customer/loginForm";
		} else if (customerService.loginCheck(id, password).equals("비밀번호 틀림")) {
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

			/*
			 * System.out.println(customerDto.getId());
			 * System.out.println(customerDto.getPassword());
			 * System.out.println(customerDto.getGender());
			 * System.out.println(customerDto.getName());
			 * System.out.println(customerDto.getPhone_number());
			 * System.out.println(customerDto.getNickname());
			 * System.out.println(customerDto.getDate_birth());
			 * System.out.println(customerDto.getLocation());
			 * System.out.println(customerDto.getEmail());
			 * System.out.println(customerDto.getGrade());
			 */

			customerService.joinCustomer(customerDto);

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
			dto = customerService.myCGV(id);

			System.out.println("controller1 :" + dto.getId());
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

			customerService.modify(customerDto);

		}
		return "/customer/myCGV";

	}// 회원탈퇴 화면으로 이동

	@RequestMapping("/customerDeleteForm")
	public String customerDelete(HttpServletRequest request, Model model, HttpSession httpSession) {
		System.out.println("=========pass by customerDeleteForm()=============");

		session.getAttribute("id");
		System.out.println("session id :" + session.getAttribute("id"));
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

		customerService.delete(id, password);
		// 세션초기화*/
		session.invalidate();
		System.out.println("정상적으로 탈퇴되었습니다.");
		return "home";
	} // 비밀번호 찾기 폼으로 이동

	@RequestMapping("/forgetPwForm")
	public String forgetPwForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by forgetPwForm()=============");
		return "/customer/forgetPwForm";
	}

	// 회원정보 입력으로 이동
	@RequestMapping("/forgetPw")
	public String forgetPw(HttpServletRequest request, Model model, @ModelAttribute CustomerDto customerDto) {
		System.out.println("=========pass by forgetPw()=============");
		// 서비스 실행
		customerService.forgetPw(customerDto.getId(), customerDto.getEmail());
		if (customerService.forgetPw(customerDto.getId(), customerDto.getEmail()).equals("회원확인실패")) {
			System.out.println(customerDto.getId());
			System.out.println(customerDto.getEmail());
			System.out.println("회원확인에 실패 하였습니다.");
			return "/customer/loginForm";
		} else {
			System.out.println("회원임을 확인했습니다. 질문에 답을 정확하게 입력해주세요.");

			String question = customerService.getQuestion(customerDto.getId(), customerDto.getEmail());
			String id = customerDto.getId();
			System.out.println("get que : " + question);
			System.out.println("get id : " + customerDto.getId());
			System.out.println("question:" + customerService.getQuestion(customerDto.getId(), customerDto.getEmail()));
			System.out.println("model question : " + model.addAttribute("question", question));
			System.out.println("model id : " + model.addAttribute("id", id));
			return "/customer/confirmAnswerForm";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/resetPwForm")
	public String confirmAnswerForm(HttpServletRequest request, Model model,@ModelAttribute CustomerDto customerDto) throws Exception {
		System.out.println("=========pass by confirmAnswerForm(질문에 답을 입력하세요)=============");
		/*String getAnswer = request.getParameter("answer");
		String getId = request.getParameter("getId");*/
		System.out.println("answer :" + customerDto.getAnswer());
		// 디비에 접속과 동시에 비교
		customerService.getAnswer(customerDto.getAnswer());
		if (customerService.getAnswer(customerDto.getAnswer()).equals("정답")) {
			System.out.println("정답이 일치하여 비빌번호 재설정으로 이동합니다.");
			String id = customerDto.getId();
			model.addAttribute("id", request.getParameter("id"));
			return "/customer/resetPwForm";
		}else if (customerService.getAnswer(customerDto.getAnswer()).equals("정답이 아닙니다."))
			System.out.println("정답이 아닙니다. 고객센터에 문의하세요.");
		
		return "/customer/confirmAnswerForm";
	}
	// 비밀번호 재설정 폼으로 이동}

	@RequestMapping(method = RequestMethod.POST, value = "resetPw")
	public String resetPw(HttpServletRequest request, Model model) {
		System.out.println("=========pass by resetPw()=============");
		// 세션을 가져오고 그중에서 id세션을 통해 비밀번호 업데이트
		
		String id = request.getParameter("id");
		String newPw = request.getParameter("newPw");
		//String newPwConfirm = request.getParameter("newPwConfirm");
		
		System.out.println("con id : "+id);
		System.out.println("con pw : "+newPw);
		
		//최종으로 받아야하는 결과 값 // param 값을 받아서 서비스로 이동		
		customerService.resetPw(id, newPw);		
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
		customerService.forgetId(phone_number, date_birth);
		
		System.out.println(customerService.forgetId(phone_number, date_birth));
		// 디비에 접속과 동시에 비교
		/*CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
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
		}*/
		return "/customer/loginForm";
	}

	@RequestMapping("/customerList")
	public String customerList(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerList()=============");
		return "/customer/customerList";
	}
}