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
		ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();

		ArrayList<TicketListDto> requestList = dao.getTicketday(sendDataMap);

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

			// 상영 종료시간 계산
			String time = hour + minute; // ex)10시45분 10+45 => 1045(string이기때문)
			int endTime = Integer.parseInt(time);

			int runningTime = ticketListDto.getRunning_time();

			endTime = endTime + ((runningTime / 60) * 100) + (runningTime - ((runningTime / 60) * 60));
			if (endTime % 100 >= 60) {
				System.out.println(endTime % 100);
				endTime -= 60; // 60분초과시삭제 후
				endTime += 100; // 1시간추가
			}

			String endHour = Integer.toString(endTime).substring(0, 2);
			String endMinute = Integer.toString(endTime).substring(2, 4);

			Map<String, Object> timeMap = new LinkedHashMap<String, Object>();
			// LinkedHashMap HashMap 의 순서를 유지한다.

			timeMap.put("year", year);
			timeMap.put("month", month);
			timeMap.put("day", day);
			timeMap.put("hour", hour);
			timeMap.put("minute", minute);
			timeMap.put("endTime", endTime);
			

			timeMap.put("room_name", ticketListDto.getRoom_name()); // 'n'관
			timeMap.put("location_name", ticketListDto.getLocation_name()); // 상영관이름
			timeMap.put("max_seat", ticketListDto.getMax_seat()); // 좌석수
			timeMap.put("running_time", ticketListDto.getRunning_time()); // 러닝타임
			timeMap.put("movie_id", ticketListDto.getMovie_id());	//영화 ID

			System.out.println("year : " + year);
			System.out.println("month : " + month);
			System.out.println("day : " + day);
			System.out.println("hour : " + hour);
			System.out.println("minute : " + minute);
			System.out.println("endTime : " + endTime);
			System.out.println("room_name : " + ticketListDto.getRoom_name());
			System.out.println("location_name : " + ticketListDto.getLocation_name());
			System.out.println("max_seat : " + ticketListDto.getMax_seat());
			System.out.println("running_time : " + ticketListDto.getRunning_time());
			System.out.println("movie_id : " + ticketListDto.getMovie_id());

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
			System.out.println("startTime : " + startTime);

			// 연 월 일 시 분 나누기(영화 예매 날짜 및 종료날짜를 구하기 위해)
			// year=startTime.substring(beginIndex, endIndex)
			year = startTime.substring(0, 4);
			month = startTime.substring(5, 7);
			day = startTime.substring(8, 10);
			hour = startTime.substring(11, 13);
			minute = startTime.substring(14, 16);

			// 상영 종료시간 계산
			String time = hour + minute; // ex)10시45분 10+45 => 1045(string이기때문)
			int endTime = Integer.parseInt(time);

			int runningTime = ticketListDto.getRunning_time();

			endTime = endTime + ((runningTime / 60) * 100) + (runningTime - ((runningTime / 60) * 60));
			if (endTime % 100 >= 60) {
				System.out.println(endTime % 100);
				endTime -= 60; // 60분초과시삭제 후
				endTime += 100; // 1시간추가
			}

			String endHour = Integer.toString(endTime).substring(0, 2);
			String endMinute = Integer.toString(endTime).substring(2, 4);

			Map<String, Object> timeMap2 = new LinkedHashMap<String, Object>();
			// LinkedHashMap HashMap 의 순서를 유지한다.

			timeMap2.put("year", year);
			timeMap2.put("month", month);
			timeMap2.put("day", day);
			timeMap2.put("hour", hour);
			timeMap2.put("minute", minute);
			timeMap2.put("endTime", endTime);
			timeMap2.put("endHour", endHour);
			timeMap2.put("endMinute", endMinute);
			

			timeMap2.put("room_name", ticketListDto.getRoom_name()); // 'n'관
			timeMap2.put("location_name", ticketListDto.getLocation_name()); // 상영관이름
			timeMap2.put("max_seat", ticketListDto.getMax_seat()); // 좌석수
			timeMap2.put("running_time", ticketListDto.getRunning_time()); // 러닝타임

			System.out.println("year2 : " + year);
			System.out.println("month2 : " + month);
			System.out.println("day2 : " + day);
			System.out.println("hour2 : " + hour);
			System.out.println("minute2 : " + minute);
			System.out.println("endTime2 : " + endTime);
			System.out.println("endHour2 : " + endHour);
			System.out.println("endMinute2 : " + endMinute);
			
			System.out.println("room_name2 : " + ticketListDto.getRoom_name());
			System.out.println("location_name2 : " + ticketListDto.getLocation_name());
			System.out.println("max_seat2 : " + ticketListDto.getMax_seat());
			System.out.println("running_time2 : " + ticketListDto.getRunning_time());

			timeListMap.add(timeMap2);

		}
		return timeListMap;
	}
}
