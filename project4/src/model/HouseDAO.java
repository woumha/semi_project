package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HouseDAO {
	
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;
 
	public HouseDAO() {
		try {
            Context initCtx = new InitialContext();
            Context ctx = (Context)initCtx.lookup("java:comp/env");
            DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");

            con = source.getConnection();

            System.out.println("DB 커넥션 풀 연결 성공");
        }
        catch (Exception e) {
            System.out.println("DB 커넥션 풀 연결 실패");
            e.printStackTrace();
        }
		
		
	}
	
	public void close() {
        try {            
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();  // 자동으로 커넥션 풀로 반납됨

            System.out.println("DB 커넥션 풀 자원 반납");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 주어진 숙소 번호로 숙소 정보를 가져옵니다.
    public HouseDTO selectHouseInfo(String houseNo) {
    	HouseDTO house = new HouseDTO();
        String query = "SELECT * FROM house WHERE house_no=?";
       
        try {
            psmt = con.prepareStatement(query);
            psmt.setNString(1, houseNo);
            rs = psmt.executeQuery();
            if (rs.next()) {            	
            	house.setHouseNo(rs.getInt(1));
            	house.setHouseOwner(rs.getString(2));
            	house.setHouseName(rs.getString(3));
            	house.setHouseCategory(rs.getString(4));
            	house.setHouseLocation(rs.getString(5));
            	house.setHousePrice(rs.getInt(6));
            	house.setHouseContent(rs.getString(7));
            	house.setHousePhone(rs.getString(8));
            	house.setHousePerson(rs.getInt(9));
            	house.setHouseStar(rs.getFloat(10));
            	house.setHouseImage1(rs.getString(12));
            	house.setHouseImage2(rs.getString(13));
            	house.setHouseImage3(rs.getString(14));
            }
            
        }
        catch (Exception e) {
            System.out.println("숙소 정보 조회 중 예외 발생");
            e.printStackTrace();
        }
        return house;
    }

}
