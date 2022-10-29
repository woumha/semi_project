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
public class accountInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 계정 > 개인정보의 정보를 불러옴
		HttpSession session = request.getSession();
		long memcode = (long)session.getAttribute("member_code_session");
	
		pmemberDAO dao = pmemberDAO.getInstance();
		String memberinfor = dao.getMemberXMLInfromation(memcode);
		
		PrintWriter out = response.getWriter();
		out.println(memberinfor);
		
		
		
		
	}

}
