package com.hicgv.ticket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.pay.dto.PayDto;
import com.hicgv.theater.dto.TheaterDto;
import com.hicgv.ticket.dao.TicketDao;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TicketListDto;

@Service
public class TicketServiceImpl implements TicketService {

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
	public ArrayList<Map<String, Object>> getSelectDate(HashMap<String, String> sendDataMap) {

		System.out.println("getSelectDate(serviceImpl) : " + sendDataMap.get("movieid"));
		System.out.println("getSelectDate2(serviceImpl) : " + sendDataMap.get("theaterid"));
		ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();

		ArrayList<TicketListDto> requestList = dao.getSelectDate(sendDataMap);

		String year = "";
		String month = "";
		String day = "";
		String hour = "";
		String minute = "";

		for (TicketListDto ticketListDto : requestList) {
			String startTime = ticketListDto.getStart_date();
			System.out.println("startTime : " + startTime);

			// 연 월 일 시 분 나누기(영화 예매 날짜 및 종료날짜를 구하기 위해)
			// year=startTime.substring(beginIndex, endIndex)
			year = startTime.substring(0, 4);
			month = startTime.substring(5, 7);
			day = startTime.substring(8, 10);
			hour = startTime.substring(11, 13);
			minute = startTime.substring(14, 16);

			Map<String, Object> timeMap = new LinkedHashMap<String, Object>();
			// LinkedHashMap HashMap 의 순서를 유지한다.

			timeMap.put("year", year);
			timeMap.put("month", month);
			timeMap.put("day", day);
			timeMap.put("hour", hour);
			timeMap.put("minute", minute);
			
			timeMap.put("room_name", ticketListDto.getRoom_name()); 
			timeMap.put("location_name", ticketListDto.getLocation_name()); 
			timeMap.put("location_id", ticketListDto.getLocation_id()); 
			timeMap.put("theater_id", ticketListDto.getTheater_id()); 
			timeMap.put("max_seat", ticketListDto.getMax_seat()); 
			timeMap.put("running_time", ticketListDto.getRunning_time()); 
			timeMap.put("movie_id", ticketListDto.getMovie_id());	
			timeMap.put("schedule_id", ticketListDto.getTheater_schedule_id());

			timeListMap.add(timeMap);
		}

		return timeListMap;
	}

	@Override
	public ArrayList<Map<String, Object>> getSelectMovieInfo(HashMap<String, String> sendDataMap) {

		System.out.println("getSelectMovieInfo(serviceImpl) : " + sendDataMap.get("movieid"));
		ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();

		ArrayList<TicketListDto> requestList = dao.getSelectMovieInfo(sendDataMap);

		String year = "";
		String month = "";
		String day = "";
		String hour = "";
		String minute = "";

		for (TicketListDto ticketListDto : requestList) {
			String startTime = ticketListDto.getStart_date();

			year = startTime.substring(0, 4);
			month = startTime.substring(5, 7);
			day = startTime.substring(8, 10);
			hour = startTime.substring(11, 13);
			minute = startTime.substring(14, 16);

			// 상영 종료시간 계산
			String time = hour + minute; 
			int endTime = Integer.parseInt(time);

			int runningTime = ticketListDto.getRunning_time();

			endTime = endTime + ((runningTime / 60) * 100) + (runningTime - ((runningTime / 60) * 60));
			if (endTime % 100 >= 60) {
				System.out.println(endTime % 100);
				endTime -= 60; 
				endTime += 100; 
			}

			String endHour = Integer.toString(endTime).substring(0, 2);
			String endMinute = Integer.toString(endTime).substring(2, 4);

			Map<String, Object> timeMapSeat = new LinkedHashMap<String, Object>();

			timeMapSeat.put("year", year);
			timeMapSeat.put("month", month);
			timeMapSeat.put("day", day);
			timeMapSeat.put("hour", hour);
			timeMapSeat.put("minute", minute);
			timeMapSeat.put("endTime", endTime);
			timeMapSeat.put("endHour", endHour);
			timeMapSeat.put("endMinute", endMinute);
			
			timeMapSeat.put("start_date",ticketListDto.getStart_date()); 
			timeMapSeat.put("room_name", ticketListDto.getRoom_name()); 
			timeMapSeat.put("location_name", ticketListDto.getLocation_name()); 
			timeMapSeat.put("location_id", ticketListDto.getLocation_id()); 
			timeMapSeat.put("max_seat", ticketListDto.getMax_seat()); 
			timeMapSeat.put("theater_id", ticketListDto.getTheater_id()); 
			timeMapSeat.put("running_time", ticketListDto.getRunning_time()); 
			timeMapSeat.put("movie_id", ticketListDto.getMovie_id()); 
			timeMapSeat.put("title_kor", ticketListDto.getTitle_kor()); 
			timeMapSeat.put("schedule_id", ticketListDto.getTheater_schedule_id()); 
			timeMapSeat.put("tday", ticketListDto.getDay()); 
			timeMapSeat.put("room_name", ticketListDto.getRoom_name()); 

			timeListMap.add(timeMapSeat);

		}
		return timeListMap;
	}

	@Override
	public List<PayDto> getSeat(String schedule_id) {
		
		
		
		return dao.getSeat(schedule_id);
	}
}
