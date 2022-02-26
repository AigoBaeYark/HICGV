package com.hicgv.admin.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hicgv.admin.controller.dto.AdminDto;
import com.hicgv.admin.dao.AdminDao;

public class AdminModifyService implements AdminServiceInf{

	@Override
	public void execute(Model model) {
		System.out.println("BModifyService-------");
//		map으로 변환
		Map<String, Object> map=model.asMap();
//		map->request
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String bid=request.getParameter("bid");
		String bName=request.getParameter("bName");
		String bTitle=request.getParameter("bTitle");
		String bContent=request.getParameter("bContent");
		
		
		AdminDao dao=new AdminDao();
		dao.modify(bid,bName,bTitle,bContent);
	}
}
