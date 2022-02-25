package com.hicgv.customer.service;

import com.hicgv.customer.dto.CustomerDto;

public interface CustomerService {
	//매퍼함수를 부름
	public void joinCustomer(CustomerDto customerDto);
	
	public String loginCheck(String id, String password);
	
	public CustomerDto myCGV(String id);
	
	public void modify(CustomerDto customerDto);
	
	public void delete(String id, String password);
	

}
