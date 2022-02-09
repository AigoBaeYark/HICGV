package com.hicgv.theater.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.theater.dao.TheaterDao;
import com.hicgv.theater.dto.LocationDto;

@Controller
public class TheaterController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/theater")
	public String theater(HttpServletRequest request, Model model) {
		System.out.println("======= << theater >> =======");

		String movieid = request.getParameter("movieid");
		String locid = request.getParameter("locid");

		System.out.println("movieid : " + movieid);
		System.out.println("locid : " + locid);

		if (movieid == null)
			movieid = "1";
		if (locid == null)
			locid = "101";

		System.out.println("movieid2 : " + movieid);
		System.out.println("locid2 : " + locid);

		TheaterDao dao = sqlSession.getMapper(TheaterDao.class);

		model.addAttribute("theater", dao.theater());
		model.addAttribute("img" , dao.getImg(locid));

		return "theater/theater";

	}

}