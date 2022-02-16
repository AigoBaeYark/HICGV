package com.hicgv.theater.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.theater.dao.TheaterDao;
import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;
import com.hicgv.theater.dto.TimeInfoDto;

@Controller
public class TheaterController {

   @Autowired
   private SqlSession sqlSession;

   @RequestMapping("/theater")
   public String theater(HttpServletRequest request, Model model) {
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
      
      model.addAttribute("theater", dao.theater());
      model.addAttribute("img" , dao.getImg(locid));
      model.addAttribute("movieinfo",dao.getMoviesInfo(locid));
      model.addAttribute("locinfo",dao.getLocationInfo(locid));
      
      return "theater/theater";

   }
   
   @RequestMapping("/timeSelect")
   public String timeSelect(HttpServletRequest request, Model model) {
	   System.out.println("======= << timeSelect >> =======");
	   String locid = request.getParameter("locid");
	   //String selectDate = request.getParameter("selectDate");
	   
	   ArrayList<Map<String, String>> timeList = new ArrayList<Map<String, String>>();
	   
	   System.out.println("locid : " + locid);
	   TheaterDao dao = sqlSession.getMapper(TheaterDao.class);
	   
	   ArrayList<TimeInfoDto> list=dao.getTime("101");
	   String year="";
	   String month="";
	   String day="";
	   String hour="";
	   String minute="";
	   
	   for (TimeInfoDto timeInfoDto : list) {
		Map<String, String> tempTimeMap = new HashMap<String, String>();
		String startTime=timeInfoDto.getStart_date();
		System.out.println("startTime : "+startTime);
		year=startTime.substring(0,4);
		month=startTime.substring(5,7);
		day=startTime.substring(8,10);
		hour=startTime.substring(11,13);
		minute=startTime.substring(14,16);
		
		
		String tempTime = hour + minute;
		int numTime = Integer.parseInt(tempTime);
		int runningTime = Integer.parseInt(timeInfoDto.getRunning_time()); // 상영 시간
		
		numTime = numTime + ((runningTime/60)*100) + (runningTime-((runningTime/60)*60));
		if(numTime%100 >= 60) {
			numTime -=60;
		}
		
		tempTimeMap.put("year", year);
		tempTimeMap.put("month", month);
		tempTimeMap.put("day", day);
		tempTimeMap.put("hour", hour);
		tempTimeMap.put("minute", minute);
		tempTimeMap.put("tempTime", tempTime);
		tempTimeMap.put("numTime",  Integer.toString(numTime));
		
		timeList.add(tempTimeMap);
		
		
		
//		System.out.println("year : "+year);
//		System.out.println("month : "+month);
//		System.out.println("day : "+day);
//		System.out.println("hour : "+hour);
//		System.out.println("minute : "+minute);
//		System.out.println("tempTime : "+tempTime);
//		System.out.println("numTime : "+numTime);
		
	}
	   for (Map<String, String> tempMap : timeList) {
			System.out.println(tempMap.get("year"));
			System.out.println(tempMap.get("numTime"));
			
		}
	   model.addAttribute("timeList",timeList);
	   return "theater/theater";
   }

}