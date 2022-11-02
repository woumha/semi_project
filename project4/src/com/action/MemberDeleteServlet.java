package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.pmemberDAO;
import com.model.pmemberDTO;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/memberDelete.do")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		long memcode = (long)session.getAttribute("member_code_session");
		pmemberDTO dto = new pmemberDTO();
		dto.setPmember_code(memcode);
		
		pmemberDAO dao = pmemberDAO.getInstance();
		
		int result = dao.setMemberDelete(dto);
		
		PrintWriter out = response.getWriter();
		out.println(result);
	}

}
