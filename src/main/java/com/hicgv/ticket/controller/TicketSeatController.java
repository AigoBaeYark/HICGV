package com.hicgv.ticket.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TicketSeatController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/ticketseat")
	public String ticketseat(HttpServletRequest request, Model model) {
		System.out.println("======= << ticketseat >> =======");
		
		return "ticket/ticketseat";
	}

}
