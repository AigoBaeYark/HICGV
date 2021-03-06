package com.hicgv.ticket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.pay.dto.PayDto;
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
	public ArrayList<TicketListDto> getSelectDate(HashMap<String, String> sendDataMap); //상영관리스트
	public ArrayList<TicketListDto> getSelectMovieInfo(HashMap<String, String> sendDataMap); //좌석예매리스트
	public List<PayDto> getSeat(String schedule_id); //이미결제된좌석
	
	
	
}
