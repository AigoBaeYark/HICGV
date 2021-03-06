package com.hicgv.store.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.store.dao.StoreDao;
import com.hicgv.store.dto.StoreDto;

@Service
public class StoreServiceImpl implements StroreService {

	@Inject
	private StoreDao dao;

	@Override
	public void getProduct() {

	}

	@Override
	public void insertProduct(StoreDto storeDto) {
		dao.insertProduct(storeDto);
	}

	@Override
	public ArrayList<StoreDto> getStoreList() {
		
		return dao.selectStoreList();
	}



}
