package com.hicgv.ticket.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.ticket.dao.TicketDao;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TTimeDto;
import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.theater.dto.TheaterDto;

@Controller
public class TicketController {

	@Autowired
	private SqlSession sqlSession;
	
	/*예매파트란*/
	@RequestMapping("/ticket")
	public String ticket(Model model) {
		System.out.println("========= < pass by ticket() > =========");
		
		TicketDao dao=sqlSession.getMapper(TicketDao.class);
		ArrayList<MoviesDto> ticket=dao.ticket();
		model.addAttribute("ticket", ticket);
		
		ArrayList<TheaterDto> biglocal=dao.biglocal();
		model.addAttribute("biglocal", biglocal);
		/*@@모델을 안 써서 값이 안 나왔음*/
		
		ArrayList<TLocationDto> local=dao.local();
		model.addAttribute("local", local);
		
		ArrayList<TTimeDto> time=dao.time();
		model.addAttribute("time", time);
		
		return "ticket/ticket";
		
	}


}
