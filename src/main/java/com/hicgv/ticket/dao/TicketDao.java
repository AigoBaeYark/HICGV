package com.hicgv.ticket.dao;

import java.util.ArrayList;

import com.hicgv.movies.dto.MoviesDto;
/*import com.hicgv.theater.dto.TheaterDto;
import com.hicgv.theater.dto.TimeInfoDto;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TTimeDto;
*/

import com.hicgv.ticket.dto.TicketListDto;

public interface TicketDao {

	public ArrayList<MoviesDto> ticket();
/*	public ArrayList<TheaterDto> biglocal();
	public ArrayList<TLocationDto> local();
<<<<<<< HEAD
	public ArrayList<TTimeDto> time();
	public ArrayList<TimeInfoDto> gettictime();
=======
	public ArrayList<TTimeDto> time(); //나중에지우기
	public ArrayList<TimeInfoDto> gettictime(); //나중에지우기
*/	
	/*이거 하나로 같이 쓸예정*/
	/*public ArrayList<TicketListDto> ticketmovie();*/
	public ArrayList<TicketListDto> ticketmovie(String movie_id);
	public ArrayList<TicketListDto> tickettheater1(String movie_id, String theater_id);
	public ArrayList<TicketListDto> tickettheater2(String movie_id, String theater_id, String location_id);
	public ArrayList<TicketListDto> ticketday(String movie_id, String theater_id, String location_id, String day);
	public ArrayList<TicketListDto> tickettime(String movie_id, String theater_id, String location_id, String day, String starttime);
>>>>>>> baaf7481cd591224e72cf7bb02f301e56a50b2c6
	

}
