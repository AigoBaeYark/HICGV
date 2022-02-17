package com.hicgv.movies.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

public interface MoviesService {
	
	public ArrayList<Map<String, String>> getDateViewer(String day);
	public String getMoviePoster();
	
}
