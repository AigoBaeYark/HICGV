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

	public ArrayList<MoviesDto> ticket();
	public ArrayList<TheaterDto> getLocal();
	public ArrayList<TLocationDto> getTheaterLocal();

	/*이거 하나로 같이 쓸예정*/
	public ArrayList<TicketListDto> ticketday(Map<String, String> sendDataMap);
	public ArrayList<TicketListDto> tickettime(String movie_id, String theater_id, String location_id, String day, String starttime);
	

}
