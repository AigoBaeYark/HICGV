package com.hicgv.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.admin.dto.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	
	@Autowired
	SqlSession sqlSession;
	
	private static String nameSpace = "AdminMapper"; 
	
	@Override
	public int selectCustomerTotCount() {
		// TODO Auto-generated method stub
		return 0;
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
	public void customerJoin(String bName, String bTitle, String bContent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public AdminDto contentView(String sbid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void customerDelete(String bid, String bName, String bTitle, String bContent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void customerMotify(String bid) {
		// TODO Auto-generated method stub
		
	}
	
}
