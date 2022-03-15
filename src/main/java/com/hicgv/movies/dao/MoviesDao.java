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
	
	/*영화상세보기란*/
	public MoviesDto moviesdv(String movie_id); //무비차트에서 상세페이지로가기, 상세페이지내용
	public ArrayList<MovieTrailerDto> trailer(String movie_id); //트레일러영상
	public int trailercnt(String movie_id); //트레일러영상갯수
	public ArrayList<MoviePosterDto> poster(String movie_id); //포스터
	public int postercnt(String movie_id); //포스터갯수
	
	
}
