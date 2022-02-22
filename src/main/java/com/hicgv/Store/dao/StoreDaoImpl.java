package com.hicgv.store.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.store.dto.StoreDto;

@Repository
public class StoreDaoImpl implements StoreDao{
	
	@Autowired
	SqlSession session;
	
	private static String nameSpace = "com.hicgv.store.dao.StoreDao";
//	@Override
//	public void insertProduct(String product_name, int product_categori, String product_categori_name,
//			int product_price, String product_script, String product_img) {
//		daomapper.insertProduct(product_name, product_categori, product_categori_name, product_price, product_script, product_img);
//	}

	@Override
	public void insertProduct(StoreDto storeDto) {
		session.insert(nameSpace+".insertProduct",storeDto);
	}

	@Override
	public ArrayList<StoreDto> selectStoreList() {
		
		List<StoreDto> storeDtos = new ArrayList<StoreDto>();
		storeDtos = session.selectList(nameSpace+".selectStoreList");
		return (ArrayList<StoreDto>) storeDtos;
	}
	
	

	
}
