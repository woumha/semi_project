package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class NoticeDAO {
	private static NoticeDAO instance;

	private NoticeDAO() {

	}

	public static NoticeDAO getInstance() {
		if(instance == null) {
			instance = new NoticeDAO();
		}
		return instance;
	}

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	String sql = null; 

	public void openConn() {
		try {
			// JNDI 서버 객체 생성
			Context ctx = new InitialContext();

			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			con = ds.getConnection();


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

	// 알림 리스트를 가져오자
	public String getNoiceList(NoticeDTO dto) {
		String result = "";

		openConn();

		try {
			sql = "select notice_no, notice_cont, created_date from notice n join reservation r on n.id = r.id where n.pmember_code = ? ORDER BY notice_no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, dto.getPmember_code());
			rs = pstmt.executeQuery();
			result += "<notices>";
			while(rs.next()) {
				result += "<notice>";
				result += "<notice_no>" + rs.getInt("notice_no") + "</notice_no>";
				result += "<notice_cont>" + rs.getString("notice_cont") + "</notice_cont>";
				result += "<created_date>" + rs.getString("created_date").substring(11, 16) + "</created_date>";
				result += "</notice>";
			}
			result += "</notices>";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public String setDeleteNotice(NoticeDTO dto) {
		int check = 0;
		String result = "";
		openConn();

		try {
			sql = "delete from notice where notice_no = ? and pmember_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getNotice_no());
			pstmt.setLong(2, dto.getPmember_code());
			check = pstmt.executeUpdate();

			if(check > 0) {
				sql = "update notice set notice_no = notice_no - 1 where notice_no > ? and pmember_code = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getNotice_no());
				pstmt.setLong(2, dto.getPmember_code());
				check = pstmt.executeUpdate();
				if(check > 0) {
					result = getNoiceList(dto);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}
}