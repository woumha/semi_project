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
 * Servlet implementation class noticeDeleteServlet
 */
@WebServlet("/notiDelete.do")
public class noticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		long memcode = (long)session.getAttribute("member_code_session");

		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_no(no);
		dto.setPmember_code(memcode);

		NoticeDAO dao = NoticeDAO.getInstance();
		String result = dao.setDeleteNotice(dto);


		PrintWriter out = response.getWriter();
		out.println(result);
	}

}