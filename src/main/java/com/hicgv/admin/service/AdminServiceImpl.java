package com.hicgv.admin.service;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hicgv.admin.dao.AdminDao;
import com.hicgv.admin.dto.AdminDto;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	AdminDao dao;

	@Override
	public int selectCustomerTotCount() {
		
		return dao.selectCustomerTotCount();
	}

	@Override
	public ArrayList<AdminDto> customerlist() {
		
		return dao.customerlist();
	}

	@Override
	public AdminDto customerView(String id) {
		System.out.println("==========adminserviceimpl customerView============");
		return dao.customerView(id);
	}

	@Override
	public void customerDelete() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void customerModify() {
		// TODO Auto-generated method stub
		
	}
}
