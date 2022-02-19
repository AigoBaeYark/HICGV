package com.hicgv.store.service;

import com.hicgv.store.dao.StoreDao;
import com.hicgv.store.dto.StoreDto;

public interface StroreService {
	public void getProduct();
//	public void insertProduct(String product_name, int product_categori,String product_categori_name
//			,int product_price, String product_script, String product_img);
	
	public void insertProduct(StoreDto storeDto);
}
