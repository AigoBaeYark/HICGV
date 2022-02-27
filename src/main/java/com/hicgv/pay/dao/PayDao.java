package com.hicgv.pay.dao;

import com.hicgv.pay.dto.PayDto;

public interface PayDao {
	public PayDto getPayInfo(String userId,String movieId);
}
