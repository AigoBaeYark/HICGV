package com.hicgv.customer.dao;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.hicgv.customer.dto.CustomerDto;

public interface CustomerDao {
	public CustomerDto loginCheckId(String id);

	public CustomerDto loginCheckPw(String id, String password);

	// 회원정보를 보여줄 필드를 list로 만들어 줌
	// 한명의 회원정보만을 가져오기때문에 list를 사용할 필요가 없음 list는 게시판에서 처럼 여러줄의 게시글을 가져올때 사용
	public CustomerDto myCGV(String id);

	// 값을 받아서 양방향으로 이동해야할 땐 리턴값을 dto
	public void modify(String id, String password, String phone_number, String nickname, String gender,
			String date_birth, String location, String email, String question, String answer);

	// 양방향없이 한쪽방향으로 이동할 땐 void 타입
	public void join(String id, String password, String name, String phone_number, String nickname, String gender,
			String date_birth, String location, String email, String question, String answer);

	public void delete(String id, String password);

	public CustomerDto forgetId(String id, String email, String question, String answer);

	public String forgetPw(String id, String email);
	//비밀번호 분실시 비번 재설정
	public void resetPw(String id, String password);

}
