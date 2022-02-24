package com.hicgv.customer.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.annotations.Case;
import org.apache.log4j.chainsaw.Main;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.StaticApplicationContext;
import org.springframework.stereotype.Service;

import com.hicgv.customer.dao.CustomerDao;
import com.hicgv.customer.dto.CustomerDto;

@Service
public class CustomerServicempl implements CustomerService {

	@Inject
	CustomerDao dao;
	
	// 맵을 활용해서 입력받은 값으로 쿼리문 실행하고 컨트롤러로 이동
	@Override
	public void joinCustomer(CustomerDto customerDto) {
		// 필수 항목은 예외처리 X (아이디,패스워드,이름,연락처,생일,이메일,질문,답)
		if (customerDto.getNickname() == null) {
			customerDto.setNickname("");
		} else if (customerDto.getGender() == null) {
			customerDto.setGender("");
		} else if (customerDto.getLocation() == null) {
			customerDto.setLocation("");
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("id", customerDto.getId());
		map.put("pw", customerDto.getPassword());
		map.put("name", customerDto.getName());
		map.put("phone_number", customerDto.getPhone_number());
		map.put("nickname", customerDto.getNickname());
		map.put("gender", customerDto.getGender());
		map.put("date_birth", customerDto.getDate_birth());
		map.put("location", customerDto.getLocation());
		map.put("email", customerDto.getEmail());
		map.put("grade", customerDto.getGrade());
		map.put("question", customerDto.getQuestion());
		map.put("answer", customerDto.getAnswer());

		System.out.println("map id : " + map.get("id"));
		System.out.println("map pw :" + map.get("pw"));
		System.out.println("map name :" + map.get("name"));
		System.out.println("map phone_number :" + map.get("phone_number"));
		System.out.println("map nickname :" + map.get("nickname"));
		System.out.println("map gender :" + map.get("gender"));
		System.out.println("map date_birth :" + map.get("date_birth"));
		System.out.println("map location :" + map.get("location"));
		System.out.println("map email :" + map.get("email"));
		System.out.println("map grade :" + map.get("grade"));
		System.out.println("map question :" + map.get("question"));
		System.out.println("map answer :" + map.get("answer"));

		// 정리하고 난 이후 방식
		dao.joinCustomer(customerDto);
	}

	// 로그인 체크
	@Override // mpl에서 loginCheck실행
	public String loginCheck(String id, String password) {
		// mpl에서 받은 리턴값을 갖고 아래로 실행
		System.out.println("=========pass by loginCheck ServeceImp()=============");
		System.out.println("login ckid : " + id);
		System.out.println("login ckpw : " + password);

		// 컨트롤러에 문자로 로그인 성공 실패 구분하기 위해서 리턴값을 문자로 줌
		if (dao.loginCheckId(id) == null) {
			System.out.println("아이디 틀림");
			return "아이디없음";
		} else if (dao.loginCheckPw(id, password) == null) {
			System.out.println("패스워드 틀림");
			return "비밀번호 틀림";
		} else
			System.out.println("로그인 성공");
		return "로그인 성공";
	}

	@Override
	public CustomerDto myCGV(String id) {
		System.out.println("==========customerServiceImpl.myCGV============");
		return dao.myCGV(id);

	}

	@Override
	public void modify(CustomerDto customerDto) {
		System.out.println("============ServiceImpl modify================");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id",customerDto.getId());
		map.put("pw", customerDto.getPassword());
		map.put("phone_number", customerDto.getPhone_number());
		map.put("nickname", customerDto.getNickname());
		map.put("gender", customerDto.getGender());
		map.put("date_birth", customerDto.getDate_birth());
		map.put("location", customerDto.getLocation());
		map.put("email", customerDto.getEmail());
		map.put("question", customerDto.getQuestion());
		map.put("answer", customerDto.getAnswer());

		
		System.out.println("map id :" + map.get("id"));
		System.out.println("map pw :" + map.get("pw"));
		System.out.println("map phone_number :" + map.get("phone_number"));
		System.out.println("map nickname :" + map.get("nickname"));
		System.out.println("map gender :" + map.get("gender"));
		System.out.println("map date_birth :" + map.get("date_birth"));
		System.out.println("map location :" + map.get("location"));
		System.out.println("map email :" + map.get("email"));	
		System.out.println("map question :" + map.get("question"));
		System.out.println("map answer :" + map.get("answer"));
		
		dao.modify(customerDto);
	}

}
