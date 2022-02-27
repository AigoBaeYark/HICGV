package com.hicgv.theater.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.theater.dto.LocationDto;
import com.hicgv.theater.dto.MoviesInfoDto;
import com.hicgv.theater.dto.ScheduleDto;

@Repository
public class TheaterDaoImpl implements TheaterDao{

	@Autowired
	SqlSession sqlSession;
	
	private static String nameSpace = "com.hicgv.theater.dao.TheaterDao";
	
	@Override
	public ArrayList<LocationDto> getTheaterInfo() {
		System.out.println("======= << TheaterDaoImpl.getTheaterInfo() >> =======");
		List<LocationDto> dto = sqlSession.selectList(nameSpace+".getTheaterInfo");
		for (LocationDto locationDto : dto) {
			System.out.println(locationDto.getLocation_id());
			System.out.println(locationDto.getLocation_name());
		}
		return (ArrayList<LocationDto>) dto;
	}

	@Override
	public String getImg(String locationId) {
		System.out.println("======= << TheaterDaoImpl.getImg() >> =======");
		return sqlSession.selectOne(nameSpace+".getImg",locationId);
	}

	@Override
	public ArrayList<MoviesInfoDto> getMoviesInfo(String theaterId, String locationId, String date) {
		System.out.println("======= << TheaterDaoImpl.getMoviesInfo() >> =======");
		
		Map<String, String> Map = new HashMap<String, String>();
		Map.put("theaterId", theaterId);
		Map.put("locationId", locationId);
		Map.put("date", date);
		
		List<MoviesInfoDto> dto = sqlSession.selectList(nameSpace+".getMoviesInfo",Map);
		
		return (ArrayList<MoviesInfoDto>) dto;
	}

	@Override
	public LocationDto getLocationInfo(String locationId) {
		System.out.println("======= << TheaterDaoImpl.getLocationInfo() >> =======");
		return sqlSession.selectOne(nameSpace+".getLocationInfo",locationId);
	}

	@Override
	public void setScheduleInfo(ScheduleDto schedultDto) {
		
		// 날짜에 있는 T를 지우고 새로 생성한 dto에 start_date를 설정해준 뒤에 보내줘야 됨
		String startDate = schedultDto.getStart_date().replace("T", " ");
		ScheduleDto schDto = schedultDto;
		schDto.setStart_date(startDate);
		System.out.println("======= << TheaterDaoImpl.setScheduleInfo() >> =======");
		System.out.println("locationId : " + schDto.getLocation_id());
		System.out.println("roomId : " +schDto.getTheaterRoom_id());
		System.out.println("movieId : " + schDto.getMovie_id());
		System.out.println("Start_date : " + schDto.getStart_date());
		
		
		sqlSession.insert(nameSpace+".setScheduleInfo",schDto);
	}

	@Override
	public MoviesInfoDto getMoviesList(String movieId) {
		System.out.println("======= << TheaterDaoImpl.getMoviesList() >> =======");
		return sqlSession.selectOne(nameSpace+".getMoviesList",movieId);
	}

	@Override
	public ArrayList<ScheduleDto> getScheduleDate() {
		System.out.println("======= << TheaterDaoImpl.getScheduleDate() >> =======");
		List<ScheduleDto> dto = sqlSession.selectList(nameSpace+".getScheduleDate");
		for (ScheduleDto scheduleDto : dto) {
			System.out.println("date : "+scheduleDto.getStart_date());
		}
	
		return (ArrayList<ScheduleDto>) dto;
	}
	
}