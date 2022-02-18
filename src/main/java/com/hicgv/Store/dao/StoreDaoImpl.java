package com.hicgv.store.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDaoImpl implements StoreDao{
	
	StoreDao daomapper;

	@Autowired
	public StoreDaoImpl(SqlSession sqlSession) {
		daomapper = sqlSession.getMapper(StoreDao.class);
	}
	


	@Override
	public void insertProduct(String product_name, int product_categori, String product_categori_name,
			int product_price, String product_script, String product_img) {
		daomapper.insertProduct(product_name, product_categori, product_categori_name, product_price, product_script, product_img);
	}
	
	

	
}
