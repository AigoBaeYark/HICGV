package com.hicgv.movies.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.movies.service.MoviesService;
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
	
}
