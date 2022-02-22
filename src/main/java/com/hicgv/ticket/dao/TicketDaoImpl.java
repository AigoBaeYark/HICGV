package com.hicgv.ticket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.movies.dto.MoviesDto;
import com.hicgv.theater.dto.TheaterDto;
/*import com.hicgv.theater.dto.TheaterDto;
import com.hicgv.theater.dto.TimeInfoDto;
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TTimeDto;
*/
import com.hicgv.ticket.dto.TLocationDto;
import com.hicgv.ticket.dto.TicketListDto;

@Repository
public class TicketDaoImpl implements TicketDao{

	
	@Autowired
	SqlSession sqlSession;
	
	private static String nameSpace = "TicketDao";
	
	@Override
	public ArrayList<MoviesDto> ticket() {
		List<MoviesDto> dto = sqlSession.selectList(nameSpace+".ticket");
		return (ArrayList<MoviesDto>) dto;
	}

	@Override
	public ArrayList<TicketListDto> ticketmovie(String movie_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TicketListDto> biglocal() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TicketListDto> local() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TicketListDto> ticketday(Map<String, String> sendDataMap) {
		List<TicketListDto> dto = sqlSession.selectList(nameSpace+".ticketday",sendDataMap);
		
		for (TicketListDto ticketListDto : dto) {
			System.out.println(ticketListDto.getAge_limit());
		}
		
		return (ArrayList<TicketListDto>) dto;
	}

	@Override
	public ArrayList<TicketListDto> tickettime(String movie_id, String theater_id, String location_id, String day,
			String starttime) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
