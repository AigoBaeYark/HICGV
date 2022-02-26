package com.hicgv.admin.dao;

import java.util.ArrayList;

import com.hicgv.admin.controller.dto.AdminDto;



public interface ADao {
	public ArrayList<AdminDto> list(int start,int end);

	
	public int selectCustomerTotCount();
	
	/*public void write(String bName,
			String bTitle, String bContent);
	public AdminDto contentView(String sbid);
	public void delete(String bid);
	public void modify(String bid, String bName,
			String bTitle, String bContent);*/
	
	
}
