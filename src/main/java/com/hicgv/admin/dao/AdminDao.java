package com.hicgv.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.hicgv.admin.controller.dto.AdminDto;

public class AdminDao {
	DataSource dataSource;

	public AdminDao() {
		// db접속
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springxe");
			System.out.println("dataSource 생성성공----------");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dataSource 생성오류");
		}
	}

	public ArrayList<AdminDto> list() {

		return null;
	}

	public void write(String bName, String bTitle, String bContent) {

	}

	public AdminDto contentView(String sbid) {

		return null;
	}

	public void modify(String bid, String bName, String bTitle, String bContent) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String sql = "update replyboard " + "set bname=?,btitle=?,bcontent=? " + "where bid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setInt(4, Integer.parseInt(bid));

			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

	public void delete(String bid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "delete from replyboard where bid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bid));
			pstmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}


}
