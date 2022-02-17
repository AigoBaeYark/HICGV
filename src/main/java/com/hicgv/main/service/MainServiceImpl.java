package com.hicgv.main.service;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hicgv.main.dao.MainDao;
import com.hicgv.main.util.DailyViewers;
import com.hicgv.main.util.GetMoiveID;
import com.hicgv.main.util.GetTrailer;
import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviesDto;

@Service
public class MainServiceImpl  implements MainService{
	
	
	@Inject 
	MainDao mainDao;
	
	// Mapper XML의 namespace와 일치해야 한다.
	private static String namespace = "com.hicgv.main.dao.MainDao";
	
	public void getDailyViewers(String day) {
		DailyViewers dViewers = new DailyViewers(day);
	}

	public void getMovieID() {
		GetMoiveID getMoiveID = new GetMoiveID();
		getMoiveID.getMoviesID();
	}
	
	public Map<String, String> getTrail() {
		
		GetTrailer getTrailer = new GetTrailer();
		return getTrailer.getTrailer();
	}
	
	public ArrayList<MoviesDto> getMoviesList(){
		return mainDao.movieChart();
	}
	
}
