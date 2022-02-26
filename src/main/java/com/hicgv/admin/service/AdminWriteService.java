package com.hicgv.admin.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hicgv.admin.controller.dto.AdminDto;
import com.hicgv.admin.dao.AdminDao;

public class AdminWriteService implements AdminServiceInf{

	@Override
	public void execute(Model model) {
		System.out.println("BWriteService-------");
//		map으로 변환
		Map<String, Object> map=model.asMap();
//		map->request
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String bName=request.getParameter("bName");
		String bTitle=request.getParameter("bTitle");
		String bContent=request.getParameter("bContent");
		
		//System.out.println("bName   :  "+bName);
		
		AdminDao dao=new AdminDao();
		dao.write(bName,bTitle,bContent);
	}
}
