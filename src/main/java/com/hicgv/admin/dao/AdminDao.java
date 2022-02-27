package com.hicgv.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.admin.dto.AdminDto;


public interface AdminDao {
	public int selectCustomerTotCount();
	
	public ArrayList<AdminDto> customerlist();
	
	public void customerDelete(String id);
	
	public void customerModify(AdminDto adminDto);

	public AdminDto customerView(String id);
}
