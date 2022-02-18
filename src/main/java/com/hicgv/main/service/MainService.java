package com.hicgv.main.service;

import java.util.Map;

import com.hicgv.main.util.DailyViewers;
import com.hicgv.main.util.GetMoiveID;

public interface MainService {
	
	public void getDailyViewers(String day);
	public void getMovieID();
	public Map<String, String> getTrail();
	
}
