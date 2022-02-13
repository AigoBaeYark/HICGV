package com.hicgv.movies.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.movies.dto.MovieDirectorDto;
import com.hicgv.movies.dto.MoviePosterDto;
import com.hicgv.movies.dto.MovieTrailerDto;


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
	
	/*영화상세보기란*/
	@RequestMapping("/moviesdetailview")
	public String moviesdetailview(HttpServletRequest request, Model model) {
		System.out.println("========= < pass by moviesdetailview() > =========");
		
		//테이블이 3~4개 들어가야함
		//영화정보(영화정보, 감독란, 배우란, 상영관정보)
		//트레일러, 스틸샷, 평점
		
		MoviesDao dao=sqlSession.getMapper(MoviesDao.class);
		/*영화상세내역*/
		//해당영화상세정보이동하기(경로)
		String movie_id=request.getParameter("movie_id");
		
		//영화상세정보
		MoviesDto moviesdv=dao.moviesdv(movie_id);
		System.out.println("moviesdv : "+moviesdv.getTitle_kor());
		model.addAttribute("moviesdv",moviesdv);  
		
		//영화배우정보
		ArrayList<MovieActorDto> actor=dao.actor(movie_id);
		for (MovieActorDto movieActorDto : actor) {
			System.out.println("actor : "+movieActorDto.getName_kor());	
		} //디비내용확인차 foreach를 입력함
		model.addAttribute("actor", actor);
		
		//감독정보
		MovieDirectorDto director = dao.director(movie_id);
		System.out.println("director : "+director.getName_kor());
		model.addAttribute("director", director);
		
		//트레일러
		ArrayList<MovieTrailerDto> trailer = dao.trailer(movie_id);
		for (MovieTrailerDto movieTrailerDto : trailer) {
			System.out.println("trailer : "+movieTrailerDto.getTrailer_title());
		}
		model.addAttribute("trailer", trailer);
		
		//스틸컷
		ArrayList<MoviePosterDto> poster = dao.poster(movie_id);
		for (MoviePosterDto moviePosterDto : poster) {
			System.out.println("poster : "+moviePosterDto.getMovie_poster_id());
			System.out.println("posterurl : "+moviePosterDto.getMovie_poster_url());
		} 
		model.addAttribute("poster", poster);
		
		
		
		
		return "movies/moviesdetailview";	
	}
	
	
	
	
	
	
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
