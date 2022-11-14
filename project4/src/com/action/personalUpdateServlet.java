package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

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
		
		PrintWriter out = response.getWriter();
		String result = "";
		boolean updateCheck;
		
		String no = request.getParameter("find");
		long membercode = Long.parseLong(request.getParameter("code"));
		System.out.println(no);
		
		pmemberDTO dto = new pmemberDTO();
		pmemberDAO dao = pmemberDAO.getInstance();
		dto.setPmember_code(membercode);
		if(no.equals("name")) { // 이름 변경
			String lastName = request.getParameter("last");
			String firstName = request.getParameter("first");
			
			dto.setPmember_firstname(firstName);
			dto.setPmember_lastname(lastName);
			
				
		} else if(no.equals("gender")) { // 성별 변경
			String gen = request.getParameter("gender");
			dto.setPmember_gender(gen);
			
		} else if(no.equals("mail")) {
			String email = request.getParameter("mail");
			String domain = request.getParameter("domain");
			dto.setPmember_email(email);
			dto.setPmember_domain(domain);
			HttpSession session = request.getSession();
			Calendar today = Calendar.getInstance();
			int year = today.get(Calendar.YEAR);
			int month = today.get(Calendar.MONTH);
			int date = today.get(Calendar.DATE);
			String day = year + "년 " + (month+1) + "월 " + date + "일에 이메일을 변경하셨습니다."; 
			session.setAttribute("updateDay", day);
		} else if(no.equals("phone")) {
			String phone = request.getParameter("num");
			
			dto.setPmember_phone(phone);
		}
		
		result = dao.setPersonalUpdate(no, dto);
	
		out.println(result);
	}

}
