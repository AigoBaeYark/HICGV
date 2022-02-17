package com.hicgv.main.controller;

import java.awt.List;
import java.awt.RenderingHints.Key;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.security.auth.Refreshable;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String main(Locale locale, Model model) {
		System.out.println("!MainController!");
		
		// jsoup 테스트
		String url = "http://www.cgv.co.kr/movies/";
		Connection connection = Jsoup.connect(url);
		ArrayList<String> rankli = new ArrayList<String>();
		ArrayList<String> titleli = new ArrayList<String>();
		
		ArrayList<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
				
		for(int i=0; i<5;i++) {
			Map<String, Object> tempMap = new HashMap<String, Object>();

			tempMap.put("key", "value"+i);
			tempMap.put("temp", "temp"+i);
			tempMap.put("map", "map"+i);
			tempList.add(tempMap);
		}
		
		for(int i=0; i<tempList.size();i++) {
			System.out.println(i + " 번째");
			Map<String, Object> m = tempList.get(i);
			System.out.println("key : "+m.get("key"));
			System.out.println("temp "+m.get("temp"));
			System.out.println("map : "+m.get("map"));
		}
		
		
		/*try {
			//cgv 홈페이지에서 랭크, 제목 가져오기
			Document document = connection.get();
			Elements e = document.select("div.sect-movie-chart");
			Iterator<Element> rank = e.select("strong.rank").iterator();
			Iterator<Element> title = e.select("strong.title").iterator();

			while (rank.hasNext()) {
				
				// rank 앞의 no. 없애기
				// rankli.add(rank.next().text().substring(3));

				// Iterator 출력, 리스트에 넣기
				System.out
						.println(rankli.add(rank.next().text().substring(3)) + "\t" + titleli.add(title.next().text()));
				// System.out.println(rank.next().text() + "\t" +
				// titleli.add(title.next().text()));

			}

			for (String li : rankli) {
				// 리스트에 잘 들어갔는지 확인
				System.out.println(li + "\t" + titleli.get(Integer.parseInt(li)));

				// dao.insertMovie(li,titleli.get(Integer.parseInt(li)));
				// dao.dailyViewer(movie_id, api가져온 관람객);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}*/

		
		//mainService.getDailyViewers("20220213"); //당일 관람객 수 (최대 10위까지)
		//mainService.getMovieID();				//cgv에서 movieID 가져오기
		
		model.addAttribute("trailer", mainService.getTrail());	//트레일러 영상 제목 설명 가져옴
		model.addAttribute("movie", mainService.getMoviesList());

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

	// public String DailyRefresh() {
	// //dao.dailyViewer(movie_id, api가져온 관람객);
	// }

}
