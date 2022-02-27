package com.hicgv.movies.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.movies.service.MoviesService;
import com.hicgv.movies.service.MoviesServiceImpl;
import com.hicgv.movies.dto.MovieDirectorDto;
import com.hicgv.movies.dto.MoviePosterDto;
import com.hicgv.movies.dto.MovieTrailerDto;


@Controller
public class MoviesController {
	
	
	@Autowired
	MoviesService moviesService;
	
	
	/*영화차트란*/
	@RequestMapping("/movies")
	public String movies(Model model) {
		System.out.println("========= < pass by movies() > =========");

		model.addAttribute("movies",moviesService.getMoviesList()); 
		model.addAttribute("dateviewer", moviesService.getDateViewer());
		model.addAttribute("poster", moviesService.getMoviePoster());
	
		
	/*movielist받기 api, 크롤링*/
			
		return "movies/movies";	
	
	}
	
	/*영화상세보기란*/
	@RequestMapping("/moviesdetailview")
	public String moviesdetailview(HttpServletRequest request, Model model) {
		System.out.println("========= < pass by moviesdetailview() > =========");
			
		/*영화상세내역*/
		//해당영화상세정보이동하기(경로)
		String movie_id=request.getParameter("movie_id");
		
		//영화상세정보
		model.addAttribute("moviesdv",moviesService.getMoviesDailyViewer(movie_id));  
		
		//영화배우정보
		model.addAttribute("actor", moviesService.getActors(movie_id));
		
		//감독정보
		model.addAttribute("director", moviesService.getDirector(movie_id));
		
		//트레일러
		for (MovieTrailerDto movieTrailerDto : moviesService.getTrailer(movie_id)) {
			System.out.println("trailer : "+movieTrailerDto.getTrailer_title());
		}
		model.addAttribute("trailer", moviesService.getTrailer(movie_id));
		
		//트레일러(갯수)
		System.out.println("trailercnt : "+moviesService.getTrailercnt(movie_id));
		model.addAttribute("trailercnt",moviesService.getTrailercnt(movie_id)); 
		
		//스틸컷
		model.addAttribute("poster", moviesService.getPoster(movie_id));
		
		//스틸컷(갯수)
		model.addAttribute("postercnt", moviesService.getPostercnt(movie_id));
			
		return "movies/moviesdetailview";	
	}
	
	
	//API로 영화 랭킹순으로 영화 내역 가져오기
	/*@RequestMapping("/refreshMovie")
	public String refreshMoive() {
		MovieApi api = new MovieApi();
		DailyViewers dailyViewers = new
		cgvCrawl cgv = new cgvCrawl();
		MoviesDao dao = sqlSession.getMapper(MoviesDao.class);
		
		dao.insertRefreshMovies(api.getMoviecd(),api.getMovietiele(), cgv.moviScr(), );
		dao.refreshRank()
		
		return "refresh";
	}*/
	
	/*@RequestMapping("/refreshMovie")
	public String refreshMoive() {
		MovieApi api = new MovieApi();
		DailyViewers dailyViewers = new
		cgvCrawl cgv = new cgvCrawl();
		MoviesDao dao = sqlSession.getMapper(MoviesDao.class);
		
		dao.insertRefreshMovies(api.getMoviecd(),api.getMovietiele(), cgv.moviScr(), );
		dao.refreshRank()
		
		return "refresh";
	}*/
	
	
	
	
	/*스틸컷*/

	
//	/*배우 상세보기는 아직 하지말긩*/
//		
//	}
//	
	
	
	
	/*model.addAttribute("moviesdetailview", dao.moviesDetailview(movie_id));
	model.addAttribute(trailer, dao.movieTrailer(movie_id));
	model.addAttribute(cut, arg1);
	model.addAttribute(actor, arg1);
	model.addAttribute(director, arg1); --트레일러 추후 추가예정 */
	
	
}
