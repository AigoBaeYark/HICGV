package com.hicgv.main.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hicgv.main.dao.MainDao;
import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviesDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		System.out.println("!MainController!");
		MainDao dao = sqlSession.getMapper(MainDao.class);
	 
		
		ArrayList<MoviesDto> list = dao.movieChart();
		for (MoviesDto moviesDto : list) {
			System.out.println("1"+moviesDto.getTitle_kor());
		}
		
		model.addAttribute("movie",list);
		
		return "main";
	}
	

	@RequestMapping(value = "header", method = RequestMethod.GET)
	public String header(Locale locale, Model model) {
	
		
		return "common/header";
	}
	
	
}
