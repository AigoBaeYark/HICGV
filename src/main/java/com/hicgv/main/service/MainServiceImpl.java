package com.hicgv.main.service;

import java.util.Map;

import com.hicgv.main.util.DailyViewers;
import com.hicgv.main.util.GetMoiveID;
import com.hicgv.main.util.GetTrailer;

public class MainServiceImpl  implements MainService{
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
	
}
