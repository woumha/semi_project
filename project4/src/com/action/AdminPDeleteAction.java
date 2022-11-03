package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.pmemberDAO;

public class AdminPDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String pmember_code = request.getParameter("no").trim();
		
		pmemberDAO p_dao = pmemberDAO.getInstance();
		int p_res = p_dao.deleteMem(pmember_code);
		PrintWriter p_out = response.getWriter();
		
		if(p_res > 0) {
			p_out.println("<script>");
			p_out.println("alert('삭제 완료')");
			p_out.println("location.href='admin_house_list.do?no="+pmember_code+"'");
			p_out.println("</script>");
		} else {
			p_out.println("<script>");
			p_out.println("alert('삭제 실패')");
			p_out.println("history.back()");
			p_out.println("</script>");
		}
		return null;
	}
}