package com.hicgv.ticket.controller;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.pay.dao.PayDao;
import com.hicgv.pay.dto.PayDto;
import com.hicgv.theater.dto.TheaterDto;
import com.hicgv.ticket.dao.TicketDao;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TicketListDto;
import com.hicgv.ticket.service.TicketService;

@Controller
public class TicketController {

	@Autowired
	TicketService ticketService;
	
	/*1. 예매파트란*/
	@RequestMapping("/ticket")
	public String ticket(HttpServletRequest request, Model model) {
		System.out.println("========= < pass by ticket() > =========");
		
		//파라미터 받을때 null값이면 다른값으로 처리
		String movieid = request.getParameter("movieid");
		String theaterid = request.getParameter("theaterid");
		//String locid = request.getParameter("locid");
		
		System.out.println("movieid : " + movieid);
		System.out.println("theaterid : " + theaterid);
		//System.out.println("locid : " + locid);
		
		if (movieid == null)
			movieid = "20223278"; //극장판주술회전 (가나다 순 중 젤 위)
		if (theaterid == null)
	        theaterid = "1"; //서울코드 (지역순)
//	    if (locid == null)
//	        locid = "101"; //서울 강남 (가나다 순 젤 위)
	    
	    System.out.println("movieid2 : " + movieid);
		System.out.println("theaterid2 : " + theaterid);
		//System.out.println("locid2 : " + locid);
		
		/*1) 영화선택*/
		model.addAttribute("moviesList", ticketService.getMoviesList());
		
		/*2)지역선택*/
		
		//2-1) 지역(도별)
		for (TheaterDto theaterDto : ticketService.getLocal()) {
			System.out.println("getLocal : "+theaterDto.getTheater_loc());
		}
		model.addAttribute("local", ticketService.getLocal());
		
		//2-2) 상영관별
		for (TLocationDto tLocationDto : ticketService.getTheaterLocal()) {
			System.out.println("getTheaterLocal : "+tLocationDto.getLocation_name());
		}
		model.addAttribute("theaterlocal", ticketService.getTheaterLocal());
	
	
		return "ticket/ticket";
		
	}

	/*4) 영화 시간선택 */
	//날짜시간 세분화 
	@RequestMapping("/getdate")
	public String getDate(HttpServletRequest request, Model model) {
		System.out.println("======= < pass by getdate() > =======");
		
		String movieid = request.getParameter("movieCd");
		String theaterid = request.getParameter("theaterId");
		String locid = request.getParameter("locId");
		String tday = request.getParameter("date");
		
		System.out.println("movieid : " + movieid);
		System.out.println("theaterid : " + theaterid);
		System.out.println("locid : " + locid);
		System.out.println("tday : " + tday);
		
		//JS로 값 받아오기 전에 임의의 값을 넣어서 test함
		/*if (movieid == null)
			movieid = "20223278"; //극장판주술회전 (가나다 순 중 젤 위)
		if (theaterid == null)
	        theaterid = "1"; //서울코드 (지역순)
	    if (locid == null)
	        locid = "101"; //서울 강남 (가나다 순 젤 위)
	    if (tday == null)
	    	tday = "16"; //16일 (주술회전 날짜 순 젤 위)
		
	    System.out.println("movieid2 : " + movieid);
		System.out.println("theaterid2 : " + theaterid);
		System.out.println("locid2 : " + locid);
		System.out.println("tday2 : " + tday);*/
		
	
		HashMap<String, String> sendDataMap = new HashMap<String, String>();
		sendDataMap.put("movieid", movieid);
		sendDataMap.put("theaterid", theaterid);
		sendDataMap.put("locid", locid);
		sendDataMap.put("tday", tday);
		
	
		/* test
		sendDataMap.put("movieid", "20210087");
		sendDataMap.put("theaterid", "1");
		sendDataMap.put("locid", "103");
		sendDataMap.put("tday", "15");*/

		
		//영화 선택시간
		ArrayList<Map<String, Object>> timeListMap = ticketService.getSelectDate(sendDataMap);
		System.out.println("size: "+timeListMap.size());
			for (Map<String, Object> timeMaplist : timeListMap) {
				System.out.println("getdate year : "+timeMaplist.get("year"));
				System.out.println("getdate month : "+timeMaplist.get("month"));
				System.out.println("getdate hour : "+timeMaplist.get("hour"));
				System.out.println("getdate minute : "+timeMaplist.get("minute"));
				System.out.println("getdate endTime : "+timeMaplist.get("endTime"));
				System.out.println("getdate day : "+timeMaplist.get("day"));
				System.out.println("getdate location_id : "+timeMaplist.get("location_id"));
				System.out.println("getdate theater_id : "+timeMaplist.get("theater_id"));
				System.out.println("getdate schedule_id : "+timeMaplist.get("schedule_id"));
			}
		
			model.addAttribute("ticketday",timeListMap);

		return "ticket/tickettime";
	}

