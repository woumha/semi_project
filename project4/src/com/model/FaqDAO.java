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




public class FaqDAO {
	
	Connection con = null;  // DB와 연동하는 객체
	PreparedStatement pstmt = null;  // DB에 SQL문을 전송하는 객체 
	ResultSet rs = null;  // SQL문을 실행한 후에 결과 값을 가지고 있는 객체
	String sql = null;  // Query문을 저장할 변수
	
	private static FaqDAO instance;
	
	private FaqDAO() {} // 기본 생성자
	
	// 3단계 : 기본 생성자 대신 싱글턴 객체를 return 해주는 getInstance()라는 메서드를 생성해
	//		  해당 getInstance()라는 메서드를 외부에서 접근할 수 있도록 만든다.
	
	public static FaqDAO getInstance() {
		if(instance == null) {
			instance = new FaqDAO();
		}
		
		return instance; // 주소값을 반환
	}
	
	public void openConn() {
	
		try {
			
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext(); //java.naming의 context
			
			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션 찾기 
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle"); 
												// "java:comp.env/context.xml에서 선언한 name"
			// 3단계 : DataSource 객체를 이용하여 커넥션을 하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
	}// openConn()메서드의 end
	
	// DB에 연결된 자원을 종료하는 메서드
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // closeConn()메서드의 end
	public List<FaqDTO> getFaqList() {
		
		openConn();
		
		List<FaqDTO> list = new ArrayList<FaqDTO>();
		
		try {
			sql = "select * from faq "
					+ " order by faq_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FaqDTO dto = new FaqDTO();
				dto.setFaq_num(rs.getInt("faq_num"));
				dto.setFaq_title(rs.getString("faq_title"));
				dto.setFaq_cont(rs.getString("faq_cont"));
				dto.setFaq_hit(rs.getInt("faq_hit"));
				dto.setFaq_date(rs.getString("faq_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} // getFaqList()메서드의 end
	
	public void faqHit(int no) {
		
		try {
			openConn();
			sql = "update faq set faq_hit = faq_hit + 1 where faq_num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Aut
			e.printStackTrace();
		}
		
	}// faqHit() 메서드의 end

	public FaqDTO getFaqContent(int no) {
		FaqDTO dto = null;
		
		try {
			openConn();
			sql = "select * from faq where faq_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new FaqDTO();
				
				dto.setFaq_num(rs.getInt("faq_no"));
				dto.setFaq_title(rs.getString("faq_title"));
				dto.setFaq_cont(rs.getString("faq_cont"));
				dto.setFaq_hit(rs.getInt("faq_hit"));
				dto.setFaq_date(rs.getString("faq_date"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}// getFaqContent() 메서드의 end
}
