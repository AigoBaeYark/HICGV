package com.hicgv.movies.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MovieDirectorDto;
import com.hicgv.movies.dto.MoviesDto;

public interface MoviesService {
	
	public ArrayList<Map<String, String>> getDateViewer(String day);
	public String getMoviePoster();
	public ArrayList<MoviesDto> getMoviesList();
	public MoviesDto getMoviesDailyViewer(String movie_id);
	public ArrayList<MovieActorDto> getActors(String movie_id);
	public MovieDirectorDto getDirector(String movie_id);
}
