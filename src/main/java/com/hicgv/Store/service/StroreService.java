package com.hicgv.store.service;

public interface StroreService {
	public void getProduct();
	public void insertProduct(String product_name, int product_categori,String product_categori_name
			,int product_price, String product_script, String product_img);
}
