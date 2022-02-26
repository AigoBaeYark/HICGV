package com.hicgv.admin.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hicgv.admin.controller.dto.AdminDto;
import com.hicgv.admin.dao.AdminDao;

@Service
public class AdminContentViewService implements AdminServiceInf{

	@Override
	public void execute(Model model) {
		System.out.println("BContentViewService-------");
//		map으로 변환
		Map<String, Object> map=model.asMap();
//		map->request
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String id=request.getParameter("id");
		
		
		//System.out.println("bName   :  "+bName);
		
		AdminDao dao=new AdminDao();
		AdminDto dto=dao.contentView(id);
		
		model.addAttribute("customerView",dto);
	}
}
