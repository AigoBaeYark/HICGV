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
		String userid=request.getParameter("userid");
		String movieid=request.getParameter("movieid");
		
		System.out.println("userid : "+userid);
		System.out.println("movieid : "+movieid);
		
		PayDao dao=sqlSession.getMapper(PayDao.class);
		
		model.addAttribute("payInfo",dao.getPayInfo(userid, movieid));
	
		return "pay/pay";
	}

}
