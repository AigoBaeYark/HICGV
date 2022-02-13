package com.hicgv.movies.dao;

import java.util.ArrayList;

import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MovieDirectorDto;
import com.hicgv.movies.dto.MoviePosterDto;
import com.hicgv.movies.dto.MovieSystemDto;
import com.hicgv.movies.dto.MovieTrailerDto;
import com.hicgv.movies.dto.MoviesDto;

public interface MoviesDao {
	/*영화차트란*/
	public ArrayList<MoviesDto> movies();
	public MoviesDto moviesdv(String movie_id); //무비차트에서 상세페이지로가기, 상세페이지내용
	/*영화상세보기란*/
	// public MoviesDto moviesdv(String movie_id); //무비차트에서 상세페이지로가기, 상세페이지내용
	public ArrayList<MovieActorDto> actor(String movie_id); //배우이름란 (movieactor)
	public MovieDirectorDto director(String movie_id); //감독이름란
	public ArrayList<MovieTrailerDto> trailer(String movie_id); //트레일러영상
	public ArrayList<MoviePosterDto> poster(String movie_id);
	
	
	
	
	/*public MovieSystemDto system(); //상영관종류(4DX, IMAX) ++우선이건 빼기로함 */	
	
	// public ArrayList<MovieTrailerDto> movieTrailer(String movie_id); --추후추가예정
	
}
