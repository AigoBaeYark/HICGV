package com.hicgv.pay.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.pay.dao.PayDao;
import com.hicgv.pay.dto.PayDto;
import com.hicgv.pay.service.PayService;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
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
	@RequestMapping("/getSeat")
	public String getSeat(HttpServletRequest request, Model model) {
		
		//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기
		
		System.out.println("======= << getSeat >> =======");
		String theaterScheduleId="1000";
		
		System.out.println("theaterScheduleId : "+theaterScheduleId);
		
		String str = "";
		String[] strArray;
		
		List<PayDto> payList =  payService.getSeat(theaterScheduleId);
		
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
}
