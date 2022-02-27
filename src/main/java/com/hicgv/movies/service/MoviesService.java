package com.hicgv.movies.service;

import java.util.ArrayList;
import java.util.Map;

import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MovieDirectorDto;
import com.hicgv.movies.dto.MoviePosterDto;
import com.hicgv.movies.dto.MovieTrailerDto;
import com.hicgv.movies.dto.MoviesDto;

public interface MoviesService {
	public ArrayList<MoviesDto> getMoviesList();
	public ArrayList<Map<String, String>> getDateViewer();
	public String getMoviePoster();
	public MoviesDto getMoviesDailyViewer(String movie_id);
	public ArrayList<MovieActorDto> getActors(String movie_id);
	public MovieDirectorDto getDirector(String movie_id);
	public ArrayList<MovieTrailerDto> getTrailer(String movie_id);
	public int getTrailercnt(String movie_id);
	public ArrayList<MoviePosterDto> getPoster(String movie_id);
	public int getPostercnt(String movie_id);
}

