package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDAO {
	private static LoginDAO instance;
	
	private LoginDAO() {
		
	}
	
	public static LoginDAO getInstance() {
		if(instance == null) {
			instance = new LoginDAO();
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
		
		// 회원인지 아닌지 확인하는 쿼리문
		public int MemberCheck(String user) {
			int result = 0;
			openConn();
			try {
				sql = "select count(*) from pmember where pmember_email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getInt(1) > 0) {
						result = 1;
					} else {
						result = 0;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			System.out.println("LoginDAO result: " + result);
			return result;
		}
		
		public void test() {
			openConn();
		} // MemberCheck
		
		// 유저코드 중복 방지 메서드
		public boolean memberCodeCheck(long code) {
			boolean check = false;
			openConn();
			
			try {
				sql = "select pmember_code from pmember where pmember_code = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, code);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					if(rs.getLong("pmember_code") == code) { // int 또는 long
						check = true;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return check;
		} // memberCodeCheck
		
		// 회원가입 메서드
		public int memberSignUp(LoginDTO userInfor) {
			int result = 0;
			openConn();
			
			try {
				sql = "insert into pmember values (?, ?, ?, ?, ?, ?, ?, ?, sysdate, 3, 'T')";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userInfor.getPmember_email());
				pstmt.setString(2, userInfor.getPmember_domain());
				pstmt.setLong(3, userInfor.getPmember_code());
				pstmt.setString(4, userInfor.getPmember_firstname());
				pstmt.setString(5, userInfor.getPmember_lastname());
				pstmt.setString(6, userInfor.getPmember_gender());
				pstmt.setInt(7, userInfor.getPmember_birth());
				pstmt.setString(8, userInfor.getPmember_phone());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		} //memberSignUp
		
		//pmember_code(session)
		public Long getMemberCode(String ID) {
			long result = 0;
			openConn();
			
			try {
				sql = "select pmember_code from pmember where pmember_email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, ID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getLong("pmember_code");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		//pmember_code(session)
		
		//pmember_name(session)
		public String getMemberName(String Name) {
			String name1 = "";
			String name2 = "";
			String result = "";
			openConn();
			
			try {
				sql = "select pmember_firstname, pmember_lastname from pmember where pmember_email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, Name);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					name1 = rs.getString("pmember_firstname");
					name2 = rs.getString("pmember_lastname");
					result = name1+name2;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		//pmember_name(session)
		
		//pmember_phone(session)
		public String getMemberPhone(String Phone) {
			String result = "";
			openConn();
				
			try {
				sql = "select pmember_phone from pmember where pmember_email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, Phone);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getString("pmember_phone");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		//pmember_phone(session)
		
		public int getMemberLevel(String mail) {
			
			int result = 0;
			
			openConn();

			try {
				sql = "select pmember_userlevel from pmember where pmember_email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mail);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt("pmember_userlevel");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		
		public String tfCheck(String user) {
			String result = null;
			openConn();
			try {
				sql = "select pmember_tf from pmember where pmember_email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getString("pmember_tf");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return result;
		}
}
