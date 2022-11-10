package com.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

public class HostingDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	private static HostingDAO instance;

	public HostingDAO() {}
	
	public static HostingDAO getInstance() {
		if (instance == null) {
			instance = new HostingDAO();
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

	public int getHostCount(long pcode) {
		
		int count = 0;
		
		try {
			
			openConn();
			
			sql = "select count(*) from house where pmember_code = ?";
			
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
	
	public List<HouseDTO> getHostList(long code, int page, int rowsize) {
		
		openConn();
		
		List<HouseDTO> list = new ArrayList<HouseDTO>();

		int startNo = (page * rowsize) - (rowsize - 1);
		
		int endNo = (page * rowsize);
		
		try {
			sql = "select * from (select row_number() over (order by house_no desc) rnum, b.* from house b) where pmember_code = ? and rnum >= ? and rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, code);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HouseDTO dto = new HouseDTO();
				
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
				dto.setPmember_code(rs.getLong("pmember_code"));
				dto.setHouse_name(rs.getString("house_name"));
				dto.setHouse_category(rs.getString("house_category"));
				dto.setHouse_location(rs.getString("house_location"));
				dto.setHouse_price(rs.getInt("house_price"));
				dto.setHouse_content(rs.getString("house_content"));
				dto.setHouse_phone(rs.getString("house_phone"));
				dto.setHouse_person(rs.getInt("house_person"));
				dto.setHouse_star(rs.getFloat("house_star"));
				dto.setHouse_update(rs.getString("house_update"));
				dto.setHouse_img1(rs.getString("house_img1"));
				dto.setHouse_img2(rs.getString("house_img2"));
				dto.setHouse_img3(rs.getString("house_img3"));
				dto.setHouse_count(rs.getInt("house_count"));
				dto.setHouse_water(rs.getInt("house_water"));
				dto.setHouse_pool(rs.getInt("house_pool"));
				dto.setHouse_ski(rs.getInt("house_ski"));
				dto.setHouse_food(rs.getInt("house_food"));
				dto.setHouse_parking(rs.getInt("house_parking"));
				dto.setHouse_grill(rs.getInt("house_grill"));
				dto.setHouse_smoking(rs.getInt("house_smoking"));
				dto.setHouse_gym(rs.getInt("house_gym"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	public String getOwnerName(long pcode) {
		
		openConn();
		
		String firstName = "";
		String lastName = "";
		String ownerName = "";
		
		try {
			
			sql = "select * from pmember where pmember_code = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pcode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				firstName = rs.getString("pmember_firstname");
				lastName = rs.getString("pmember_lastname");
				ownerName = firstName + lastName;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return ownerName;
	}

	
	public int writeHost(HouseDTO dto) {
		
		openConn();
		
		int result = 0, count = 0;
		
		try {
			
			sql = "select max(house_no) from house";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into house values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, sysdate, ?, ?, ?, default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getHouse_owner());
			pstmt.setLong(3, dto.getPmember_code());
			pstmt.setString(4, dto.getHouse_name());
			pstmt.setString(5, dto.getHouse_category());
			pstmt.setString(6, dto.getHouse_location());
			pstmt.setInt(7, dto.getHouse_price());
			pstmt.setString(8, dto.getHouse_content());
			pstmt.setString(9, dto.getHouse_phone());
			pstmt.setInt(10, dto.getHouse_person());
			pstmt.setString(11, dto.getHouse_img1());
			pstmt.setString(12, dto.getHouse_img2());
			pstmt.setString(13, dto.getHouse_img3());
			pstmt.setInt(14, dto.getHouse_water());
			pstmt.setInt(15, dto.getHouse_pool());
			pstmt.setInt(16, dto.getHouse_ski());
			pstmt.setInt(17, dto.getHouse_food());
			pstmt.setInt(18, dto.getHouse_parking());
			pstmt.setInt(19, dto.getHouse_grill());
			pstmt.setInt(20, dto.getHouse_smoking());
			pstmt.setInt(21, dto.getHouse_gym());
			pstmt.setString(22, dto.getLatitude());
			pstmt.setString(23, dto.getLongitude());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	public HouseDTO getHouseNo(int no) {
		openConn();
		
		HouseDTO dto = null;
		
		try {
			
			sql = "select * from house where house_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();	
			
			if(rs.next()) {
				
				dto = new HouseDTO();
				
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
				dto.setPmember_code(rs.getLong("pmember_code"));
				dto.setHouse_name(rs.getString("house_name"));
				dto.setHouse_category(rs.getString("house_category"));
				dto.setHouse_location(rs.getString("house_location"));
				dto.setHouse_price(rs.getInt("house_price"));
				dto.setHouse_content(rs.getString("house_content"));
				dto.setHouse_phone(rs.getString("house_phone"));
				dto.setHouse_person(rs.getInt("house_person"));
				dto.setHouse_star(rs.getFloat("house_star"));
				dto.setHouse_update(rs.getString("house_update"));
				dto.setHouse_img1(rs.getString("house_img1"));
				dto.setHouse_img2(rs.getString("house_img2"));
				dto.setHouse_img3(rs.getString("house_img3"));
				dto.setHouse_count(rs.getInt("house_count"));
				dto.setHouse_water(rs.getInt("house_water"));
				dto.setHouse_pool(rs.getInt("house_pool"));
				dto.setHouse_ski(rs.getInt("house_ski"));
				dto.setHouse_food(rs.getInt("house_food"));
				dto.setHouse_parking(rs.getInt("house_parking"));
				dto.setHouse_grill(rs.getInt("house_grill"));
				dto.setHouse_smoking(rs.getInt("house_smoking"));
				dto.setHouse_gym(rs.getInt("house_gym"));
				dto.setLatitude(rs.getString("latitude"));
				dto.setLongitude(rs.getString("longitude"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	
	public int UpdateHouse(HouseDTO dto) {
		openConn();
		
		int check = 0 ;
		
		try {
			sql = "update house set house_name = ?, house_category = ?, house_location = ?, house_price = ?, house_content = ?, house_phone = ?, house_person = ?, house_img1 = ?, house_img2 = ?, house_img3 = ?, house_water = ?, house_pool = ?, house_ski = ?, house_food = ?, house_parking = ?, house_grill = ?, house_smoking = ?, house_gym = ?, latitude = ?, longitude = ? where house_no = ?";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getHouse_name());
			pstmt.setString(2, dto.getHouse_category());
			pstmt.setString(3, dto.getHouse_location());
			pstmt.setInt(4, dto.getHouse_price());
			pstmt.setString(5, dto.getHouse_content());
			pstmt.setString(6, dto.getHouse_phone());
			pstmt.setInt(7, dto.getHouse_person());
			pstmt.setString(8, dto.getHouse_img1());
			pstmt.setString(9, dto.getHouse_img2());
			pstmt.setString(10, dto.getHouse_img3());
			pstmt.setInt(11, dto.getHouse_water());
			pstmt.setInt(12, dto.getHouse_pool());
			pstmt.setInt(13, dto.getHouse_ski());
			pstmt.setInt(14, dto.getHouse_food());
			pstmt.setInt(15, dto.getHouse_parking());
			pstmt.setInt(16, dto.getHouse_grill());
			pstmt.setInt(17, dto.getHouse_smoking());
			pstmt.setInt(18, dto.getHouse_gym());
			pstmt.setString(19, dto.getLatitude());
			pstmt.setString(20, dto.getLongitude());
			pstmt.setInt(21, dto.getHouse_no());
			
			check = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return check;
	}
	
	
	public int deleteHouse(int no) {
		openConn();
		
		int check = 0;
		
		try {	
			sql = "delete from house where house_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			check = pstmt.executeUpdate();
			
			sql = "update house set house_no = house_no - 1 where house_no > ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
					
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return check;
	}
	
	
}