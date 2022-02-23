package com.hicgv.ticket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.theater.dto.TheaterDto;
import com.hicgv.ticket.dao.TicketDao;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TicketListDto;

@Service
public class TicketServiceImpl implements TicketService{

	@Inject
	TicketDao dao;
	
	@Override
	public ArrayList<MoviesDto> getMoviesList() {
		
		return dao.ticket();
	}

	@Override
	public ArrayList<TheaterDto> getLocal() {
		
		return dao.getLocal();
	}

	@Override
	public ArrayList<TLocationDto> getTheaterLocal() {
		
		return dao.getTheaterLocal();
	}

	@Override
	public ArrayList<Map<String, Object>> getSelectTime(Map<String, String> sendDataMap) {
	
		ArrayList<Map<String, Object>> timeListMap =  new ArrayList<Map<String, Object>>();
		
		ArrayList<TicketListDto> requestList = dao.ticketday(sendDataMap);
		for (TicketListDto ticketListDto : requestList) {
			System.out.println("시간 : "+ticketListDto.getDay());
		}
		
		String year="";
		String month="";
		String day="";
		String hour="";
		String minute="";
		
		for (TicketListDto ticketListDto : requestList) {
			String startTime=ticketListDto.getStart_date();
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
			
			int runningTime = ticketListDto.getRunning_time();	
			
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
		
		return timeListMap;
	}

}
