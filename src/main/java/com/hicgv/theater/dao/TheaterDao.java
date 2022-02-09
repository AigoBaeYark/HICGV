package com.hicgv.theater.dao;

import java.util.ArrayList;

import com.hicgv.theater.dto.LocationDto;


public interface TheaterDao {
	public ArrayList<LocationDto> theater();
	public String getImg(String location_id);
}
