package com.hicgv.store.dao;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public interface StoreDao {
	
	
	public void insertProduct(@Param("product_name") String product_name, 
			@Param("product_categori") int product_categori,@Param("product_categori_name") String product_categori_name,
			@Param("product_price") int product_price,@Param("product_script") String product_script, 
			@Param("product_img") String product_img);
	
}
