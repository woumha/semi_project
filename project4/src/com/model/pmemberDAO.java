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
					dto.setPmember_phone(rs.getString("pmember_phone"));
					dto.setPmember_date(rs.getString("pmember_date"));
					dto.setPmember_userlevel(rs.getInt("pmember_userlevel"));
				}
				
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
						result += "<pmember_firstname>" + rs.getString("pmember_firstname") + "</pmember_firstname>";
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
		} // getMemberXMLInfromation
		
		public String setPersonalUpdate(String no, pmemberDTO dto) {
			String result = "";
			openConn();
			
			try {
				if(no.equals("name")) { // 이름 변경
					sql = "update pmember set pmember_firstname = ?, pmember_lastname = ? where pmember_code = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getPmember_firstname());
					pstmt.setString(2, dto.getPmember_lastname());
					pstmt.setLong(3, dto.getPmember_code());
					pstmt.executeUpdate();
					
					sql = "select * from pmember where pmember_code = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setLong(1, dto.getPmember_code());
					rs = pstmt.executeQuery();
					result += "<personals>";
					if(rs.next()) {
						result += "<personal>";
						result += "<pmember_firstname>" + rs.getString("pmember_firstname") + "</pmember_firstname>";
						result += "<pmember_lastname>" + rs.getString("pmember_lastname") + "</pmember_lastname>";
						result += "</personal>";
					}
					result += "</personals>";
				} else if (no.equals("gender")) { // 성별 변경
					sql = "update pmember set pmember_gender = ? where pmember_code = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getPmember_gender());
					pstmt.setLong(2, dto.getPmember_code());
					pstmt.executeUpdate();
					
					sql = "select pmember_gender from pmember where pmember_code = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setLong(1, dto.getPmember_code());
					rs = pstmt.executeQuery();
					result += "<personals>";
					if(rs.next()) {
						result += "<personal>";
						result += "<pmember_gender>" + rs.getString("pmember_gender") + "</pmember_gender>";
						result += "</personal>";
					}
					result += "</personals>";
				} else if (no.equals("mail")) { // 이메일 변경
					sql = "update pmember set pmember_email = ?, pmember_domain = ? where pmember_code = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getPmember_email());
					pstmt.setString(2, dto.getPmember_domain());
					pstmt.setLong(3, dto.getPmember_code());
					pstmt.executeUpdate();
					
					sql = "select pmember_email, pmember_domain from pmember where pmember_code = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setLong(1, dto.getPmember_code());
					rs = pstmt.executeQuery();
					result += "<personals>";
					if(rs.next()) {
						result += "<personal>";
						result += "<pmember_email>" + rs.getString("pmember_email") + "</pmember_email>";
						result += "<pmember_domain>" + rs.getString("pmember_domain") + "</pmember_domain>";
						result += "</personal>";
					}
					result += "</personals>";
				} else if (no.equals("phone")) { // 전화 번호
					sql = "update pmember set pmember_phone = ? where pmember_code = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getPmember_phone());
					pstmt.setLong(2, dto.getPmember_code());
					rs = pstmt.executeQuery();
					result += "<personals>";
					if(rs.next()) {
						result += "<personal>";
						result += "<pmember_phone>" + rs.getString("pmember_phone") + "</pmember_phone>";
						result += "</personal>";
					}
					result += "</personals>";
				} else if(no.equals("addr")) { // 주소 변경
					System.out.println("미완성");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		} // setPersonalUpdate
		
		public int setMemberDelete(pmemberDTO dto) {
			int check = 0;
			String result = "";
			openConn();
			
			try {
				sql = "delete from pmember where pmember_code = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, dto.getPmember_code());
				check = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return check;
		}
		//kk
				public int getPmemberCount() {
					int count = 0;
					
					try {
						openConn();
						sql = "select count(*) from pmember";
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							count = rs.getInt(1);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						closeConn(rs, pstmt, con);
					}
					return count;
				}
				
				public List<pmemberDTO> getPlist(int p_page, int p_rowsize) {
					List<pmemberDTO> p_list = new ArrayList<pmemberDTO>();
					int p_startNo = (p_page*p_rowsize) - (p_rowsize - 1);
					int p_endNo = (p_page * p_rowsize);
					
					try {
						openConn();
						sql = "select * from(select row_number() over(order by pmember_code desc) rnum, b.* from pmember b) where rnum >= ? and rnum <= ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, p_startNo);
						pstmt.setInt(2, p_endNo);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							pmemberDTO dto = new pmemberDTO();
							dto.setPmember_email(rs.getString("pmember_email"));
							dto.setPmember_domain(rs.getString("pmember_domain"));
							dto.setPmember_code(rs.getLong("pmember_code"));
							dto.setPmember_firstname(rs.getString("pmember_firstname"));
							dto.setPmember_lastname(rs.getString("pmember_lastname"));
							dto.setPmember_gender(rs.getString("pmember_gender"));
							dto.setPmember_birth(rs.getInt("pmember_birth"));
							dto.setPmember_phone(rs.getString("pmember_phone"));
							dto.setPmember_date(rs.getString("pmember_date"));
							dto.setPmember_userlevel(rs.getInt("pmember_userlevel"));
							p_list.add(dto);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						closeConn(rs, pstmt, con);
					}
					return p_list;
				}
				
				public pmemberDTO selectMemInfo(String pmember_code) {
					openConn();
					pmemberDTO dto = new pmemberDTO();
					
					try {
						sql = "select * from pmember where pmember_code = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, pmember_code);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							dto.setPmember_email(rs.getString("pmember_email"));
							dto.setPmember_domain(rs.getString("pmember_domain"));
							dto.setPmember_code(rs.getLong("pmember_code"));
							dto.setPmember_firstname(rs.getString("pmember_firstname"));
							dto.setPmember_lastname(rs.getString("pmember_lastname"));
							dto.setPmember_gender(rs.getString("pmember_gender"));
							dto.setPmember_birth(rs.getInt("pmember_birth"));
							dto.setPmember_phone(rs.getString("pmember_phone"));
							dto.setPmember_date(rs.getString("pmember_date"));
							dto.setPmember_userlevel(rs.getInt("pmember_userlevel"));
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						closeConn(rs, pstmt, con);
					}
					return dto;
				}
				
				public int deleteMem(String no) {
					int result = 0;
					
					try {
						openConn();
						sql = "select * from pmember where pmember_code = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, no);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							sql = "delete from pmember where pmember_code = ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, no);
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
				
				public pmemberDTO getMemCont(String no) {
					pmemberDTO dto = null;
					
					try {
						openConn();
						sql = "select * from pmember where pmember_code = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, no);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							dto = new pmemberDTO();
							dto.setPmember_email(rs.getString("pmember_email"));
							dto.setPmember_domain(rs.getString("pmember_domain"));
							dto.setPmember_code(rs.getLong("pmember_code"));
							dto.setPmember_firstname(rs.getString("pmember_firstname"));
							dto.setPmember_lastname(rs.getString("pmember_lastname"));
							dto.setPmember_gender(rs.getString("pmember_gender"));
							dto.setPmember_birth(rs.getInt("pmember_birth"));
							dto.setPmember_phone(rs.getString("pmember_phone"));
							dto.setPmember_date(rs.getString("pmember_date"));
							dto.setPmember_userlevel(rs.getInt("pmember_userlevel"));
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeConn(rs, pstmt, con);
					}
					return dto;
				}
				
				public int updateMem(pmemberDTO dto) {
					int result = 0;

					try {
						openConn();
							sql = "update pmember set pmember_firstname = ?, pmember_lastname = ?, pmember_birth = ?, pmember_phone = ?, pmember_email = ?, pmember_domain = ?, pmember_gender = ? where pmember_code = ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, dto.getPmember_firstname());
							pstmt.setString(2, dto.getPmember_lastname());
							pstmt.setInt(3, dto.getPmember_birth());
							pstmt.setString(4, dto.getPmember_phone());
							pstmt.setString(5, dto.getPmember_email());
							pstmt.setString(6, dto.getPmember_domain());
							pstmt.setString(7, dto.getPmember_gender());
							pstmt.setLong(8, dto.getPmember_code());
							result = pstmt.executeUpdate();
					}catch (Exception e) {
						// TODO: handle exception
					} finally {
						closeConn(rs, pstmt, con);
					}
					return result;
				}
				
		}