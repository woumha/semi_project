package com.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

public class ResDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	private static ResDAO instance;

	public ResDAO() {}
	
	public static ResDAO getInstance() {
		if (instance == null) {
			instance = new ResDAO();
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

	public int getResCount(long pcode) {
		
		int count = 0;
		
		try {
			
			openConn();
			
			sql = "select count(*) from reservation where pmember_code = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pcode);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}	
	
	public List<ResDTO> getResList(long code, int page, int rowsize) {
		
		openConn();
		
		List<ResDTO> list = new ArrayList<ResDTO>();

		int startNo = (page * rowsize) - (rowsize - 1);
		
		int endNo = (page * rowsize);
		
		try {
			sql = "select * from (select row_number() over (order by house_no desc) rnum, b.* from reservation b) where pmember_code = ? and rnum >= ? and rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, code);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ResDTO dto = new ResDTO();
				
				dto.setId(rs.getInt("id"));
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setPmember_code(rs.getLong("pmember_code"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setHeadcount(rs.getInt("headcount"));
				dto.setprice(rs.getInt("price"));
				dto.setCreated_date(rs.getString("created_date"));
				dto.setHouse_name(rs.getString("house_name"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	public int deleteRes(int id) {
		int result = 0;
		
		try {
			openConn();
			sql = "select * from reservation where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "delete from reservation where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				result = pstmt.executeUpdate();
			} else {
				result = -1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	public ResDTO selectResInfo(long pcode) {
		openConn();
		ResDTO dto = new ResDTO();
		
		try {
			sql = "select * from reservation where pmember_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pcode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setPmember_code(rs.getLong("pmember_code"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setHeadcount(rs.getInt("headcount"));
				dto.setprice(rs.getInt("price"));
				dto.setCreated_date(rs.getString("created_date"));
				dto.setHouse_name(rs.getString("house_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
}