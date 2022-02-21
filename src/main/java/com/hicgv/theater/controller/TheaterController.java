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

import com.hicgv.theater.dao.TheaterDao;
import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;
import com.hicgv.theater.dto.TimeInfoDto;

@Controller
public class TheaterController {

   @Autowired
   private SqlSession sqlSession;

   @RequestMapping("/theater")
   public String getTheaterInfo(HttpServletRequest request, Model model) {
      System.out.println("======= << theater >> =======");

      String theaterid = request.getParameter("theaterid");
      String locid = request.getParameter("locid");

      System.out.println("theaterid : " + theaterid);
      System.out.println("locid : " + locid);

      if (theaterid == null)
         theaterid = "1";
      if (locid == null)
         locid = "101";

      System.out.println("theaterid2 : " + theaterid);
      System.out.println("locid2 : " + locid);

      TheaterDao dao = sqlSession.getMapper(TheaterDao.class);

      // 다른 Dto랑 헷갈리지 말 것!(MoviesDto,MoviesInfoDto 잘 확인하고 적기)
      ArrayList<MoviesInfoDto> list=dao.getMoviesInfo(locid);
      
      for (MoviesInfoDto moviesinfo : list) {
         System.out.println("연령제한 : "+moviesinfo.getAge_limit());
      }
      
      LocationDto loc =new LocationDto();
      loc = dao.getLocationInfo(locid);
      System.out.println(loc.getLocation_add());
      
      model.addAttribute("theater", dao.getTheaterInfo());
      model.addAttribute("img" , dao.getImg(locid));
      model.addAttribute("movieinfo",dao.getMoviesInfo(locid));
      model.addAttribute("locinfo",dao.getLocationInfo(locid));
      
      return "theater/theater";

   }
   
   @RequestMapping("/timeSelect")
   public String timeSelect(HttpServletRequest request, Model model) {
	   System.out.println("======= << timeSelect >> =======");
	   String locid = request.getParameter("locid");
	   
	   System.out.println("locid : " + locid);
	   
	   TheaterDao dao = sqlSession.getMapper(TheaterDao.class);
	   
	   ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();
	   
	   ArrayList<TimeInfoDto> tList=dao.getTime(locid);
	   String year="";
	   String month="";
	   String day="";
	   String hour="";
	   String minute="";
	   
	   for (TimeInfoDto timeInfoDto : tList) {
		
		// 연, 월, 일, 시, 분 추출
		String startTime=timeInfoDto.getStart_date();
		System.out.println("startTime : "+startTime);
		year=startTime.substring(0,4);
		month=startTime.substring(5,7);
		day=startTime.substring(8,10);
		hour=startTime.substring(11,13);
		minute=startTime.substring(14,16);
		
		// 상영 종료시간 계산
		String time = hour + minute;
		int endTime = Integer.parseInt(time);

		int runningTime = timeInfoDto.getRunning_time();		

		endTime = endTime + ((runningTime/60)*100) + (runningTime-((runningTime/60)*60));
		if(endTime%100 >= 60) {
			System.out.println(endTime%100);
			endTime -=60;
			endTime +=100;
		}
		
		Map<String, Object> timeMap = new LinkedHashMap<String, Object>();
		
		timeMap.put("year", year);
		timeMap.put("month", month);
		timeMap.put("day", day);
		timeMap.put("hour", hour);
		timeMap.put("minute", minute);
		timeMap.put("time", time);
		timeMap.put("endTime",  endTime);
		
		System.out.println("year : "+ year);
		System.out.println("day"+ day);
		System.out.println("hour"+ hour);
		System.out.println("minute"+ minute);
		System.out.println("time"+ time);
		System.out.println("endTime"+  endTime);
		
		timeListMap.add(timeMap);
		
	}
	   for (Map<String, Object> tempMap : timeListMap) {
			System.out.println(tempMap.get("year"));
			System.out.println(tempMap.get("numTime"));
			
		}
	   
	   ArrayList<MoviesInfoDto> mList=dao.getMoviesInfo(locid);
	   
	   model.addAttribute("timeList",timeListMap);
	   model.addAttribute("movieInfo",mList);
	   
	   return "theater/theater";
   }
   
   @RequestMapping("theaterAdmin")
   public String theaterAdmin() {
	   System.out.println("======= << theaterAdmin >> =======");
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
   @ResponseBody
   public String theaterTimeList(HttpServletRequest request, Model model, @RequestParam String date) {
	   System.out.println("======= << theaterTimeList >> =======");
	   String theaterid = request.getParameter("theaterid");
	   String locid = request.getParameter("locid");
	   System.out.println("date : "+date);
	   
	      if (theaterid == null)
	         theaterid = "1";
	      if (locid == null)
	         locid = "101";

	      TheaterDao dao = sqlSession.getMapper(TheaterDao.class);
	      
	      model.addAttribute("theater", dao.getTheaterInfo());
	      model.addAttribute("img" , dao.getImg(locid));
	      model.addAttribute("movieinfo",dao.getMoviesInfo(locid));
	      model.addAttribute("locinfo",dao.getLocationInfo(locid));
	     
		   ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();
		   
		   ArrayList<TimeInfoDto> tList=dao.getTime(locid);
		   String year="";
		   String month="";
		   String day="";
		   String hour="";
		   String minute="";
		   String startTime="";
		   
		   for (TimeInfoDto timeInfoDto : tList) {
			
			// 연, 월, 일, 시, 분 추출
			startTime=timeInfoDto.getStart_date();
			System.out.println("startTime : "+startTime);
			year=startTime.substring(0,4);
			month=startTime.substring(5,7);
			day=startTime.substring(8,10);
			hour=startTime.substring(11,13);
			minute=startTime.substring(14,16);
			
			// 상영 종료시간 계산
			String time = hour + minute;
			int endTime = Integer.parseInt(time);

			int runningTime = timeInfoDto.getRunning_time();		

			endTime = endTime + ((runningTime/60)*100) + (runningTime-((runningTime/60)*60));
			if(endTime%100 >= 60) {
				System.out.println(endTime%100);
				endTime -=60;
				endTime +=100;
			}
			
			Map<String, Object> timeMap = new LinkedHashMap<String, Object>();
			
			timeMap.put("year", year);
			timeMap.put("month", month);
			timeMap.put("day", day);
			timeMap.put("hour", hour);
			timeMap.put("minute", minute);
			timeMap.put("time", time);
			timeMap.put("endTime",  endTime);
			
			timeListMap.add(timeMap);
			
		}
		   ArrayList<MoviesInfoDto> mList=dao.getMoviesInfo(locid);
		   
		   TimeInfoDto tDto=new TimeInfoDto();
		   String nowDate=year+month+day;
		   System.out.println("nowDate : "+nowDate);
		  
		   
		   if (date.equals("20220215")) {
			   model.addAttribute("timeList1",timeListMap);
		} else if (date.equals("20220216")) {
			model.addAttribute("timeList12",timeListMap);
			
		} else if (date.equals("20220217")) {
			model.addAttribute("timeList3",timeListMap);
			
		}
		  
		   model.addAttribute("nowDate",nowDate);
		   model.addAttribute("movieInfo",mList);
	   
	   return "";
   }
   

}