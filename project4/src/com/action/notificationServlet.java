package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.NoticeDAO;
import com.model.NoticeDTO;

/**
 * Servlet implementation class notificationServlet
 */
@WebServlet("/notifi.do")
public class notificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public notificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		response.setContentType("application/x-json; charset=UTF-8");

		// 예약한 내역을 뿌려줌
		NoticeDAO notice_Dao = NoticeDAO.getInstance();
		HttpSession session = request.getSession();
		long memcode = (long)session.getAttribute("member_code_session");
		NoticeDTO notice_DTO = new NoticeDTO(); 
		notice_DTO.setPmember_code(memcode);
		String result = notice_Dao.getNoiceList(notice_DTO);

		PrintWriter out = response.getWriter();
		System.out.println(result);
		out.println(result);
	}

}