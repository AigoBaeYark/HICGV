package com.hicgv.movies.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MovieDirectorDto;
import com.hicgv.movies.dto.MoviePosterDto;
import com.hicgv.movies.dto.MovieTrailerDto;
import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.movies.util.GetMovieApi;
import com.hicgv.movies.util.GetMoivePoster;

@Service
public class MoviesServiceImpl implements MoviesService{
	
	@Inject
	MoviesDao dao;
	
	@Override
	public ArrayList<MoviesDto> getMoviesList() {
		
		return dao.movies();
	}
	
	@Override
	public ArrayList<Map<String, String>> getMovieApi() {
		GetMovieApi getDateViewer = new GetMovieApi(); //겟데이터뷰에 생성자 없애서 여기 공란
		
		SimpleDateFormat day = new SimpleDateFormat("yyyyMMdd");
		
		// 하루 전 날짜 (영화진흥API 랭킹순위에 오늘 날짜는 안떠서)
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.DATE, -1);
        System.out.println(day.format(cal.getTime()));
        String strDay = day.format(cal.getTime());
		
		
		return getDateViewer.getMovieApi(strDay);
	}

	@Override
	public String getMoviePoster() {
		GetMoivePoster getMoviePoster = new GetMoivePoster();
		getMoviePoster.getMoviePoster();
		
		return null;
	}

	@Override
	public MoviesDto getMoviesDailyViewer(String movie_id) {
		return dao.moviesdv(movie_id);
	}

	@Override
	public ArrayList<MovieActorDto> getActors(String movie_id) {
		return dao.actor(movie_id);
	}

	@Override
	public MovieDirectorDto getDirector(String movie_id) {
		return dao.director(movie_id);
	}
	
	@Override
	public ArrayList<MovieTrailerDto> getTrailer(String movie_id){
		return dao.trailer(movie_id);	
	}

	@Override
	public int getTrailercnt(String movie_id) {
		return dao.trailercnt(movie_id);
	}

	@Override
	public ArrayList<MoviePosterDto> getPoster(String movie_id) {
		return dao.poster(movie_id);
	}

	@Override
	public int getPostercnt(String movie_id) {
		return dao.postercnt(movie_id);
	}
	
	
	
}
