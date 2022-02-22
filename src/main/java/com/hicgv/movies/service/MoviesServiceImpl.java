package com.hicgv.movies.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import com.hicgv.movies.service.MoviesService;
import com.hicgv.movies.util.GetDateViewer;
import com.hicgv.movies.util.GetMoivePoster;


public class MoviesServiceImpl implements MoviesService{
	public ArrayList<Map<String, String>> getDateViewer(String day) {
		GetDateViewer getDateViewer = new GetDateViewer(); //겟데이터뷰에 생성자 없애서 여기 공란
		System.out.println("impl day : "+ day);
		return getDateViewer.getDateViewer(day);
	}

	public String getMoviePoster() {
		GetMoivePoster getMoviePoster = new GetMoivePoster();
		getMoviePoster.getMoviePoster();
		
		return null;
	}
	
	
}
