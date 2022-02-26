package com.hicgv.admin.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hicgv.admin.controller.dto.AdminDto;
import com.hicgv.admin.dao.AdminDao;

public class AdminDeleteService implements AdminServiceInf{

	@Override
	public void execute(Model model) {
		System.out.println("BDeleteService-------");
//		map으로 변환
		Map<String, Object> map=model.asMap();
//		map->request
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String bid=request.getParameter("bid");
		
		
		//System.out.println("bName   :  "+bName);
		
		AdminDao dao=new AdminDao();
		dao.delete(bid);
	}
}
