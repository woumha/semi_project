package model;

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


public class ReviewDAO {
	   public Connection con;
	    public Statement stmt;
	    public PreparedStatement psmt;
	    public ResultSet rs;
	public ReviewDAO() {
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
	
	// 주어진 숙소 번호로 작성된 리뷰의 개수를 반환합니다.
    public HouseReviewDTO selectCount(String id) {
        HouseReviewDTO dto = new HouseReviewDTO();
        String query = "SELECT COUNT(*), AVG(grade) FROM review WHERE id=?"; // 쿼리문 템플릿 준비
        try {
            psmt = con.prepareStatement(query);  // 쿼리문 준비
            psmt.setNString(1, id);  // 인파라미터 설정
            rs = psmt.executeQuery();  // 쿼리문 실행
            rs.next();
            dto.setCount(rs.getInt(1));
            dto.setAvgGrade(rs.getFloat(2));
        }
        catch (Exception e) {
        	System.out.println("리뷰 카운트 중 예외 발생");
            e.printStackTrace();
        }
        return dto;
    }

    // 주어진 숙소 번호로 작성된 리뷰 목록을 반환합니다.
    public List<ReviewDTO> selectReviews(String id) {
        List<ReviewDTO> reviewList = new Vector<ReviewDTO>();
        String query = "SELECT * FROM review WHERE house_no=? ORDER BY created_date DESC";
       
        try {
            psmt = con.prepareStatement(query);
            psmt.setNString(1, id);
            rs = psmt.executeQuery();

            while (rs.next()) {
            	ReviewDTO dto = new ReviewDTO();

                dto.setId(rs.getInt(1));
                dto.setHouseNo(rs.getInt(2));
                dto.setMemberId(rs.getString(3));
                dto.setContents(rs.getString(4));
                dto.setGrade(rs.getInt(5));
                dto.setCreatedDate(rs.getDate(6));

                reviewList.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("리뷰 목록 조회 중 예외 발생");
            e.printStackTrace();
        }
        return reviewList;
    }

    // 리뷰 데이터를 받아 DB에 추가합니다.
    public int insertWrite(ReviewDTO dto) {
        int result = 0;
        try {
            String query = "INSERT INTO review ( "
                         + " id, house_no, member_id, contents, grade, created_date) "
                         + " VALUES ( "
                         + " seq_board_num.NEXTVAL,?,?,?,?,sysdate)";
            psmt = con.prepareStatement(query);
            psmt.setInt(1, dto.getHouseNo());
            psmt.setString(2, dto.getMemberId());
            psmt.setString(3, dto.getContents());
            psmt.setInt(4, dto.getGrade());
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("리뷰 저장 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }

}
