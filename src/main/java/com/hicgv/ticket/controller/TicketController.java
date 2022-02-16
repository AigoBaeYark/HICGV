package com.hicgv.ticket.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.ticket.dao.TicketDao;
import com.hicgv.ticket.dto.TicketDto;

@Controller
public class TicketController {

	@Autowired
	private SqlSession sqlSession;
	
	/*예매파트란*/
	@RequestMapping("/ticket")
	public String ticket(Model model) {
		System.out.println("========= < pass by ticket() > =========");
		
		/*TicketDao dao=sqlSession.getMapper(TicketDao.class);
		ArrayList<TicketDto> ticket=dao.ticket();
		model.addAttribute("ticket", ticket);*/
				
				
		return "ticket/ticket";
		
	}
	

}
