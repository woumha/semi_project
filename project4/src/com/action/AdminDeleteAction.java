package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.HouseDAO;
import com.model.pmemberDAO;

public class AdminDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String houseNo = request.getParameter("no").trim();
		
		HouseDAO dao = HouseDAO.getInstance();
		int res = dao.deleteHouse(houseNo);
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			dao.updateSequence(houseNo);
			out.println("<script>");
			out.println("alert('삭제 완료')");
			out.println("location.href='admin_house_list.do?no="+houseNo+"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}
}