package com.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

public class ReservationDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	private static ReservationDAO instance;

	public ReservationDAO() {}
	
	public static ReservationDAO getInstance() {
		if (instance == null) {
			instance = new ReservationDAO();
		}
		return instance;
	}
	
	public void openConn() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if (pstmt !=null) { pstmt.close(); }
			if (con != null) { con.close(); }
			if (rs !=null) { rs.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ReservationDTO> getRList() {
		openConn();
		List<ReservationDTO> list = new ArrayList<ReservationDTO>();
		try {
			sql = "select * from reservation";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReservationDTO dto = new ReservationDTO();
				dto.setId(rs.getInt("id"));
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_name(rs.getString("house_name"));
				dto.setPmember_code(rs.getLong("pmember_code"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setHeadcount(rs.getInt("headcount"));
				dto.setprice(rs.getInt("price"));
				dto.setCreated_date(rs.getString("created_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	public int insertRes(int house_no, String house_name, Long pmember_code, String checkin, String checkout, int price) {
		int result = 0, count = 0;
		
		try {
			openConn();
			sql = "select max(id) from reservation";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into reservation values(?, ?, ?, ?, ?, 0, ?, sysdate, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, house_no);
			pstmt.setLong(3, pmember_code);
			pstmt.setString(4, checkin);
			pstmt.setString(5, checkout);
			pstmt.setInt(6, price);
			pstmt.setString(7, house_name);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
}
