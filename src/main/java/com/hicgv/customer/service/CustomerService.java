package com.hicgv.customer.service;

import java.util.ArrayList;


import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hicgv.customer.dto.CustomerDto;

public interface CustomerService {
	//매퍼함수를 부름
	public void joinCustomer(CustomerDto customerDto);
	
	public String loginCheck(String id, String password);
	
	public CustomerDto myCGV(String id);
	
	public void modify(CustomerDto customerDto);
	
	public void delete(String id, String password);
	
	public String forgetPw(String id, String email);
	
	public void resetPw(String password, String name );
	
	public String getQuestion(String id, String email);

	public String getAnswer(String answer);
	
	public String forgetId(String phone_number, String date_birth);
//========================관리자체이지=====================================
/*	public LinkedList<CustomerDto> customerList(int start,int end);
	
	public void execute(Model model);*/

}
