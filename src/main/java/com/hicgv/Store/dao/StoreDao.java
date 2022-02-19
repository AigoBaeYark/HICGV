package com.hicgv.store.dao;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hicgv.store.dto.StoreDto;

public interface StoreDao {
	
	
	public void insertProduct(StoreDto storeDto);
	
	
}
