package com.hicgv.main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.movies.dto.MoviesDto;

public interface MainDao {
	
	//영화순위 (10위까지)
	public ArrayList<MoviesDto> movieChart();
	public int checkMovieId(String movie_id);
	
	//모든 영화인 데이터 넣기
	public void insertAllActor(HashMap<String, Object> actor);
	public void insertMovie(MoviesDto moviesDto);
}
