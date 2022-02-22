package com.hicgv.store.service;

import java.util.ArrayList;

import com.hicgv.store.dao.StoreDao;
import com.hicgv.store.dto.StoreDto;

public interface StroreService {
	public void getProduct();
	
	public void insertProduct(StoreDto storeDto);
	public ArrayList<StoreDto> getStoreList();
}
