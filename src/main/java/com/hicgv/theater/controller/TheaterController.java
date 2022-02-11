package com.hicgv.theater.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.theater.dao.TheaterDao;
import com.hicgv.theater.dto.MoviesInfoDto;

@Controller
public class TheaterController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/theater")
	public String theater(HttpServletRequest request, Model model) {
		System.out.println("======= << theater >> =======");

		String theaterid = request.getParameter("theaterid");
		String locid = request.getParameter("locid");
		String movieid=request.getParameter("movieid");

		System.out.println("theaterid : " + theaterid);
		System.out.println("locid : " + locid);

		if (theaterid == null)
			theaterid = "1";
		if (locid == null)
			locid = "101";

		System.out.println("theaterid2 : " + theaterid);
		System.out.println("locid2 : " + locid);
		System.out.println("movieid : "+movieid);

		TheaterDao dao = sqlSession.getMapper(TheaterDao.class);

		ArrayList<MoviesDto> list=dao.getMoviesInfo(theaterid);
		
		ArrayList<MoviesInfoDto> slist = dao.movietime(movieid);	//듄	의 상영시간
		//ArrayList<Timestamp> slist = dao.movietime(movieid2);	//주술회전	의 상영시간
		//ArrayList<Timestamp> slist = dao.movietime(movieid3);	//암튼다른영화 상영시간
		
		for (MoviesDto moviesDto : list) {
			System.out.println("1"+moviesDto.getAge_limit());
		}
		
		model.addAttribute("theater", dao.theater());
		model.addAttribute("img" , dao.getImg(locid));
		model.addAttribute("movieinfo",dao.getMoviesInfo(theaterid));

		return "theater/theater";

	}

}