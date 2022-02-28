package com.hicgv.pay.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.pay.dto.PayDto;

@Repository
public class PayDaoImpl implements PayDao{

	@Autowired
	SqlSession sqlSession; 
	
	private static String nameSpace = "com.hicgv.pay.dao.PayDao";
	
	@Override
	public PayDto getPayInfo(String userId, String movieId) {
		System.out.println("======= << PayDaoImpl.getPayInfo() >> =======");
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("userId", userId);
		map.put("movieId", movieId);
		
		return sqlSession.selectOne(nameSpace+".getPayInfo",map);
	}

	@Override
	public ArrayList<PayDto> getSeat(String theater_schedule_id) {
		System.out.println("======= << PayDaoImpl.getSeat() >> =======");
		List<PayDto> dto=sqlSession.selectOne(nameSpace+".getSeat");
		
		return (ArrayList<PayDto>) dto;
	}

}
