package com.hicgv.customer.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Repository;

import com.hicgv.customer.dto.CustomerDto;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	

	@Autowired
	private HttpSession session;

	@Autowired
	SqlSession sqlSession;

	private static String nameSpace = "com.hicgv.customer.dao.CustomerDao";

	@Override
	public void joinCustomer(CustomerDto customerDto) {
		sqlSession.insert(nameSpace + ".joinCustomer", customerDto);
		// sqlSession.sel
	}

	@Override
	public String loginCheckId(String id) {
		System.out.println("=========pass by DaoImp loginCheckId()=============");
		System.out.println("loginCheckId : " + id);
		System.out.println((String) sqlSession.selectOne(nameSpace + ".loginCheckId", id));
		return sqlSession.selectOne(nameSpace + ".loginCheckId", id);

	}

	@Override
	public CustomerDto loginCheckPw(String id, String password) {
		System.out.println("=========pass by DaoImp loginCheckPw()=============");
		System.out.println("loginCheckid  " + id);
		System.out.println("loginCheckPw  " + password);

		Map<String, String> Map = new HashMap<String, String>();
		Map.put("id", id);
		Map.put("password", password);

		return sqlSession.selectOne(nameSpace + ".loginCheckPw", Map);
	}

	@Override
	public CustomerDto myCGV(String id) {
		System.out.println("==========customerDaoImpl.myCGV============");

		System.out.println("id:" + session.getAttribute("id"));

		Map<String, Object> Map = new HashMap<String, Object>();
		Map.put("id", id);
		System.out.println("id :" + Map.get("id"));
		CustomerDto customerDto = sqlSession.selectOne(nameSpace + ".myCGV", Map);
		System.out.println("selectOne : " + customerDto.getId());
		return customerDto;
	}

	@Override
	public String getEmail(String id) {
		System.out.println("==========customerDaoImpl getemail============");
		System.out.println("id :"+id);
		System.out.println("email : "+(String) sqlSession.selectOne(nameSpace + ".getEmail", id));
		return sqlSession.selectOne(nameSpace + ".getEmail", id);
	}

	@Override
	public void modify(CustomerDto customerDto) {
		System.out.println("==========customerDaoImpl modify============");
		
		sqlSession.update(nameSpace + ".modify", customerDto);
	}

	@Override
	public void delete(String id, String password) {
		System.out.println("===========customerDaoImpl delete==================");
		Map<String, String> Map = new HashMap<String, String>();
		Map.put("id", id);
		Map.put("password", password);
		System.out.println("id :"+Map.get("id"));
		System.out.println("password :"+Map.get("password"));
		
		sqlSession.delete(nameSpace+".delete",Map);
	}
	@Override
	public String getQuestion(String id, String email) {
		System.out.println("==========customerDaoImpl getQuestion============");
		System.out.println("id :"+id);
		System.out.println("email : "+(String) sqlSession.selectOne(nameSpace + ".getEmail", id));
		Map<String, String> Map = new HashMap<String, String>();
		Map.put("id", id);
		Map.put("email", email);
		
		System.out.println("queDaoImpl + "+sqlSession.selectOne(nameSpace + ".getQuestion", Map));
		
		return sqlSession.selectOne(nameSpace + ".getQuestion", Map);
	}

	@Override
	public String getAnswer(String answer) {
		System.out.println("==========customerDaoImpl getAnswer============");
		
		Map<String, String> Map = new HashMap<String, String>();
		Map.put("answer", answer);
		
		System.out.println("answer : "+(String) sqlSession.selectOne(nameSpace + ".getAnswer", answer));
		return sqlSession.selectOne(nameSpace + ".getAnswer", answer);
	}
	@Override
	public void resetPw(String id, String password) {
		System.out.println("=========DaoImpl resetPw===========");
		
		Map<String, String> Map =new HashMap<String, String>();
		Map.put("id", id);
		Map.put("password", password);
		System.out.println("id : "+Map.get("id"));
		System.out.println("password : "+Map.get("password"));
		sqlSession.update(nameSpace+".resetPw", Map);
	}

	@Override
	public String getPhone_number(String phone_number) {
		return null;
	}

	@Override
	public String forgetId(String phone_number, String date_birth) {
		System.out.println("==============daoImpl forgetId==============");
		
		
		System.out.println("phone_number :"+phone_number);
		System.out.println("date_birth : "+date_birth);
		Map<String, String> Map =new HashMap<String, String>();
		Map.put("phone_number", phone_number);
		Map.put("date_birth", date_birth);
		System.out.println("==========daoImpl forgetId=========");
		System.out.println("result  : "+ sqlSession.selectOne(nameSpace + ".forgetId", Map));
		
		return sqlSession.selectOne(nameSpace + ".forgetId", Map);
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

	@Override
	public CustomerDto getCustomerDto(String id) {

		return null;
	}


}
