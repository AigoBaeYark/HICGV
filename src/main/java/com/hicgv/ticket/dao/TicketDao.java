package com.hicgv.ticket.dao;

import java.util.ArrayList;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.theater.dto.TheaterDto;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TTimeDto;


public interface TicketDao {

	public ArrayList<MoviesDto> ticket();
	public ArrayList<TheaterDto> biglocal();
	public ArrayList<TLocationDto> local();
	public ArrayList<TTimeDto> time();
	

}
