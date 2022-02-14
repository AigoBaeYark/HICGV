package com.hicgv.customer.dao;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.hicgv.customer.dto.CustomerDto;

public interface CustomerDao {
	public CustomerDto loginCheck(String id, String password);

	public void joinForm(int user_id, String id, String password, String name, String phone_number, String nickname,
			String gender, String date_birth, String location, Timestamp create_at, String email, String question,
			String answer);

	// 회원정보를 보여줄 필드를 list로 만들어 줌
	// 한명의 회원정보만을 가져오기때문에 list를 사용할 필요가 없음 list는 게시판에서 처럼 여러줄의 게시글을 가져올때 사용
	public CustomerDto myCGV(String id);

	public CustomerDto modifyForm(String id,String password, String phone_number, String nickname,
			String gender, String date_birth, String location, String email, String question,
			String answer);

}
