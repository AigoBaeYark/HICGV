package com.hicgv.ticket.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.hicgv.theater.dto.TimeInfoDto;

@Controller
public class TicketController {

	@Autowired
	private SqlSession sqlSession;
	
	/*예매파트란*/
	@RequestMapping("/ticket")
	public String ticket(HttpServletRequest request, Model model) {
		System.out.println("========= < pass by ticket() > =========");
		
		String theaterid = request.getParameter("theaterid");
		String locid = request.getParameter("locid");
		
		System.out.println("theaterid : " + theaterid);
		System.out.println("locid : " + locid);
		
		TicketDao dao=sqlSession.getMapper(TicketDao.class);
		ArrayList<MoviesDto> ticket=dao.ticket();
		model.addAttribute("ticket", ticket);
		
		ArrayList<TheaterDto> biglocal=dao.biglocal();
		for (TheaterDto theaterDto : biglocal) {
			System.out.println(theaterDto.getTheater_id());
		}
		model.addAttribute("biglocal", biglocal);
		/*@@모델을 안 써서 값이 안 나왔음*/
		
		ArrayList<TLocationDto> local=dao.local();
		for (TLocationDto tLocationDto : local) {
			System.out.println("loc : " + tLocationDto.getLocation_id());
		}
		model.addAttribute("local", local);
		
		ArrayList<TTimeDto> time=dao.time();
		for (TTimeDto tTimeDto : time) {
			System.out.println("time : " + tTimeDto.getStart_date());
		}
		
		model.addAttribute("time", time);
		
		return "ticket/ticket";
		
	}

	/*날짜시간 세분화 및 상영종료 시간 구하기*/
	
	/*@RequestMapping("/timeSelect")
	public String timeSelect(HttpServletRequest request, Model model) {
		System.out.println("======= < pass by timeSelect() > =======");
		
		//request.getParameter(" "); 아직 뭐 받을지 생각중
		
		TicketDao dao = sqlSession.getMapper(TicketDao.class);
		
		ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();
		
		ArrayList<TimeInfoDto> tList=dao.getTime(); //괄호안에 다가 날짜 쓸 예정
		String year="";
		String month="";
		String day="";
		String hour="";
		String minute="";
		
		for (TimeInfoDto timeInfoDto : tList) {
			String startTime=timeInfoDto.getStart_date();
			System.out.println("startTime : "+startTime);
			//year=startTime.substring(beginIndex, endIndex)
		}*/
		
		
		
		// LinkedHashMap  HashMap 의 순서를 유지한다.
		
		
		
		
//		return "ticket/ticket";
//		
//	}
	
	
	
	
	
	
	
	
	
	
	

}
