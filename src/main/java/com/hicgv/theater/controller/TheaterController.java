package com.hicgv.theater.controller;

import java.text.ParseException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.theater.dao.TheaterDao;
import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;
import com.hicgv.theater.dto.ScheduleDto;
import com.hicgv.theater.service.TheaterService;

@Controller
public class TheaterController {

	@Autowired
	private TheaterService theaterService;

	@RequestMapping("/theater")
	public String getTheaterInfo(HttpServletRequest request, Model model) {
		System.out.println("======= << theater >> =======");

		String theaterId = request.getParameter("theaterId");
		String locId = request.getParameter("locId");

		if (theaterId == null)
			theaterId = "1";
		if (locId == null)
			locId = "101";

		System.out.println("theaterId : " + theaterId);
		System.out.println("locId : " + locId);
		
		ArrayList<ScheduleDto> schDto = new ArrayList<ScheduleDto>();
		schDto = theaterService.getScheduleDate();
		LinkedList<HashMap<String, Object>> schMapList = new LinkedList<HashMap<String,Object>>();
		
		
		for (int i = 0; i < schDto.size(); i++) {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			String year =schDto.get(i).getStart_date().substring(0, 4);
			String month =schDto.get(i).getStart_date().substring(4, 6);
			String day =schDto.get(i).getStart_date().substring(6, 8);
			LocalDate date = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
			System.out.println("요일? " +date);
			DayOfWeek dayOfWeek = date.getDayOfWeek();
			
			System.out.println("요일?? "+dayOfWeek.getDisplayName(TextStyle.NARROW, Locale.KOREAN));
			hashMap.put("schdto", schDto);
			hashMap.put("day_kor",dayOfWeek.getDisplayName(TextStyle.NARROW, Locale.KOREAN) );
			schMapList.add(hashMap);
		}

		model.addAttribute("theater", theaterService.getTheaterInfo());
		model.addAttribute("img", theaterService.getImg(locId));
		model.addAttribute("locInfo", theaterService.getLocationInfo(locId));
		model.addAttribute("scheduleDate",theaterService.getScheduleDate());
		model.addAttribute("scheduleDate2",schMapList);
		
		return "theater/theater";

	}

	// 바로 theaterAdmin.jsp로 들어가면 input 값이 null로 들어가니까 화면전환 먼저 해줌
	@RequestMapping("/theaterAdmin")
	public String theaterAdmin(Model model) {
		System.out.println("======= << theaterAdmin >> =======");
		
		model.addAttribute("selLoc",theaterService.selLocation());
		model.addAttribute("selRoom",theaterService.selRoom());
		
		return "theater/theaterAdmin";
	}

	// theaterAdmin.jsp에서 입력한 값 DB에 INSERT
	@RequestMapping("/theaterInsertAdmin")
	public String theaterInsertAdmin(Model model, @ModelAttribute ScheduleDto schedultDto) throws ParseException {
		System.out.println("======= << theaterInsertAdmin >> =======");
		
		// @ModelAttribute를 사용했으니 아래는 쓸 필요없음 (jsp name값이랑 dto 필드이름이랑 같아야 됨)
		/*
		String locationId = request.getParameter("locationId");
		String roomId = request.getParameter("roomId");
		String movieId = request.getParameter("movieId");
		String startDate = request.getParameter("startDate");*/
		
		// input type="datetime-local" 값 중간에 T가 들어가서 " "로 바꿔줌
		
		System.out.println("locationId : " + schedultDto.getLocation_id());
		System.out.println("roomId : " +schedultDto.getTheater_room_id());
		System.out.println("movieId : " + schedultDto.getMovie_id());
		System.out.println("startDate : " + schedultDto);
		
		theaterService.setScheduleInfo(schedultDto);

		return "theater/theaterAdmin";
	}

	@ResponseBody
	@RequestMapping("/moviesList")
	public MoviesInfoDto schedule(HttpServletRequest request, Model model) {
		System.out.println("======= << moviesList >> =======");
		String movieId = request.getParameter("movie_id");

		System.out.println("movie_id : " + movieId);

		model.addAttribute("movieInfo", theaterService.getMoviesList(movieId));
		MoviesInfoDto dto = theaterService.getMoviesList(movieId);
		System.out.println(dto.getTitle_kor());

		return dto;
	}
	
	@RequestMapping(value = "theaterTimeList", produces = "application/text; charset=utf8")
	public String theaterTimeList(HttpServletRequest request, Model model) {
		System.out.println("======= << theaterTimeList >> =======");
		String theaterId = request.getParameter("theaterId");
		String locId = request.getParameter("locId");
		String date = request.getParameter("date");

		System.out.println("date : " + date);

		if (theaterId == null)
			theaterId = "1";
		if (locId == null)
			locId = "101";

		System.out.println("theaterId : " + theaterId);
		System.out.println("locId : " + locId);
		
		ArrayList<Map<String, Object>> timeListMap = theaterService.getMoviesInfo(theaterId,locId , date);
		
		for (Map<String, Object> map : timeListMap) {
			System.out.println(map.get("age_limit"));
		}

		model.addAttribute("movieInfo", timeListMap);
		
		return "theater/scheduleList";
	}

}