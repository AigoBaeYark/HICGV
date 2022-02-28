package com.hicgv.pay.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.pay.dao.PayDao;
import com.hicgv.pay.dto.PayDto;

@Service
public class PayServiceImpl implements PayService{
	
	@Inject
	PayDao dao;

	@Override
	public PayDto getPayInfo(String userId, String movieId) {
		return dao.getPayInfo(userId, movieId);
	}

	@Override
	public ArrayList<PayDto> getSeat(String theater_schedule_id) {
		return dao.getSeat(theater_schedule_id);
	}

	
}
