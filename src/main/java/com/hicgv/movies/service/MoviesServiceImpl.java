package com.hicgv.movies.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviePosterDto;
import com.hicgv.movies.dto.MovieTrailerDto;
import com.hicgv.movies.dto.MoviesDto;

@Service
public class MoviesServiceImpl implements MoviesService{
	
	@Inject
	MoviesDao dao;
	
	@Override
	public ArrayList<MoviesDto> getMoviesList() {
		return dao.movies();
	}
	

	@Override
	public MoviesDto getMoviesDailyViewer(String movie_id) {
		return dao.moviesdv(movie_id);
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
