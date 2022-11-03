package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.pmemberDAO;
import com.model.pmemberDTO;

public class AdminPUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pmember_code = request.getParameter("no").trim();
		
		pmemberDAO dao = pmemberDAO.getInstance();
		pmemberDTO cont = dao.getMemCont(pmember_code);
		
		request.setAttribute("p_modify", cont);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_p_modify.jsp");
		return forward;
	}
}