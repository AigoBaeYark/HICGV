package com.hicgv.ticket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public ArrayList<TheaterDto> getLocal() {
		List<TheaterDto> dto = sqlSession.selectList(nameSpace+".getLocal");
		return (ArrayList<TheaterDto>) dto;
	}
	
	@Override
	public ArrayList<TLocationDto> getTheaterLocal() {
		List<TLocationDto> dto = sqlSession.selectList(nameSpace+".getTheaterLocal");
		return (ArrayList<TLocationDto>) dto;
	}

	@Override
	public ArrayList<TicketListDto> getSelectDate(HashMap<String, String> sendDataMap) {
		List<TicketListDto> dto = new ArrayList<TicketListDto>(); //상영관이 여러개 있을 수 있어서
		dto = sqlSession.selectList(nameSpace+".getSelectDate",sendDataMap);
		System.out.println("sendData(DaoImpl) : "+sqlSession.selectList(nameSpace+".getSelectDate",sendDataMap).size());
		for (TicketListDto ticketListDto : dto) {
			System.out.println(ticketListDto.getAge_limit());
		}
		
		return (ArrayList<TicketListDto>) dto;
	}

	@Override
	public ArrayList<TicketListDto> getSelectMovieInfo(HashMap<String, String> sendDataMap) {
		List<TicketListDto> dto = new ArrayList<TicketListDto>();
		dto = sqlSession.selectList(nameSpace+".getSelectMovieInfo",sendDataMap);
		System.out.println("sendData(DaoImpl) : "+sqlSession.selectList(nameSpace+".getSelectMovieInfo",sendDataMap).size());
		for (TicketListDto ticketListDto : dto) {
			System.out.println(ticketListDto.getTitle_kor());
		}
		
		return (ArrayList<TicketListDto>) dto; //@@nameSpace뒤에 .getSelectMovieInfo를 써야했는데 .getTicketday를 써서 오류
	}

	@Override
	public List<PayDto> getSeat(String schedule_id) {

		return sqlSession.selectList(nameSpace+".getSeat",schedule_id);
	}


	


	

	

}
