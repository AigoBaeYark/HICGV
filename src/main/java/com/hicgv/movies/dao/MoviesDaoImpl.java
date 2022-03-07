package com.hicgv.movies.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.movies.dto.MovieActorDto;
import com.hicgv.movies.dto.MovieDirectorDto;
import com.hicgv.movies.dto.MoviePosterDto;
import com.hicgv.movies.dto.MovieTrailerDto;
import com.hicgv.movies.dto.MoviesDto;

@Repository
public class MoviesDaoImpl implements MoviesDao{

	@Autowired
	SqlSession sqlsession;
	
	private static String nameSpace = "com.hicgv.movies.dao.MoviesDao";
	
	
	@Override
	public ArrayList<MoviesDto> movies() {
		
		List<MoviesDto> moviesList = sqlsession.selectList(nameSpace+".movies");
		return (ArrayList<MoviesDto>) moviesList;
	}

	@Override
	public MoviesDto moviesdv(String movie_id) {
		return sqlsession.selectOne(nameSpace+".moviesdv",movie_id);
	}

	/*@Override
	public ArrayList<MovieActorDto> actor(String movie_id) {
		List<MovieActorDto> dto =  sqlsession.selectList(nameSpace+".actor",movie_id);
		return (ArrayList<MovieActorDto>) dto;
	}

	@Override
	public MovieDirectorDto director(String movie_id) {
		return sqlsession.selectOne(nameSpace+".director",movie_id);
	}*/

	@Override
	public ArrayList<MovieTrailerDto> trailer(String movie_id) {
		List<MovieTrailerDto> dto = sqlsession.selectList(nameSpace+".trailer", movie_id);
		return (ArrayList<MovieTrailerDto>) dto;
	}

	@Override
	public int trailercnt(String movie_id) {
		return sqlsession.selectOne(nameSpace+".trailercnt", movie_id);
	}

	@Override
	public ArrayList<MoviePosterDto> poster(String movie_id) {
		List<MoviePosterDto> dto = sqlsession.selectList(nameSpace+".poster", movie_id);
		return (ArrayList<MoviePosterDto>) dto;
	}

	@Override
	public int postercnt(String movie_id) {
		return sqlsession.selectOne(nameSpace+".postercnt", movie_id);
	}
	


}
