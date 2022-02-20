package com.hicgv.ticket.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
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
		
		/*1.영화선택*/
		TicketDao dao=sqlSession.getMapper(TicketDao.class);
		ArrayList<MoviesDto> ticket=dao.ticket();
		model.addAttribute("ticket", ticket);
		
		/*2.지역선택*/
		//2-1.지역(도별)
		ArrayList<TheaterDto> biglocal=dao.biglocal();
		for (TheaterDto theaterDto : biglocal) {
			System.out.println("theid : "+theaterDto.getTheater_id());
		}
		model.addAttribute("biglocal", biglocal);
		/*@@모델을 안 써서 값이 안 나왔음*/
		
		//2-2.영화관
		ArrayList<TLocationDto> local=dao.local();
		for (TLocationDto tLocationDto : local) {
			System.out.println("loc : " + tLocationDto.getLocation_id());
		}
		model.addAttribute("local", local);
		
		//4. 시간선택 (종료시간구하는건 아래 메소드에)
		ArrayList<TTimeDto> time=dao.time();
		for (TTimeDto tTimeDto : time) {
			System.out.println("time : " + tTimeDto.getStart_date());
		}
		
		model.addAttribute("time", time);
		
		return "ticket/ticket";
		
	}

	/*3.영화 상영날짜, 4.영화 종료시간*/
	/*날짜시간 세분화 및 상영종료 시간 구하기*/
	@RequestMapping("/tictimeSelect")
	public String timeSelect(HttpServletRequest request, Model model) {
		System.out.println("======= < pass by timeSelect() > =======");
		
		//request.getParameter(" "); 영화날짜만 받아오기
		
		TicketDao dao = sqlSession.getMapper(TicketDao.class);
		
		ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();
		
		ArrayList<TimeInfoDto> tList=dao.gettictime(); //괄호안에 다가 날짜 쓸 예정
		String year="";
		String month="";
		String day="";
		String hour="";
		String minute="";
		
		for (TimeInfoDto timeInfoDto : tList) {
			String startTime=timeInfoDto.getStart_date();
			System.out.println("startTime : "+startTime);
			
			//연 월 일 시 분 나누기(영화 예매 날짜 및 종료날짜를 구하기 위해)
			//year=startTime.substring(beginIndex, endIndex)
			year=startTime.substring(0, 4);
			month=startTime.substring(5,7);
			day=startTime.substring(8,10);
			hour=startTime.substring(11,13);
			minute=startTime.substring(14,16);
			
			// 상영 종료시간 계산
			String time = hour + minute; //ex)10시45분 10+45 => 1045(string이기때문)
			int endTime = Integer.parseInt(time);
			
			int runningTime = timeInfoDto.getRunning_time();	
			
			endTime = endTime + ((runningTime/60)*100) + (runningTime-((runningTime/60)*60));
			if(endTime%100 >= 60) {
				System.out.println(endTime%100);
				endTime -=60; //60분초과시삭제 후
				endTime +=100; //1시간추가
			}
			
			Map<String, Object> timeMap = new LinkedHashMap<String, Object>();
			// LinkedHashMap  HashMap 의 순서를 유지한다.
			
			timeMap.put("year", year);
			timeMap.put("month", month);
			timeMap.put("day", day);
			timeMap.put("hour", hour);
			timeMap.put("minute", minute);
			timeMap.put("endTime", endTime);
			
			System.out.println("year : "+ year);
			System.out.println("day"+ day);
			System.out.println("hour"+ hour);
			System.out.println("minute"+ minute);
			System.out.println("endTime"+  endTime);
			
			timeListMap.add(timeMap);
		}
			
			for (Map<String, Object> timeMaplist : timeListMap) {
				System.out.println(timeMaplist.get("day"));
				System.out.println(timeMaplist.get("endTime"));
			}
		
			model.addAttribute("ttimeList",timeListMap);
		
		
		
		
		return "ticket/ticket";
		
	}
	
	
	/*좌석예매란*/
	@RequestMapping("/seat")
	public String tSeat(HttpServletRequest request, Model model) {
		
		
		
		return "ticket/ticketseat";
		
	}
	
	
	
	
	
	
	

}
