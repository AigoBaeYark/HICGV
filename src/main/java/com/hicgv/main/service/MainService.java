package com.hicgv.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.hicgv.main.dao.MainDao;
import com.hicgv.main.util.DailyViewers;
import com.hicgv.main.util.GetMoiveID;
import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviesDto;

public interface MainService {
	
	public void getDailyViewers(String day);
	public void getMovieID();
	public Map<String, String> getTrail();
	public ArrayList<MoviesDto> getMoviesList();
	public LinkedList<HashMap<String, String>> getSearchFinal(String searchTitle);	
	public void getSearchFinalDaily(String day);
	public void getSearchMovieInfo(String searchTitle);
	public int checkMovieId(String movie_id);
	
}
