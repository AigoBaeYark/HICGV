package com.hicgv.movies.dao;

import java.util.ArrayList;

import com.hicgv.movies.dto.MoviesDto;

public interface MoviesDao {
	public ArrayList<MoviesDto> movies();
	public MoviesDto moviesDetailview(String movie_id);
	//public ArrayList<MovieTrailerDto> movieTrailer(String movie_id);
	
}
