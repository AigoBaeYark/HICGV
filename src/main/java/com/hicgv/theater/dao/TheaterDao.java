package com.hicgv.theater.dao;

import java.util.ArrayList;

import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;
import com.hicgv.theater.dto.ScheduleDto;

public interface TheaterDao {
   public ArrayList<LocationDto> getTheaterInfo();
   public String getImg(String location_id);
   public ArrayList<MoviesInfoDto> getMoviesInfo(String theater_id,String location_id,String date);
   public LocationDto getLocationInfo(String location_id);
   public ScheduleDto setScheduleInfo(String movieid,String roomid,String date,String locid);
   public MoviesInfoDto getMoviesList(String movieid);
}