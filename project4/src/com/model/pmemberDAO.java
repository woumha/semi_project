package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class pmemberDAO {
	private static pmemberDAO instance;
		
		private pmemberDAO() {
			
		}
		
		public static pmemberDAO getInstance() {
			if(instance == null) {
				instance = new pmemberDAO();
			}
			return instance;
		}
		
		private Connection con = null;
		private ResultSet rs = null;
		private PreparedStatement pstmt = null;
		String sql = null;
		
		// DB 연동 작업을 진행하는 메소드
		public void openConn() {
			try {
				// 1단계: JNDI 서버 객체 생성
				Context ctx = new InitialContext();
				
				
				// 2단계: lookup() 메소드를 이용하여 매칭되는 커넥션을 찾는다
				DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
				
				// 3단계: DataSource 객체를 이용하여 커넥션을 하나 가져옴
				con = ds.getConnection();
				System.out.println("연결성공");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
			try {
				if(rs != null) {
					rs.close();
				}
	
				if(pstmt != null) {
					pstmt.close();
				}
	
				if(con != null) {
					con.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		} // closeConn
	
		public void closeConn(PreparedStatement pstmt, Connection con) {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
	
				if(con != null) {
					con.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		} // closeConn
		
		
		// 유저코드로 가져온 유저 정보
		public pmemberDTO getMemberInformation(long code) {
			pmemberDTO dto = null;
			
			openConn();
			
			try {
				sql = "select * from pmember where pmember_code = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, code);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					dto = new pmemberDTO();
					dto.setPmember_email(rs.getString("pmember_email"));
					dto.setPmember_domain(rs.getString("pmember_domain"));
					dto.setPmember_code(rs.getLong("pmember_code"));
					dto.setPmember_firstname(rs.getString("pmember_firstname"));
					dto.setPmember_lastname(rs.getString("pmember_lastname"));
					dto.setPmember_gender(rs.getString("pmember_gender"));
					dto.setPmember_birth(rs.getInt("pmember_birth"));
					dto.setPmember_phone(rs.getInt("pmember_phone"));
					dto.setPmember_date(rs.getString("pmember_date"));
					dto.setPmember_userlevel(rs.getInt("pmember_userlevel"));
				}
				System.out.println(dto.getPmember_code());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return dto;
		} //getMemberInformation
		
		
		public String getMemberXMLInfromation(long code) {
			String result = "";
			openConn();
			
			try {
				sql = "select * from pmember where pmember_code = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, code);
				rs = pstmt.executeQuery();
				result += "<personals>";
				while(rs.next()) {
					result += "<personal>";
						result += "<pmember_email>" + rs.getString("pmember_email") + "</pmember_email>";
						result += "<pmember_domain>" + rs.getString("pmember_domain") + "</pmember_domain>";
						result += "<pmember_code>" + rs.getString("pmember_code") + "</pmember_code>";
						result += "<pmember_firtname>" + rs.getString("pmember_firtname") + "</pmember_firtname>";
						result += "<pmember_lastname>" + rs.getString("pmember_lastname") + "</pmember_lastname>";
						result += "<pmember_gender>" + rs.getString("pmember_gender") + "</pmember_gender>";
						result += "<pmember_birth>" + rs.getString("pmember_birth") + "</pmember_birth>";
						result += "<pmember_phone>" + rs.getString("pmember_phone") + "</pmember_phone>";
						result += "<pmember_userlevel>" + rs.getString("pmember_userlevel") + "</pmember_userlevel>";
					result += "</personal>";
				}
				result += "</personals>";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
}
