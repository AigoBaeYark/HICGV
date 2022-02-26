package com.hicgv.pay.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.pay.dao.PayDao;

@Controller
public class PayController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/pay")
	public String reserve(HttpServletRequest request, Model model) {
		System.out.println("======= << pay >> =======");
		String userId=request.getParameter("userId");
		String movieId=request.getParameter("movieId");
		
		System.out.println("userid : "+userId);
		System.out.println("movieid : "+movieId);
		
		PayDao dao=sqlSession.getMapper(PayDao.class);
		
		model.addAttribute("payInfo",dao.getPayInfo(userId, movieId));
	
		return "pay/pay";
	}

}
