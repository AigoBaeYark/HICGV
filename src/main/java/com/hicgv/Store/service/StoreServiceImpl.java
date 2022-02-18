package com.hicgv.store.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.store.dao.StoreDao;

@Service
public class StoreServiceImpl implements StroreService {

	@Inject
	private StoreDao dao;

	@Override
	public void getProduct() {

	}

	@Override
	public void insertProduct(String product_name, int product_categori, String product_categori_name,
			int product_price, String product_script, String product_img) {
		dao.insertProduct(product_name, product_categori, product_categori_name, product_price, product_script, product_img);
	}

}
