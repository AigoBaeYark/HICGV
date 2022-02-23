package com.hicgv.theater.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hicgv.theater.dao.TheaterDao;
import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;
import com.hicgv.theater.dto.ScheduleDto;

@Controller
public class TheaterController {

   @Autowired
   private SqlSession sqlSession;

   @RequestMapping("/theater")
   public String getTheaterInfo(HttpServletRequest request, Model model) {
      System.out.println("======= << theater >> =======");

      String theaterid = request.getParameter("theaterid");
      String locid = request.getParameter("locid");

      if (theaterid == null)
         theaterid = "1";
      if (locid == null)
         locid = "101";

      System.out.println("theaterid : " + theaterid);
      System.out.println("locid : " + locid);

      TheaterDao dao = sqlSession.getMapper(TheaterDao.class);
      
      
      LocationDto loc = dao.getLocationInfo(locid);
      System.out.println(loc.getLocation_id());
      
      model.addAttribute("theater", dao.getTheaterInfo());
      model.addAttribute("img" , dao.getImg(locid));
      model.addAttribute("locinfo",dao.getLocationInfo(locid));
      
      return "theater/theater";

   }
   
   @RequestMapping("theaterAdmin")
   public String theaterAdmin(HttpServletRequest request, Model model) {
	   System.out.println("======= << theaterAdmin >> =======");
	   String locid=request.getParameter("locid");
	   String roomid=request.getParameter("roomid");
	   String movieid=request.getParameter("movieid");
	   String startdate=request.getParameter("startdate");
	   
	   if (locid==null || roomid==null || movieid==null || startdate==null) {
		
		   
	}
	   
	   System.out.println("locid : "+locid);
	   System.out.println("roomid : "+roomid);
	   System.out.println("movieid : "+movieid);
	   System.out.println("startdate : "+startdate);
	   
	   TheaterDao dao=sqlSession.getMapper(TheaterDao.class);
	   dao.setScheduleInfo(movieid, locid, roomid, startdate);
	   
	   return "theater/theaterAdmin";
   }

   
   @RequestMapping("theaterList")
   public String schedule(HttpServletRequest request, Model model) {
	   System.out.println("======= << theaterList >> =======");
	   String movieid=request.getParameter("movie_id");
	   String roomid=request.getParameter("theater_room_id");
	   String locationid=request.getParameter("location_id");
	   String startdate=request.getParameter("start_date");
	   
	   System.out.println("movieid : "+movieid);
	   System.out.println("roomid : "+roomid);
	   System.out.println("locationid : "+locationid);
	   System.out.println("startdate : "+startdate);
	   
	   /*TheaterDao dao=sqlSession.getMapper(TheaterDao.class);
	   dao.getAllMoviesInfo();*/
	   
	   
	   return "theater/theaterList";
   }
   
   
   @RequestMapping(value="theaterTimeList" , produces = "application/text; charset=utf8")
   public ModelAndView theaterTimeList(HttpServletRequest request, Model model) {
	   System.out.println("======= << theaterTimeList >> =======");
	   String theaterid = request.getParameter("theaterid");
	   String locid = request.getParameter("locid");
	   String date=request.getParameter("date");
	   
	   System.out.println("date : "+date);
	   
	      if (theaterid == null)
	         theaterid = "1";
	      if (locid == null)
	         locid = "101";

	   System.out.println("theaterid : "+theaterid);
	   System.out.println("locid : "+locid);
	   
	      TheaterDao dao = sqlSession.getMapper(TheaterDao.class);
	  
		   ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();
		   
		   ArrayList<MoviesInfoDto> mList=dao.getMoviesInfo(theaterid, locid, date);
		   
		   String year="";
		   String month="";
		   String day="";
		   String hour="";
		   String minute="";
		   String startTime="";
		   
		   for (MoviesInfoDto moviesInfoDto : mList) {
			
			// 연, 월, 일, 시, 분 추출
			startTime=moviesInfoDto.getStart_date();
			year=startTime.substring(0,4);
			month=startTime.substring(5,7);
			day=startTime.substring(8,10);
			hour=startTime.substring(11,13);
			minute=startTime.substring(14,16);
			System.out.println("startTime : "+startTime);
			
			// 상영 종료시간 계산
			String time = hour + minute;
			int endTime = Integer.parseInt(time);

			int runningTime = moviesInfoDto.getRunning_time();		

			endTime = endTime + ((runningTime/60)*100) + (runningTime-((runningTime/60)*60));
			if(endTime%100 >= 60) {
				System.out.println(endTime%100);
				endTime -=60;
				endTime +=100;
			}
			String endHour=Integer.toString(endTime).substring(0,2);
			String endMinute=Integer.toString(endTime).substring(2,4);
			
			System.out.println("연령제한 : "+moviesInfoDto.getAge_limit());
			
			 /*for (Map<String, Object> tempMap : timeListMap) {
					System.out.println(tempMap.get("year"));
					System.out.println(tempMap.get("endTime"));
				}*/
			
			Map<String, Object> timeMap = new LinkedHashMap<String, Object>();
			
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
		   
		   
		   ModelAndView mv = new ModelAndView();
		   mv.addObject("movieInfo",timeListMap);
		   mv.setViewName("theater/schList");
	   
	   return mv;
   }

}