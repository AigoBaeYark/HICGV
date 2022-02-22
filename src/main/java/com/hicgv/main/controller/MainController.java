package com.hicgv.main.controller;

import java.awt.RenderingHints.Key;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.security.auth.Refreshable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hicgv.main.dao.MainDao;
import com.hicgv.main.service.MainService;
import com.hicgv.main.service.MainServiceImpl;
import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviesDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	//bean 객체로 주입되어서 new 로  새로 넣을 필요없음
	@Autowired
	private MainService mainService;
	
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

		model.addAttribute("serverTime", formattedDate);
		
		return "home";
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(HttpServletRequest req,HttpSession session, Locale locale, Model model) {
		logger.info("before mainContrller main()");
		//LinkedList<HashMap<String, String>> finalSearchList = new LinkedList<HashMap<String, String>>();
		
		//mainService.getDailyViewers("20220213"); //당일 관람객 수 (최대 10위까지)
		//mainService.getMovieID();				//cgv에서 movieID 가져오기
		
		//데이터 들어오는거 테스트 완료
//		try {
//			finalSearchList = mainService.getSearchFinal("스파이더맨");
//			for (HashMap<String, String> hashMap : finalSearchList) {
//				System.out.println("title : "+hashMap.get("title_kor"));
//			}
//		} catch (Exception e) {
//			throw new RuntimeException("검색실패",e);
//		}
	
		
		//mainService.getSearchFinalDaily("20220218");
		//mainService.getSearchMovieInfo("듄");
		model.addAttribute("trailer", mainService.getTrail());	//트레일러 영상 제목 설명 가져옴
		model.addAttribute("movie", mainService.getMoviesList());
		//model.addAttribute("movieList",finalSearchList);
		session.setAttribute("t", mainService.getTrail());
		logger.info("after mainContrller main()");
		

		return "main";
		
	}

	@RequestMapping(value = "header", method = RequestMethod.GET)
	public String header(Locale locale, Model model) {

		// 영화를 넣는법
		// 1. 직접입력
		// 2. api 가져오기

		return "common/header";
	}
	
	@RequestMapping(value="/seatTest")
	public String seat(Locale locale, Model model) {
		System.out.println("!seatTest!");
		
		return "common/seatTest";
	}
	
	@RequestMapping(value="/moviesAdmin")
	public String moviesAdmin(Model model) {
		logger.info("befroe moviesAdmin");
		
		return "common/moviesAdmin";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/moviesResult", produces = "application/json; charset=utf8")
	public List<HashMap<String, String>> moviesResult(HttpServletRequest request, Model model,@RequestParam String searchTitle) {
		logger.info("postSearch");
		System.out.println(searchTitle);
		List<HashMap<String, String>> finalSearchList = mainService.getSearchFinal(searchTitle);
		if(finalSearchList.size()==0)
		{
			return null;
		}
		
		return finalSearchList;
	}
	
	
	// public String DailyRefresh() {
	// //dao.dailyViewer(movie_id, api가져온 관람객);
	// }

}
