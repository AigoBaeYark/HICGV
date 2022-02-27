package com.hicgv.theater.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.theater.dao.TheaterDao;
import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;
import com.hicgv.theater.dto.ScheduleDto;

@Service
public class TheaterServiceImpl implements TheaterService {

	@Inject
	TheaterDao dao;

	@Override
	public ArrayList<LocationDto> getTheaterInfo() {
		return dao.getTheaterInfo();
	}

	@Override
	public String getImg(String locId) {
		return dao.getImg(locId);
	}

	@Override
	public ArrayList<Map<String, Object>> getMoviesInfo(String theaterId, String locationId, String startDate) {
		String year = "";
		String month = "";
		String day = "";
		String hour = "";
		String minute = "";
		String selectDate = "";
		ArrayList<MoviesInfoDto> mList = dao.getMoviesInfo(theaterId, locationId, startDate);
		ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();

		for (MoviesInfoDto moviesInfoDto : mList) {

			// 연, 월, 일, 시, 분 추출
			selectDate = moviesInfoDto.getStart_date();
			year = selectDate.substring(0, 4);
			month = selectDate.substring(5, 7);
			day = selectDate.substring(8, 10);
			hour = selectDate.substring(11, 13);
			minute = selectDate.substring(14, 16);
			System.out.println("startTime : " + selectDate);

			// 상영 종료시간 계산
			String time = hour + minute;
			int endTime = Integer.parseInt(time);

			int runningTime = moviesInfoDto.getRunning_time();

			endTime = endTime + ((runningTime / 60) * 100) + (runningTime - ((runningTime / 60) * 60));
			if (endTime % 100 >= 60) {
				System.out.println(endTime % 100);
				endTime -= 60;
				endTime += 100;
			}
			String endHour = Integer.toString(endTime).substring(0, 2);
			String endMinute = Integer.toString(endTime).substring(2, 4);

			System.out.println("연령제한 : " + moviesInfoDto.getAge_limit());

			/*
			 * for (Map<String, Object> tempMap : timeListMap) {
			 * System.out.println(tempMap.get("year"));
			 * System.out.println(tempMap.get("endTime")); }
			 */

			Map<String, Object> timeMap = new LinkedHashMap<String, Object>();

			System.out.println(year);
			System.out.println(month);
			System.out.println(day);
			System.out.println(hour);
			System.out.println(minute);
			timeMap.put("year", year);
			timeMap.put("month", month);
			timeMap.put("day", day);
			timeMap.put("hour", hour);
			timeMap.put("minute", minute);
			timeMap.put("endHour", endHour);
			timeMap.put("endMinute", endMinute);
			timeMap.put("age_limit", moviesInfoDto.getAge_limit());
			timeMap.put("title_kor", moviesInfoDto.getTitle_kor());
			timeMap.put("genre", moviesInfoDto.getGenre());
			timeMap.put("running_time", moviesInfoDto.getRunning_time());
			timeMap.put("opening_date", moviesInfoDto.getOpening_date());
			timeMap.put("room_name", moviesInfoDto.getRoom_name());
			timeMap.put("max_seat", moviesInfoDto.getMax_seat());
			timeMap.put("movie_id", moviesInfoDto.getMovie_id());

			timeListMap.add(timeMap);
		}

		return timeListMap;
	}

	@Override
	public LocationDto getLocationInfo(String locId) {
		return dao.getLocationInfo(locId);
	}

	@Override
	public void setScheduleInfo(ScheduleDto schedultDto) {
		dao.setScheduleInfo(schedultDto);
	}

	@Override
	public MoviesInfoDto getMoviesList(String movieId) {
		return dao.getMoviesList(movieId);
	}

	@Override
	public ArrayList<ScheduleDto> getScheduleDate() {
		return 	dao.getScheduleDate();

	}

	

}
