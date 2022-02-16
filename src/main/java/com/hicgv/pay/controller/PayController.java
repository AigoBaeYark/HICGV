package com.hicgv.pay.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/pay")
	public String reserve(HttpServletRequest request, Model model) {
		System.out.println("======= << pay >> =======");
		
		return "pay/pay";
	}

}
