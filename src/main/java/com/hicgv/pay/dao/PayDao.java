package com.hicgv.pay.dao;

import java.util.ArrayList;

import com.hicgv.pay.dto.PayDto;

public interface PayDao {
	public PayDto getPayInfo(String userId,String movieId);
	public ArrayList<PayDto> getSeat(String theater_schedule_id);
}
