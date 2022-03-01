package com.hicgv.main.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.print.DocFlavor.STRING;

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
		
		return mainDao.checkMovieId(movie_id);
	}

	@Override
	public void insertAllActor(HashMap<String, Object> actor) {
		System.out.println("serviceActor : ");
		mainDao.insertAllActor(actor);
	}

	@Override
	public void insertMovie(MoviesDto moviesDto) {
		mainDao.insertMovie(moviesDto);
	}

	@Override
	public void updateDailyRank(LinkedList<HashMap<String, String>> updateMovieRank) {

		mainDao.updateDailyRank(updateMovieRank);
	}

	@Override
	public void rankInit() {
		mainDao.rankInit();
	}

	@Override
	public LinkedList<HashMap<String, String>> getmovieDay(String movie_id, String location_id) {
		
		LinkedList<HashMap<String, String>> weekMapList = new LinkedList<HashMap<String,String>>();
		for (String day : mainDao.getMovieDay(movie_id,location_id)) {
			
			HashMap<String, String> subDay = new HashMap<String, String>();
			subDay.put("year", day.substring(0,4));
			subDay.put("month", day.substring(4,6));
			subDay.put("day", day.substring(6,8));
			
			LocalDate date = LocalDate.of(Integer.parseInt(subDay.get("year").toString()), Integer.parseInt(subDay.get("month").toString()), Integer.parseInt(subDay.get("day")));
			System.out.println("요일? " +date);
			DayOfWeek dayOfWeek = date.getDayOfWeek();
			
			System.out.println("요일?? "+dayOfWeek.getDisplayName(TextStyle.NARROW, Locale.KOREAN));
			
			subDay.put("day_kor", dayOfWeek.getDisplayName(TextStyle.NARROW, Locale.KOREAN));
			
			weekMapList.add(subDay);
			
		}
		
		
		return weekMapList;
	}

	@Override
	public ArrayList<MoviesDto> searchNormal(String parameter) {
		return mainDao.searchNormal(parameter);
	}

	
}
