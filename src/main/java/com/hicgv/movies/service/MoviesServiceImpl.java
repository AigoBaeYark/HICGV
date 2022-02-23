package com.hicgv.movies.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MovieDirectorDto;
import com.hicgv.movies.dto.MoviePosterDto;
import com.hicgv.movies.dto.MovieTrailerDto;
import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.movies.util.GetDateViewer;
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
	public ArrayList<Map<String, String>> getDateViewer(String day) {
		GetDateViewer getDateViewer = new GetDateViewer(); //겟데이터뷰에 생성자 없애서 여기 공란
		System.out.println("impl day : "+ day);
		return getDateViewer.getDateViewer(day);
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
