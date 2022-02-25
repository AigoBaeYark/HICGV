package com.hicgv.customer.dao;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.hicgv.customer.dto.CustomerDto;


public interface CustomerDao {
	
	public void joinCustomer(CustomerDto customerDto);
	
	public String loginCheckId(String id);

	public CustomerDto loginCheckPw(String id, String password);
	
	public CustomerDto myCGV(String id);

	public String getEmail(String id);
	
	public String getQuestion(String id, String email);
	// 값을 받아서 양방향으로 이동해야할 땐 리턴값을 dto
	/*public void modify(String id, String password, String phone_number, String nickname, String gender,
			String date_birth, String location, String email, String question, String answer);*/
	public void modify(CustomerDto customerDto);
	// 양방향없이 한쪽방향으로 이동할 땐 void 타입
	/*public void join(String id, String password, String name, String phone_number, String nickname, String gender,
			String date_birth, String location, String email, String question, String answer);*/

	public void delete(String id, String password);


	//비밀번호 분실시 비번 재설정
	public void resetPw(String id, String password);
	
	public String getAnswer(String answer);
	//아이디찾기를 위한 쿼리문  > 입력한 전화번호로 디비의 전화번호를 찾고 그 전화번호와 생년월일을 비교하여 아이디를 찾음 
	public String getPhone_number(String phone_number);
	public String forgetId(String phone_number, String date_birth);
	// 회원정보를 보여줄 필드를 list로 만들어 줌
	// 한명의 회원정보만을 가져오기때문에 list를 사용할 필요가 없음 list는 게시판에서 처럼 여러줄의 게시글을 가져올때 사용
	//myCGV에 가져올 이름 닉네임 등급 아이디 프로필 이미지
	
	public String name(String id, String password);
	public String nickname(String id, String password);
	public String grade(String id, String password);
	//public String img(String id, String password);
	public CustomerDto getCustomerDto(String id);


}
