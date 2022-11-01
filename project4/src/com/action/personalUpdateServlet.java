package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.pmemberDAO;
import com.model.pmemberDTO;

/**
 * Servlet implementation class personalUpdateServlet
 */
@WebServlet("/personal_update.do")
public class personalUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public personalUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String result = "";
		
		int no = Integer.parseInt(request.getParameter("find"));
		long membercode = Long.parseLong(request.getParameter("code"));
		System.out.println(no);
		
		pmemberDTO dto = new pmemberDTO();
		pmemberDAO dao = pmemberDAO.getInstance();
		dto.setPmember_code(membercode);
		if(no == 1) { // 이름 변경
			String lastName = request.getParameter("last");
			String firstName = request.getParameter("first");
			
			dto.setPmember_firstname(firstName);
			dto.setPmember_lastname(lastName);
			
			result = dao.setPersonalUpdate(no, dto);		
		} else if(no == 2) { // 성별 변경
			String gen = request.getParameter("gender");
			dto.setPmember_gender(gen);
			result = dao.setPersonalUpdate(no, dto);
		} else if(no == 3) {
			String email = request.getParameter("mail");
			String domain = request.getParameter("domain");
			dto.setPmember_email(email);
			dto.setPmember_domain(domain);
			
			result = dao.setPersonalUpdate(no, dto);
			
		}
		
		PrintWriter out = response.getWriter();
		out.println(result);	
	}

}
