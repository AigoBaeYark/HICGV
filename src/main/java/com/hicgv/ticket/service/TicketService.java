package com.hicgv.ticket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.ticket.dto.TicketListDto;

public interface TicketService {
	public ArrayList<MoviesDto> getMoviesList();
	public ArrayList<TicketListDto> getBiglocal();
	public ArrayList<TicketListDto> getLocal();
	public ArrayList<Map<String, Object>> getSelectTime(Map<String, String> sendDataMap);


}
