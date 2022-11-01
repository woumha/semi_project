package com.action;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.pmemberDAO;
import com.model.pmemberDTO;

public class accountSettingsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 계정
		long member_code = Long.parseLong(request.getParameter("code"));
		
		pmemberDAO dao = pmemberDAO.getInstance();
		pmemberDTO member = dao.getMemberInformation(member_code);
		
		request.setAttribute("pmember", member);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("account-settings/account_settings.jsp");
		
		return forward;
	}

}
