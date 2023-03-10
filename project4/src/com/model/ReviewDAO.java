package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.model.HouseDAO;


public class ReviewDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static ReviewDAO instance;
	public ReviewDAO() {}
   
	public static ReviewDAO getInstance() {
		if(instance == null) {
			instance = new ReviewDAO();
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
   
   // 주어진 숙소 번호로 작성된 리뷰의 개수를 반환합니다.
    public HouseReviewDTO selectCount(String id) {
    	openConn();
        HouseReviewDTO dto = new HouseReviewDTO();
        try {
        	sql = "SELECT COUNT(*), AVG(grade) FROM review WHERE id=?"; // 쿼리문 템플릿 준비
        	pstmt = con.prepareStatement(sql);  // 쿼리문 준비
        	pstmt.setNString(1, id);  // 인파라미터 설정
            rs = pstmt.executeQuery();  // 쿼리문 실행
            rs.next();
            dto.setCount(rs.getInt(1));
            dto.setAvgGrade(rs.getFloat(2));
        } catch (Exception e) {
        	System.out.println("리뷰 카운트 중 예외 발생");
            e.printStackTrace();
        } finally {
			closeConn(rs, pstmt, con);
		}
        return dto;
    }

    // 주어진 숙소 번호로 작성된 리뷰 목록을 반환합니다.
    public List<ReviewDTO> selectReviews(String id) {
    	openConn();
        List<ReviewDTO> list = new Vector<ReviewDTO>();       
        try {
        	sql = "SELECT * FROM review WHERE house_no=? ORDER BY created_date DESC";
        	pstmt = con.prepareStatement(sql);
        	pstmt.setNString(1, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
               ReviewDTO dto = new ReviewDTO();

                dto.setId(rs.getInt(1));
                dto.setHouseNo(rs.getInt(2));
                dto.setMemberId(rs.getString(3));
                dto.setContents(rs.getString(4));
                dto.setGrade(rs.getInt(5));
                dto.setCreatedDate(rs.getDate(6));

                list.add(dto);
            }
        } catch (Exception e) {
            System.out.println("리뷰 목록 조회 중 예외 발생");
            e.printStackTrace();
        } finally {
			closeConn(rs, pstmt, con);
		}
        return list;
    }
    
    // 주어진 유저 아이디로 작성된 리뷰 목록을 반환합니다.
    public List<ReviewDTO> selectUserReviews(Long id) {
    	openConn();
        List<ReviewDTO> list = new Vector<ReviewDTO>();       
        try {
        	sql = "SELECT * FROM review WHERE member_id=? ORDER BY created_date DESC";
        	pstmt = con.prepareStatement(sql);
        	pstmt.setLong(1, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
               ReviewDTO dto = new ReviewDTO();
               HouseDAO dao = new HouseDAO();
               HouseDTO hDto = dao.selectHouseInfo(Integer.toString(rs.getInt(2)));

                dto.setId(rs.getInt(1));
                dto.setHouseNo(rs.getInt(2));
                dto.setHouseName(hDto.getHouse_name());
                dto.setMemberId(rs.getString(3));
                dto.setContents(rs.getString(4));
                dto.setGrade(rs.getInt(5));
                dto.setCreatedDate(rs.getDate(6));

                list.add(dto);
            }
        } catch (Exception e) {
            System.out.println("리뷰 목록 조회 중 예외 발생");
            e.printStackTrace();
        } finally {
			closeConn(rs, pstmt, con);
		}
        return list;
    }
    
    // 주어진 유저 아이디로 리뷰를 작성할 수 있는 숙소를 가져옵니다.
    public List<ReservationDTO> selectReviewWritableHouse(Long id) {
    	openConn();
        List<ReservationDTO> list = new Vector<ReservationDTO>();       
        try {
        	sql = "SELECT * FROM reservation WHERE pmember_code=? ORDER BY created_date DESC";
        	pstmt = con.prepareStatement(sql);
        	pstmt.setLong(1, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	ReservationDTO dto = new ReservationDTO();
            	HouseDAO dao = new HouseDAO();
                HouseDTO hDto = dao.selectHouseInfo(Integer.toString(rs.getInt(2)));
	            dto.setHouse_no(rs.getInt(2));
	            dto.setHouse_name(hDto.getHouse_name());
	            list.add(dto);
            }
        } catch (Exception e) {
            System.out.println("리뷰 목록 조회 중 예외 발생");
            e.printStackTrace();
        } finally {
			closeConn(rs, pstmt, con);
		}
        return list;
    }

    // 리뷰작성 - 리뷰 데이터를 받아 DB에 추가합니다.
    public int insertWrite(ReviewDTO dto) {
    	openConn();
        int result = 0;
        int count = 0;
        try {
        	
        	sql = "select max(id) from review";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
        	
            sql = "INSERT INTO review VALUES(?,?,?,?,?,sysdate)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, count);
            pstmt.setInt(2, dto.getHouseNo());
            pstmt.setString(3, dto.getMemberId());
            pstmt.setString(4, dto.getContents());
            pstmt.setInt(5, dto.getGrade());
            result = pstmt.executeUpdate();
            sql = "UPDATE house "
	        		+ "SET house_star = (select avg(grade) from review where house_no = ?) "
	        		+ "WHERE house_no = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, dto.getHouseNo());
            pstmt.setInt(2, dto.getHouseNo());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("리뷰 저장 중 예외 발생");
            e.printStackTrace();
        } finally {
			closeConn(rs, pstmt, con);
		}
        return result;
    }
    
    // 리뷰의 아이디를 받아 리뷰를 삭제합니다.
    public int deleteReview(String id) {
    	openConn();
        int result = 0;
        try {
        	sql = "select house_no from review where id = ?";
        	pstmt = con.prepareStatement(sql);
        	pstmt.setNString(1, id);
        	rs = pstmt.executeQuery();
        	sql = "delete from review where id = ?";
        	pstmt = con.prepareStatement(sql);
        	pstmt.setNString(1, id);
        	result = pstmt.executeUpdate();
        	rs.next();
        	sql = "UPDATE house "
        	 		+ "SET house_star = (select avg(grade) from review where house_no = ?) "
        			+ "WHERE house_no = ?";
        	pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, rs.getInt(1));
	        pstmt.setInt(2, rs.getInt(1));
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("리뷰 삭제 중 예외 발생");
            e.printStackTrace();
        } finally {
			closeConn(rs, pstmt, con);
		}
        return result;
    }

}