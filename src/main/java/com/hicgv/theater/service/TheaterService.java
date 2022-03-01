package com.hicgv.theater.service;

import java.util.ArrayList;
import java.util.Map;

import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;
import com.hicgv.theater.dto.ScheduleDto;

public interface TheaterService {

	public ArrayList<LocationDto> getTheaterInfo();
	public String getImg(String locationId);
	public ArrayList<Map<String, Object>> getMoviesInfo(String theaterId,String locationId,String startDate);
	public LocationDto getLocationInfo(String locationId);
	public void setScheduleInfo(ScheduleDto schedultDto);
	public MoviesInfoDto getMoviesList(String movieId);
	public ArrayList<ScheduleDto> getScheduleDate();
	public ArrayList<LocationDto> selLocation();
	public ArrayList<LocationDto> selRoom();

}
