package com.hicgv.main.service;

import com.hicgv.main.util.DailyViewers;
import com.hicgv.main.util.GetMoiveID;

public interface MainService {
	
	public void getDailyViewers(String day);
	public void getMovieID();
	public String getTrail();
	
}
