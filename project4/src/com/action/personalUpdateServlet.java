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
		
		long membercode = Long.parseLong(request.getParameter("code"));
		String lastName = request.getParameter("last");
		String firstName = request.getParameter("first");
		
		pmemberDTO dto = new pmemberDTO();
		dto.setPmember_code(membercode);
		dto.setPmember_firstname(firstName);
		dto.setPmember_lastname(lastName);
		
		pmemberDAO dao = pmemberDAO.getInstance();
		String result = dao.setPersonalUpdate(dto);
		
		PrintWriter out = response.getWriter();
		out.println(result);
	}

}
