package com.hicgv.customer.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Repository;

import com.hicgv.customer.dto.CustomerDto;

@Repository
public class CustomerDaoImpl implements CustomerDao{

	
	@Autowired
	SqlSession sqlSession;
	
	private static String nameSpace = "com.hicgv.customer.dao.CustomerDao";
	@Override
	public void joinCustomer(CustomerDto customerDto) {
		sqlSession.insert(nameSpace+".joinCustomer",customerDto);
		//sqlSession.sel
	}
	@Override
	public String loginCheckId(String id) {
		
		System.out.println("loginCheckId : "+id);
		System.out.println( (String) sqlSession.selectOne(nameSpace+".loginCheckId",id));
		return sqlSession.selectOne(nameSpace+".loginCheckId",id);
		
	}
	@Override
	public CustomerDto loginCheckPw(String id, String password) {
		
		System.out.println("loginCheckid  "+id);
		System.out.println("loginCheckPw  "+password);
		
		Map<String, String> sendMap = new HashMap<String,String>();
		sendMap.put("id", id);
		sendMap.put("password", password);
		
		return sqlSession.selectOne(nameSpace+".loginCheckPw",sendMap);
	}
	@Override
	public CustomerDto myCGV(String id) {
		
		System.out.println("myCGV :"+ getCustomerDto(id));
		
		Map<String, Object> sendMap = new HashMap<String, Object>();
		sendMap.put("id", id);
		
		return sqlSession.selectOne(nameSpace+".myCGV",sendMap);
	}
	@Override
	public String getEmail(String id) {
		return null;
	}
	@Override
	public void modify(String id, String password, String phone_number, String nickname, String gender,
			String date_birth, String location, String email, String question, String answer) {
		
	}
	/*@Override
	public void join(String id, String password, String name, String phone_number, String nickname, String gender,
			String date_birth, String location, String email, String question, String answer) {
		
	}*/
	@Override
	public void delete(String id, String password) {
		
	}
	@Override
	public void resetPw(String id, String password) {
		
	}
	@Override
	public String getQuestion(String id, String email) {
		return null;
	}
	@Override
	public String getAnswer(String answer) {
		return null;
	}
	@Override
	public String getPhone_number(String phone_number) {
		return null;
	}
	@Override
	public String forgetId(String phone_number, String date_birth) {
		return null;
	}
	
	@Override
	public String name(String id, String password) {
		return null;
	}
	@Override
	public String nickname(String id, String password) {
		return null;
	}
	@Override
	public String grade(String id, String password) {
		return null;
	}
	/*@Override
	public String img(String id, String password) {
		return null;
	}*/
	@Override
	public CustomerDto getCustomerDto(String id) {
		return null;
	}
	
	
	
	
	
	
	
}
