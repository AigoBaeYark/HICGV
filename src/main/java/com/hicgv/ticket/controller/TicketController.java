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

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.ticket.dao.TicketDao;
import com.hicgv.ticket.dto.TicketListDto;

@Controller
public class TicketController {

	@Autowired
	private SqlSession sqlSession;
	
	/*예매파트란*/
	@RequestMapping("/ticket")
	public String ticket(HttpServletRequest request, Model model) {
		System.out.println("========= < pass by ticket() > =========");
		
		//파라미터 받을때 null값이면 다른값으로 처리
		String movieid = request.getParameter("movieid");
		String theaterid = request.getParameter("theaterid");
		String locid = request.getParameter("locid");
		
		System.out.println("theaterid : " + movieid);
		System.out.println("theaterid : " + theaterid);
		System.out.println("locid : " + locid);
		
<<<<<<< HEAD
		/*1.영화선택*/
		TicketDao dao=sqlSession.getMapper(TicketDao.class);
		ArrayList<MoviesDto> ticket=dao.ticket();
		model.addAttribute("ticket", ticket);
		
		/*2.지역선택*/
		//2-1.지역(도별)
		ArrayList<TheaterDto> biglocal=dao.biglocal();
		for (TheaterDto theaterDto : biglocal) {
			System.out.println("theid : "+theaterDto.getTheater_id());
=======
		if (movieid == null)
			movieid = "20223278"; //극장판주술회전 (가나다 순 중 젤 위)
		if (theaterid == null)
	        theaterid = "1"; //서울코드 (지역순)
	    if (locid == null)
	        locid = "101"; //서울 강남 (가나다 순 젤 위)
	      
		
		/*1.영화선택*/
		TicketDao dao=sqlSession.getMapper(TicketDao.class);
		ArrayList<MoviesDto> ticketmovie=dao.ticket();
		model.addAttribute("ticketmovie", ticketmovie);
		
		/*TicketDao dao=sqlSession.getMapper(TicketDao.class);
		ArrayList<TicketListDto> ticketmovie=dao.ticketmovie();
		ArrayList<TicketListDto> ticketmovie=dao.ticketmovie(movieid);
		model.addAttribute("ticketmovie", ticketmovie);
		*/
		/*2.지역선택*/
		//2-1.지역(도별)
		ArrayList<TicketListDto> tickettheater1=dao.tickettheater1(movieid, theaterid);
		for (TicketListDto ticketListDto : tickettheater1) {
			System.out.println("theid1 : "+ticketListDto.getTheater_id());
>>>>>>> baaf7481cd591224e72cf7bb02f301e56a50b2c6
		}
		model.addAttribute("tickettheater1", tickettheater1);
		/*@@모델을 안 써서 값이 안 나왔음*/
		
		//2-2.영화관
<<<<<<< HEAD
		ArrayList<TLocationDto> local=dao.local();
		for (TLocationDto tLocationDto : local) {
			System.out.println("loc : " + tLocationDto.getLocation_id());
=======
		ArrayList<TicketListDto> tickettheater2=dao.tickettheater2(movieid, theaterid, locid);
		for (TicketListDto ticketListDto : tickettheater2) {
			System.out.println("theid2 : " + ticketListDto.getLocation_id());
>>>>>>> baaf7481cd591224e72cf7bb02f301e56a50b2c6
		}
		model.addAttribute("tickettheater2", tickettheater2);
		
<<<<<<< HEAD
		//4. 시간선택 (종료시간구하는건 아래 메소드에)
		ArrayList<TTimeDto> time=dao.time();
		for (TTimeDto tTimeDto : time) {
			System.out.println("time : " + tTimeDto.getStart_date());
		}
=======
>>>>>>> baaf7481cd591224e72cf7bb02f301e56a50b2c6
		
		
		return "ticket/ticket";
		
	}

<<<<<<< HEAD
	/*3.영화 상영날짜, 4.영화 종료시간*/
	/*날짜시간 세분화 및 상영종료 시간 구하기*/
	@RequestMapping("/tictimeSelect")
	public String timeSelect(HttpServletRequest request, Model model) {
		System.out.println("======= < pass by timeSelect() > =======");
		
		//request.getParameter(" "); 영화날짜만 받아오기
=======
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
>>>>>>> baaf7481cd591224e72cf7bb02f301e56a50b2c6
		
		TicketDao dao = sqlSession.getMapper(TicketDao.class);
		
		ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();
		
<<<<<<< HEAD
		ArrayList<TimeInfoDto> tList=dao.gettictime(); //괄호안에 다가 날짜 쓸 예정
=======
		ArrayList<TicketListDto> ticketday=dao.ticketday(movieid, theaterid, locid, tday); //괄호안에 다가 날짜 쓸 예정
>>>>>>> baaf7481cd591224e72cf7bb02f301e56a50b2c6
		String year="";
		String month="";
		String day="";
		String hour="";
		String minute="";
		
		for (TicketListDto ticketListDto : ticketday) {
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
			
<<<<<<< HEAD
			int runningTime = timeInfoDto.getRunning_time();	
=======
			int runningTime = ticketListDto.getRunning_time();	
>>>>>>> baaf7481cd591224e72cf7bb02f301e56a50b2c6
			
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
		
<<<<<<< HEAD
			model.addAttribute("ttimeList",timeListMap);
=======
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
		
		TicketDao dao = sqlSession.getMapper(TicketDao.class);
>>>>>>> baaf7481cd591224e72cf7bb02f301e56a50b2c6
		
		ArrayList<Map<String, Object>> timeListMap = new ArrayList<Map<String, Object>>();
		
		ArrayList<TicketListDto> tickettiem=dao.tickettime(movieid, theaterid, locid, tday, starttime); //괄호안에 다가 날짜 쓸 예정
		String year="";
		String month="";
		String day="";
		String hour="";
		String minute="";
		
		for (TicketListDto ticketListDto : tickettiem) {
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
			
			for (Map<String, Object> timeMaplist : timeListMap) {
				System.out.println(timeMaplist.get("day"));
				System.out.println(timeMaplist.get("endTime"));
			}
		
<<<<<<< HEAD
		return "ticket/ticket";
		
	}
=======
			model.addAttribute("tickettime",timeListMap);
	
		return "ticket/ticket";
	}
	
	
>>>>>>> baaf7481cd591224e72cf7bb02f301e56a50b2c6
	
	
	/*좌석예매란*/
	@RequestMapping("/seat")
	public String tSeat(HttpServletRequest request, Model model) {
		
		
		
		return "ticket/ticketseat";
		
	}
	
	
	
	/*좌석예매란*/
	@RequestMapping("/ticketseat")
	public String tSeat(HttpServletRequest request, Model model) {
		
		
		
		return "ticket/ticketseat";
		
	}
	
	
	
	
	
	
	

}
