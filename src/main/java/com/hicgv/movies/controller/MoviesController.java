package com.hicgv.movies.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviesDto;


@Controller
public class MoviesController {
	
	@Autowired
	private SqlSession sqlSession; //sqlSession은 트랜젝션(SELECT, UPDATE, INSERT, DELETE 등) 관련하여 해당 기능을 사용하기 쉽게 해주는것
	
	/*영화차트란*/
	@RequestMapping("/movies")
	public String movies(Model model) {
		System.out.println("========= < pass by movies() > =========");

		MoviesDao dao=sqlSession.getMapper(MoviesDao.class); //sql세션은 트랜젝션 관련하여 해당 기능을 사용하기 쉽게 해주는것
		ArrayList<MoviesDto> moives=dao.movies(); //1.moives()는 MoviesDao moives()로
		model.addAttribute("movies",moives); 
		
		
		return "movies/movies";	
	}
	
	@RequestMapping("/moviesdetailview")
	public String moviesdetailview(HttpServletRequest request, Model model) {
		System.out.println("========= < pass by moviesdetailview() > =========");
		
		//테이블이 3~4개 들어가야함
		//영화정보(영화정보, 감독란, 배우란, 상영관정보)
		//트레일러, 스틸샷, 평점
		
		String movie_id=request.getParameter("movie_id");
		MoviesDao dao=sqlSession.getMapper(MoviesDao.class);
		
		return "movies/moviesdetailview";	
	}
	
	/*영화상세보기란*/
	@RequestMapping("/actor")
	public String actorlist(Model model) {
		
		
		return "movies/person"; 
		
	}
	
	
	
	
	/*model.addAttribute("moviesdetailview", dao.moviesDetailview(movie_id));
	model.addAttribute(trailer, dao.movieTrailer(movie_id));
	model.addAttribute(cut, arg1);
	model.addAttribute(actor, arg1);
	model.addAttribute(director, arg1); --트레일러 추후 추가예정 */
	
	
}
