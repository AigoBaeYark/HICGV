package com.hicgv.customer.service;

import com.hicgv.customer.dto.CustomerDto;

public interface CustomerService {
	
	public void insertCustomer(CustomerDto customerDto);
	public String checkLogin(String id, String pw);

}
