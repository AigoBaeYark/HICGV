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

@Controller
public class PayController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/pay")
	public String reserve(HttpServletRequest request, Model model) {
		System.out.println("======= << pay >> =======");
		String userId=request.getParameter("userId");
		String movieId=request.getParameter("theater_schedule_id");
		
		System.out.println("userid : "+userId);
		System.out.println("movieid : "+movieId);
		
		PayDao dao=sqlSession.getMapper(PayDao.class);
		
		model.addAttribute("payInfo",dao.getPayInfo(userId, movieId));
	
		return "pay/pay";
	}
	@RequestMapping("getSeat")
	public String getSeat(HttpServletRequest request, Model model) {
		
		//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기//좌석번호 넘기기
		
		System.out.println("======= << getSeat >> =======");
		String theaterScheduleId="1000";
		
		System.out.println("theaterScheduleId : "+theaterScheduleId);
		
		String str = "";
		String[] strArray;
		
		PayDao dao=sqlSession.getMapper(PayDao.class);
		List<PayDto> payList =  dao.getSeat(theaterScheduleId);
		
		//jsp에서 수정하고 뿌리기 편하게 str로 변환해서 보내줌
		for (int i = 0; i < payList.size(); i++) {
			str += payList.get(i).getSeat() + ",";
		}
		strArray = str.split(",");
		
		
		model.addAttribute("seat",strArray);
		
		return "ticket/ticketseat3";
	}
}
