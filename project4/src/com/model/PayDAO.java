package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PayDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static PayDAO instance;
	
	private PayDAO() {  } 
	
	public static PayDAO getInstance() {
		
		if(instance == null) {
			instance = new PayDAO();
		}
		return instance;
	}
	
	public void openConn() {
		
		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();
			
			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			// 3단계 : DataSource 객체를 이용하여 커넥션을 하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}  // openConn() 메서드 end
	
	// DB에 연결된 자원 종료하는 메서드.
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}  // closeConn() 메서드 end
	
public List<HouseDTO> getHouseList() {
		
		openConn();
		
		List<HouseDTO> list = new ArrayList<HouseDTO>();

		try {
			
			sql = "select * from house order by house_no desc";
			
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
}