	//좌석선택란
	@RequestMapping("/ticketseat")
	public String getSeat(HttpServletRequest request, Model model) {
		System.out.println("======= < pass by ticketseat() > =======");
		
		
		
		String movieid = request.getParameter("movieid");
		System.out.println("movieid : "+movieid); 
		String theaterid = request.getParameter("theaterid");
		System.out.println("theaterid : "+theaterid);
		String locid = request.getParameter("locid");
		System.out.println("locid : "+locid);
		String tday = request.getParameter("tday");
		System.out.println("tday : "+tday);
		String hour = request.getParameter("hour");
		System.out.println("hour : "+hour);
		String minute = request.getParameter("minute");
		System.out.println("minute : "+minute);
		String schedule_id = request.getParameter("schedule_id");
		System.out.println("schedule_id : "+schedule_id); //예약 내역을 가져오기 위함
		
		//String startmovtime = request.getParameter("sTime"); //hour+minute
			
		HashMap<String, String> sendDataMap = new HashMap<String, String>();
		sendDataMap.put("movieid", movieid);
		sendDataMap.put("theaterid", theaterid);
		sendDataMap.put("locid", locid);
		sendDataMap.put("tday", tday);
		sendDataMap.put("hour", hour);
		sendDataMap.put("minute", minute);
		
		//sendDataMap.put("sTime", startmovtime); //hour+minute
		
		ArrayList<Map<String, Object>> timeListMap = ticketService.getSelectMovieInfo(sendDataMap);
		
		for (Map<String, Object> timeMaplist : timeListMap) {
			System.out.println("ticketseat year : "+timeMaplist.get("year"));
			System.out.println("ticketseat month : "+timeMaplist.get("month"));
			System.out.println("ticketseat hour : "+timeMaplist.get("hour"));
			System.out.println("ticketseat minute : "+timeMaplist.get("minute"));
			System.out.println("ticketseat endTime : "+timeMaplist.get("endTime"));
			System.out.println("ticketseat tday : "+timeMaplist.get("tday"));
			System.out.println("ticketseat schedule : "+timeMaplist.get("schedule_id"));
			//System.out.println("ticketseat startmovtime : "+timeMaplist.get("startmovtime"));
			}
		
		List<PayDto> payDto =  ticketService.getSeat(schedule_id);
		
		
		String str = "";
		String[] strArray;
		
		
		//jsp에서 수정하고 뿌리기 편하게 str로 변환해서 보내줌
		for (int i = 0; i < payDto.size(); i++) {
			str += payDto.get(i).getSeat() + ",";
		}
		strArray = str.split(",");
		
		model.addAttribute("seat", strArray);
		model.addAttribute("ticketseat",timeListMap);
		
		
		
		//pay에서 모델 값을 가져와야할 것 같음
		
		return "ticket/ticketseat";
	
	}
	
	
	
	
}
