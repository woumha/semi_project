package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.ResDAO;

public class ResDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("no").trim());
		long pmember_code = Long.parseLong(request.getParameter("pcode").trim());
		
		ResDAO dao = ResDAO.getInstance();
		int res = dao.deleteRes(id);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("res_list.do?pcode="+pmember_code);
		} else {
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}