package com.hicgv.ticket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.theater.dto.TheaterDto;
import com.hicgv.ticket.dao.TicketDao;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TicketListDto;
import com.hicgv.ticket.service.TicketService;

@Controller
public class TicketController {

	@Autowired
	TicketService ticketService;
	
	/*예매파트란*/
	@RequestMapping("/ticket")
	public String ticket(HttpServletRequest request, Model model) {
		System.out.println("========= < pass by ticket() > =========");
		
		//파라미터 받을때 null값이면 다른값으로 처리
		String movieid = request.getParameter("movieid");
		String theaterid = request.getParameter("theaterid");
		String locid = request.getParameter("locid");
		
		System.out.println("movieid : " + movieid);
		System.out.println("theaterid : " + theaterid);
		System.out.println("locid : " + locid);
		
		if (movieid == null)
			movieid = "20223278"; //극장판주술회전 (가나다 순 중 젤 위)
		if (theaterid == null)
	        theaterid = "1"; //서울코드 (지역순)
	    if (locid == null)
	        locid = "101"; //서울 강남 (가나다 순 젤 위)
	    
	    System.out.println("movieid2 : " + movieid);
		System.out.println("theaterid2 : " + theaterid);
		System.out.println("locid2 : " + locid);
		
		/*1.영화선택*/
		model.addAttribute("moviesList", ticketService.getMoviesList());
		
		/*2.지역선택*/
		
		//2-1. 지역(도별)
		
		for (TheaterDto theaterDto : ticketService.getLocal()) {
			System.out.println("getLocal : "+theaterDto.getTheater_loc());
		}
		model.addAttribute("local", ticketService.getLocal());
		
		//2-2. 상영관별
		for (TLocationDto tLocationDto : ticketService.getTheaterLocal()) {
			System.out.println("getTheaterLocal : "+tLocationDto.getLocation_name());
		}
		model.addAttribute("theaterlocal", ticketService.getTheaterLocal());
	
		
		
		return "ticket/ticket";
		
	}

	/*3.영화 상영날짜, 4.영화 시간선택 */
	//3번
	/*날짜시간 세분화 및 상영종료 시간 구하기*/
	@RequestMapping("/tictimeSelect1")
	public String timeSelect1(HttpServletRequest request, Model model) {
		System.out.println("======= < pass by tictimeSelect1() > =======");
		
		String movieid = request.getParameter("movieid");
		String theaterid = request.getParameter("theaterid");
		String locid = request.getParameter("locid");
		String tday = request.getParameter("day");
		
		Map<String, String> sendDataMap = new HashMap<String, String>();
		sendDataMap.put("movieid", "20210087");
		sendDataMap.put("theaterid", "1");
		sendDataMap.put("locid", "101");
		sendDataMap.put("tday", "15");
		
		//TicketDao dao = sqlSession.getMapper(TicketDao.class);
		
		//영화 선택시간
		ArrayList<Map<String, Object>> timeListMap = ticketService.getSelectTime(sendDataMap);
		
		
			for (Map<String, Object> timeMaplist : timeListMap) {
				System.out.println(timeMaplist.get("day"));
				System.out.println(timeMaplist.get("endTime"));
			}
		
			model.addAttribute("ticketday",timeListMap);
	
		return "ticket/ticket";
	}
	//4번
	@RequestMapping("/tictimeSelect2")
	public String timeSelect2(HttpServletRequest request, Model model) {
		System.out.println("======= < pass by tictimeSelect2() > =======");
		
		String movieid = request.getParameter("movieid");
		String theaterid = request.getParameter("theaterid");
		String locid = request.getParameter("locid");
		String tday = request.getParameter("day");
		String starttime = request.getParameter("starttime");
		
		//TicketDao dao = sqlSession.getMapper(TicketDao.class);
		
		ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();
		
		//ArrayList<TicketListDto> tickettiem=dao.tickettime(movieid, theaterid, locid, tday, starttime); //괄호안에 다가 날짜 쓸 예정
		String year="";
		String month="";
		String day="";
		String hour="";
		String minute="";
		
//		for (TicketListDto ticketListDto : tickettiem) {
//			String startTime=ticketListDto.getStart_date();
//			System.out.println("startTime : "+startTime);
//			
//			//연 월 일 시 분 나누기(영화 예매 날짜 및 종료날짜를 구하기 위해)
//			//year=startTime.substring(beginIndex, endIndex)
//			year=startTime.substring(0,4);
//			month=startTime.substring(5,7);
//			day=startTime.substring(8,10);
//			hour=startTime.substring(11,13);
//			minute=startTime.substring(14,16);
//			
//			// 상영 종료시간 계산
//			String time = hour + minute; //ex)10시45분 10+45 => 1045(string이기때문)
//			int endTime = Integer.parseInt(time);
//			
//			int runningTime = ticketListDto.getRunning_time();	
//			
//			endTime = endTime + ((runningTime/60)*100) + (runningTime-((runningTime/60)*60));
//			if(endTime%100 >= 60) {
//				System.out.println(endTime%100);
//				endTime -=60; //60분초과시삭제 후
//				endTime +=100; //1시간추가
//			}
//			
//			Map<String, Object> timeMap = new LinkedHashMap<String, Object>();
//			// LinkedHashMap  HashMap 의 순서를 유지한다.
//			
//			timeMap.put("year", year);
//			timeMap.put("month", month);
//			timeMap.put("day", day);
//			timeMap.put("hour", hour);
//			timeMap.put("minute", minute);
//			timeMap.put("endTime", endTime);
//			
//			System.out.println("year : "+ year);
//			System.out.println("day"+ day);
//			System.out.println("hour"+ hour);
//			System.out.println("minute"+ minute);
//			System.out.println("endTime"+  endTime);
//			
//			timeListMap.add(timeMap);
//		}
			
			for (Map<String, Object> timeMaplist : timeListMap) {
				System.out.println(timeMaplist.get("day"));
				System.out.println(timeMaplist.get("endTime"));
			}
		
			model.addAttribute("tickettime",timeListMap);
	
		return "ticket/ticket";
	}
	
	
	
	
	/*좌석예매란*/
	@RequestMapping("/ticketseat")
	public String tSeat(HttpServletRequest request, Model model) {
		
		
		
		return "ticket/ticketseat";
		
		
	}
	
	/*예매란 배너*/
		@RequestMapping("/ticketbuy")
		public String bTicket(HttpServletRequest request, Model model) {
			
			
			
			return "ticket/ticketbuy";
		
	}
	
	
	
}
