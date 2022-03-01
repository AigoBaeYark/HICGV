package com.hicgv.pay.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hicgv.pay.dto.PayDto;
import com.hicgv.pay.service.PayService;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
	// DB pay테이블 가져오기
	@RequestMapping("/pay")
	public String reserve(HttpServletRequest request, Model model) {
		System.out.println("======= << pay >> =======");
		String userId=request.getParameter("userId");
		String movieId=request.getParameter("theater_schedule_id");
		
		System.out.println("userid : "+userId);
		System.out.println("movieid : "+movieId);
		
		model.addAttribute("payInfo",payService.getPayInfo(userId, movieId));
	
		return "pay/pay";
	}
	// 좌석번호 넘기기
	@RequestMapping("/getSeat")
	public String getSeat(HttpServletRequest request, Model model) {
		
		System.out.println("======= << getSeat >> =======");
		String theaterScheduleId="1000";
		
		System.out.println("theaterScheduleId : "+theaterScheduleId);
		
		List<PayDto> payList =  payService.getSeat(theaterScheduleId);
		
		String str="";
		String[] strArray;
		
		//jsp에서 수정하고 뿌리기 편하게 str로 변환해서 보내줌
		for (int i = 0; i < payList.size(); i++) {
			str += payList.get(i).getSeat() + ",";
		}
		strArray = str.split(",");
		
		
		model.addAttribute("seat",payService.getSeat(theaterScheduleId));
		
		return "ticket/ticketseat";
	}
	
	@RequestMapping("/modifyPayInfo")
	public String modifyPayInfo() {
		System.out.println("======= << modifyPayInfo >> =======");

		
		return "pay/modifyPayInfo";
	}
	
	@RequestMapping(value ="/payTtest", method = RequestMethod.GET) //@@맵핑명 안 써서 오류
	public String goPay(HttpServletRequest request,HttpServletResponse response, Model model) {
		System.out.println("======= < pass by goPay() > =======");
		
		String location_name = request.getParameter("location_name");
		String seat = request.getParameter("seat");
		String person = request.getParameter("person");
		String seat_price = request.getParameter("seat_price");
		String start_date = request.getParameter("start_date");
		String title_kor = request.getParameter("title_kor");
		String room_name = request.getParameter("room_name");
		
		System.out.println("location_name : " + location_name);
		System.out.println("person : "+person);
		System.out.println("seat : "+seat);
		System.out.println("seat_price : "+seat_price);
		System.out.println("start_date : "+start_date);
		System.out.println("room_name : "+room_name);

		model.addAttribute("location_name",location_name);
		model.addAttribute("person",person);
		model.addAttribute("seat",seat);
		model.addAttribute("seat_price",seat_price);
		model.addAttribute("start_date",start_date);
		model.addAttribute("title_kor",title_kor);
		model.addAttribute("room_name",room_name);
		
		return "pay/pay";
		
	}
	
}
