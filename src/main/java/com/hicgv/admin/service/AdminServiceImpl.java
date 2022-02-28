package com.hicgv.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	public void customerDelete(String id) {
		System.out.println("==========adminserviceimpl customerDelete============");
		dao.customerDelete(id);
	}

	@Override
	public void customerModify(AdminDto adminDto) {
		System.out.println("============ServiceImpl customerModify================");
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("id", adminDto.getId());		
		map.put("nickname", adminDto.getNickname());
		map.put("date_birth", adminDto.getDate_birth());
		map.put("location", adminDto.getLocation());
		map.put("gender", adminDto.getGender());
		map.put("question", adminDto.getQuestion());
		map.put("answer", adminDto.getAnswer());
		map.put("email", adminDto.getEmail());
		map.put("phone_number", adminDto.getPhone_number());

		System.out.println("map id :" + map.get("id"));		
		System.out.println("map nickname :" + map.get("nickname"));
		System.out.println("map date_birth :" + map.get("date_birth"));
		System.out.println("map location :" + map.get("location"));
		System.out.println("map gender :" + map.get("gender"));
		System.out.println("map question :" + map.get("question"));
		System.out.println("map answer :" + map.get("answer"));
		System.out.println("map email :" + map.get("email"));
		System.out.println("map phone_number :" + map.get("phone_number"));

		dao.customerModify(adminDto);
	}
}
