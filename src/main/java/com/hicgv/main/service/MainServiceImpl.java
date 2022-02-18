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
import com.hicgv.main.util.GetToNaver;
import com.hicgv.main.util.GetTrailer;
import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviesDto;

@Service
public class MainServiceImpl  implements MainService{
	
	
	@Inject 
	MainDao mainDao;
	
		
	@Override
	public void getDailyViewers(String day) {
		DailyViewers dViewers = new DailyViewers(day);
	}
	
	@Override
	public void getMovieID() {
		GetMoiveID getMoiveID = new GetMoiveID();
		getMoiveID.getMoviesID();
	}
	
	@Override
	public Map<String, String> getTrail() {
		
		GetTrailer getTrailer = new GetTrailer();
		return getTrailer.getTrailer();
	}
	
	@Override
	public ArrayList<MoviesDto> getMoviesList(){
		return mainDao.movieChart();
	}

	@Override
	public void getToNaver() {
		GetToNaver naver = new GetToNaver("듄");
	}
	
}
