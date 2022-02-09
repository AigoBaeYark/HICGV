package com.hicgv.customer.dao;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.hicgv.customer.dto.CustomerDto;


public interface CustomerDao {
	public CustomerDto loginCheck(String id,String password);
	public void joinForm(int user_id,String id,String password,String name,String phone_number,
	String nickname,String gender,String date_birth,String location,Timestamp create_at);
	//회원정보를 보여줄 필드를 list로 만들어 줌
	public ArrayList<CustomerDto> list(int user_id,String id,String password,String name,String phone_number,
			String nickname,String gender,String date_birth,String location,Timestamp create_at);
}
