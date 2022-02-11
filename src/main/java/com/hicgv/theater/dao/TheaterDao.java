package com.hicgv.theater.dao;

import java.util.ArrayList;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;


public interface TheaterDao {
   public ArrayList<LocationDto> theater();
   public String getImg(String location_id);
   public ArrayList<MoviesDto> getMoviesInfo(String movie_id);
   public ArrayList<MoviesInfoDto> movietime(String movie_id);
}
