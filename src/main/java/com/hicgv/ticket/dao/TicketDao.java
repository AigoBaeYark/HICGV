package com.hicgv.ticket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.theater.dto.TheaterDto;
/*import com.hicgv.theater.dto.TheaterDto;
import com.hicgv.theater.dto.TimeInfoDto;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TTimeDto;
*/
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TicketListDto;

public interface TicketDao {

	public ArrayList<MoviesDto> ticket(); //영화리스트
	public ArrayList<TheaterDto> getLocal(); //지역리스트
	public ArrayList<TLocationDto> getTheaterLocal(); //영화관리스트

	/*이거 하나로 같이 쓸예정*/
	public ArrayList<TicketListDto> getTicketday(HashMap<String, String> sendDataMap);
	
	public ArrayList<TicketListDto> getTickettime(String movie_id, String theater_id, String location_id, String day, String starttime);
	
	
	
	
	/*티켓예약배너*/
	/*public TicketListDto */
	
}
