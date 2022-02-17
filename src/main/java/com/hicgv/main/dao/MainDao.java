package com.hicgv.main.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.movies.dto.MoviesDto;

@Repository
public interface MainDao {
	
	
	//영화순위 (10위까지)
	public ArrayList<MoviesDto> movieChart();
}
