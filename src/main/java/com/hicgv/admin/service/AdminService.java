package com.hicgv.admin.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.hicgv.admin.dto.AdminDto;

import org.springframework.stereotype.Service;

public interface AdminService {
//	public void execute(Model model);

	public int selectCustomerTotCount();
	
	public	 ArrayList<AdminDto> customerlist();
	
	public AdminDto customerView(String id);
	
	public void customerDelete();
	
	public void customerModify();

	
}
