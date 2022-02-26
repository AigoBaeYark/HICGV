package com.hicgv.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hicgv.main.dao.MainDao;
import com.hicgv.main.util.DailyViewers;
import com.hicgv.main.util.GetMoiveID;
import com.hicgv.main.util.GetToNaver;
import com.hicgv.main.util.GetTrailer;
import com.hicgv.main.util.getMoviesCrawlFinal;
import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviesDto;

@Service
public class MainServiceImpl  implements MainService{
	
	
	@Inject 
	MainDao mainDao;
	
	@Autowired(required=false)
	@Qualifier("crawlFinal")
	getMoviesCrawlFinal crawlFinal;
	
		
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
	public LinkedList<HashMap<String, String>> getSearchFinal(String searchTitle) {
		//crawlFinal.searchToTitleNaver("듄");
		return crawlFinal.searchToTitleMovieInfoApi(searchTitle);
	}

	@Override
	public void getSearchFinalDaily(String day) {
		crawlFinal.searchToDate(day);
	}

	@Override
	public void getSearchMovieInfo(String searchTitle) {
		crawlFinal.searchToTitleMovieInfoApi(searchTitle);
	}

	@Override
	public int checkMovieId(String movie_id) {
		
		mainDao.checkMovieId(movie_id);
		
		return 0;
	}

	@Override
	public void insertAllActor(HashMap<String, Object> actor) {
		System.out.println("serviceActor : ");
		mainDao.insertAllActor(actor);
	}

	
}
