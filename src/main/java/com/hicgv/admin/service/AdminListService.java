package com.hicgv.admin.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.hicgv.admin.controller.dto.AdminDto;
import com.hicgv.admin.dao.AdminDao;

public class AdminListService implements AdminServiceInf{

	@Override
	public void execute(Model model) {
		System.out.println("BListService-------");
		AdminDao dao=new AdminDao();//훳호출  BoardDao()의 생성자호출
		ArrayList<AdminDto> dtos=dao.list();
		
		//리턴받은 내용을 모델에 담기
		model.addAttribute("list",dtos);
		
	}
}
