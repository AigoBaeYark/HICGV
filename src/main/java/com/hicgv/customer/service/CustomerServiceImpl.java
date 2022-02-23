package com.hicgv.customer.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.customer.dao.CustomerDao;
import com.hicgv.customer.dto.CustomerDto;


@Service
public class CustomerServiceImpl implements CustomerService{

	@Inject
	CustomerDao dao;

	@Override
	public void insertCustomer(CustomerDto customerDto) {
		//기존거
		//dao.join(id, password, name, phone_number, nickname, gender, date_birth, location, email, question, answer);
		List<String> list = new ArrayList<String>();
		list.add(customerDto.getId());
		list.add(customerDto.getPassword());
		for (String string : list) {
			System.out.println("list : "+string);
			
		}
		
		Map<String, String> map =  new HashMap<String, String>(); 
		map.put("id", customerDto.getId());
		map.put("pw", customerDto.getPassword());
		System.out.println("map id : "+ map.get("id"));
		System.out.println("map pw :" + map.get("pw"));
		
		
		
		//정리하고 난 이후 방식
		dao.insertCustomer(customerDto);
	}

	@Override
	public String checkLogin(String id, String pw) {
		
		
		
		
		if(dao.loginCheckId(id) == null){
			return "아이디없음";
		}else{
			if(dao.loginCheckPw(id, pw)==null){
				return "비밀번호 틀림";
			}else
				return "로그인 성공";
		}
		
		
	}
	
	
	
}
