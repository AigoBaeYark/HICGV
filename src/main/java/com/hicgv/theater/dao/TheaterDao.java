package com.hicgv.theater.dao;

import java.util.ArrayList;

import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;
import com.hicgv.theater.dto.ScheduleDto;

public interface TheaterDao {
   public ArrayList<LocationDto> getTheaterInfo();
   public String getImg(String locationId);
   public ArrayList<MoviesInfoDto> getMoviesInfo(String theaterId,String locationId,String startDate);
   public LocationDto getLocationInfo(String locationId);
   public void setScheduleInfo(ScheduleDto scheduleDto);
   public MoviesInfoDto getMoviesList(String movieId);
   public ArrayList<ScheduleDto> getScheduleDate();
	public ArrayList<LocationDto> selLocation();
	public ArrayList<LocationDto> selRoom();
}