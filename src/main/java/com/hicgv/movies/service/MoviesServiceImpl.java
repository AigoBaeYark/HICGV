package com.hicgv.movies.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MovieDirectorDto;
import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.movies.util.GetDateViewer;
import com.hicgv.movies.util.GetMoivePoster;

@Service
public class MoviesServiceImpl implements MoviesService{
	
	@Inject
	MoviesDao dao;
	
	
	public ArrayList<Map<String, String>> getDateViewer(String day) {
		GetDateViewer getDateViewer = new GetDateViewer(); //겟데이터뷰에 생성자 없애서 여기 공란
		System.out.println("impl day : "+ day);
		return getDateViewer.getDateViewer(day);
	}

	public String getMoviePoster() {
		GetMoivePoster getMoviePoster = new GetMoivePoster();
		getMoviePoster.getMoviePoster();
		
		return null;
	}

	@Override
	public ArrayList<MoviesDto> getMoviesList() {
		return dao.movies();
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
	
	
}
