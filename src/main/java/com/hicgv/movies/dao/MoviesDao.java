package com.hicgv.movies.dao;

import java.util.ArrayList;

import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MovieDiretorDto;
import com.hicgv.movies.dto.MovieSystemDto;
import com.hicgv.movies.dto.MoviesDto;

public interface MoviesDao {
	/*영화차트란*/
	public ArrayList<MoviesDto> movies();
	public MoviesDto moviesDetailview(String movie_id); //무비차트에서 상세페이지로가기
	/*영화상세보기란*/
	public MovieActorDto mactor(); //배우이름란 (movieactor)
	public MovieDiretorDto mdiretor(); //감독이름란
	public MovieSystemDto msystem(); //상영관종류(4DX, IMAX)
	
	
	// public ArrayList<MovieTrailerDto> movieTrailer(String movie_id); --추후추가예정
	
}
