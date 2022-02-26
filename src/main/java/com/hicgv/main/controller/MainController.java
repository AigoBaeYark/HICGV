package com.hicgv.main.controller;

import java.awt.RenderingHints.Key;
import java.lang.reflect.Method;
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
import java.util.Optional;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.hicgv.main.dao.MainDao;
import com.hicgv.main.service.MainService;
import com.hicgv.main.service.MainServiceImpl;
import com.hicgv.main.util.getMoviesCrawlFinal;
import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviesDto;

import oracle.net.aso.p;
import oracle.net.aso.s;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	// bean 객체로 주입되어서 new 로 새로 넣을 필요없음
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
	public String main(HttpServletRequest req, HttpSession session, Locale locale, Model model) {
		logger.info("before mainContrller main()");
		// LinkedList<HashMap<String, String>> finalSearchList = new
		// LinkedList<HashMap<String, String>>();

		// mainService.getDailyViewers("20220213"); //당일 관람객 수 (최대 10위까지)
		// mainService.getMovieID(); //cgv에서 movieID 가져오기

		// 데이터 들어오는거 테스트 완료
		// try {
		// finalSearchList = mainService.getSearchFinal("스파이더맨");
		// for (HashMap<String, String> hashMap : finalSearchList) {
		// System.out.println("title : "+hashMap.get("title_kor"));
		// }
		// } catch (Exception e) {
		// throw new RuntimeException("검색실패",e);
		// }

		// mainService.getSearchFinalDaily("20220218");
		// mainService.getSearchMovieInfo("듄");
		model.addAttribute("trailer", mainService.getTrail()); // 트레일러 영상 제목 설명 가져옴
		model.addAttribute("movie", mainService.getMoviesList());
		// model.addAttribute("movieList",finalSearchList);
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

	@RequestMapping(value = "/seatTest")
	public String seat(Locale locale, Model model) {
		System.out.println("!seatTest!");

		return "common/seatTest";
	}

	@RequestMapping(value = "/moviesAdmin")
	public String moviesAdmin(Model model) {
		logger.info("befroe moviesAdmin");

		return "common/moviesAdmin";
	}

	@ResponseBody
	@RequestMapping(value = "/moviesResult", produces = "application/json; charset=utf8")
	public List<HashMap<String, String>> moviesResult(HttpServletRequest request, Model model,
			@RequestParam String searchTitle) {
		logger.info("postSearch");
		System.out.println(searchTitle);
		List<HashMap<String, String>> finalSearchList = mainService.getSearchFinal(searchTitle);

		for (HashMap<String, String> hashMap : finalSearchList) {
			System.out.println(hashMap.get("movie_id"));
		}

		if (finalSearchList.size() == 0) {
			return null;
		}

		return finalSearchList;
	}

	@RequestMapping(value = "/moviesAdminInputDetail")
	public String moviesAdminInputDetail(HttpServletRequest request, Model model) {
		// 직접 입력창
		return "common/moviesAdminInputDetail";
	}

	@RequestMapping(value = "/moviesAdminDetail" )
	public String moviesAdminDetail(HttpServletRequest request, Model model, @RequestParam String movieId,@RequestParam String poster, @RequestParam String description) {
		// API 정보 가져와서 화면에 뿌리게
		System.out.println(movieId);
		
		//String movie_id = request.getParameter("movieid");
		//String poster = request.getParameter("poster"); // 포스터는 네이버에서 가져와야하는데 또 네이버 Api랑 같이 사용하면 느릴거 같아서 포스터는 바로 가져옴
		//String description = request.getParameter("description"); // 줄거리는 네이버에서 가져와야하는데 또 네이버 Api랑 같이 사용하면 느릴거 같아서 줄거리는 바로 가져옴
		System.out.println("movie_id : " + movieId);
		getMoviesCrawlFinal crawlFinal = new getMoviesCrawlFinal();
		String actorsStr = "";
		String actorsEnStr = "";
		crawlFinal.searchToAllActors();
		

		try {
			// 배열에 담겨온 애들은 빼줌
			Map<String, Object> resultMap = crawlFinal.searchToMovieId(movieId);
			System.out.println(resultMap.get("movie_id"));
			LinkedList<String> actorsList = (LinkedList<String>) resultMap.get("actors");
			LinkedList<String> actorsEnList = (LinkedList<String>) resultMap.get("actorsEn");
			
			//jsp에서 수정하고 뿌리기 편하게 str로 변환해서 보내줌
			for (int i = 0; i < actorsList.size(); i++) {
				actorsStr += actorsList.get(i).toString() + ",";
				actorsEnStr += actorsEnList.get(i).toString() + ",";
			}
			
			// null 예외를 방지하고 문자열에서 마지막 문자를 제거하는 기능적 접근 방식을 사용할 수 있습니다.
			actorsStr = Optional.ofNullable(actorsStr).filter(s -> s.length() != 0)
					.map(s -> s.substring(0, s.length() - 1)).orElse(actorsStr);
			actorsEnStr = Optional.ofNullable(actorsEnStr).filter(s -> s.length() != 0)
					.map(s -> s.substring(0, s.length() - 1)).orElse(actorsEnStr);
			
			System.out.println("영화배우들 : " + actorsStr);
			System.out.println("영화배우들 영어이름 : " + actorsEnStr);
			model.addAttribute("actors", actorsStr);
			model.addAttribute("actorsEn",actorsEnStr);

			if (resultMap.get("directors") == null) {	//감독이 한명밖에 없을 때
				model.addAttribute("director",resultMap.get("director"));
				model.addAttribute("directorEn",resultMap.get("directorEn"));
			}else {
				String directorsStr = "";
				String directorsEnStr = "";
				
				LinkedList<String> directorsList = (LinkedList<String>) resultMap.get("directors");
				LinkedList<String> directorsEnList = (LinkedList<String>) resultMap.get("directorsEn");
				for (int i = 0; i < directorsList.size(); i++) {
					directorsStr += directorsList.get(i).toString() + ",";
					directorsEnStr += directorsEnList.get(i).toString() + ",";
				}
				
				// null 예외를 방지하고 문자열에서 마지막 문자를 제거하는 기능적 접근 방식을 사용할 수 있습니다.
				directorsStr = Optional.ofNullable(directorsStr).filter(s -> s.length() != 0)
						.map(s -> s.substring(0, s.length() - 1)).orElse(directorsStr);
				
				directorsEnStr = Optional.ofNullable(directorsEnStr).filter(s -> s.length() != 0)
						.map(s -> s.substring(0, s.length() - 1)).orElse(directorsEnStr);
				
				model.addAttribute("director",directorsStr);
				model.addAttribute("directorEn",directorsEnStr);
			}
			
			if(resultMap.get("genres") == null) {	//장르가 한가지밖에 없을때
				model.addAttribute("genre",resultMap.get("genre"));
			}else {
				String genresStr = "";
				LinkedList<String> genresList = (LinkedList<String>) resultMap.get("genres");
				for (String string : genresList) {
					genresStr+=string+",";
				}
				
				// null 예외를 방지하고 문자열에서 마지막 문자를 제거하는 기능적 접근 방식을 사용할 수 있습니다.
				genresStr = Optional.ofNullable(genresStr).filter(s -> s.length() != 0)
						.map(s -> s.substring(0, s.length() - 1)).orElse(genresStr);
				
				model.addAttribute("genre",genresStr);
				
				
			}
			
			if(resultMap.get("nations") == null) {	//제작국가가 하나일 때
				model.addAttribute("nation",resultMap.get("nation"));
			}else {
				String nationsStr = "";
				LinkedList<String> nationsList = (LinkedList<String>) resultMap.get("nations");
				for (String string : nationsList) {
					nationsStr += string+",";
				}
				// null 예외를 방지하고 문자열에서 마지막 문자를 제거하는 기능적 접근 방식을 사용할 수 있습니다.
				nationsStr = Optional.ofNullable(nationsStr).filter(s -> s.length() != 0)
						.map(s -> s.substring(0, s.length() - 1)).orElse(nationsStr);
				
				model.addAttribute("nation",nationsStr);
			}
			
			
			
			
			
			model.addAttribute("poster",poster);
			model.addAttribute("movieInfo",resultMap);

		} catch (Exception e) {
			throw new RuntimeException("영화내용 불러오기 실패", e);
		}

		return "common/moviesAdminDetail";
	}
	
	@RequestMapping("insertMovie")
	public String insertMovie(Model model, @ModelAttribute MoviesDto moviesDto) {
		
		
		return null;
	}
	@RequestMapping("insertAllActor")
	public String insertAllActor(Model model) {
		
		getMoviesCrawlFinal getMoviesCrawlFinal = new getMoviesCrawlFinal();
		List<HashMap<String, String>> resultActors = getMoviesCrawlFinal.searchToAllActors();
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		resultMap.put("actorList", resultActors);
		mainService.insertAllActor(resultMap);
		
		
		/*for (HashMap<String, String> hashMap : resultActors) {
			System.out.println("배우 확인용 : "+hashMap.get("name_kor"));
			mainService.insertAllActor(hashMap);

		}*/
		
		//mainService.insertAllActor();
		
		return "main";
		
	}
	
	
	//영화 중복환인
	@RequestMapping("checkDuplicationMovie")
	@ResponseBody
	public String checkDuplicationMovie(@RequestParam String movie_id) {
		logger.info("before checkDuplicationMovie");
		System.out.println("중복확인 : "+movie_id);
		if(mainService.checkMovieId(movie_id) >=1)
		{
			logger.info("after checkDuplicationMovie");
			System.out.println("1 이상");
			return "등록된 영화";
		}else {
			logger.info("after checkDuplicationMovie");
			System.out.println("0 으로");
			return "미등록 영화";
		}
		
		
	}


}
