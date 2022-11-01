package com.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

public class HouseDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	private static HouseDAO instance;

	public HouseDAO() {}
	
	public static HouseDAO getInstance() {
		if (instance == null) {
			instance = new HouseDAO();
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
	
	public List<HouseDTO> getHouseList() {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house order by house_no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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

	public List<HouseDTO> categoryList(String cate) {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house where house_category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cate);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	
	public List<HouseDTO> filterList_cprice(String cata, int price) {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house where house_category = ? and house_price <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cata);
			pstmt.setInt(2, price);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	// ===========================================================================
	public List<HouseDTO> filterList_price(int price) {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house where house_price <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, price);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	
	public List<HouseDTO> filterList_cperson(String cata, int person) {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house where house_category = ? and house_person >= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cata);
			pstmt.setInt(2, person);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	// ===========================================================================
	public List<HouseDTO> filterList_person(int person) {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house where house_person >= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, person);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	
	public List<HouseDTO> filterList_pperson(int price, int person) {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house where house_price <= ? and house_person >= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, price);
			pstmt.setInt(2, person);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	
	public List<HouseDTO> filterList_cpperson(String cate, int price, int person) {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house where house_category = ? and house_price <= ? and house_person >= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cate);
			pstmt.setInt(2, price);
			pstmt.setInt(3, person);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	
	public List<HouseDTO> categoryHotList() {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house order by house_count desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	
	public List<HouseDTO> categoryStar() {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house order by house_star desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	
	public List<HouseDTO> categoryPriceList() {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			sql = "select * from house order by house_price desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
	
	public List<HouseDTO> categoryOption(int water, int pool, int ski, int grill, int smoking, int gym) {
		openConn();
		List<HouseDTO> list = new ArrayList<HouseDTO>();
		try {
			if (water == 1) {
				sql = "select * from house where house_water = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, water);
			} else if (pool == 1) {
				sql = "select * from house where house_pool = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pool);				
			} else if (ski == 1) {
				sql = "select * from house where house_ski = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ski);				
			} else if (grill == 1) {
				sql = "select * from house where house_grill = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, grill);				
			} else if (smoking == 1) {
				sql = "select * from house where house_smoking = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, smoking);				
			} else if (gym == 1) {
				sql = "select * from house where house_gym = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, gym);				
			}
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				HouseDTO dto = new HouseDTO();
				dto.setHouse_no(rs.getInt("house_no"));
				dto.setHouse_owner(rs.getString("house_owner"));
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
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}		
		return list;
	}
	
	public HouseDTO selectHouseInfo(String houseNo) {
		openConn();
    	HouseDTO dto = new HouseDTO();
       
        try {
        	sql = "SELECT * FROM house WHERE house_no= ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setNString(1, houseNo);
            rs = pstmt.executeQuery();
            if (rs.next()) {            	
            	dto.setHouse_no(rs.getInt(1));
            	dto.setHouse_owner(rs.getString(2));
            	dto.setHouse_name(rs.getString(3));
            	dto.setHouse_category(rs.getString(4));
            	dto.setHouse_location(rs.getString(5));
            	dto.setHouse_price(rs.getInt(6));
            	dto.setHouse_content(rs.getString(7));
            	dto.setHouse_phone(rs.getString(8));
            	dto.setHouse_person(rs.getInt(9));
            	dto.setHouse_star(rs.getFloat(10));
            	dto.setHouse_img1(rs.getString(12));
            	dto.setHouse_img2(rs.getString(13));
            	dto.setHouse_img3(rs.getString(14));
				dto.setHouse_count(rs.getInt(15));
				dto.setHouse_water(rs.getInt(16));
				dto.setHouse_pool(rs.getInt(17));
				dto.setHouse_ski(rs.getInt(18));
				dto.setHouse_food(rs.getInt(19));
				dto.setHouse_parking(rs.getInt(20));
				dto.setHouse_grill(rs.getInt(21));
				dto.setHouse_smoking(rs.getInt(22));
				dto.setHouse_gym(rs.getInt(23));
            }
            
        } catch (SQLException e) {
            System.out.println("숙소 정보 조회 중 예외 발생");
            e.printStackTrace();
        } finally {
			closeConn(rs, pstmt, con);
		}
        return dto;
    }
	
}
