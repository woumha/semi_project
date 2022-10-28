package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.ActionForward;
import com.model.pmemberDAO;
import com.model.pmemberDTO;

/**
 * Servlet implementation class account_information
 */
@WebServlet("/account.do")
public class account_information extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 계정 > 개인정보의 정보를 불러옴
		HttpSession session = request.getSession();
		long memcode = (long)session.getAttribute("member_code_session");
	
		pmemberDAO dao = pmemberDAO.getInstance();
		String memberinfor = dao.getMemberXMLInfromation(memcode);
		
//		String name = personal_list.getPmember_name();
//		String code = Long.toString(personal_list.getPmember_code());
//		String emain = personal_list.getPmember_email();
//		String domain = personal_list.getPmember_domain();
//		String birth = Integer.toString(personal_list.getPmember_birth());
//		String phone = Integer.toString(personal_list.getPmember_phone());
//		String date = personal_list.getPmember_date();
//		String userlevel = Integer.toString(personal_list.getPmember_userlevel());
		
//		String []arr = { name,  code, emain, domain, birth, phone, date, userlevel };
		System.out.println(memberinfor);
		PrintWriter out = response.getWriter();
		out.println(memberinfor);
		
		
		
		
	}

}
