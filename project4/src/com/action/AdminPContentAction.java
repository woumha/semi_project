package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.pmemberDAO;
import com.model.pmemberDTO;

public class AdminPContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pmember_code = request.getParameter("no").trim();	
		pmemberDAO dao = pmemberDAO.getInstance();
		
		pmemberDTO content = dao.selectMemInfo(pmember_code);
		request.setAttribute("Cont", content);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_member_content.jsp");
		return forward;
	}
}