package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.pmemberDAO;
import com.model.pmemberDTO;

/**
 * Servlet implementation class ShutDownMmeberServlet
 */
@WebServlet("/shutdownMember.do")
public class ShutDownMmeberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShutDownMmeberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		long code = (long)session.getAttribute("member_code_session");

		pmemberDTO dto = new pmemberDTO();
		dto.setPmember_code(code);

		pmemberDAO dao = pmemberDAO.getInstance();
		int check = dao.setShutDownMember(dto);

		PrintWriter out = response.getWriter();
		out.println(check);
	}

}