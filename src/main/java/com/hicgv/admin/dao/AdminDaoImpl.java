package com.hicgv.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Repository;

import com.hicgv.admin.dto.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	SqlSession sqlSession;
	
	private static String nameSpace = "AdminMapper"; 
	
	@Override
	public int selectCustomerTotCount() {
		
		return sqlSession.selectOne(nameSpace+".selectCustomerTotCount");
	}

	@Override
	public ArrayList<AdminDto> customerlist() {
		System.out.println("=====adminDao customerlist=====");
		
		List<AdminDto> dto = sqlSession.selectList(nameSpace +".getcustomerList");
		for(AdminDto adminDto : dto){
			System.out.println(adminDto.getId());
		}
		return (ArrayList<AdminDto>) dto;
	}

	@Override
	public AdminDto customerView(String id) {
		System.out.println("==========adminDaoImpl customerView============");
		System.out.println("id :" +id);
		//System.out.println("id:" + session.getAttribute("id"));
		Map<String, Object> Map = new HashMap<String, Object>();
		Map.put("id", id);
		//AdminDao adminDao =sqlSession.selectOne(id);
		AdminDto adminDto =sqlSession.selectOne(nameSpace +".customerView", Map);
		return adminDto;
	}

	@Override
	public void customerDelete(String id) {
		Map<String, String> Map = new HashMap<String, String>();
		Map.put("id", id);

		System.out.println("id :"+Map.get("id"));
		
		sqlSession.delete(nameSpace+".customerDelete",Map);
	}

	@Override
	public void customerModify(AdminDto adminDto) {
		System.out.println("==========adminDaoImpl customerModify============");
		
		sqlSession.update(nameSpace + ".customerModify", adminDto);
	}

}
