package com.hicgv.main.serviceImpl;

import com.hicgv.main.service.MainService;
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
	
	public String getTrail() {
		
		GetTrailer getTrailer = new GetTrailer();
		return getTrailer.getTrailer();
	}
}
