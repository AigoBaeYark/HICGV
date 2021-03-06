package com.hicgv.ticket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.pay.dto.PayDto;
import com.hicgv.theater.dto.TheaterDto;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TicketListDto;

public interface TicketService {
	public ArrayList<MoviesDto> getMoviesList();
	public ArrayList<TheaterDto> getLocal();
	public ArrayList<TLocationDto> getTheaterLocal();
	public ArrayList<Map<String, Object>> getSelectDate(HashMap<String, String> sendDataMap);
	public ArrayList<Map<String, Object>> getSelectMovieInfo(HashMap<String, String> sendDataMap);
	public List<PayDto> getSeat (String schedule_id);

}
